Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B99D209ACE
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 09:52:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390394AbgFYHwk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 03:52:40 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:39871 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390224AbgFYHwj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 03:52:39 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id oMgKjfuFybJPcoMgPjELIa; Thu, 25 Jun 2020 09:52:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593071557; bh=Uovi5ivsPdbMDRWtHZmMQPDhROFf0NLd64SF+HCxKWY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=DXXH1gFU7lomA6wYpYESZKHj2f8FPp8x7XblvxFeDGq6JGTDsDLf4jRgDp0F9udE8
         1bU7juPJoUHcoWOJVgxc/g2fVhnJWWsNdaPwj46lbew2AXru4c277oEI3Dri9+Gy56
         XOtBC83aTLU+bKeHvrGMrKAZzPnd9exMD9Zbow/NGtyyvzywQZto6ppqP0NGLr/rIJ
         Ek1oi+jSh0xCwl2LcFtHec/wGE0gsDN/T7EyxQ4GJG9gnQwvNqeoU2TuVpNrDLnwQa
         s2U6T90An/SsRSD8deSXLZu7rFPmuwVcwMEZo+kq/1raaIwUl/GbsC5fI86DmxuZO1
         JQ11BQ5FwrVDg==
Subject: Re: [RFC 7/7] media: uapi: make H264 stateless codec interface public
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>, kernel@collabora.com,
        Jonas Karlman <jonas@kwiboo.se>,
        Alexandre Courbot <acourbot@chromium.org>,
        Jeffrey Kardatzke <jkardatzke@chromium.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maxime Ripard <mripard@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
References: <20200623182809.1375-1-ezequiel@collabora.com>
 <20200623182809.1375-8-ezequiel@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <478a33a8-89e2-7ed8-4efe-76d62ddc223a@xs4all.nl>
Date:   Thu, 25 Jun 2020 09:52:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200623182809.1375-8-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfBvg2zcRvZ/zAJ9eu0/F7hAPLKjUxJS33oB3Xi26sP0tNQcQaf853AwFhx8iZTJJWyty4Eiy4y/9GMs/8Avrr23gT8xlgU5NzzovKYi65CEJP3sDvaap
 RBlZPC9Z+gQYqWXPOhjP+I0y5LsNdiqwuH3JMH+vB+XKcjbKLnshsrK0A4gwrOx0y0HBF2sz37UnjrO9vrJNYOnJlihuXhFqSopUYb/3lNikes3LoJfZ0L2p
 94RYGGUYC6Zv4GRLN9/kcLnpoINHQbyB3qjajuDN/nhW1qoD0XgWsf2dkFUXXg81Ukz9kY80z7z5lRoJEo2kyHkAuTjrnU73RrszAZW2j+goCf+XscKJPUxv
 dfLwnjaV1sSOHu93UuZdNP0uMOU1z1LRilfgIx7fMLT9kA/P0tqZ3E/uEZ924Ij2P6MSIFXQSNd72R+kOsQQfToiWEOokxZXLRy9ZWFXFOgv6e0l1TadNhtK
 8XdoZ+fpA8HIfiayH805bwLiKy7A5QYyG0T4MqG3u6ZF9OClgaB6KOQqOGmgaXc9gij4Hn+CdSfKqrCoVpAdtLmKOGmFrmfbVt7lSg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 23/06/2020 20:28, Ezequiel Garcia wrote:
> The H264 interface is now ready to be part of the official
> public API.
> 
> In addition, sanitize header includes.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/staging/media/hantro/hantro_hw.h                  | 5 ++---
>  include/media/v4l2-ctrls.h                                | 3 ++-
>  include/media/v4l2-h264.h                                 | 2 +-
>  .../{media/h264-ctrls.h => uapi/linux/v4l2-h264-ctrls.h}  | 8 ++------
>  4 files changed, 7 insertions(+), 11 deletions(-)
>  rename include/{media/h264-ctrls.h => uapi/linux/v4l2-h264-ctrls.h} (96%)

This isn't quite how this should be done.

The V4L2_PIX_FMT_H264_SLICE define and the V4L2_CTRL_TYPE_H264_* defines should
move to videodev2.h.

The remaining CID defines and the data structures should be moved to v4l2-controls.h.

