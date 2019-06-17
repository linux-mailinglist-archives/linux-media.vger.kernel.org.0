Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1746C47F00
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2019 11:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728106AbfFQJ7e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Jun 2019 05:59:34 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:59657 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727545AbfFQJ7e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Jun 2019 05:59:34 -0400
Received: from [IPv6:2001:983:e9a7:1:544b:e813:3dc0:55f6] ([IPv6:2001:983:e9a7:1:544b:e813:3dc0:55f6])
        by smtp-cloud8.xs4all.net with ESMTPA
        id coQFhpWxW41bFcoQGhcQXE; Mon, 17 Jun 2019 11:59:32 +0200
Subject: Re: [PATCH v2 8/9] media: vivid: add CEC support to display present
 ctrl
To:     Johan Korsnes <johan.korsnes@gmail.com>,
        linux-media@vger.kernel.org
References: <20190616182218.37726-1-johan.korsnes@gmail.com>
 <20190616182218.37726-9-johan.korsnes@gmail.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c2638253-8178-b0b5-84e2-9008608d09c0@xs4all.nl>
Date:   Mon, 17 Jun 2019 11:59:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190616182218.37726-9-johan.korsnes@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfM/Pzx/IamGpx2dVUc9W9xLSRW3RQA04uQHb1rLXdv7goQJgv7Gr7oW1M1hcm5FInlgzDk8HcKMjBOEykv8a5tgOJlPpH/SuNTIEInonDXtNc+9ZBmRy
 zRmUETRp1f8YCg+Dmb1v6axWjInGyMkACAsYiVJtopEA5GWArUVJib/nxr51vOJHeBoQIcrhMhyRyDurtaih1imbWn9g9GSKUUPHE02fIbdcGZDZyHLZbmEa
 l0kSw1+2TWhdp8xURR7vkwO/gfhxeV8wEAYcE2T0DiTBrDUgnRXKzq8SHBg0jUVSe0h+oUfdCD7VF1x4w7SLVw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/16/19 8:22 PM, Johan Korsnes wrote:
> Set/invalidate physical addresses based on the configuration of the
> display present control. This is relevant not only when the display
> present control is modified, but also when the Vivid instance EDID is
> set/cleared.
> 
> Signed-off-by: Johan Korsnes <johan.korsnes@gmail.com>
> ---
>  drivers/media/platform/vivid/vivid-ctrls.c    | 25 ++++++++++++++++---
>  drivers/media/platform/vivid/vivid-vid-cap.c  | 17 +++++++++++--
>  .../media/platform/vivid/vivid-vid-common.c   |  2 ++
>  3 files changed, 38 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/vivid/vivid-ctrls.c b/drivers/media/platform/vivid/vivid-ctrls.c
> index ae3690fd1b52..807c9e92e051 100644
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
> +		if (!dev->cec_tx_adap)
> +			break;

This isn't right: cec_tx_adap is an array of cec_adapter pointers, so
dev->cec_tx_adap is always non-NULL.

Just drop it.

> +
> +		bus_idx = dev->cec_output2bus_map[dev->output];

Instead you need to do:

		if (!dev->cec_tx_adap[bus_idx])
			break;

to ensure that the adapter for bus_idx is non-NULL.

Regards,

	Hans

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
> index ca15c13abf6c..0d1ee9a221db 100644
> --- a/drivers/media/platform/vivid/vivid-vid-cap.c
> +++ b/drivers/media/platform/vivid/vivid-vid-cap.c
> @@ -1750,7 +1750,8 @@ int vidioc_s_edid(struct file *file, void *_fh,
>  {
>  	struct vivid_dev *dev = video_drvdata(file);
>  	u16 phys_addr;
> -	unsigned int i;
> +	u32 display_present = 0;
> +	unsigned int i, j;
>  	int ret;
>  
>  	memset(edid->reserved, 0, sizeof(edid->reserved));
> @@ -1760,6 +1761,8 @@ int vidioc_s_edid(struct file *file, void *_fh,
>  		return -EINVAL;
>  	if (edid->blocks == 0) {
>  		dev->edid_blocks = 0;
> +		v4l2_ctrl_s_ctrl(dev->ctrl_tx_edid_present, 0);
> +		v4l2_ctrl_s_ctrl(dev->ctrl_tx_hotplug, 0);
>  		phys_addr = CEC_PHYS_ADDR_INVALID;
>  		goto set_phys_addr;
>  	}
> @@ -1778,13 +1781,23 @@ int vidioc_s_edid(struct file *file, void *_fh,
>  	dev->edid_blocks = edid->blocks;
>  	memcpy(dev->edid, edid->edid, edid->blocks * 128);
>  
> +	for (i = 0, j = 0; i < dev->num_outputs; i++)
> +		if (dev->output_type[i] == HDMI)
> +			display_present |=
> +				dev->display_present[i] << j++;
> +
> +	v4l2_ctrl_s_ctrl(dev->ctrl_tx_edid_present, display_present);
> +	v4l2_ctrl_s_ctrl(dev->ctrl_tx_hotplug, display_present);
> +
>  set_phys_addr:
>  	/* TODO: a proper hotplug detect cycle should be emulated here */
>  	cec_s_phys_addr(dev->cec_rx_adap, phys_addr, false);
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
> index 10a344c29a1a..1f33eb1a76b6 100644
> --- a/drivers/media/platform/vivid/vivid-vid-common.c
> +++ b/drivers/media/platform/vivid/vivid-vid-common.c
> @@ -887,6 +887,8 @@ int vidioc_g_edid(struct file *file, void *_fh,
>  			return -EINVAL;
>  		if (dev->output_type[edid->pad] != HDMI)
>  			return -EINVAL;
> +		if (!dev->display_present[edid->pad])
> +			return -ENODATA;
>  		bus_idx = dev->cec_output2bus_map[edid->pad];
>  		adap = dev->cec_tx_adap[bus_idx];
>  	}
> 

