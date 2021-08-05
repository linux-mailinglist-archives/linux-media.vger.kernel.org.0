Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 897753E17D6
	for <lists+linux-media@lfdr.de>; Thu,  5 Aug 2021 17:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242248AbhHEPYu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Aug 2021 11:24:50 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:46334 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242177AbhHEPXU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Aug 2021 11:23:20 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80420E04;
        Thu,  5 Aug 2021 17:22:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1628176964;
        bh=nCi2Tli+pkM5lIEPzDQMcK3DDN32NiXCxrp3JzyzmNg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qb7ayOxrVcgRsU+D0Yv5vLrhnoJ2XzdDCdeuO/HaPiWcfujO0m9oaamEh1Uvr8SC6
         GxhdH4RGqHAI5enChp2tP7TXQoVYBA/ahJzO9yNPWqspFlCMmMlpcxt/HWJZTv98SJ
         5iSLfdWcQC6yfC+aQodvDcqhhJxPsqM8JOZMXKVA=
Date:   Thu, 5 Aug 2021 18:22:32 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     David Plowman <david.plowman@raspberrypi.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@iki.fi,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v3 1/2] media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAIN_XXX
 controls
Message-ID: <YQwCOBCFK9w4dvxl@pendragon.ideasonboard.com>
References: <20210722121249.16483-1-david.plowman@raspberrypi.com>
 <20210722121249.16483-2-david.plowman@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210722121249.16483-2-david.plowman@raspberrypi.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi David,

Thank you for the patch.

On Thu, Jul 22, 2021 at 01:12:48PM +0100, David Plowman wrote:
> We add new controls, one for each of the four usual Bayer channels:
> 
> V4L2_CID_NOTIFY_GAIN_RED
> V4L2_CID_NOTIFY_GAIN_GREENR
> V4L2_CID_NOTIFY_GAIN_BLUE
> V4L2_CID_NOTIFY_GAIN_GREENB

This will effectively limit the API to Bayer patterns. I wonder if we
should instead implement it as a single array control, with one element
per CFA component.

> These are provided for sensors that need to know what colour gains
> will be applied to the Bayer channel by subsequent processing (such as
> by an ISP), even though the sensor will not apply this gain itself.
> 
> The units are linear with the default value indicating a gain of
> exactly 1.
> 
> Signed-off-by: David Plowman <david.plowman@raspberrypi.com>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c | 4 ++++
>  include/uapi/linux/v4l2-controls.h        | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index b6344bbf1e00..12c810cd4ae6 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1106,6 +1106,10 @@ const char *v4l2_ctrl_get_name(u32 id)
>  	case V4L2_CID_TEST_PATTERN_GREENR:	return "Green (Red) Pixel Value";
>  	case V4L2_CID_TEST_PATTERN_BLUE:	return "Blue Pixel Value";
>  	case V4L2_CID_TEST_PATTERN_GREENB:	return "Green (Blue) Pixel Value";
> +	case V4L2_CID_NOTIFY_GAIN_RED:		return "Notify Red Gain";
> +	case V4L2_CID_NOTIFY_GAIN_GREENR:	return "Notify Green (Red) Gain";
> +	case V4L2_CID_NOTIFY_GAIN_BLUE:		return "Notify Blue Gain";
> +	case V4L2_CID_NOTIFY_GAIN_GREENB:	return "Notify Green (Blue) Gain";
>  
>  	/* Image processing controls */
>  	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index fdf97a6d7d18..711930bb54f0 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1117,6 +1117,10 @@ enum v4l2_jpeg_chroma_subsampling {
>  #define V4L2_CID_TEST_PATTERN_BLUE		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 6)
>  #define V4L2_CID_TEST_PATTERN_GREENB		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 7)
>  #define V4L2_CID_UNIT_CELL_SIZE			(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
> +#define V4L2_CID_NOTIFY_GAIN_RED		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
> +#define V4L2_CID_NOTIFY_GAIN_GREENR		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 10)
> +#define V4L2_CID_NOTIFY_GAIN_BLUE		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 11)
> +#define V4L2_CID_NOTIFY_GAIN_GREENB		(V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 12)
>  
>  
>  /* Image processing controls */

-- 
Regards,

Laurent Pinchart
