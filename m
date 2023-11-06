Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C15F7E213E
	for <lists+linux-media@lfdr.de>; Mon,  6 Nov 2023 13:21:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231671AbjKFMVI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Nov 2023 07:21:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231641AbjKFMVH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Nov 2023 07:21:07 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0149ABB
        for <linux-media@vger.kernel.org>; Mon,  6 Nov 2023 04:21:03 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD35D223;
        Mon,  6 Nov 2023 13:20:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1699273241;
        bh=qUvFDs3K1+fFaTUEeQruDp49IO6CGYQO3t3pInCu0Uw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZvWvxiQPyLnJs1aIqTmGcNbL39utnue2yvYNBKorb02/RegrBI77/GkMvnAq4eCLz
         ZTJpqZhyCkBWwBfF4XR5uy+NqHAEWIPacD7u/myLP1InOFWFA/GjWUlUlnqBc2K+Ac
         mi+KHmSL8VqOUEG91R0ie/TPoXGKpRV2fJgeWKlg=
Date:   Mon, 6 Nov 2023 14:21:09 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, hverkuil@xs4all.nl,
        tomi.valkeinen@ideasonboard.com, jacopo.mondi@ideasonboard.com,
        bingbu.cao@intel.com, hongju.wang@intel.com,
        Alain Volmat <alain.volmat@foss.st.com>
Subject: Re: [PATCH v6 0/8] Unify sub-device state access functions
Message-ID: <20231106122109.GC16995@pendragon.ideasonboard.com>
References: <20231106121805.1266696-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231106121805.1266696-1-sakari.ailus@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 06, 2023 at 02:17:57PM +0200, Sakari Ailus wrote:
> Hi folks,
> 
> This set unifies historical and stream-aware sub-device state access
> functions into one set of functions called
> v4l2_subdev_state_get_{format,crop,compose}. No functional change is
> intended.
> 
> This happened after Tomi suggested adding a num_pads field to struct
> v4l2_subdev_state.
> 
> I'd like to merge these somewhat soon, assuming there's a rough consensus
> on them, as this is a fairly hot set, touching 136 files.

All patches have been reviewed, so I think the consensus is there.

Could you please push this to a branch that the 0-day bot tracks ? The
series touches many drivers, so it would be good to give the bot a week
to compile-test different configurations.

