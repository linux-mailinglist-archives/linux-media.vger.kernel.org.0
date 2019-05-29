Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E154C2D688
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 09:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbfE2Hjm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 03:39:42 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:53095 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726057AbfE2Hjl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 03:39:41 -0400
Received: from [IPv6:2001:983:e9a7:1:352c:d076:e7aa:19ae] ([IPv6:2001:983:e9a7:1:352c:d076:e7aa:19ae])
        by smtp-cloud7.xs4all.net with ESMTPA
        id VtBRh37AO3qlsVtBShrvIx; Wed, 29 May 2019 09:39:39 +0200
Subject: Re: [PATCH 7/8] media: vivid: add CEC support to display present ctrl
To:     johan.korsnes@gmail.com, linux-media@vger.kernel.org
References: <20190528171912.3688-1-johan.korsnes@gmail.com>
 <20190528171912.3688-8-johan.korsnes@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <021b02ca-9543-c921-d231-0864e045b3c9@xs4all.nl>
Date:   Wed, 29 May 2019 09:39:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190528171912.3688-8-johan.korsnes@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKUxMB85FjNqhHh0JTDNvVXghgUdx+D0NL9vufebMU67lBXNllqiyoLNDFfPM7HvISf/di7c5jqF19U/wuhUD/ZpqMVaF7QGLS7oPRd6ukMtbFdQr1Xl
 ixmEip8ocLO0kQxWehQ77K3L7G02pJPVsVBhn28+zkN2wozIj93lZGmu85EHjgnQ11EQ1dJS0Dk4izk5S7lzHZqG1/1MpgEMmlyb4NJMlLwJJkfrwq95XjSN
 Q8j+jamdJozXMymcI1qZNsvZw8t9fckaY5pIfa2M8JsU1te2exiU8Io1FohiA9zzfMBu3RIrXdTHhJc1KqagyA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Johan,

Thanks for this patch series!

The previous patches all look good, but this one needs a bit more work:

On 5/28/19 7:19 PM, johan.korsnes@gmail.com wrote:
> From: Johan Korsnes <johan.korsnes@gmail.com>
> 
> Set/invalidate physical addresses based on the configuration of the
> display present control. This is relevant not only when the display
> present control is modified, but also when the Vivid instance EDID is
> set/cleared.
> 
> Signed-off-by: Johan Korsnes <johan.korsnes@gmail.com>
> ---
>  drivers/media/platform/vivid/vivid-core.c     | 16 ++++++------
>  drivers/media/platform/vivid/vivid-ctrls.c    | 25 ++++++++++++++++---
>  drivers/media/platform/vivid/vivid-vid-cap.c  |  6 ++++-
>  .../media/platform/vivid/vivid-vid-common.c   |  2 ++
>  4 files changed, 36 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/vivid/vivid-core.c b/drivers/media/platform/vivid/vivid-core.c
> index b2b4ee48cef0..ca46ac24f51e 100644
> --- a/drivers/media/platform/vivid/vivid-core.c
> +++ b/drivers/media/platform/vivid/vivid-core.c
> @@ -1060,14 +1060,6 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  	vivid_update_format_cap(dev, false);
>  	vivid_update_format_out(dev);
>  
> -	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vid_cap);
> -	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vid_out);
> -	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vbi_cap);
> -	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vbi_out);
> -	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_radio_rx);
> -	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_radio_tx);
> -	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_sdr_cap);
> -
>  	/* initialize overlay */
>  	dev->fb_cap.fmt.width = dev->src_rect.width;
>  	dev->fb_cap.fmt.height = dev->src_rect.height;
> @@ -1488,6 +1480,14 @@ static int vivid_create_instance(struct platform_device *pdev, int inst)
>  	}
>  #endif
>  
> +	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vid_cap);
> +	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vid_out);
> +	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vbi_cap);
> +	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_vbi_out);
> +	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_radio_rx);
> +	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_radio_tx);
> +	v4l2_ctrl_handler_setup(&dev->ctrl_hdl_sdr_cap);
> +
>  	/* Now that everything is fine, let's add it to device list */
>  	vivid_devs[inst] = dev;
>  

This change should be in a patch of its own.

It also needs more work. The reason for this change is that v4l2_ctrl_handler_setup()
expects that the cec adapters are up and running, so moving these calls until after
the creation of the adapters fixes that.

However, that now means that controls change after the creation of the video devices,
which isn't right.

If you look at the probe() function you'll see that things are done in two stages:
first all the vb2 queues are created, and only if that succeeded are the video devices
created.

The same should be done for the CEC adapters: they should be allocated (vivid_cec_alloc_adap)
in the first stage, then call v4l2_ctrl_handler_setup(), and finally create the actual
device nodes (cec_register_adapter).

That way the controls are configured correctly before any device nodes are created.

