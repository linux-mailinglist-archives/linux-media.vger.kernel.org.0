Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC10F2A7F6A
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 14:03:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730672AbgKENDm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 08:03:42 -0500
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:38627 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730466AbgKENDm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 08:03:42 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id aevRkD4wRNanzaevUkoPZt; Thu, 05 Nov 2020 14:03:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1604581420; bh=hvXjIgji52vY+aeu2D4kIpN83iogbgLFrGDBu+GqxB4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=sYmUuLn9VFw0GZWdRdez04WwuxYv5MVNgqONGKphV0eUcjkT0STm7X1Mg5Gq/RNfU
         jH+k2Cg2ZMfJN4KKpjtNTFmxfCU3+UFlaX/O/KFm1O8SRzOD5xlc23IaTXBCa5Fc2I
         ZXG9N+04qMSt/mV7PxP9FAqBcxQYDsyBOAkJa/4eEnQh0OTxA87hFMMGXP/WR/Z74y
         ta3Jgcbpudu2C0JbVzd1wbuLod+s0z6YXfJThxXWUb2+cKLVMCn4uRPHIBcC8FFzJG
         p1haZJBvmS+OcA1bYRGvfjhbDBdOhI38yr4xQjR23tYk7CvcrQntgaMcTVoAOPZj4I
         at2EhBicVDc6w==
Subject: Re: [PATCH v2 105/106] ccs: Add shading correction and luminance
 correction level controls
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-1-sakari.ailus@linux.intel.com>
 <20201007084557.25843-96-sakari.ailus@linux.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <eaf54ce4-54c5-6d1e-e8a1-29c6346dab04@xs4all.nl>
Date:   Thu, 5 Nov 2020 14:03:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201007084557.25843-96-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfP56hQOHgPiD8B9FFLyMmWFFBd4viyNCPzA0vKsgjXoiPbE2+3XmIheXpBnFXDYpEEzi9v7xBOaFiA9A9fIXjJ/VBznkQANAmeg52gNWSqKe+yQA2nHj
 tnKFo5yGcqnJ6qU9/Ck9Ie8LgTUzJndfscT19lwXnW+PMVhrZl9/wZvva4NF2J4RlVagTw1W0gsJFikOUspqDTZgvFk11xLC4uxHkXFJ9n5VSNeEAF0cziW+
 67F92glJcMVQInnAP6Uk6A==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/10/2020 10:45, Sakari Ailus wrote:
