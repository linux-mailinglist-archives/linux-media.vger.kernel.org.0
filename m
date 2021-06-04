Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE06A39BBA6
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 17:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbhFDPWE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 11:22:04 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36072 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbhFDPWE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 11:22:04 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB0FA9E5;
        Fri,  4 Jun 2021 17:20:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622820016;
        bh=7wS7LYhZjzkSBJWUcgKIAj61BaLPFhVRj7xDnMrQyBc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fRWwyy8LBJKXCYp/WefD48FFwJ1XOWV6Uz6BGkD8WtI3/ncOUfOT8Q/PidpKgJzml
         QBYH7TapXPkjk/XTo8EZewxIzR7LGT3f9t9qhBaKj/BSnOC9wYjIjt3p1tPCBARhgL
         Bkg7sTz/m/Dn7mrNWRXCEL8zwVkJAQzqh7+sayjQ=
Date:   Fri, 4 Jun 2021 18:20:04 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v2 1/1] media: v4l2-subdev: add subdev-wide state struct
Message-ID: <YLpEpMRxZxdmpPPa@pendragon.ideasonboard.com>
References: <20210527094244.617473-1-tomi.valkeinen@ideasonboard.com>
 <20210527094244.617473-2-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210527094244.617473-2-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Thu, May 27, 2021 at 12:42:44PM +0300, Tomi Valkeinen wrote:
> We have 'struct v4l2_subdev_pad_config' which contains configuration for
> a single pad used for the TRY functionality, and an array of those
> structs is passed to various v4l2_subdev_pad_ops.
> 
> I was working on subdev internal routing between pads, and realized that
> there's no way to add TRY functionality for routes, which is not pad
> specific configuration. Adding a separate struct for try-route config
> wouldn't work either, as e.g. set-fmt needs to know the try-route
> configuration to propagate the settings.
> 
> This patch adds a new struct, 'struct v4l2_subdev_state' (which at the
> moment only contains the v4l2_subdev_pad_config array) and the new
> struct is used in most of the places where v4l2_subdev_pad_config was
> used. All v4l2_subdev_pad_ops functions taking v4l2_subdev_pad_config
> are changed to instead take v4l2_subdev_state.

I really like this change, especially for the next steps that it
enables.

