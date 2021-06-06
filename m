Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6346339CDE1
	for <lists+linux-media@lfdr.de>; Sun,  6 Jun 2021 09:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbhFFH3d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Jun 2021 03:29:33 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56088 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbhFFH3c (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Jun 2021 03:29:32 -0400
Received: from [192.168.1.136] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0FA8F3E7;
        Sun,  6 Jun 2021 09:27:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622964462;
        bh=uDKpnmcIQIJpUxT7BUMUaSFSe2GPF6JCtDG95WRnSvQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=EHYrDIketiMszU487qVzlhgNJLDra2pNmOy06MismJfqiB7ybdwqkz18p34hG0Jk4
         f0GdwzmpUCtCqu327+eZVnuE8hjq0jry+fpZ9jwO9hsYRY+tCsR7fgIGaxQqM1qzzz
         YMCTf1MMwqMePeTXPeC44VOE1VAYxJYdIXZJeFRE=
Subject: Re: [PATCH v2 1/1] media: v4l2-subdev: add subdev-wide state struct
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20210527094244.617473-1-tomi.valkeinen@ideasonboard.com>
 <20210527094244.617473-2-tomi.valkeinen@ideasonboard.com>
 <YLpEpMRxZxdmpPPa@pendragon.ideasonboard.com>
 <YLwBMwM1j/iaDE4K@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <d2fcc25b-fd05-da31-8155-c0bea33f7b18@ideasonboard.com>
Date:   Sun, 6 Jun 2021 10:27:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YLwBMwM1j/iaDE4K@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 06/06/2021 01:56, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Fri, Jun 04, 2021 at 06:20:04PM +0300, Laurent Pinchart wrote:
>> On Thu, May 27, 2021 at 12:42:44PM +0300, Tomi Valkeinen wrote:
>>> We have 'struct v4l2_subdev_pad_config' which contains configuration for
>>> a single pad used for the TRY functionality, and an array of those
>>> structs is passed to various v4l2_subdev_pad_ops.
>>>
>>> I was working on subdev internal routing between pads, and realized that
>>> there's no way to add TRY functionality for routes, which is not pad
>>> specific configuration. Adding a separate struct for try-route config
>>> wouldn't work either, as e.g. set-fmt needs to know the try-route
>>> configuration to propagate the settings.
>>>
>>> This patch adds a new struct, 'struct v4l2_subdev_state' (which at the
>>> moment only contains the v4l2_subdev_pad_config array) and the new
>>> struct is used in most of the places where v4l2_subdev_pad_config was
>>> used. All v4l2_subdev_pad_ops functions taking v4l2_subdev_pad_config
>>> are changed to instead take v4l2_subdev_state.
>>
>> I really like this change, especially for the next steps that it
>> enables.
>>
>>> The changes to drivers/media/v4l2-core/v4l2-subdev.c and
>>> include/media/v4l2-subdev.h were written by hand, and all the driver
>>> changes were done with the semantic patch below. The spatch needs to be
>>> applied to a select list of directories. I used the following shell
>>> commands to apply the spatch:
>>>
>>> dirs="drivers/media/i2c drivers/media/platform drivers/media/usb drivers/media/test-drivers/vimc drivers/media/pci drivers/staging/media"
>>> for dir in $dirs; do spatch -j8 --dir --include-headers --no-show-diff --in-place --sp-file v4l2-subdev-state.cocci $dir; done
>>>
>>> Note that Coccinelle chokes on a few drivers (gcc extensions?). With
>>> minor changes we can make Coccinelle run fine, and these changes can be
>>> reverted after spatch. The diff for these changes is:
>>>
>>> diff --git a/drivers/media/i2c/s5k5baf.c b/drivers/media/i2c/s5k5baf.c
>>> index 6e702b57c37d..5f136831039f 100644
>>> --- a/drivers/media/i2c/s5k5baf.c
>>> +++ b/drivers/media/i2c/s5k5baf.c
>>> @@ -1481,7 +1481,7 @@ static int s5k5baf_set_selection(struct v4l2_subdev *sd,
>>>   				&s5k5baf_cis_rect,
>>>   				v4l2_subdev_get_try_crop(sd, cfg, PAD_CIS),
>>>   				v4l2_subdev_get_try_compose(sd, cfg, PAD_CIS),
>>> -				v4l2_subdev_get_try_crop(sd, cfg, PAD_OUT)
>>> +				v4l2_subdev_get_try_crop(sd, cfg, PAD_OUT),
>>>   			};
>>>   		s5k5baf_set_rect_and_adjust(rects, rtype, &sel->r);
>>>   		return 0;
>>> diff --git a/drivers/media/platform/s3c-camif/camif-capture.c b/drivers/media/platform/s3c-camif/camif-capture.c
>>> index 9ca49af29542..d92a5fb8835f 100644
>>> --- a/drivers/media/platform/s3c-camif/camif-capture.c
>>> +++ b/drivers/media/platform/s3c-camif/camif-capture.c
>>> @@ -1230,7 +1230,7 @@ static int s3c_camif_subdev_get_fmt(struct v4l2_subdev *sd,
>>>   		*mf = camif->mbus_fmt;
>>>   		break;
>>>
>>> -	case CAMIF_SD_PAD_SOURCE_C...CAMIF_SD_PAD_SOURCE_P:
>>> +	case CAMIF_SD_PAD_SOURCE_C:
>>>   		/* crop rectangle at camera interface input */
>>>   		mf->width = camif->camif_crop.width;
>>>   		mf->height = camif->camif_crop.height;
>>> @@ -1332,7 +1332,7 @@ static int s3c_camif_subdev_set_fmt(struct v4l2_subdev *sd,
>>>   		}
>>>   		break;
>>>
>>> -	case CAMIF_SD_PAD_SOURCE_C...CAMIF_SD_PAD_SOURCE_P:
>>> +	case CAMIF_SD_PAD_SOURCE_C:
>>>   		/* Pixel format can be only changed on the sink pad. */
>>>   		mf->code = camif->mbus_fmt.code;
>>>   		mf->width = crop->width;
>>>
>>> The semantic patch is:
>>>
>>> // <smpl>
>>>
>>> // Change function parameter
>>>
>>> @@
>>> identifier func;
>>> identifier cfg;
>>> @@
>>>
>>>   func(...,
>>> -   struct v4l2_subdev_pad_config *cfg
>>> +   struct v4l2_subdev_state *sd_state
>>>      , ...)
>>>   {
>>>   <...
>>> - cfg
>>> + sd_state
>>>   ...>
>>>   }
>>>
>>> // Change function declaration parameter
>>>
>>> @@
>>> identifier func;
>>> identifier cfg;
>>> type T;
>>> @@
>>> T func(...,
>>> -   struct v4l2_subdev_pad_config *cfg
>>> +   struct v4l2_subdev_state *sd_state
>>>      , ...);
>>>
>>> // Change function return value
>>>
>>> @@
>>> identifier func;
>>> @@
>>> - struct v4l2_subdev_pad_config
>>> + struct v4l2_subdev_state
>>>   *func(...)
>>>   {
>>>      ...
>>>   }
>>>
>>> // Change function declaration return value
>>>
>>> @@
>>> identifier func;
>>> @@
>>> - struct v4l2_subdev_pad_config
>>> + struct v4l2_subdev_state
>>>   *func(...);
>>>
>>> // Some drivers pass a local pad_cfg for a single pad to a called function. Wrap it
>>> // inside a pad_state.
>>>
>>> @@
>>> identifier func;
>>> identifier pad_cfg;
>>> @@
>>> func(...)
>>> {
>>>      ...
>>>      struct v4l2_subdev_pad_config pad_cfg;
>>> +   struct v4l2_subdev_state pad_state = { .pads = &pad_cfg };
>>>
>>>      <+...
>>>
>>> (
>>>      v4l2_subdev_call
>>> |
>>>      sensor_call
>>> |
>>>      isi_try_fse
>>> |
>>>      isc_try_fse
>>> |
>>>      saa_call_all
>>> )
>>>      (...,
>>> -   &pad_cfg
>>> +   &pad_state
>>>      ,...)
>>>
>>>      ...+>
>>> }
>>>
>>> // If the function uses fields from pad_config, access via state->pads
>>>
>>> @@
>>> identifier func;
>>> identifier state;
>>> @@
>>>   func(...,
>>>      struct v4l2_subdev_state *state
>>>      , ...)
>>>   {
>>>      <...
>>> (
>>> -   state->try_fmt
>>> +   state->pads->try_fmt
>>> |
>>> -   state->try_crop
>>> +   state->pads->try_crop
>>> |
>>> -   state->try_compose
>>> +   state->pads->try_compose
>>> )
>>>      ...>
>>> }
>>>
>>> // If the function accesses the filehandle, use fh->state instead
>>>
>>> @@
>>> struct v4l2_subdev_fh *fh;
>>> @@
>>> -    fh->pad
>>> +    fh->state
>>>
>>> @@
>>> struct v4l2_subdev_fh fh;
>>> @@
>>> -    fh.pad
>>> +    fh.state
>>>
>>> // Start of vsp1 specific
>>>
>>> @@
>>> @@
>>> struct vsp1_entity {
>>>      ...
>>> -    struct v4l2_subdev_pad_config *config;
>>> +    struct v4l2_subdev_state *config;
>>>      ...
>>> };
>>>
>>> @@
>>> symbol entity;
>>> @@
>>> vsp1_entity_init(...)
>>> {
>>>      ...
>>>      entity->config =
>>> -    v4l2_subdev_alloc_pad_config
>>> +    v4l2_subdev_alloc_state
>>>      (&entity->subdev);
>>>      ...
>>> }
>>>
>>> @@
>>> symbol entity;
>>> @@
>>> vsp1_entity_destroy(...)
>>> {
>>>      ...
>>> -   v4l2_subdev_free_pad_config
>>> +   v4l2_subdev_free_state
>>>      (entity->config);
>>>      ...
>>> }
>>>
>>> @exists@
>>> identifier func =~ "(^vsp1.*)|(hsit_set_format)|(sru_enum_frame_size)|(sru_set_format)|(uif_get_selection)|(uif_set_selection)|(uds_enum_frame_size)|(uds_set_format)|(brx_set_format)|(brx_get_selection)|(histo_get_selection)|(histo_set_selection)|(brx_set_selection)";
>>> symbol config;
>>> @@
>>> func(...) {
>>>      ...
>>> -    struct v4l2_subdev_pad_config *config;
>>> +    struct v4l2_subdev_state *config;
>>>      ...
>>> }
>>>
>>> // End of vsp1 specific
>>>
>>> // Start of rcar specific
>>>
>>> @@
>>> identifier sd;
>>> identifier pad_cfg;
>>> @@
>>>   rvin_try_format(...)
>>>   {
>>>      ...
>>> -   struct v4l2_subdev_pad_config *pad_cfg;
>>> +   struct v4l2_subdev_state *sd_state;
>>>      ...
>>> -   pad_cfg = v4l2_subdev_alloc_pad_config(sd);
>>> +   sd_state = v4l2_subdev_alloc_state(sd);
>>>      <...
>>> -   pad_cfg
>>> +   sd_state
>>>      ...>
>>> -   v4l2_subdev_free_pad_config(pad_cfg);
>>> +   v4l2_subdev_free_state(sd_state);
>>>      ...
>>>   }
>>>
>>> // End of rcar specific
>>>
>>> // Start of rockchip specific
>>>
>>> @@
>>> identifier func =~ "(rkisp1_rsz_get_pad_fmt)|(rkisp1_rsz_get_pad_crop)|(rkisp1_rsz_register)";
>>> symbol rsz;
>>> symbol pad_cfg;
>>> @@
>>>
>>>   func(...)
>>>   {
>>> +   struct v4l2_subdev_state state = { .pads = rsz->pad_cfg };
>>>      ...
>>> -   rsz->pad_cfg
>>> +   &state
>>>      ...
>>>   }
>>>
>>> @@
>>> identifier func =~ "(rkisp1_isp_get_pad_fmt)|(rkisp1_isp_get_pad_crop)";
>>> symbol isp;
>>> symbol pad_cfg;
>>> @@
>>>
>>>   func(...)
>>>   {
>>> +   struct v4l2_subdev_state state = { .pads = isp->pad_cfg };
>>>      ...
>>> -   isp->pad_cfg
>>> +   &state
>>>      ...
>>>   }
>>>
>>> @@
>>> symbol rkisp1;
>>> symbol isp;
>>> symbol pad_cfg;
>>> @@
>>>
>>>   rkisp1_isp_register(...)
>>>   {
>>> +   struct v4l2_subdev_state state = { .pads = rkisp1->isp.pad_cfg };
>>>      ...
>>> -   rkisp1->isp.pad_cfg
>>> +   &state
>>>      ...
>>>   }
>>>
>>> // End of rockchip specific
>>>
>>> // Start of tegra-video specific
>>>
>>> @@
>>> identifier sd;
>>> identifier pad_cfg;
>>> @@
>>>   __tegra_channel_try_format(...)
>>>   {
>>>      ...
>>> -   struct v4l2_subdev_pad_config *pad_cfg;
>>> +   struct v4l2_subdev_state *sd_state;
>>>      ...
>>> -   pad_cfg = v4l2_subdev_alloc_pad_config(sd);
>>> +   sd_state = v4l2_subdev_alloc_state(sd);
>>>      <...
>>> -   pad_cfg
>>> +   sd_state
>>>      ...>
>>> -   v4l2_subdev_free_pad_config(pad_cfg);
>>> +   v4l2_subdev_free_state(sd_state);
>>>      ...
>>>   }
>>>
>>> @@
>>> identifier sd_state;
>>> @@
>>>   __tegra_channel_try_format(...)
>>>   {
>>>      ...
>>>      struct v4l2_subdev_state *sd_state;
>>>      <...
>>> -   sd_state->try_crop
>>> +   sd_state->pads->try_crop
>>>      ...>
>>>   }
>>>
>>> // End of tegra-video specific
>>>
>>> // </smpl>
>>>
>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>> ---
>>>   drivers/media/i2c/adv7170.c                   |   6 +-
>>>   drivers/media/i2c/adv7175.c                   |   6 +-
>>>   drivers/media/i2c/adv7180.c                   |  18 +--
>>>   drivers/media/i2c/adv7183.c                   |   8 +-
>>>   drivers/media/i2c/adv748x/adv748x-afe.c       |  13 +-
>>>   drivers/media/i2c/adv748x/adv748x-csi2.c      |  14 +-
>>>   drivers/media/i2c/adv748x/adv748x-hdmi.c      |  13 +-
>>>   drivers/media/i2c/adv7511-v4l2.c              |  10 +-
>>>   drivers/media/i2c/adv7604.c                   |  12 +-
>>>   drivers/media/i2c/adv7842.c                   |  12 +-
>>>   drivers/media/i2c/ak881x.c                    |   6 +-
>>>   drivers/media/i2c/ccs/ccs-core.c              |  84 ++++++-----
>>>   drivers/media/i2c/cx25840/cx25840-core.c      |   2 +-
>>>   drivers/media/i2c/et8ek8/et8ek8_driver.c      |  23 +--
>>>   drivers/media/i2c/hi556.c                     |  15 +-
>>>   drivers/media/i2c/imx214.c                    |  37 ++---
>>>   drivers/media/i2c/imx219.c                    |  30 ++--
>>>   drivers/media/i2c/imx258.c                    |  19 +--
>>>   drivers/media/i2c/imx274.c                    |  32 ++--
>>>   drivers/media/i2c/imx290.c                    |  20 +--
>>>   drivers/media/i2c/imx319.c                    |  18 +--
>>>   drivers/media/i2c/imx334.c                    |  18 +--
>>>   drivers/media/i2c/imx355.c                    |  18 +--
>>>   drivers/media/i2c/m5mols/m5mols_core.c        |  21 ++-
>>>   drivers/media/i2c/max9286.c                   |  17 ++-
>>>   drivers/media/i2c/ml86v7667.c                 |   4 +-
>>>   drivers/media/i2c/mt9m001.c                   |  18 +--
>>>   drivers/media/i2c/mt9m032.c                   |  34 +++--
>>>   drivers/media/i2c/mt9m111.c                   |  18 +--
>>>   drivers/media/i2c/mt9p031.c                   |  45 +++---
>>>   drivers/media/i2c/mt9t001.c                   |  44 +++---
>>>   drivers/media/i2c/mt9t112.c                   |  14 +-
>>>   drivers/media/i2c/mt9v011.c                   |   6 +-
>>>   drivers/media/i2c/mt9v032.c                   |  44 +++---
>>>   drivers/media/i2c/mt9v111.c                   |  23 +--
>>>   drivers/media/i2c/noon010pc30.c               |  19 ++-
>>>   drivers/media/i2c/ov02a10.c                   |  17 ++-
>>>   drivers/media/i2c/ov13858.c                   |  18 +--
>>>   drivers/media/i2c/ov2640.c                    |  16 +-
>>>   drivers/media/i2c/ov2659.c                    |  14 +-
>>>   drivers/media/i2c/ov2680.c                    |  23 +--
>>>   drivers/media/i2c/ov2685.c                    |  10 +-
>>>   drivers/media/i2c/ov2740.c                    |  15 +-
>>>   drivers/media/i2c/ov5640.c                    |  14 +-
>>>   drivers/media/i2c/ov5645.c                    |  38 ++---
>>>   drivers/media/i2c/ov5647.c                    |  26 ++--
>>>   drivers/media/i2c/ov5648.c                    |  14 +-
>>>   drivers/media/i2c/ov5670.c                    |  19 +--
>>>   drivers/media/i2c/ov5675.c                    |  15 +-
>>>   drivers/media/i2c/ov5695.c                    |  15 +-
>>>   drivers/media/i2c/ov6650.c                    |  28 ++--
>>>   drivers/media/i2c/ov7251.c                    |  39 ++---
>>>   drivers/media/i2c/ov7670.c                    |  17 ++-
>>>   drivers/media/i2c/ov772x.c                    |  12 +-
>>>   drivers/media/i2c/ov7740.c                    |  17 ++-
>>>   drivers/media/i2c/ov8856.c                    |  15 +-
>>>   drivers/media/i2c/ov8865.c                    |  14 +-
>>>   drivers/media/i2c/ov9640.c                    |   8 +-
>>>   drivers/media/i2c/ov9650.c                    |  17 ++-
>>>   drivers/media/i2c/ov9734.c                    |  15 +-
>>>   drivers/media/i2c/rdacm20.c                   |   4 +-
>>>   drivers/media/i2c/rdacm21.c                   |   4 +-
>>>   drivers/media/i2c/rj54n1cb0c.c                |  12 +-
>>>   drivers/media/i2c/s5c73m3/s5c73m3-core.c      |  55 +++----
>>>   drivers/media/i2c/s5k4ecgx.c                  |  22 +--
>>>   drivers/media/i2c/s5k5baf.c                   |  49 +++---
>>>   drivers/media/i2c/s5k6a3.c                    |  19 ++-
>>>   drivers/media/i2c/s5k6aa.c                    |  39 ++---
>>>   drivers/media/i2c/saa6752hs.c                 |   6 +-
>>>   drivers/media/i2c/saa7115.c                   |   2 +-
>>>   drivers/media/i2c/saa717x.c                   |   2 +-
>>>   drivers/media/i2c/sr030pc30.c                 |   8 +-
>>>   drivers/media/i2c/st-mipid02.c                |  21 +--
>>>   drivers/media/i2c/tc358743.c                  |   8 +-
>>>   drivers/media/i2c/tda1997x.c                  |  14 +-
>>>   drivers/media/i2c/tvp514x.c                   |   6 +-
>>>   drivers/media/i2c/tvp5150.c                   |  20 +--
>>>   drivers/media/i2c/tvp7002.c                   |  11 +-
>>>   drivers/media/i2c/tw9910.c                    |  10 +-
>>>   drivers/media/i2c/vs6624.c                    |   8 +-
>>>   drivers/media/pci/cx18/cx18-av-core.c         |   2 +-
>>>   drivers/media/pci/intel/ipu3/ipu3-cio2-main.c |  17 ++-
>>>   drivers/media/pci/saa7134/saa7134-empress.c   |   5 +-
>>>   drivers/media/platform/atmel/atmel-isc-base.c |  19 ++-
>>>   drivers/media/platform/atmel/atmel-isi.c      |  19 ++-
>>>   drivers/media/platform/cadence/cdns-csi2tx.c  |  14 +-
>>>   .../media/platform/exynos4-is/fimc-capture.c  |  22 +--
>>>   drivers/media/platform/exynos4-is/fimc-isp.c  |  37 +++--
>>>   drivers/media/platform/exynos4-is/fimc-lite.c |  39 ++---
>>>   drivers/media/platform/exynos4-is/mipi-csis.c |  17 ++-
>>>   .../media/platform/marvell-ccic/mcam-core.c   |   5 +-
>>>   drivers/media/platform/omap3isp/ispccdc.c     |  85 ++++++-----
>>>   drivers/media/platform/omap3isp/ispccp2.c     |  41 ++---
>>>   drivers/media/platform/omap3isp/ispcsi2.c     |  41 ++---
>>>   drivers/media/platform/omap3isp/isppreview.c  |  69 +++++----
>>>   drivers/media/platform/omap3isp/ispresizer.c  |  70 +++++----
>>>   drivers/media/platform/pxa_camera.c           |   5 +-
>>>   .../media/platform/qcom/camss/camss-csid.c    |  35 ++---
>>>   .../media/platform/qcom/camss/camss-csiphy.c  |  40 ++---
>>>   .../media/platform/qcom/camss/camss-ispif.c   |  36 ++---
>>>   drivers/media/platform/qcom/camss/camss-vfe.c |  84 ++++++-----
>>>   drivers/media/platform/rcar-vin/rcar-csi2.c   |   8 +-
>>>   drivers/media/platform/rcar-vin/rcar-v4l2.c   |  10 +-
>>>   drivers/media/platform/renesas-ceu.c          |   7 +-
>>>   .../platform/rockchip/rkisp1/rkisp1-isp.c     | 112 ++++++++------
>>>   .../platform/rockchip/rkisp1/rkisp1-resizer.c |  95 +++++++-----
>>>   .../media/platform/s3c-camif/camif-capture.c  |  18 +--
>>>   drivers/media/platform/stm32/stm32-dcmi.c     |  14 +-
>>>   .../platform/sunxi/sun4i-csi/sun4i_v4l2.c     |  16 +-
>>>   drivers/media/platform/ti-vpe/cal-camerarx.c  |  35 +++--
>>>   drivers/media/platform/via-camera.c           |   5 +-
>>>   drivers/media/platform/video-mux.c            |  22 +--
>>>   drivers/media/platform/vsp1/vsp1_brx.c        |  34 +++--
>>>   drivers/media/platform/vsp1/vsp1_clu.c        |  13 +-
>>>   drivers/media/platform/vsp1/vsp1_entity.c     |  53 +++----
>>>   drivers/media/platform/vsp1/vsp1_entity.h     |  20 +--
>>>   drivers/media/platform/vsp1/vsp1_histo.c      |  51 ++++---
>>>   drivers/media/platform/vsp1/vsp1_hsit.c       |  14 +-
>>>   drivers/media/platform/vsp1/vsp1_lif.c        |  13 +-
>>>   drivers/media/platform/vsp1/vsp1_lut.c        |  13 +-
>>>   drivers/media/platform/vsp1/vsp1_rwpf.c       |  32 ++--
>>>   drivers/media/platform/vsp1/vsp1_rwpf.h       |   2 +-
>>>   drivers/media/platform/vsp1/vsp1_sru.c        |  22 +--
>>>   drivers/media/platform/vsp1/vsp1_uds.c        |  22 +--
>>>   drivers/media/platform/vsp1/vsp1_uif.c        |  27 ++--
>>>   .../media/platform/xilinx/xilinx-csi2rxss.c   |  20 +--
>>>   drivers/media/platform/xilinx/xilinx-tpg.c    |  25 ++--
>>>   drivers/media/platform/xilinx/xilinx-vip.c    |   8 +-
>>>   drivers/media/platform/xilinx/xilinx-vip.h    |   4 +-
>>>   .../media/test-drivers/vimc/vimc-debayer.c    |  20 +--
>>>   drivers/media/test-drivers/vimc/vimc-scaler.c |  36 ++---
>>>   drivers/media/test-drivers/vimc/vimc-sensor.c |  16 +-
> 
> There are compilation errors in vimc in your branch.

Ah. The branch I shared contains a minimal version of this patch, which 
only changes the drivers I've been using. It's not fun to rebase this 
patch, so I don't have the full version in my work branch.

  Tomi