> Add controls for supporting lens shading correction.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/ccs/ccs-core.c | 74 ++++++++++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 0ba06a580951..10ed3d01af16 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -757,6 +757,25 @@ static int ccs_set_ctrl(struct v4l2_ctrl *ctrl)
>  	case V4L2_CID_TEST_PATTERN_GREENB:
>  		rval = ccs_write(sensor, TEST_DATA_GREENB, ctrl->val);
>  
> +		break;
> +	case V4L2_CID_CCS_SHADING_CORRECTION:
> +		if (!(CCS_LIM(sensor, SHADING_CORRECTION_CAPABILITY) &
> +		      (CCS_SHADING_CORRECTION_CAPABILITY_COLOR_SHADING |
> +		       CCS_SHADING_CORRECTION_CAPABILITY_LUMINANCE_CORRECTION)))
> +			break;
> +
> +		rval = ccs_write(sensor, SHADING_CORRECTION_EN,
> +				 ctrl->val ? CCS_SHADING_CORRECTION_EN_ENABLE :
> +				 0);
> +
> +		break;
> +	case V4L2_CID_CCS_LUMINANCE_SHADING_CORRECTION:
> +		if (!(CCS_LIM(sensor, SHADING_CORRECTION_CAPABILITY) &
> +		      CCS_SHADING_CORRECTION_CAPABILITY_LUMINANCE_CORRECTION))
> +			break;
> +
> +		rval = ccs_write(sensor, LUMINANCE_CORRECTION_LEVEL, ctrl->val);
> +
>  		break;
>  	case V4L2_CID_PIXEL_RATE:
>  		/* For v4l2_ctrl_s_ctrl_int64() used internally. */
> @@ -878,6 +897,61 @@ static int ccs_init_controls(struct ccs_sensor *sensor)
>  	}
>  	}
>  
> +	if (CCS_LIM(sensor, SHADING_CORRECTION_CAPABILITY) &
> +	    CCS_SHADING_CORRECTION_CAPABILITY_COLOR_SHADING) {
> +		const struct v4l2_ctrl_config ctrl_cfg = {

Can be static.

> +			.name = "Shading Correction",

Should this perhaps be called "Chroma Shading Correction"? Since there is a luminance
shading correction as well...

Since these controls are all CCS specific, should the names of these controls begin
with "CCS "? (Not just the controls in this patch, but also from previous patches).

> +			.type = V4L2_CTRL_TYPE_BOOLEAN,
> +			.id = V4L2_CID_CCS_SHADING_CORRECTION,
> +			.ops = &ccs_ctrl_ops,
> +			.max = 1,
> +			.step = 1,
> +		};
> +
> +		v4l2_ctrl_new_custom(&sensor->pixel_array->ctrl_handler,
> +				     &ctrl_cfg, NULL);
> +	}
> +
> +	if (CCS_LIM(sensor, SHADING_CORRECTION_CAPABILITY) &
> +	    CCS_SHADING_CORRECTION_CAPABILITY_LUMINANCE_CORRECTION) {
> +		const struct v4l2_ctrl_config ctrl_cfg = {

Can be static.

> +			.name = "Luminance Shading Correction",
> +			.type = V4L2_CTRL_TYPE_BOOLEAN,
> +			.id = V4L2_CID_CCS_LUMINANCE_SHADING_CORRECTION,
> +			.ops = &ccs_ctrl_ops,
> +			.max = 255,
> +			.step = 1,
> +			.def = 128,
> +		};
> +
> +		v4l2_ctrl_new_custom(&sensor->pixel_array->ctrl_handler,
> +				     &ctrl_cfg, NULL);
> +	}
> +
> +	if (CCS_LIM(sensor, SHADING_CORRECTION_CAPABILITY) &
> +	    (CCS_SHADING_CORRECTION_CAPABILITY_COLOR_SHADING |
> +	     CCS_SHADING_CORRECTION_CAPABILITY_LUMINANCE_CORRECTION)) {
> +		u32 val =
> +			((CCS_LIM(sensor, SHADING_CORRECTION_CAPABILITY) &
> +			  CCS_SHADING_CORRECTION_CAPABILITY_COLOR_SHADING) ?
> +			 V4L2_CCS_SHADING_CORRECTION_COLOUR : 0) |
> +			((CCS_LIM(sensor, SHADING_CORRECTION_CAPABILITY) &
> +			   CCS_SHADING_CORRECTION_CAPABILITY_LUMINANCE_CORRECTION) ?
> +			 V4L2_CCS_SHADING_CORRECTION_LUMINANCE : 0);
> +		const struct v4l2_ctrl_config ctrl_cfg = {
> +			.name = "Shading Correction Capability",
> +			.type = V4L2_CTRL_TYPE_BITMASK,
> +			.id = V4L2_CID_CCS_SHADING_CORRECTION_CAPABILITY,
> +			.ops = &ccs_ctrl_ops,
> +			.max = val,
> +			.def = val,
> +			.flags = V4L2_CTRL_FLAG_READ_ONLY,
> +		};

Is this needed? If e.g. V4L2_CCS_SHADING_CORRECTION_COLOUR is not supported,
then the V4L2_CID_CCS_SHADING_CORRECTION control is simply not created.
So calling VIDIOC_QUERYCTRL would simply fail and so indicate that this
capability is not present.

If it really is needed, then having two bool controls makes more sense
because a bitmask is less intuitive.

Regards,

	Hans

> +
> +		v4l2_ctrl_new_custom(&sensor->pixel_array->ctrl_handler,
> +				     &ctrl_cfg, NULL);
> +	}
> +
>  	if (CCS_LIM(sensor, DIGITAL_GAIN_CAPABILITY) ==
>  	    CCS_DIGITAL_GAIN_CAPABILITY_GLOBAL ||
>  	    CCS_LIM(sensor, DIGITAL_GAIN_CAPABILITY) ==
> 

