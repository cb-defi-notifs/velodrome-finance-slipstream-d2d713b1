// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity =0.7.6;

import {LiquidityAmounts} from "./libraries/LiquidityAmounts.sol";
import {PositionValue} from "./libraries/PositionValue.sol";
import {TickMath} from "../core/libraries/TickMath.sol";
import {INonfungiblePositionManager} from "./interfaces/INonfungiblePositionManager.sol";
import {ISugarHelper} from "./interfaces/ISugarHelper.sol";

/// @notice Expose on-chain helpers for liquidity math
contract SugarHelper is ISugarHelper {
    ///
    /// Wrappers for LiquidityAmounts
    ///

    function getAmountsForLiquidity(
        uint160 sqrtRatioX96,
        uint160 sqrtRatioAX96,
        uint160 sqrtRatioBX96,
        uint128 liquidity
    ) external pure override returns (uint256 amount0, uint256 amount1) {
        return LiquidityAmounts.getAmountsForLiquidity({
            sqrtRatioX96: sqrtRatioX96,
            sqrtRatioAX96: sqrtRatioAX96,
            sqrtRatioBX96: sqrtRatioBX96,
            liquidity: liquidity
        });
    }

    function getAmount0ForLiquidity(uint160 sqrtRatioAX96, uint160 sqrtRatioBX96, uint128 liquidity)
        external
        pure
        override
        returns (uint256 amount0)
    {
        return LiquidityAmounts.getAmount0ForLiquidity({
            sqrtRatioAX96: sqrtRatioAX96,
            sqrtRatioBX96: sqrtRatioBX96,
            liquidity: liquidity
        });
    }

    function getAmount1ForLiquidity(uint160 sqrtRatioAX96, uint160 sqrtRatioBX96, uint128 liquidity)
        external
        pure
        override
        returns (uint256 amount1)
    {
        return LiquidityAmounts.getAmount1ForLiquidity({
            sqrtRatioAX96: sqrtRatioAX96,
            sqrtRatioBX96: sqrtRatioBX96,
            liquidity: liquidity
        });
    }

    ///
    /// Wrappers for PositionValue
    ///

    function principal(INonfungiblePositionManager positionManager, uint256 tokenId, uint160 sqrtRatioX96)
        external
        view
        override
        returns (uint256 amount0, uint256 amount1)
    {
        return PositionValue.principal({positionManager: positionManager, tokenId: tokenId, sqrtRatioX96: sqrtRatioX96});
    }

    function fees(INonfungiblePositionManager positionManager, uint256 tokenId)
        external
        view
        override
        returns (uint256 amount0, uint256 amount1)
    {
        return PositionValue.fees({positionManager: positionManager, tokenId: tokenId});
    }

    ///
    /// Wrappers for TickMath
    ///

    function getSqrtRatioAtTick(int24 tick) external pure override returns (uint160 sqrtRatioX96) {
        return TickMath.getSqrtRatioAtTick(tick);
    }

    function getTickAtSqrtRatio(uint160 sqrtPriceX96) external pure override returns (int24 tick) {
        return TickMath.getTickAtSqrtRatio(sqrtPriceX96);
    }
}
