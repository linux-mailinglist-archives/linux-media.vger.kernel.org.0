Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E115E9E89D
	for <lists+linux-media@lfdr.de>; Tue, 27 Aug 2019 15:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729733AbfH0NHU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Aug 2019 09:07:20 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46686 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729864AbfH0NHS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Aug 2019 09:07:18 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7258F2F0;
        Tue, 27 Aug 2019 15:07:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1566911237;
        bh=3j9cnv/XY7+LRH1a7RUwppRHd7ZLY/494msDDxl7nPQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nEZna2t/rrQdWFMxzI8sC0j2wcRBusa5KfeIKIJ1cfWWYD5GFHleY3Mozz2lhtt/J
         e7pqkEfgU+nF1BCsV1I+UqxbPjxLwiVJmRjHWs6+6YIQMQqIxEwhZzTTyJQM1ljMap
         x5PDKDPEIh0f0nClUDOofmrT1oAkcl+TwySxDcRQ=
Date:   Tue, 27 Aug 2019 16:07:10 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>, tfiga@google.com,
        "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 05/10] media: v4l2-ctrl: Add
 V4L2_CID_CAMERA_SENSOR_ROTATION
Message-ID: <20190827130710.GW5054@pendragon.ideasonboard.com>
References: <20190827092339.8858-1-jacopo@jmondi.org>
 <20190827092339.8858-7-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190827092339.8858-7-jacopo@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Tue, Aug 27, 2019 at 11:23:32AM +0200, Jacopo Mondi wrote:
> Add support for the newly defined V4L2_CID_CAMERA_SENSOR_ROTATION
> read-only control used to report the camera device mounting rotation.
> 
> Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

(although I would squash it with the previous patch)

> ---
>  drivers/media/v4l2-core/v4l2-ctrls.c | 2 ++
>  include/uapi/linux/v4l2-controls.h   | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
> index db7124494530..b7af47a25125 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls.c
> @@ -995,6 +995,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_PAN_SPEED:		return "Pan, Speed";
>  	case V4L2_CID_TILT_SPEED:		return "Tilt, Speed";
>  	case V4L2_CID_CAMERA_SENSOR_LOCATION:	return "Camera Sensor Location";
> +	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
>  
>  	/* FM Radio Modulator controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> @@ -1320,6 +1321,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
>  	case V4L2_CID_MIN_BUFFERS_FOR_CAPTURE:
>  	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
>  	case V4L2_CID_CAMERA_SENSOR_LOCATION:
> +	case V4L2_CID_CAMERA_SENSOR_ROTATION:
>  		*type = V4L2_CTRL_TYPE_INTEGER;
>  		*flags |= V4L2_CTRL_FLAG_READ_ONLY;
>  		break;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 387c2c8553cb..f2be7a99818e 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -917,6 +917,8 @@ enum v4l2_auto_focus_range {
>  #define V4L2_LOCATION_BACK			1
>  #define V4L2_LOCATION_EXTERNAL			2
>  
> +#define V4L2_CID_CAMERA_SENSOR_ROTATION		(V4L2_CID_CAMERA_CLASS_BASE+35)
> +
>  /* FM Modulator class control IDs */
>  
>  #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)

-- 
Regards,

Laurent Pinchart