> The changes to drivers/media/v4l2-core/v4l2-subdev.c and
> include/media/v4l2-subdev.h were written by hand, and all the driver
> changes were done with the semantic patch below. The spatch needs to be
> applied to a select list of directories. I used the following shell
> commands to apply the spatch:
> 
> dirs="drivers/media/i2c drivers/media/platform drivers/media/usb drivers/media/test-drivers/vimc drivers/media/pci drivers/staging/media"
> for dir in $dirs; do spatch -j8 --dir --include-headers --no-show-diff --in-place --sp-file v4l2-subdev-state.cocci $dir; done
> 
> Note that Coccinelle chokes on a few drivers (gcc extensions?). With
> minor changes we can make Coccinelle run fine, and these changes can be
> reverted after spatch. The diff for these changes is:
> 
> diff --git a/drivers/media/i2c/s5k5baf.c b/drivers/media/i2c/s5k5baf.c
> index 6e702b57c37d..5f136831039f 100644
> --- a/drivers/media/i2c/s5k5baf.c
> +++ b/drivers/media/i2c/s5k5baf.c
> @@ -1481,7 +1481,7 @@ static int s5k5baf_set_selection(struct v4l2_subdev *sd,
>  				&s5k5baf_cis_rect,
>  				v4l2_subdev_get_try_crop(sd, cfg, PAD_CIS),
>  				v4l2_subdev_get_try_compose(sd, cfg, PAD_CIS),
> -				v4l2_subdev_get_try_crop(sd, cfg, PAD_OUT)
> +				v4l2_subdev_get_try_crop(sd, cfg, PAD_OUT),
>  			};
>  		s5k5baf_set_rect_and_adjust(rects, rtype, &sel->r);
>  		return 0;
> diff --git a/drivers/media/platform/s3c-camif/camif-capture.c b/drivers/media/platform/s3c-camif/camif-capture.c
> index 9ca49af29542..d92a5fb8835f 100644
> --- a/drivers/media/platform/s3c-camif/camif-capture.c
> +++ b/drivers/media/platform/s3c-camif/camif-capture.c
> @@ -1230,7 +1230,7 @@ static int s3c_camif_subdev_get_fmt(struct v4l2_subdev *sd,
>  		*mf = camif->mbus_fmt;
>  		break;
> 
> -	case CAMIF_SD_PAD_SOURCE_C...CAMIF_SD_PAD_SOURCE_P:
> +	case CAMIF_SD_PAD_SOURCE_C:
>  		/* crop rectangle at camera interface input */
>  		mf->width = camif->camif_crop.width;
>  		mf->height = camif->camif_crop.height;
> @@ -1332,7 +1332,7 @@ static int s3c_camif_subdev_set_fmt(struct v4l2_subdev *sd,
>  		}
>  		break;
> 
> -	case CAMIF_SD_PAD_SOURCE_C...CAMIF_SD_PAD_SOURCE_P:
> +	case CAMIF_SD_PAD_SOURCE_C:
>  		/* Pixel format can be only changed on the sink pad. */
>  		mf->code = camif->mbus_fmt.code;
>  		mf->width = crop->width;
> 
> The semantic patch is:
> 
> // <smpl>
> 
> // Change function parameter
> 
> @@
> identifier func;
> identifier cfg;
> @@
> 
>  func(...,
> -   struct v4l2_subdev_pad_config *cfg
> +   struct v4l2_subdev_state *sd_state
>     , ...)
>  {
>  <...
> - cfg
> + sd_state
>  ...>
>  }
> 
> // Change function declaration parameter
> 
> @@
> identifier func;
> identifier cfg;
> type T;
> @@
> T func(...,
> -   struct v4l2_subdev_pad_config *cfg
> +   struct v4l2_subdev_state *sd_state
>     , ...);
> 
> // Change function return value
> 
> @@
> identifier func;
> @@
> - struct v4l2_subdev_pad_config
> + struct v4l2_subdev_state
>  *func(...)
>  {
>     ...
>  }
> 
> // Change function declaration return value
> 
> @@
> identifier func;
> @@
> - struct v4l2_subdev_pad_config
> + struct v4l2_subdev_state
>  *func(...);
> 
> // Some drivers pass a local pad_cfg for a single pad to a called function. Wrap it
> // inside a pad_state.
> 
> @@
> identifier func;
> identifier pad_cfg;
> @@
> func(...)
> {
>     ...
>     struct v4l2_subdev_pad_config pad_cfg;
> +   struct v4l2_subdev_state pad_state = { .pads = &pad_cfg };
> 
>     <+...
> 
> (
>     v4l2_subdev_call
> |
>     sensor_call
> |
>     isi_try_fse
> |
>     isc_try_fse
> |
>     saa_call_all
> )
>     (...,
> -   &pad_cfg
> +   &pad_state
>     ,...)
> 
>     ...+>
> }
> 
> // If the function uses fields from pad_config, access via state->pads
> 
> @@
> identifier func;
> identifier state;
> @@
>  func(...,
>     struct v4l2_subdev_state *state
>     , ...)
>  {
>     <...
> (
> -   state->try_fmt
> +   state->pads->try_fmt
> |
> -   state->try_crop
> +   state->pads->try_crop
> |
> -   state->try_compose
> +   state->pads->try_compose
> )
>     ...>
> }
> 
> // If the function accesses the filehandle, use fh->state instead
> 
> @@
> struct v4l2_subdev_fh *fh;
> @@
> -    fh->pad
> +    fh->state
> 
> @@
> struct v4l2_subdev_fh fh;
> @@
> -    fh.pad
> +    fh.state
> 
> // Start of vsp1 specific
> 
> @@
> @@
> struct vsp1_entity {
>     ...
> -    struct v4l2_subdev_pad_config *config;
> +    struct v4l2_subdev_state *config;
>     ...
> };
> 
> @@
> symbol entity;
> @@
> vsp1_entity_init(...)
> {
>     ...
>     entity->config =
> -    v4l2_subdev_alloc_pad_config
> +    v4l2_subdev_alloc_state
>     (&entity->subdev);
>     ...
> }
> 
> @@
> symbol entity;
> @@
> vsp1_entity_destroy(...)
> {
>     ...
> -   v4l2_subdev_free_pad_config
> +   v4l2_subdev_free_state
>     (entity->config);
>     ...
> }
> 
> @exists@
> identifier func =~ "(^vsp1.*)|(hsit_set_format)|(sru_enum_frame_size)|(sru_set_format)|(uif_get_selection)|(uif_set_selection)|(uds_enum_frame_size)|(uds_set_format)|(brx_set_format)|(brx_get_selection)|(histo_get_selection)|(histo_set_selection)|(brx_set_selection)";
> symbol config;
> @@
> func(...) {
>     ...
> -    struct v4l2_subdev_pad_config *config;
> +    struct v4l2_subdev_state *config;
>     ...
> }
> 
> // End of vsp1 specific
> 
> // Start of rcar specific
> 
> @@
> identifier sd;
> identifier pad_cfg;
> @@
>  rvin_try_format(...)
>  {
>     ...
> -   struct v4l2_subdev_pad_config *pad_cfg;
> +   struct v4l2_subdev_state *sd_state;
>     ...
> -   pad_cfg = v4l2_subdev_alloc_pad_config(sd);
> +   sd_state = v4l2_subdev_alloc_state(sd);
>     <...
> -   pad_cfg
> +   sd_state
>     ...>
> -   v4l2_subdev_free_pad_config(pad_cfg);
> +   v4l2_subdev_free_state(sd_state);
>     ...
>  }
> 
> // End of rcar specific
> 
> // Start of rockchip specific
> 
> @@
> identifier func =~ "(rkisp1_rsz_get_pad_fmt)|(rkisp1_rsz_get_pad_crop)|(rkisp1_rsz_register)";
> symbol rsz;
> symbol pad_cfg;
> @@
> 
>  func(...)
>  {
> +   struct v4l2_subdev_state state = { .pads = rsz->pad_cfg };
>     ...
> -   rsz->pad_cfg
> +   &state
>     ...
>  }
> 
> @@
> identifier func =~ "(rkisp1_isp_get_pad_fmt)|(rkisp1_isp_get_pad_crop)";
> symbol isp;
> symbol pad_cfg;
> @@
> 
>  func(...)
>  {
> +   struct v4l2_subdev_state state = { .pads = isp->pad_cfg };
>     ...
> -   isp->pad_cfg
> +   &state
>     ...
>  }
> 
> @@
> symbol rkisp1;
> symbol isp;
> symbol pad_cfg;
> @@
> 
>  rkisp1_isp_register(...)
>  {
> +   struct v4l2_subdev_state state = { .pads = rkisp1->isp.pad_cfg };
>     ...
> -   rkisp1->isp.pad_cfg
> +   &state
>     ...
>  }
> 
> // End of rockchip specific
> 
> // Start of tegra-video specific
> 
> @@
> identifier sd;
> identifier pad_cfg;
> @@
>  __tegra_channel_try_format(...)
>  {
>     ...
> -   struct v4l2_subdev_pad_config *pad_cfg;
> +   struct v4l2_subdev_state *sd_state;
>     ...
> -   pad_cfg = v4l2_subdev_alloc_pad_config(sd);
> +   sd_state = v4l2_subdev_alloc_state(sd);
>     <...
> -   pad_cfg
> +   sd_state
>     ...>
> -   v4l2_subdev_free_pad_config(pad_cfg);
> +   v4l2_subdev_free_state(sd_state);
>     ...
>  }
> 
> @@
> identifier sd_state;
> @@
>  __tegra_channel_try_format(...)
>  {
>     ...
>     struct v4l2_subdev_state *sd_state;
>     <...
> -   sd_state->try_crop
> +   sd_state->pads->try_crop
>     ...>
>  }
> 
> // End of tegra-video specific
> 
> // </smpl>
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/i2c/adv7170.c                   |   6 +-
>  drivers/media/i2c/adv7175.c                   |   6 +-
>  drivers/media/i2c/adv7180.c                   |  18 +--
>  drivers/media/i2c/adv7183.c                   |   8 +-
>  drivers/media/i2c/adv748x/adv748x-afe.c       |  13 +-
>  drivers/media/i2c/adv748x/adv748x-csi2.c      |  14 +-
>  drivers/media/i2c/adv748x/adv748x-hdmi.c      |  13 +-
>  drivers/media/i2c/adv7511-v4l2.c              |  10 +-
>  drivers/media/i2c/adv7604.c                   |  12 +-
>  drivers/media/i2c/adv7842.c                   |  12 +-
>  drivers/media/i2c/ak881x.c                    |   6 +-
>  drivers/media/i2c/ccs/ccs-core.c              |  84 ++++++-----
>  drivers/media/i2c/cx25840/cx25840-core.c      |   2 +-
>  drivers/media/i2c/et8ek8/et8ek8_driver.c      |  23 +--
>  drivers/media/i2c/hi556.c                     |  15 +-
>  drivers/media/i2c/imx214.c                    |  37 ++---
>  drivers/media/i2c/imx219.c                    |  30 ++--
>  drivers/media/i2c/imx258.c                    |  19 +--
>  drivers/media/i2c/imx274.c                    |  32 ++--
>  drivers/media/i2c/imx290.c                    |  20 +--
>  drivers/media/i2c/imx319.c                    |  18 +--
>  drivers/media/i2c/imx334.c                    |  18 +--
>  drivers/media/i2c/imx355.c                    |  18 +--
>  drivers/media/i2c/m5mols/m5mols_core.c        |  21 ++-
>  drivers/media/i2c/max9286.c                   |  17 ++-
>  drivers/media/i2c/ml86v7667.c                 |   4 +-
>  drivers/media/i2c/mt9m001.c                   |  18 +--
>  drivers/media/i2c/mt9m032.c                   |  34 +++--
>  drivers/media/i2c/mt9m111.c                   |  18 +--
>  drivers/media/i2c/mt9p031.c                   |  45 +++---
>  drivers/media/i2c/mt9t001.c                   |  44 +++---
>  drivers/media/i2c/mt9t112.c                   |  14 +-
>  drivers/media/i2c/mt9v011.c                   |   6 +-
>  drivers/media/i2c/mt9v032.c                   |  44 +++---
>  drivers/media/i2c/mt9v111.c                   |  23 +--
>  drivers/media/i2c/noon010pc30.c               |  19 ++-
>  drivers/media/i2c/ov02a10.c                   |  17 ++-
>  drivers/media/i2c/ov13858.c                   |  18 +--
>  drivers/media/i2c/ov2640.c                    |  16 +-
>  drivers/media/i2c/ov2659.c                    |  14 +-
>  drivers/media/i2c/ov2680.c                    |  23 +--
>  drivers/media/i2c/ov2685.c                    |  10 +-
>  drivers/media/i2c/ov2740.c                    |  15 +-
>  drivers/media/i2c/ov5640.c                    |  14 +-
>  drivers/media/i2c/ov5645.c                    |  38 ++---
>  drivers/media/i2c/ov5647.c                    |  26 ++--
>  drivers/media/i2c/ov5648.c                    |  14 +-
>  drivers/media/i2c/ov5670.c                    |  19 +--
>  drivers/media/i2c/ov5675.c                    |  15 +-
>  drivers/media/i2c/ov5695.c                    |  15 +-
>  drivers/media/i2c/ov6650.c                    |  28 ++--
>  drivers/media/i2c/ov7251.c                    |  39 ++---
>  drivers/media/i2c/ov7670.c                    |  17 ++-
>  drivers/media/i2c/ov772x.c                    |  12 +-
>  drivers/media/i2c/ov7740.c                    |  17 ++-
>  drivers/media/i2c/ov8856.c                    |  15 +-
>  drivers/media/i2c/ov8865.c                    |  14 +-
>  drivers/media/i2c/ov9640.c                    |   8 +-
>  drivers/media/i2c/ov9650.c                    |  17 ++-
>  drivers/media/i2c/ov9734.c                    |  15 +-
>  drivers/media/i2c/rdacm20.c                   |   4 +-
>  drivers/media/i2c/rdacm21.c                   |   4 +-
>  drivers/media/i2c/rj54n1cb0c.c                |  12 +-
>  drivers/media/i2c/s5c73m3/s5c73m3-core.c      |  55 +++----
>  drivers/media/i2c/s5k4ecgx.c                  |  22 +--
>  drivers/media/i2c/s5k5baf.c                   |  49 +++---
>  drivers/media/i2c/s5k6a3.c                    |  19 ++-
>  drivers/media/i2c/s5k6aa.c                    |  39 ++---
>  drivers/media/i2c/saa6752hs.c                 |   6 +-
>  drivers/media/i2c/saa7115.c                   |   2 +-
>  drivers/media/i2c/saa717x.c                   |   2 +-
>  drivers/media/i2c/sr030pc30.c                 |   8 +-
>  drivers/media/i2c/st-mipid02.c                |  21 +--
>  drivers/media/i2c/tc358743.c                  |   8 +-
>  drivers/media/i2c/tda1997x.c                  |  14 +-
>  drivers/media/i2c/tvp514x.c                   |   6 +-
>  drivers/media/i2c/tvp5150.c                   |  20 +--
>  drivers/media/i2c/tvp7002.c                   |  11 +-
>  drivers/media/i2c/tw9910.c                    |  10 +-
>  drivers/media/i2c/vs6624.c                    |   8 +-
>  drivers/media/pci/cx18/cx18-av-core.c         |   2 +-
>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  17 ++-
>  drivers/media/pci/saa7134/saa7134-empress.c   |   5 +-
>  drivers/media/platform/atmel/atmel-isc-base.c |  19 ++-
>  drivers/media/platform/atmel/atmel-isi.c      |  19 ++-
>  drivers/media/platform/cadence/cdns-csi2tx.c  |  14 +-
>  .../media/platform/exynos4-is/fimc-capture.c  |  22 +--
>  drivers/media/platform/exynos4-is/fimc-isp.c  |  37 +++--
>  drivers/media/platform/exynos4-is/fimc-lite.c |  39 ++---
>  drivers/media/platform/exynos4-is/mipi-csis.c |  17 ++-
>  .../media/platform/marvell-ccic/mcam-core.c   |   5 +-
>  drivers/media/platform/omap3isp/ispccdc.c     |  85 ++++++-----
>  drivers/media/platform/omap3isp/ispccp2.c     |  41 ++---
>  drivers/media/platform/omap3isp/ispcsi2.c     |  41 ++---
>  drivers/media/platform/omap3isp/isppreview.c  |  69 +++++----
>  drivers/media/platform/omap3isp/ispresizer.c  |  70 +++++----
>  drivers/media/platform/pxa_camera.c           |   5 +-
>  .../media/platform/qcom/camss/camss-csid.c    |  35 ++---
>  .../media/platform/qcom/camss/camss-csiphy.c  |  40 ++---
>  .../media/platform/qcom/camss/camss-ispif.c   |  36 ++---
>  drivers/media/platform/qcom/camss/camss-vfe.c |  84 ++++++-----
>  drivers/media/platform/rcar-vin/rcar-csi2.c   |   8 +-
>  drivers/media/platform/rcar-vin/rcar-v4l2.c   |  10 +-
>  drivers/media/platform/renesas-ceu.c          |   7 +-
>  .../platform/rockchip/rkisp1/rkisp1-isp.c     | 112 ++++++++------
>  .../platform/rockchip/rkisp1/rkisp1-resizer.c |  95 +++++++-----
>  .../media/platform/s3c-camif/camif-capture.c  |  18 +--
>  drivers/media/platform/stm32/stm32-dcmi.c     |  14 +-
>  .../platform/sunxi/sun4i-csi/sun4i_v4l2.c     |  16 +-
>  drivers/media/platform/ti-vpe/cal-camerarx.c  |  35 +++--
>  drivers/media/platform/via-camera.c           |   5 +-
>  drivers/media/platform/video-mux.c            |  22 +--
>  drivers/media/platform/vsp1/vsp1_brx.c        |  34 +++--
>  drivers/media/platform/vsp1/vsp1_clu.c        |  13 +-
>  drivers/media/platform/vsp1/vsp1_entity.c     |  53 +++----
>  drivers/media/platform/vsp1/vsp1_entity.h     |  20 +--
>  drivers/media/platform/vsp1/vsp1_histo.c      |  51 ++++---
>  drivers/media/platform/vsp1/vsp1_hsit.c       |  14 +-
>  drivers/media/platform/vsp1/vsp1_lif.c        |  13 +-
>  drivers/media/platform/vsp1/vsp1_lut.c        |  13 +-
>  drivers/media/platform/vsp1/vsp1_rwpf.c       |  32 ++--
>  drivers/media/platform/vsp1/vsp1_rwpf.h       |   2 +-
>  drivers/media/platform/vsp1/vsp1_sru.c        |  22 +--
>  drivers/media/platform/vsp1/vsp1_uds.c        |  22 +--
>  drivers/media/platform/vsp1/vsp1_uif.c        |  27 ++--
>  .../media/platform/xilinx/xilinx-csi2rxss.c   |  20 +--
>  drivers/media/platform/xilinx/xilinx-tpg.c    |  25 ++--
>  drivers/media/platform/xilinx/xilinx-vip.c    |   8 +-
>  drivers/media/platform/xilinx/xilinx-vip.h    |   4 +-
>  .../media/test-drivers/vimc/vimc-debayer.c    |  20 +--
>  drivers/media/test-drivers/vimc/vimc-scaler.c |  36 ++---
>  drivers/media/test-drivers/vimc/vimc-sensor.c |  16 +-
>  drivers/media/usb/go7007/s2250-board.c        |   2 +-
>  drivers/media/v4l2-core/v4l2-subdev.c         | 141 ++++++++++--------
>  .../media/atomisp/i2c/atomisp-gc0310.c        |  10 +-
>  .../media/atomisp/i2c/atomisp-gc2235.c        |  10 +-
>  .../media/atomisp/i2c/atomisp-mt9m114.c       |  12 +-
>  .../media/atomisp/i2c/atomisp-ov2680.c        |  10 +-
>  .../media/atomisp/i2c/atomisp-ov2722.c        |  10 +-
>  .../media/atomisp/i2c/ov5693/atomisp-ov5693.c |  10 +-
>  .../staging/media/atomisp/pci/atomisp_cmd.c   |  33 ++--
>  .../staging/media/atomisp/pci/atomisp_csi2.c  |  28 ++--
>  .../staging/media/atomisp/pci/atomisp_csi2.h  |   2 +-
>  .../staging/media/atomisp/pci/atomisp_file.c  |  14 +-
>  .../staging/media/atomisp/pci/atomisp_fops.c  |   6 +-
>  .../media/atomisp/pci/atomisp_subdev.c        |  64 ++++----
>  .../media/atomisp/pci/atomisp_subdev.h        |   9 +-
>  .../staging/media/atomisp/pci/atomisp_tpg.c   |  12 +-
>  drivers/staging/media/imx/imx-ic-prp.c        |  19 +--
>  drivers/staging/media/imx/imx-ic-prpencvf.c   |  31 ++--
>  drivers/staging/media/imx/imx-media-csi.c     |  82 +++++-----
>  drivers/staging/media/imx/imx-media-utils.c   |   4 +-
>  drivers/staging/media/imx/imx-media-vdic.c    |  24 +--
>  drivers/staging/media/imx/imx-media.h         |   2 +-
>  drivers/staging/media/imx/imx6-mipi-csi2.c    |  12 +-
>  drivers/staging/media/imx/imx7-media-csi.c    |  33 ++--
>  drivers/staging/media/imx/imx7-mipi-csis.c    |  34 +++--
>  drivers/staging/media/ipu3/ipu3-v4l2.c        |  26 ++--
>  drivers/staging/media/omap4iss/iss_csi2.c     |  37 ++---
>  drivers/staging/media/omap4iss/iss_ipipe.c    |  37 ++---
>  drivers/staging/media/omap4iss/iss_ipipeif.c  |  47 +++---
>  drivers/staging/media/omap4iss/iss_resizer.c  |  39 ++---
>  drivers/staging/media/tegra-video/csi.c       |  10 +-
>  drivers/staging/media/tegra-video/vi.c        |  24 +--
>  include/media/v4l2-subdev.h                   |  72 +++++----
>  165 files changed, 2123 insertions(+), 1769 deletions(-)

[snip]

Skipping the drivers, or the mail won't make it to the list (and I'm not
sure I'd survive the process anyway).

> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
> index 956dafab43d4..bd996dcace3b 100644
> --- a/drivers/media/v4l2-core/v4l2-subdev.c
> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
> @@ -26,19 +26,21 @@
>  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
>  static int subdev_fh_init(struct v4l2_subdev_fh *fh, struct v4l2_subdev *sd)
>  {
> -	if (sd->entity.num_pads) {
> -		fh->pad = v4l2_subdev_alloc_pad_config(sd);
> -		if (fh->pad == NULL)
> -			return -ENOMEM;
> -	}
> +	struct v4l2_subdev_state *state;
> +
> +	state = v4l2_subdev_alloc_state(sd);
> +	if (IS_ERR(state))
> +		return PTR_ERR(state);
> +
> +	fh->state = state;
>  
>  	return 0;
>  }
>  
>  static void subdev_fh_free(struct v4l2_subdev_fh *fh)
>  {
> -	v4l2_subdev_free_pad_config(fh->pad);
> -	fh->pad = NULL;
> +	v4l2_subdev_free_state(fh->state);
> +	fh->state = NULL;
>  }
>  
>  static int subdev_open(struct file *file)
> @@ -146,63 +148,63 @@ static inline int check_pad(struct v4l2_subdev *sd, u32 pad)
>  	return 0;
>  }
>  
> -static int check_cfg(u32 which, struct v4l2_subdev_pad_config *cfg)
> +static int check_cfg(u32 which, struct v4l2_subdev_state *state)
>  {
> -	if (which == V4L2_SUBDEV_FORMAT_TRY && !cfg)
> +	if (which == V4L2_SUBDEV_FORMAT_TRY && !state)
>  		return -EINVAL;
>  
>  	return 0;
>  }
>  
>  static inline int check_format(struct v4l2_subdev *sd,
> -			       struct v4l2_subdev_pad_config *cfg,
> +			       struct v4l2_subdev_state *state,
>  			       struct v4l2_subdev_format *format)
>  {
>  	if (!format)
>  		return -EINVAL;
>  
>  	return check_which(format->which) ? : check_pad(sd, format->pad) ? :
> -	       check_cfg(format->which, cfg);
> +	       check_cfg(format->which, state);
>  }
>  
>  static int call_get_fmt(struct v4l2_subdev *sd,
> -			struct v4l2_subdev_pad_config *cfg,
> +			struct v4l2_subdev_state *state,
>  			struct v4l2_subdev_format *format)
>  {
> -	return check_format(sd, cfg, format) ? :
> -	       sd->ops->pad->get_fmt(sd, cfg, format);
> +	return check_format(sd, state, format) ? :
> +	       sd->ops->pad->get_fmt(sd, state, format);
>  }
>  
>  static int call_set_fmt(struct v4l2_subdev *sd,
> -			struct v4l2_subdev_pad_config *cfg,
> +			struct v4l2_subdev_state *state,
>  			struct v4l2_subdev_format *format)
>  {
> -	return check_format(sd, cfg, format) ? :
> -	       sd->ops->pad->set_fmt(sd, cfg, format);
> +	return check_format(sd, state, format) ? :
> +	       sd->ops->pad->set_fmt(sd, state, format);
>  }
>  
>  static int call_enum_mbus_code(struct v4l2_subdev *sd,
> -			       struct v4l2_subdev_pad_config *cfg,
> +			       struct v4l2_subdev_state *state,
>  			       struct v4l2_subdev_mbus_code_enum *code)
>  {
>  	if (!code)
>  		return -EINVAL;
>  
>  	return check_which(code->which) ? : check_pad(sd, code->pad) ? :
> -	       check_cfg(code->which, cfg) ? :
> -	       sd->ops->pad->enum_mbus_code(sd, cfg, code);
> +	       check_cfg(code->which, state) ? :
> +	       sd->ops->pad->enum_mbus_code(sd, state, code);
>  }
>  
>  static int call_enum_frame_size(struct v4l2_subdev *sd,
> -				struct v4l2_subdev_pad_config *cfg,
> +				struct v4l2_subdev_state *state,
>  				struct v4l2_subdev_frame_size_enum *fse)
>  {
>  	if (!fse)
>  		return -EINVAL;
>  
>  	return check_which(fse->which) ? : check_pad(sd, fse->pad) ? :
> -	       check_cfg(fse->which, cfg) ? :
> -	       sd->ops->pad->enum_frame_size(sd, cfg, fse);
> +	       check_cfg(fse->which, state) ? :
> +	       sd->ops->pad->enum_frame_size(sd, state, fse);
>  }
>  
>  static inline int check_frame_interval(struct v4l2_subdev *sd,
> @@ -229,42 +231,42 @@ static int call_s_frame_interval(struct v4l2_subdev *sd,
>  }
>  
>  static int call_enum_frame_interval(struct v4l2_subdev *sd,
> -				    struct v4l2_subdev_pad_config *cfg,
> +				    struct v4l2_subdev_state *state,
>  				    struct v4l2_subdev_frame_interval_enum *fie)
>  {
>  	if (!fie)
>  		return -EINVAL;
>  
>  	return check_which(fie->which) ? : check_pad(sd, fie->pad) ? :
> -	       check_cfg(fie->which, cfg) ? :
> -	       sd->ops->pad->enum_frame_interval(sd, cfg, fie);
> +	       check_cfg(fie->which, state) ? :
> +	       sd->ops->pad->enum_frame_interval(sd, state, fie);
>  }
>  
>  static inline int check_selection(struct v4l2_subdev *sd,
> -				  struct v4l2_subdev_pad_config *cfg,
> +				  struct v4l2_subdev_state *state,
>  				  struct v4l2_subdev_selection *sel)
>  {
>  	if (!sel)
>  		return -EINVAL;
>  
>  	return check_which(sel->which) ? : check_pad(sd, sel->pad) ? :
> -	       check_cfg(sel->which, cfg);
> +	       check_cfg(sel->which, state);
>  }
>  
>  static int call_get_selection(struct v4l2_subdev *sd,
> -			      struct v4l2_subdev_pad_config *cfg,
> +			      struct v4l2_subdev_state *state,
>  			      struct v4l2_subdev_selection *sel)
>  {
> -	return check_selection(sd, cfg, sel) ? :
> -	       sd->ops->pad->get_selection(sd, cfg, sel);
> +	return check_selection(sd, state, sel) ? :
> +	       sd->ops->pad->get_selection(sd, state, sel);
>  }
>  
>  static int call_set_selection(struct v4l2_subdev *sd,
> -			      struct v4l2_subdev_pad_config *cfg,
> +			      struct v4l2_subdev_state *state,
>  			      struct v4l2_subdev_selection *sel)
>  {
> -	return check_selection(sd, cfg, sel) ? :
> -	       sd->ops->pad->set_selection(sd, cfg, sel);
> +	return check_selection(sd, state, sel) ? :
> +	       sd->ops->pad->set_selection(sd, state, sel);
>  }
>  
>  static inline int check_edid(struct v4l2_subdev *sd,
> @@ -506,7 +508,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  
>  		memset(format->reserved, 0, sizeof(format->reserved));
>  		memset(format->format.reserved, 0, sizeof(format->format.reserved));
> -		return v4l2_subdev_call(sd, pad, get_fmt, subdev_fh->pad, format);
> +		return v4l2_subdev_call(sd, pad, get_fmt, subdev_fh->state, format);
>  	}
>  
>  	case VIDIOC_SUBDEV_S_FMT: {
> @@ -517,7 +519,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  
>  		memset(format->reserved, 0, sizeof(format->reserved));
>  		memset(format->format.reserved, 0, sizeof(format->format.reserved));
> -		return v4l2_subdev_call(sd, pad, set_fmt, subdev_fh->pad, format);
> +		return v4l2_subdev_call(sd, pad, set_fmt, subdev_fh->state, format);
>  	}
>  
>  	case VIDIOC_SUBDEV_G_CROP: {
> @@ -531,7 +533,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  		sel.target = V4L2_SEL_TGT_CROP;
>  
>  		rval = v4l2_subdev_call(
> -			sd, pad, get_selection, subdev_fh->pad, &sel);
> +			sd, pad, get_selection, subdev_fh->state, &sel);
>  
>  		crop->rect = sel.r;
>  
> @@ -553,7 +555,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  		sel.r = crop->rect;
>  
>  		rval = v4l2_subdev_call(
> -			sd, pad, set_selection, subdev_fh->pad, &sel);
> +			sd, pad, set_selection, subdev_fh->state, &sel);
>  
>  		crop->rect = sel.r;
>  
> @@ -564,7 +566,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  		struct v4l2_subdev_mbus_code_enum *code = arg;
>  
>  		memset(code->reserved, 0, sizeof(code->reserved));
> -		return v4l2_subdev_call(sd, pad, enum_mbus_code, subdev_fh->pad,
> +		return v4l2_subdev_call(sd, pad, enum_mbus_code, subdev_fh->state,
>  					code);
>  	}
>  
> @@ -572,7 +574,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  		struct v4l2_subdev_frame_size_enum *fse = arg;
>  
>  		memset(fse->reserved, 0, sizeof(fse->reserved));
> -		return v4l2_subdev_call(sd, pad, enum_frame_size, subdev_fh->pad,
> +		return v4l2_subdev_call(sd, pad, enum_frame_size, subdev_fh->state,
>  					fse);
>  	}
>  
> @@ -597,7 +599,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  		struct v4l2_subdev_frame_interval_enum *fie = arg;
>  
>  		memset(fie->reserved, 0, sizeof(fie->reserved));
> -		return v4l2_subdev_call(sd, pad, enum_frame_interval, subdev_fh->pad,
> +		return v4l2_subdev_call(sd, pad, enum_frame_interval, subdev_fh->state,
>  					fie);
>  	}
>  
> @@ -606,7 +608,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  
>  		memset(sel->reserved, 0, sizeof(sel->reserved));
>  		return v4l2_subdev_call(
> -			sd, pad, get_selection, subdev_fh->pad, sel);
> +			sd, pad, get_selection, subdev_fh->state, sel);
>  	}
>  
>  	case VIDIOC_SUBDEV_S_SELECTION: {
> @@ -617,7 +619,7 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>  
>  		memset(sel->reserved, 0, sizeof(sel->reserved));
>  		return v4l2_subdev_call(
> -			sd, pad, set_selection, subdev_fh->pad, sel);
> +			sd, pad, set_selection, subdev_fh->state, sel);
>  	}
>  
>  	case VIDIOC_G_EDID: {
> @@ -892,35 +894,50 @@ int v4l2_subdev_link_validate(struct media_link *link)
>  }
>  EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate);
>  
> -struct v4l2_subdev_pad_config *
> -v4l2_subdev_alloc_pad_config(struct v4l2_subdev *sd)
> +struct v4l2_subdev_state *v4l2_subdev_alloc_state(struct v4l2_subdev *sd)
>  {
> -	struct v4l2_subdev_pad_config *cfg;
> +	struct v4l2_subdev_state *state;
>  	int ret;
>  
> -	if (!sd->entity.num_pads)
> -		return NULL;
> -
> -	cfg = kvmalloc_array(sd->entity.num_pads, sizeof(*cfg),
> -			     GFP_KERNEL | __GFP_ZERO);
> -	if (!cfg)
> -		return NULL;
> +	state = kzalloc(sizeof(*state), GFP_KERNEL);
> +	if (!state) {
> +		ret = -ENOMEM;
> +		goto err;

You can return ERR_PTR(-ENOMEM) directly.

> +	}
>  
> -	ret = v4l2_subdev_call(sd, pad, init_cfg, cfg);
> -	if (ret < 0 && ret != -ENOIOCTLCMD) {
> -		kvfree(cfg);
> -		return NULL;
> +	if (sd->entity.num_pads) {
> +		state->pads = kvmalloc_array(sd->entity.num_pads,
> +					     sizeof(*state->pads),
> +					     GFP_KERNEL | __GFP_ZERO);
> +		if (!state->pads) {
> +			ret = -ENOMEM;
> +			goto err;
> +		}
>  	}
>  
> -	return cfg;
> +	ret = v4l2_subdev_call(sd, pad, init_cfg, state);
> +	if (ret < 0 && ret != -ENOIOCTLCMD)
> +		goto err;
> +
> +	return state;
> +
> +err:
> +	if (state && state->pads)
> +		kvfree(state->pads);
> +
> +	kfree(state);
> +
> +	return ERR_PTR(ret);
>  }
> -EXPORT_SYMBOL_GPL(v4l2_subdev_alloc_pad_config);
> +EXPORT_SYMBOL_GPL(v4l2_subdev_alloc_state);
>  
> -void v4l2_subdev_free_pad_config(struct v4l2_subdev_pad_config *cfg)
> +void v4l2_subdev_free_state(struct v4l2_subdev_state *state)
>  {
> -	kvfree(cfg);
> +	kvfree(state->pads);
> +	kvfree(state);

state was allocated with kzalloc(), this should be kfree().

>  }
> -EXPORT_SYMBOL_GPL(v4l2_subdev_free_pad_config);
> +EXPORT_SYMBOL_GPL(v4l2_subdev_free_state);
> +
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>  
>  void v4l2_subdev_init(struct v4l2_subdev *sd, const struct v4l2_subdev_ops *ops)

[snip]

> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index d0e9a5bdb08b..79f9932d2b00 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -623,6 +623,19 @@ struct v4l2_subdev_pad_config {
>  	struct v4l2_rect try_compose;
>  };
>  
> +/**
> + * struct v4l2_subdev_state - Used for storing subdev information.

s/information/state information/

> + *
> + * @pads: &struct v4l2_subdev_pad_config array
> + *
> + * This structure only needs to be passed to the pad op if the 'which' field
> + * of the main argument is set to %V4L2_SUBDEV_FORMAT_TRY. For
> + * %V4L2_SUBDEV_FORMAT_ACTIVE it is safe to pass %NULL.

We should fix this by storing an instance of v4l2_subdev_state in
v4l2_subdev (on top of this patch).

> + */
> +struct v4l2_subdev_state {
> +	struct v4l2_subdev_pad_config *pads;
> +};
> +
>  /**
>   * struct v4l2_subdev_pad_ops - v4l2-subdev pad level operations
>   *
> @@ -687,27 +700,27 @@ struct v4l2_subdev_pad_config {
>   */
>  struct v4l2_subdev_pad_ops {
>  	int (*init_cfg)(struct v4l2_subdev *sd,
> -			struct v4l2_subdev_pad_config *cfg);
> +			struct v4l2_subdev_state *state);
>  	int (*enum_mbus_code)(struct v4l2_subdev *sd,
> -			      struct v4l2_subdev_pad_config *cfg,
> +			      struct v4l2_subdev_state *state,
>  			      struct v4l2_subdev_mbus_code_enum *code);
>  	int (*enum_frame_size)(struct v4l2_subdev *sd,
> -			       struct v4l2_subdev_pad_config *cfg,
> +			       struct v4l2_subdev_state *state,
>  			       struct v4l2_subdev_frame_size_enum *fse);
>  	int (*enum_frame_interval)(struct v4l2_subdev *sd,
> -				   struct v4l2_subdev_pad_config *cfg,
> +				   struct v4l2_subdev_state *state,
>  				   struct v4l2_subdev_frame_interval_enum *fie);
>  	int (*get_fmt)(struct v4l2_subdev *sd,
> -		       struct v4l2_subdev_pad_config *cfg,
> +		       struct v4l2_subdev_state *state,
>  		       struct v4l2_subdev_format *format);
>  	int (*set_fmt)(struct v4l2_subdev *sd,
> -		       struct v4l2_subdev_pad_config *cfg,
> +		       struct v4l2_subdev_state *state,
>  		       struct v4l2_subdev_format *format);
>  	int (*get_selection)(struct v4l2_subdev *sd,
> -			     struct v4l2_subdev_pad_config *cfg,
> +			     struct v4l2_subdev_state *state,
>  			     struct v4l2_subdev_selection *sel);
>  	int (*set_selection)(struct v4l2_subdev *sd,
> -			     struct v4l2_subdev_pad_config *cfg,
> +			     struct v4l2_subdev_state *state,
>  			     struct v4l2_subdev_selection *sel);
>  	int (*get_edid)(struct v4l2_subdev *sd, struct v4l2_edid *edid);
>  	int (*set_edid)(struct v4l2_subdev *sd, struct v4l2_edid *edid);
> @@ -918,14 +931,14 @@ struct v4l2_subdev {
>   * struct v4l2_subdev_fh - Used for storing subdev information per file handle
>   *
>   * @vfh: pointer to &struct v4l2_fh
> - * @pad: pointer to &struct v4l2_subdev_pad_config
> + * @state: pointer to &struct v4l2_subdev_state
>   * @owner: module pointer to the owner of this file handle
>   */
>  struct v4l2_subdev_fh {
>  	struct v4l2_fh vfh;
>  	struct module *owner;
>  #if defined(CONFIG_VIDEO_V4L2_SUBDEV_API)
> -	struct v4l2_subdev_pad_config *pad;
> +	struct v4l2_subdev_state *state;

I'd expect the v4l2_subdev_state structure to remain small, as it will
mostly contains a few pointers. Should we embed it in v4l2_subdev_fh
instead of allocating it separately ?

>  #endif
>  };
>  
> @@ -945,17 +958,17 @@ struct v4l2_subdev_fh {
>   *	&struct v4l2_subdev_pad_config->try_fmt
>   *
>   * @sd: pointer to &struct v4l2_subdev
> - * @cfg: pointer to &struct v4l2_subdev_pad_config array.
> - * @pad: index of the pad in the @cfg array.
> + * @state: pointer to &struct v4l2_subdev_state.
> + * @pad: index of the pad in the @state array.

@state isn't an array.

>   */
>  static inline struct v4l2_mbus_framefmt *
>  v4l2_subdev_get_try_format(struct v4l2_subdev *sd,
> -			   struct v4l2_subdev_pad_config *cfg,
> +			   struct v4l2_subdev_state *state,
>  			   unsigned int pad)
>  {
>  	if (WARN_ON(pad >= sd->entity.num_pads))
>  		pad = 0;
> -	return &cfg[pad].try_fmt;
> +	return &state->pads[pad].try_fmt;

As the goal is to not limit the state to TRY formats but store it in the
v4l2_subdev structure too, I'd rename try_fmt to format.
v4l2_subdev_get_try_format() should then become
v4l2_subdev_state_get_oad_format() or something similar (likely in a
separate patch).

>  }
>  
>  /**
> @@ -963,17 +976,17 @@ v4l2_subdev_get_try_format(struct v4l2_subdev *sd,
>   *	&struct v4l2_subdev_pad_config->try_crop
>   *
>   * @sd: pointer to &struct v4l2_subdev
> - * @cfg: pointer to &struct v4l2_subdev_pad_config array.
> - * @pad: index of the pad in the @cfg array.
> + * @state: pointer to &struct v4l2_subdev_state.
> + * @pad: index of the pad in the @state array.
>   */
>  static inline struct v4l2_rect *
>  v4l2_subdev_get_try_crop(struct v4l2_subdev *sd,
> -			 struct v4l2_subdev_pad_config *cfg,
> +			 struct v4l2_subdev_state *state,
>  			 unsigned int pad)
>  {
>  	if (WARN_ON(pad >= sd->entity.num_pads))
>  		pad = 0;
> -	return &cfg[pad].try_crop;
> +	return &state->pads[pad].try_crop;
>  }
>  
>  /**
> @@ -981,17 +994,17 @@ v4l2_subdev_get_try_crop(struct v4l2_subdev *sd,
>   *	&struct v4l2_subdev_pad_config->try_compose
>   *
>   * @sd: pointer to &struct v4l2_subdev
> - * @cfg: pointer to &struct v4l2_subdev_pad_config array.
> - * @pad: index of the pad in the @cfg array.
> + * @state: pointer to &struct v4l2_subdev_state.
> + * @pad: index of the pad in the @state array.
>   */
>  static inline struct v4l2_rect *
>  v4l2_subdev_get_try_compose(struct v4l2_subdev *sd,
> -			    struct v4l2_subdev_pad_config *cfg,
> +			    struct v4l2_subdev_state *state,
>  			    unsigned int pad)
>  {
>  	if (WARN_ON(pad >= sd->entity.num_pads))
>  		pad = 0;
> -	return &cfg[pad].try_compose;
> +	return &state->pads[pad].try_compose;
>  }
>  
>  #endif
> @@ -1093,20 +1106,17 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
>  int v4l2_subdev_link_validate(struct media_link *link);
>  
>  /**
> - * v4l2_subdev_alloc_pad_config - Allocates memory for pad config
> + * v4l2_subdev_alloc_state - allocate v4l2_subdev_state
>   *
> - * @sd: pointer to struct v4l2_subdev

Won't kerneldoc complain if not all parameters are documented ?

> + * Must call v4l2_subdev_free_state() when state is no longer needed.
>   */
> -struct
> -v4l2_subdev_pad_config *v4l2_subdev_alloc_pad_config(struct v4l2_subdev *sd);
> +struct v4l2_subdev_state *v4l2_subdev_alloc_state(struct v4l2_subdev *sd);
>  
>  /**
> - * v4l2_subdev_free_pad_config - Frees memory allocated by
> - *	v4l2_subdev_alloc_pad_config().
> - *
> - * @cfg: pointer to &struct v4l2_subdev_pad_config
> + * v4l2_subdev_free_state - uninitialize v4l2_subdev_state

s/uninitialize/Free a/ ?

>   */
> -void v4l2_subdev_free_pad_config(struct v4l2_subdev_pad_config *cfg);
> +void v4l2_subdev_free_state(struct v4l2_subdev_state *state);
> +
>  #endif /* CONFIG_MEDIA_CONTROLLER */
>  
>  /**

-- 
Regards,

Laurent Pinchart
