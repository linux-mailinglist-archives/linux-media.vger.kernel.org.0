Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7632B8ECB1
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 15:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731282AbfHONXy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 09:23:54 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:58521 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730497AbfHONXy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 09:23:54 -0400
Received: from [IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f] ([IPv6:2001:420:44c1:2579:f038:4b04:f67a:276f])
        by smtp-cloud8.xs4all.net with ESMTPA
        id yFjHhvwAJDqPeyFjKhYHte; Thu, 15 Aug 2019 15:23:52 +0200
Subject: Re: [RFC 3/5] media: v4l2-ctrls: Add support for V4L2_CID_LOCATION
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20190814202815.32491-1-jacopo@jmondi.org>
 <20190814202815.32491-4-jacopo@jmondi.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <6c9460e2-b607-9863-f8f0-1a94773c6556@xs4all.nl>
Date:   Thu, 15 Aug 2019 15:23:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190814202815.32491-4-jacopo@jmondi.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfA+Q18XfWqRoIglqwR8iaXdKQGQMt86mT33jQPkY2hKikyDDUd3AR1zr1BTBPpYZYKMQWcdo56ZCRMcGytCBTVh/LLU0YPGzDJbq45xf7Mc3CwKwnAkQ
 ffeALGTy6+++r4B1ulwgzNkkrxkU/SCNM7PFub0vLwrWW8OT85sGLlRP+MIpdxNRAx5NdRkn+CuobNtUKisbIN+fMbJ3cBkoG0gSpNLIWSPpJLGW7w39MaS/
 iFOsipFH1mSiZ0qxQEOAaT8yIkjKW3IfcsZXb2oN2ctGLpqAAbrNdUV1rCFLp9D1PiDBO8Yal9cTJ4NTjuMdJjPkE5hwli5y2DT+8a1Gt74+Mmg4UtssGNmU
 jEZmPetZUcwVh0A04EyV0oxB/KMIy6bLceE7QMGs+W3QSq2E9RB5OX6pzPUbPOXjmoPd0lriWHwMKJeW3SNbfIFicLhs+OPnRmoczLNhEgcvZvrpkV7W8WfK
 TFCK+K9+qk7DVu2n
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/14/19 10:28 PM, Jacopo Mondi wrote:
> Add support for the newly defined V4L2_CID_LOCATION read-only control
> used to report the camera device mounting position.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 7 +++++++
>  include/uapi/linux/v4l2-controls.h   | 4 ++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 7d3a33258748..8ab0857df59a 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -943,6 +943,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_AUTO_FOCUS_RANGE:		return "Auto Focus, Range";
>  	case V4L2_CID_PAN_SPEED:		return "Pan, Speed";
>  	case V4L2_CID_TILT_SPEED:		return "Tilt, Speed";
> +	case V4L2_CID_LOCATION:			return "Location";
>  
>  	/* FM Radio Modulator controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> @@ -1300,6 +1301,12 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  		break;
>  	case V4L2_CID_MPEG_VIDEO_FWHT_PARAMS:
>  		*type = V4L2_CTRL_TYPE_FWHT_PARAMS;

Missing break!

Regards,

	Hans

> +	case V4L2_CID_LOCATION:
> +		*type = V4L2_CTRL_TYPE_INTEGER;
> +		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
> +		*min = V4L2_LOCATION_FRONT;
> +		*max = V4L2_LOCATION_BACK;
> +		*step = 1;
>  		break;
>  	default:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 37807f23231e..5c4c7b245921 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -889,6 +889,10 @@ enum v4l2_auto_focus_range {
>  #define V4L2_CID_PAN_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+32)
>  #define V4L2_CID_TILT_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+33)
>  
> +#define V4L2_CID_LOCATION			(V4L2_CID_CAMERA_CLASS_BASE+34)
> +#define V4L2_LOCATION_FRONT			(0 << 0)
> +#define V4L2_LOCATION_BACK			(1 << 0)
> +
>  /* FM Modulator class control IDs */
>  
>  #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)
> 

