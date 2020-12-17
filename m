Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 541AA2DD88C
	for <lists+linux-media@lfdr.de>; Thu, 17 Dec 2020 19:42:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729151AbgLQSmC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Dec 2020 13:42:02 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:50092 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728704AbgLQSmB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Dec 2020 13:42:01 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 199E52CF;
        Thu, 17 Dec 2020 19:41:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608230480;
        bh=Di+XvCkm86NlTYZyAvZaca3x8FZpzofIjd2QnIYwvuY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WECjpUjuumxK95W17Xl/n2sJYtwB68M06OZVHAw8a+S/7WUWVD6ERuqT+8dT+i6Vi
         +waZyOT0FE3AEO8fdC3uunjahUmFCIhr5AJqiGC3JQOeMKYQzm9NPhoEYcQ6KV004U
         kanhaehhwyjBVdNIGN70FAvt+cdxYAs/RQLU71dY=
Date:   Thu, 17 Dec 2020 20:41:12 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] media: uapi: Add an entity type for Image Signal
 Processors
Message-ID: <X9umSNYPdC0uxm7/@pendragon.ideasonboard.com>
References: <20201217182903.27098-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201217182903.27098-1-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Thu, Dec 17, 2020 at 08:29:03PM +0200, Sakari Ailus wrote:
> Add and document a media entity type for Image Signal Processor devices.
> Surprisingly we didn't have one, so add one now. More or less all ISP
> drivers should use this type instead of what they currently are using (or
> not using anything).
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  Documentation/userspace-api/media/mediactl/media-types.rst | 6 ++++++
>  include/uapi/linux/media.h                                 | 1 +
>  2 files changed, 7 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/mediactl/media-types.rst b/Documentation/userspace-api/media/mediactl/media-types.rst
> index 7b24a213cae7..f18b2004de6d 100644
> --- a/Documentation/userspace-api/media/mediactl/media-types.rst
> +++ b/Documentation/userspace-api/media/mediactl/media-types.rst
> @@ -39,6 +39,7 @@ Types and flags used to represent the media graph elements
>  .. _MEDIA-ENT-F-PROC-VIDEO-STATISTICS:
>  .. _MEDIA-ENT-F-PROC-VIDEO-ENCODER:
>  .. _MEDIA-ENT-F-PROC-VIDEO-DECODER:
> +.. _MEDIA-ENT-F-PROC-VIDEO-ISP:
>  .. _MEDIA-ENT-F-VID-MUX:
>  .. _MEDIA-ENT-F-VID-IF-BRIDGE:
>  .. _MEDIA-ENT-F-DV-DECODER:
> @@ -201,6 +202,11 @@ Types and flags used to represent the media graph elements
>            decompressing a compressed video stream into uncompressed video
>  	  frames. Must have one sink pad and at least one source pad.
>  
> +    *  -  ``MEDIA_ENT_F_PROC_VIDEO_ISP``
> +       -  An Image Signal Processor (ISP) device. ISPs generally are one of a
> +	  kind devices that have their specific control interfaces. Most devices
> +	  have either memory or data bus input.
> +

This looks good to me. I don't think we need to formally define what an
ISP is here, it's a fairly well understood concept in the industry and
having some flexibility in the definition is useful.

We may want to expand a bit on the "specific control interface", to tell
it's about the V4L2 API, and not the hardware interface. Maybe "...,
using a combination of custom V4L2 controls and IOCTLs, and parameters
supplied in a metadata buffer" ?

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>      *  -  ``MEDIA_ENT_F_VID_MUX``
>         - Video multiplexer. An entity capable of multiplexing must have at
>           least two sink pads and one source pad, and must pass the video
> diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> index 383ac7b7d8f0..200fa8462b90 100644
> --- a/include/uapi/linux/media.h
> +++ b/include/uapi/linux/media.h
> @@ -127,6 +127,7 @@ struct media_device_info {
>  #define MEDIA_ENT_F_PROC_VIDEO_STATISTICS	(MEDIA_ENT_F_BASE + 0x4006)
>  #define MEDIA_ENT_F_PROC_VIDEO_ENCODER		(MEDIA_ENT_F_BASE + 0x4007)
>  #define MEDIA_ENT_F_PROC_VIDEO_DECODER		(MEDIA_ENT_F_BASE + 0x4008)
> +#define MEDIA_ENT_F_PROC_VIDEO_ISP		(MEDIA_ENT_F_BASE + 0x4009)
>  
>  /*
>   * Switch and bridge entity functions

-- 
Regards,

Laurent Pinchart
