Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47CED1CA903
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2020 13:09:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727093AbgEHLJY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 May 2020 07:09:24 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:50897 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726627AbgEHLJX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 8 May 2020 07:09:23 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id X0sYjdud6tKAsX0sbje8ud; Fri, 08 May 2020 13:09:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1588936161; bh=hj/vj/D3dynIwv0WWpFsMOwC18NJjLLUtWJpBPd5v6w=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=pss3tNw5/HKD4xXjWlTJfWbcQDDSpy1ff50T7B5DikHCbzRFIqmK7y/cj4YE2OUhK
         yYcyqdEXNbmpWTTB8zL4dHSKRDaJAcnToaIX5DSLgO8vFpa/1Gd24TeZKQymgWPiQj
         001L/a/d3Nl8CNNyo62ecxB8z1/nyHzaemtpk/tpbzSL6bSuWzwRaJDGb+yOWkeA9y
         YrvP1GxussnbKGwEismGNGrez3gnMJJYejXztkj0AWXgWdaFEYB2dn/0EfAck1n2mc
         RhFI8uNgKnaMfUf3l/ToSNmCtFFocSZtSmY9dJi4xyOSMcyuNWaJDO/QioRsRWJsVz
         lZzBEepSW8u2w==
Subject: Re: [PATCH v10 06/13] media: v4l2-ctrls: Add camera orientation and
 rotation
To:     Jacopo Mondi <jacopo@jmondi.org>,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>, libcamera-devel@lists.libcamera.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     tfiga@google.com, pavel@ucw.cz
References: <20200508100158.3437161-1-jacopo@jmondi.org>
 <20200508100158.3437161-7-jacopo@jmondi.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <c734d6c1-b948-f529-a841-8e04006682dd@xs4all.nl>
Date:   Fri, 8 May 2020 13:09:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200508100158.3437161-7-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPktsdAgYxR5evL9XF0e7fcADex9wbRrWgKYq6jZaE4DpNu15XzGc7v8o2rPR9N5kC+4WT6gxxCWqcfZZJGUNwJtHJvmyF0sVut24yFukvYaZ3rGXDZz
 iWK5mfp8ibIwN9VfFeEjXYvHUeu7mAuA5SIwGSiDZMDp2Uqm6lggZxt6l8hGkpU5e2+Fbjm+RAUEuNscoj9Mhmd/tQ0RRlXshvt4ipbWUxNrEmbYx0/+afFn
 gGwg0GYNrYpCNVMG4ub+CDDNVcLu+T4CvQ6awlBJ5yfsYIGu0BCbvMTiE2LbmbFtoxHFTtdp/lAsGoaxif17e2hAd5b3+Zqv7wM9nEL1gL+R6mTG7kunLFtW
 Dqfzl0DtXWmXiyesiJGDo8eM4e/vvPj6JIipqevVZ437ubLON5jOnxaBvOTjM4APaAxok+Wnn/G6m0u7y7lkZ4MdUeWyrw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/05/2020 12:01, Jacopo Mondi wrote:
> Add support for the newly defined V4L2_CID_CAMERA_ORIENTATION
> and V4L2_CID_CAMERA_SENSOR_ROTATION read-only controls used to report
> the camera device mounting position and orientation respectively.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 15 +++++++++++++++
>  include/uapi/linux/v4l2-controls.h   |  7 +++++++
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 1c617b42a944d..97765a57654d2 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -583,6 +583,12 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>  		"Annex B Start Code",
>  		NULL,
>  	};
> +	static const char * const camera_orientation[] = {
> +		"Front Camera",
> +		"Back Camera",
> +		"External Camera",

You can drop 'Camera' here. The name of the control itself already specifies that
it is about the camera orientation, so that does (and should) not be repeated here.

> +		NULL,
> +	};
>  
>  	switch (id) {
>  	case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ:
> @@ -708,6 +714,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>  		return hevc_decode_mode;
>  	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:
>  		return hevc_start_code;
> +	case V4L2_CID_CAMERA_ORIENTATION:
> +		return camera_orientation;
>  	default:
>  		return NULL;
>  	}
> @@ -1020,6 +1028,8 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_PAN_SPEED:		return "Pan, Speed";
>  	case V4L2_CID_TILT_SPEED:		return "Tilt, Speed";
>  	case V4L2_CID_UNIT_CELL_SIZE:		return "Unit Cell Size";
> +	case V4L2_CID_CAMERA_ORIENTATION:	return "Camera Orientation";
> +	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
>  
>  	/* FM Radio Modulator controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> @@ -1295,6 +1305,10 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:
>  		*type = V4L2_CTRL_TYPE_MENU;
>  		break;
> +	case V4L2_CID_CAMERA_ORIENTATION:

Just move this up to just below 'case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE'
and add 'case V4L2_CID_CAMERA_ORIENTATION:' to the switch at the end of
this function that sets the READ_ONLY flag.

I.e. this function has two switches: one that sets the type and one at the
end that sets the flags. I see that the code is not entirely consistent anymore,
but we should try to keep to how it is supposed to be used.

> +		*type = V4L2_CTRL_TYPE_MENU;
> +		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +		break;
>  	case V4L2_CID_LINK_FREQ:
>  		*type = V4L2_CTRL_TYPE_INTEGER_MENU;
>  		break;
> @@ -1346,6 +1360,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  		break;
>  	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
>  	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
> +	case V4L2_CID_CAMERA_SENSOR_ROTATION:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;

Same here.

>  		break;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 0ba1005c96519..3da37c9cf5046 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -923,6 +923,13 @@ enum v4l2_auto_focus_range {
>  #define V4L2_CID_PAN_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+32)
>  #define V4L2_CID_TILT_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+33)
>  
> +#define V4L2_CID_CAMERA_ORIENTATION		(V4L2_CID_CAMERA_CLASS_BASE+34)
> +#define V4L2_ORIENTATION_FRONT			0
> +#define V4L2_ORIENTATION_BACK			1
> +#define V4L2_ORIENTATION_EXTERNAL		2
> +
> +#define V4L2_CID_CAMERA_SENSOR_ROTATION		(V4L2_CID_CAMERA_CLASS_BASE+35)
> +
>  /* FM Modulator class control IDs */
>  
>  #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)
> 

Regards,

	Hans