Yes, I know, v4l2-controls.h is getting large. At some point (could actually be
done in a follow-up patch) the codec controls in v4l2-controls.h should be split off
into their own header (v4l2-codec-controls.h).

One more thing that I was wondering about:

#define V4L2_CID_MPEG_VIDEO_H264_SPS            (V4L2_CID_MPEG_BASE+1000)

These controls are at V4L2_CID_MPEG_BASE+1000. But I was wondering if:

1) wouldn't it be a good thing to use new CID values since this is the actual
   uAPI version? This series changes the layout of several structs, so creating
   new CID values to prevent confusion in applications might be a good idea.

2) related to 1): should we make a new control class for stateless codecs?
   Currently it is mixed in with the stateful codec controls, but I am not so
   sure that that is such a good idea. Creating a separate stateless codec
   control class would be a clean separation of stateful and stateless, and it
   would probably improve the documentation as well.

   The only 'standard' codec control that is used by stateless codecs is
   V4L2_CID_MPEG_VIDEO_H264_PROFILE in hantro, although it is not clear to me
   how it is used. It looks like it is just to report the supported profiles?
   But it isn't present in the cedrus driver, so it's a bit odd.

Thank you for working on finalizing the H264 API.

Regards,

	Hans

> 
> diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
> index 4053d8710e04..48d5be144319 100644
> --- a/drivers/staging/media/hantro/hantro_hw.h
> +++ b/drivers/staging/media/hantro/hantro_hw.h
> @@ -11,9 +11,8 @@
>  
>  #include <linux/interrupt.h>
>  #include <linux/v4l2-controls.h>
> -#include <media/h264-ctrls.h>
> -#include <media/mpeg2-ctrls.h>
> -#include <media/vp8-ctrls.h>
> +
> +#include <media/v4l2-ctrls.h>
>  #include <media/videobuf2-core.h>
>  
>  #define DEC_8190_ALIGN_MASK	0x07U
> diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
> index f40e2cbb21d3..fc725ba2ebd8 100644
> --- a/include/media/v4l2-ctrls.h
> +++ b/include/media/v4l2-ctrls.h
> @@ -13,13 +13,14 @@
>  #include <linux/videodev2.h>
>  #include <media/media-request.h>
>  
> +#include <linux/v4l2-h264-ctrls.h>
> +
>  /*
>   * Include the stateless codec compound control definitions.
>   * This will move to the public headers once this API is fully stable.
>   */
>  #include <media/mpeg2-ctrls.h>
>  #include <media/fwht-ctrls.h>
> -#include <media/h264-ctrls.h>
>  #include <media/vp8-ctrls.h>
>  #include <media/hevc-ctrls.h>
>  
> diff --git a/include/media/v4l2-h264.h b/include/media/v4l2-h264.h
> index f08ba181263d..d2314f4d4490 100644
> --- a/include/media/v4l2-h264.h
> +++ b/include/media/v4l2-h264.h
> @@ -10,7 +10,7 @@
>  #ifndef _MEDIA_V4L2_H264_H
>  #define _MEDIA_V4L2_H264_H
>  
> -#include <media/h264-ctrls.h>
> +#include <media/v4l2-ctrls.h>
>  
>  /**
>   * struct v4l2_h264_reflist_builder - Reference list builder object
> diff --git a/include/media/h264-ctrls.h b/include/uapi/linux/v4l2-h264-ctrls.h
> similarity index 96%
> rename from include/media/h264-ctrls.h
> rename to include/uapi/linux/v4l2-h264-ctrls.h
> index 6446ec9f283d..a06f60670d68 100644
> --- a/include/media/h264-ctrls.h
> +++ b/include/uapi/linux/v4l2-h264-ctrls.h
> @@ -2,14 +2,10 @@
>  /*
>   * These are the H.264 state controls for use with stateless H.264
>   * codec drivers.
> - *
> - * It turns out that these structs are not stable yet and will undergo
> - * more changes. So keep them private until they are stable and ready to
> - * become part of the official public API.
>   */
>  
> -#ifndef _H264_CTRLS_H_
> -#define _H264_CTRLS_H_
> +#ifndef __LINUX_V4L2_H264_CONTROLS_H
> +#define __LINUX_V4L2_H264_CONTROLS_H
>  
>  #include <linux/videodev2.h>
>  
> 

