Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 949BA9E86D
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 14:54:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726555AbfH0MyH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 08:54:07 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46414 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726250AbfH0MyH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 08:54:07 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2957D2F0;
        Tue, 27 Aug 2019 14:54:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1566910446;
        bh=sgMfFbY14ILLDbfCBg6Y2kTqWbsPlKoAxm/wXFu0o9c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ap6chgHdAAEaLnfiqGpNtAJWNUfE/EWtlYmtFdD/s2ZKjJTDTCHVyL4s09md01WFP
         gObxK5M08BK2VHqeUdn+h2ea82LayLrmc1NxIvEuUSkKU7Wc/UxcpabDVuXX+NQ8Rm
         Ve7M4zH4TtPbJLix9zJgpRngxLtkueJaqevMHv8w=
Date:   Tue, 27 Aug 2019 15:53:59 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>, tfiga@google.com,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 04/10] media: v4l2-ctrl: Add
 V4L2_CID_CAMERA_SENSOR_LOCATION
Message-ID: <20190827125359.GV5054@pendragon.ideasonboard.com>
References: <20190827092339.8858-1-jacopo@jmondi.org>
 <20190827092339.8858-5-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190827092339.8858-5-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Aug 27, 2019 at 11:23:30AM +0200, Jacopo Mondi wrote:
> Add support for the newly defined V4L2_CID_CAMERA_SENSOR_LOCATION
> read-only control used to report the camera device mounting position.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 2 ++
>  include/uapi/linux/v4l2-controls.h   | 5 +++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index 1d8f38824631..db7124494530 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -994,6 +994,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_AUTO_FOCUS_RANGE:		return "Auto Focus, Range";
>  	case V4L2_CID_PAN_SPEED:		return "Pan, Speed";
>  	case V4L2_CID_TILT_SPEED:		return "Tilt, Speed";
> +	case V4L2_CID_CAMERA_SENSOR_LOCATION:	return "Camera Sensor Location";
>  
>  	/* FM Radio Modulator controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> @@ -1318,6 +1319,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  		break;
>  	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
>  	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
> +	case V4L2_CID_CAMERA_SENSOR_LOCATION:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  		break;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index a2669b79b294..387c2c8553cb 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -912,6 +912,11 @@ enum v4l2_auto_focus_range {
>  #define V4L2_CID_PAN_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+32)
>  #define V4L2_CID_TILT_SPEED			(V4L2_CID_CAMERA_CLASS_BASE+33)
>  
> +#define V4L2_CID_CAMERA_SENSOR_LOCATION		(V4L2_CID_CAMERA_CLASS_BASE+34)
> +#define V4L2_LOCATION_FRONT			0
> +#define V4L2_LOCATION_BACK			1
> +#define V4L2_LOCATION_EXTERNAL			2
> +
>  /* FM Modulator class control IDs */
>  
>  #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)

-- 
Regards,

Laurent Pinchart
