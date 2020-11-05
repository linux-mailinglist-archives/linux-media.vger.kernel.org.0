Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B42AC2A7ED1
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 13:42:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726874AbgKEMmt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 07:42:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:46292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725468AbgKEMmt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 5 Nov 2020 07:42:49 -0500
Received: from coco.lan (ip5f5ad5d8.dynamic.kabel-deutschland.de [95.90.213.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E8F8320756;
        Thu,  5 Nov 2020 12:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604580168;
        bh=+u26YhO3IgIzz3xegyy+dJ6m1Su3/k6aGUyM7Qz2A8Y=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=toM/vAzLarEQokDNXbQOSDGbRl0bMknIKt93gOfk90oZcznBYbjRwbP7i3UfM9t77
         t2Ycd6AvixCyrhRZ72NBQGSPDa4G6J93f1HLVu0B4LaC5h2eXzzjFFKXgIIWQXSDys
         wBTl0vhda8IDmst7/wtmZRYgAvZow3KZXiQ4rlj0=
Date:   Thu, 5 Nov 2020 13:42:43 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v2 105/106] ccs: Add shading correction and luminance
 correction level controls
Message-ID: <20201105134243.62ef1938@coco.lan>
In-Reply-To: <20201007084557.25843-96-sakari.ailus@linux.intel.com>
References: <20201007084505.25761-1-sakari.ailus@linux.intel.com>
        <20201007084557.25843-1-sakari.ailus@linux.intel.com>
        <20201007084557.25843-96-sakari.ailus@linux.intel.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Wed,  7 Oct 2020 11:45:56 +0300
Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:

> Add controls for supporting lens shading correction.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

For patches 098 to 105, we should at least have those new controls
documented at the uAPI documents.

I'm not convinced yet that we shouldn't instead place them inside
V4L2_CTRL_CLASS_CAMERA.

As those are part of a MIPI standard, I won't doubt that sooner or
later, other drivers may need them.

Regards,
Mauro

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
> +			.name = "Shading Correction",
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
> +
> +		v4l2_ctrl_new_custom(&sensor->pixel_array->ctrl_handler,
> +				     &ctrl_cfg, NULL);
> +	}
> +
>  	if (CCS_LIM(sensor, DIGITAL_GAIN_CAPABILITY) ==
>  	    CCS_DIGITAL_GAIN_CAPABILITY_GLOBAL ||
>  	    CCS_LIM(sensor, DIGITAL_GAIN_CAPABILITY) ==



Thanks,
Mauro