> Note: the big Coccinelle-generated patch likely won't make it to the list.
> You can find it here:
> <URL:https://pilvi.retiisi.eu/s/j3LjF7FmGAmadDL/download/v4-0006-media-v4l-subdev-Switch-to-stream-aware-state-fun.patch>.
> 
> since v5:
> 
> - Fix Coccinelle-added space (not tab) indenting in the big patch.
> 
> since v4:
> 
> - Rework macros for two/three argument state information access functions.
>   There's now a common function for generating the name while renames have
>   been done according to the discussion on the list.
> 
> - Don't warn about incorrect pad or stream being set for pad information
>   access functions (dropped the last patch). The pad index is nowadays
>   validated by the caller and so resulting NULL is now a driver bug, in
>   other words we no longer need to prepare for driver not validating the
>   field (as this is now done by the framework).
> 
> - There are no changes to the big patch i.e. it's the same as in v4.
> 
> since v3:
> 
> - Drop the patch asserting state mutex acquisition for stream-unaware
>   drivers.
> 
> - Add a patch to warn about non-zero stream when access per-pad state
>   information.
> 
> - Added a comment on why pad 0 information was returned on invalid pad.
> 
> - Add a patch to return NULL from per-pad state information access
>   functions if pad is invalid. (The added comment is removed by this patch
>   as well.)
> 
> - Use only __VA_ARGS__ to implement variable number of arguments for
>   subdev state information access functions. This should now work for all
>   supported GCC versions. Add a comment to explain the macro.
> 
> - Rename the subdev state information access functions to include "state"
>   again, i.e. v4l2_subdev_state_get_{format,crop,compose}.
> 
> - Try to avoid confusing git am by adding '> ' prefix for the manually
>   created diff.
> 
> since v2:
> 
> - Add back a missing patch (adding sub-device pointer to the state).
> 
> - Address unused variable warnings in a few sensor drivers.
> 
> - Address kernel-doc build warnings (see lkp bot mail to v2).
> 
> - Add a patch to assert holding the state lock also for stream-unaware
>   users.
> 
> - Elaborate manual changes in the commit message of the big
>   Coccinelle-generated patch.
> 
> since v1:
> 
> - Fix missing changes in ds90ub913, TI CAL and IMX drivers.
> 
> - Rename state access functions as v4l2_subdev_state_get_*(), i.e. added
>   "state_" to the function names.
> 
> - Instead of requiring stream-unaware users to specify the stream value,
>   provide a wrapper macro to produce that, using variadic args.
> 
> - Put struct v4l2_subdev pointer to sub-device state (instead of num_pads
>   integer field).
> 
> Sakari Ailus (8):
>   media: v4l: subdev: Store the sub-device in the sub-device state
>   media: v4l: subdev: Also return pads array information on stream
>     functions
>   media: v4l: subdev: Rename sub-device state information access
>     functions
>   media: v4l: subdev: v4l2_subdev_state_get_format always returns format
>     now
>   media: v4l: subdev: Make stream argument optional in state access
>     functions
>   media: v4l: subdev: Switch to stream-aware state functions
>   media: v4l: subdev: Remove stream-unaware sub-device state access
>   media: v4l: subdev: Return NULL from pad access functions on error
> 
>  drivers/media/i2c/adv7180.c                   |   4 +-
>  drivers/media/i2c/adv748x/adv748x-afe.c       |   6 +-
>  drivers/media/i2c/adv748x/adv748x-csi2.c      |   2 +-
>  drivers/media/i2c/adv748x/adv748x-hdmi.c      |   6 +-
>  drivers/media/i2c/adv7511-v4l2.c              |   4 +-
>  drivers/media/i2c/adv7604.c                   |   4 +-
>  drivers/media/i2c/adv7842.c                   |   4 +-
>  drivers/media/i2c/ar0521.c                    |   5 +-
>  drivers/media/i2c/ccs/ccs-core.c              |  22 +--
>  drivers/media/i2c/ds90ub913.c                 |   3 +-
>  drivers/media/i2c/ds90ub953.c                 |   3 +-
>  drivers/media/i2c/ds90ub960.c                 |  12 +-
>  drivers/media/i2c/et8ek8/et8ek8_driver.c      |   3 +-
>  drivers/media/i2c/hi556.c                     |  13 +-
>  drivers/media/i2c/hi846.c                     |  11 +-
>  drivers/media/i2c/hi847.c                     |   9 +-
>  drivers/media/i2c/imx208.c                    |   9 +-
>  drivers/media/i2c/imx214.c                    |   4 +-
>  drivers/media/i2c/imx219.c                    |  12 +-
>  drivers/media/i2c/imx258.c                    |   9 +-
>  drivers/media/i2c/imx290.c                    |   8 +-
>  drivers/media/i2c/imx296.c                    |  18 +--
>  drivers/media/i2c/imx319.c                    |   7 +-
>  drivers/media/i2c/imx334.c                    |   4 +-
>  drivers/media/i2c/imx335.c                    |   4 +-
>  drivers/media/i2c/imx355.c                    |   7 +-
>  drivers/media/i2c/imx412.c                    |   4 +-
>  drivers/media/i2c/imx415.c                    |   6 +-
>  drivers/media/i2c/isl7998x.c                  |   6 +-
>  drivers/media/i2c/max9286.c                   |   4 +-
>  drivers/media/i2c/mt9m001.c                   |   4 +-
>  drivers/media/i2c/mt9m111.c                   |   4 +-
>  drivers/media/i2c/mt9m114.c                   |  58 +++----
>  drivers/media/i2c/mt9p031.c                   |   6 +-
>  drivers/media/i2c/mt9v032.c                   |  10 +-
>  drivers/media/i2c/mt9v111.c                   |   2 +-
>  drivers/media/i2c/og01a1b.c                   |  10 +-
>  drivers/media/i2c/ov01a10.c                   |   2 +-
>  drivers/media/i2c/ov02a10.c                   |   6 +-
>  drivers/media/i2c/ov08d10.c                   |   9 +-
>  drivers/media/i2c/ov08x40.c                   |   7 +-
>  drivers/media/i2c/ov13858.c                   |  10 +-
>  drivers/media/i2c/ov13b10.c                   |  10 +-
>  drivers/media/i2c/ov2640.c                    |   4 +-
>  drivers/media/i2c/ov2659.c                    |   6 +-
>  drivers/media/i2c/ov2680.c                    |   6 +-
>  drivers/media/i2c/ov2685.c                    |   4 +-
>  drivers/media/i2c/ov2740.c                    |   4 +-
>  drivers/media/i2c/ov4689.c                    |   2 +-
>  drivers/media/i2c/ov5640.c                    |   9 +-
>  drivers/media/i2c/ov5645.c                    |   4 +-
>  drivers/media/i2c/ov5647.c                    |  12 +-
>  drivers/media/i2c/ov5648.c                    |   6 +-
>  drivers/media/i2c/ov5670.c                    |  13 +-
>  drivers/media/i2c/ov5675.c                    |   9 +-
>  drivers/media/i2c/ov5693.c                    |   4 +-
>  drivers/media/i2c/ov5695.c                    |   8 +-
>  drivers/media/i2c/ov7251.c                    |   4 +-
>  drivers/media/i2c/ov7670.c                    |   7 +-
>  drivers/media/i2c/ov7740.c                    |   7 +-
>  drivers/media/i2c/ov8856.c                    |   9 +-
>  drivers/media/i2c/ov8858.c                    |   6 +-
>  drivers/media/i2c/ov8865.c                    |   8 +-
>  drivers/media/i2c/ov9282.c                    |   6 +-
>  drivers/media/i2c/ov9650.c                    |   7 +-
>  drivers/media/i2c/ov9734.c                    |   9 +-
>  drivers/media/i2c/s5c73m3/s5c73m3-core.c      |  37 +++--
>  drivers/media/i2c/s5k5baf.c                   |  35 ++---
>  drivers/media/i2c/s5k6a3.c                    |   8 +-
>  drivers/media/i2c/st-mipid02.c                |  11 +-
>  drivers/media/i2c/st-vgxy61.c                 |   5 +-
>  drivers/media/i2c/tc358746.c                  |  12 +-
>  drivers/media/i2c/tda1997x.c                  |   6 +-
>  drivers/media/i2c/tvp5150.c                   |   2 +-
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c      |  10 +-
>  drivers/media/pci/intel/ivsc/mei_csi.c        |   4 +-
>  drivers/media/platform/cadence/cdns-csi2rx.c  |   4 +-
>  drivers/media/platform/cadence/cdns-csi2tx.c  |   3 +-
>  .../platform/microchip/microchip-csi2dc.c     |  15 +-
>  .../platform/microchip/microchip-isc-scaler.c |  16 +-
>  drivers/media/platform/nxp/imx-mipi-csis.c    |  10 +-
>  drivers/media/platform/nxp/imx7-media-csi.c   |  16 +-
>  .../platform/nxp/imx8-isi/imx8-isi-crossbar.c |  10 +-
>  .../platform/nxp/imx8-isi/imx8-isi-pipe.c     |  18 +--
>  .../platform/nxp/imx8-isi/imx8-isi-video.c    |   2 +-
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c |  13 +-
>  .../media/platform/qcom/camss/camss-csid.c    |   3 +-
>  .../media/platform/qcom/camss/camss-csiphy.c  |   3 +-
>  .../media/platform/qcom/camss/camss-ispif.c   |   3 +-
>  drivers/media/platform/qcom/camss/camss-vfe.c |  10 +-
>  drivers/media/platform/renesas/rcar-isp.c     |   4 +-
>  .../platform/renesas/rcar-vin/rcar-csi2.c     |   4 +-
>  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   |   6 +-
>  .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |   6 +-
>  .../media/platform/renesas/vsp1/vsp1_brx.c    |   2 +-
>  .../media/platform/renesas/vsp1/vsp1_entity.c |   8 +-
>  .../media/platform/renesas/vsp1/vsp1_rwpf.c   |   3 +-
>  .../platform/rockchip/rkisp1/rkisp1-csi.c     |  16 +-
>  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 103 ++++++-------
>  .../platform/rockchip/rkisp1/rkisp1-resizer.c |  53 +++----
>  .../samsung/exynos4-is/fimc-capture.c         |  12 +-
>  .../platform/samsung/exynos4-is/fimc-isp.c    |  24 ++-
>  .../platform/samsung/exynos4-is/fimc-lite.c   |  16 +-
>  .../platform/samsung/exynos4-is/mipi-csis.c   |   3 +-
>  .../samsung/s3c-camif/camif-capture.c         |   8 +-
>  .../platform/sunxi/sun4i-csi/sun4i_v4l2.c     |   8 +-
>  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        |   8 +-
>  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   |   8 +-
>  .../sun8i_a83t_mipi_csi2.c                    |   8 +-
>  drivers/media/platform/ti/cal/cal-camerarx.c  |  18 +--
>  drivers/media/platform/ti/cal/cal-video.c     |   2 +-
>  drivers/media/platform/ti/omap3isp/ispccdc.c  |   7 +-
>  drivers/media/platform/ti/omap3isp/ispccp2.c  |   3 +-
>  drivers/media/platform/ti/omap3isp/ispcsi2.c  |   3 +-
>  .../media/platform/ti/omap3isp/isppreview.c   |   6 +-
>  .../media/platform/ti/omap3isp/ispresizer.c   |   5 +-
>  drivers/media/platform/video-mux.c            |  18 +--
>  .../media/platform/xilinx/xilinx-csi2rxss.c   |   5 +-
>  drivers/media/platform/xilinx/xilinx-tpg.c    |   9 +-
>  drivers/media/platform/xilinx/xilinx-vip.c    |   4 +-
>  .../media/test-drivers/vimc/vimc-debayer.c    |  10 +-
>  drivers/media/test-drivers/vimc/vimc-scaler.c |   9 +-
>  drivers/media/test-drivers/vimc/vimc-sensor.c |   6 +-
>  drivers/media/v4l2-core/v4l2-subdev.c         |  73 ++++++---
>  .../media/atomisp/i2c/atomisp-gc0310.c        |   2 +-
>  .../staging/media/atomisp/pci/atomisp_csi2.c  |   3 +-
>  .../media/atomisp/pci/atomisp_subdev.c        |   6 +-
>  drivers/staging/media/imx/imx-ic-prp.c        |   4 +-
>  drivers/staging/media/imx/imx-ic-prpencvf.c   |   4 +-
>  drivers/staging/media/imx/imx-media-csi.c     |   8 +-
>  drivers/staging/media/imx/imx-media-utils.c   |   2 +-
>  drivers/staging/media/imx/imx-media-vdic.c    |   2 +-
>  drivers/staging/media/imx/imx6-mipi-csi2.c    |   2 +-
>  drivers/staging/media/ipu3/ipu3-v4l2.c        |  14 +-
>  drivers/staging/media/omap4iss/iss_csi2.c     |   3 +-
>  drivers/staging/media/omap4iss/iss_ipipe.c    |   3 +-
>  drivers/staging/media/omap4iss/iss_ipipeif.c  |   3 +-
>  drivers/staging/media/omap4iss/iss_resizer.c  |   3 +-
>  .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    |   8 +-
>  include/media/v4l2-subdev.h                   | 141 ++++++------------
>  140 files changed, 669 insertions(+), 778 deletions(-)
> 
> 
> base-commit: 3e238417254bfdcc23fe207780b59cbb08656762

-- 
Regards,

Laurent Pinchart