> diff --git a/drivers/media/platform/vivid/vivid-ctrls.c b/drivers/media/platform/vivid/vivid-ctrls.c
> index ae3690fd1b52..e4758a2837e6 100644
> --- a/drivers/media/platform/vivid/vivid-ctrls.c
> +++ b/drivers/media/platform/vivid/vivid-ctrls.c
> @@ -18,6 +18,7 @@
>  #include "vivid-radio-common.h"
>  #include "vivid-osd.h"
>  #include "vivid-ctrls.h"
> +#include "vivid-cec.h"
>  
>  #define VIVID_CID_CUSTOM_BASE		(V4L2_CID_USER_BASE | 0xf000)
>  #define VIVID_CID_BUTTON		(VIVID_CID_CUSTOM_BASE + 0)
> @@ -923,7 +924,7 @@ static int vivid_vid_out_s_ctrl(struct v4l2_ctrl *ctrl)
>  	struct vivid_dev *dev = container_of(ctrl->handler, struct vivid_dev, ctrl_hdl_vid_out);
>  	struct v4l2_bt_timings *bt = &dev->dv_timings_out.bt;
>  	u32 display_present = 0;
> -	unsigned i, j;
> +	unsigned i, j, bus_idx;
>  
>  	switch (ctrl->id) {
>  	case VIVID_CID_HAS_CROP_OUT:
> @@ -962,15 +963,31 @@ static int vivid_vid_out_s_ctrl(struct v4l2_ctrl *ctrl)
>  			break;
>  
>  		dev->display_present[dev->output] = ctrl->val;
> -
>  		for (i = 0, j = 0; i < dev->num_outputs; i++)
>  			if (dev->output_type[i] == HDMI)
>  				display_present |=
>  					dev->display_present[i] << j++;
>  
> -		__v4l2_ctrl_s_ctrl(dev->ctrl_tx_hotplug, display_present);
>  		__v4l2_ctrl_s_ctrl(dev->ctrl_tx_rxsense, display_present);
> -		__v4l2_ctrl_s_ctrl(dev->ctrl_tx_edid_present, display_present);
> +
> +		if (dev->edid_blocks) {
> +			__v4l2_ctrl_s_ctrl(dev->ctrl_tx_edid_present,
> +					   display_present);
> +			__v4l2_ctrl_s_ctrl(dev->ctrl_tx_hotplug,
> +					   display_present);
> +		}
> +
> +		if (dev->cec_tx_adap == NULL)
> +			break;
> +
> +		bus_idx = dev->cec_output2bus_map[dev->output];
> +		if (ctrl->val && dev->edid_blocks)
> +			cec_s_phys_addr(dev->cec_tx_adap[bus_idx],
> +					dev->cec_tx_adap[bus_idx]->phys_addr,
> +					false);
> +		else
> +			cec_phys_addr_invalidate(dev->cec_tx_adap[bus_idx]);
> +
>  		break;
>  	}
>  	return 0;
> diff --git a/drivers/media/platform/vivid/vivid-vid-cap.c b/drivers/media/platform/vivid/vivid-vid-cap.c
> index ca15c13abf6c..920be638da83 100644
> --- a/drivers/media/platform/vivid/vivid-vid-cap.c
> +++ b/drivers/media/platform/vivid/vivid-vid-cap.c
> @@ -1760,6 +1760,7 @@ int vidioc_s_edid(struct file *file, void *_fh,
>  		return -EINVAL;
>  	if (edid->blocks == 0) {
>  		dev->edid_blocks = 0;
> +		v4l2_ctrl_s_ctrl(dev->ctrl_tx_edid_present, false);

false should be 0 (it's a bitmask control).
The tx_hotplug control should be set to 0 as well.

>  		phys_addr = CEC_PHYS_ADDR_INVALID;
>  		goto set_phys_addr;
>  	}
> @@ -1777,6 +1778,7 @@ int vidioc_s_edid(struct file *file, void *_fh,
>  
>  	dev->edid_blocks = edid->blocks;
>  	memcpy(dev->edid, edid->edid, edid->blocks * 128);
> +	v4l2_ctrl_s_ctrl(dev->ctrl_tx_edid_present, true);

true should be a display_present mask. And the tx_hotplug control should
be set as well with the same mask.

It's probably best to just recalculate the display_present mask, just as
you did in vivid_vid_out_s_ctrl().

>  
>  set_phys_addr:
>  	/* TODO: a proper hotplug detect cycle should be emulated here */
> @@ -1784,7 +1786,9 @@ int vidioc_s_edid(struct file *file, void *_fh,
>  
>  	for (i = 0; i < MAX_OUTPUTS && dev->cec_tx_adap[i]; i++)
>  		cec_s_phys_addr(dev->cec_tx_adap[i],
> -				v4l2_phys_addr_for_input(phys_addr, i + 1),
> +				dev->display_present[i] ?
> +				v4l2_phys_addr_for_input(phys_addr, i + 1) :
> +				CEC_PHYS_ADDR_INVALID,
>  				false);
>  	return 0;
>  }
> diff --git a/drivers/media/platform/vivid/vivid-vid-common.c b/drivers/media/platform/vivid/vivid-vid-common.c
> index b6882426fc12..0addf8ef7dbf 100644
> --- a/drivers/media/platform/vivid/vivid-vid-common.c
> +++ b/drivers/media/platform/vivid/vivid-vid-common.c
> @@ -907,6 +907,8 @@ int vidioc_g_edid(struct file *file, void *_fh,
>  			return -EINVAL;
>  		if (dev->output_type[edid->pad] != HDMI)
>  			return -EINVAL;
> +		if (!dev->display_present[dev->output])

dev->output should be edid->pad. VIDIOC_G_EDID gets the EDID of the specified
output, not of the current output.

> +			return -ENODATA;
>  		bus_idx = dev->cec_output2bus_map[edid->pad];
>  		adap = dev->cec_tx_adap[bus_idx];
>  	}
> 

Regards,

	Hans
