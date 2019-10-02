Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE17EC88E2
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 14:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727191AbfJBMkj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 08:40:39 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54364 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726992AbfJBMkj (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 08:40:39 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id E8C50289C67
Message-ID: <d2ecfe4f0a730246903a7035d813c23afb9fb4b2.camel@collabora.com>
Subject: Re: [PATCHv2 1/2] v4l: Add macros for printing V4L fourcc values
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Date:   Wed, 02 Oct 2019 09:40:31 -0300
In-Reply-To: <20190916100433.24367-2-hverkuil-cisco@xs4all.nl>
References: <20190916100433.24367-1-hverkuil-cisco@xs4all.nl>
         <20190916100433.24367-2-hverkuil-cisco@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2019-09-16 at 12:04 +0200, Hans Verkuil wrote:
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> 
> Add two macros that facilitate printing V4L fourcc values with printf
> family of functions. v4l2_fourcc_conv provides the printf conversion
> specifier for printing formats and v4l2_fourcc_args provides the actual
> arguments for that conversion specifier.
> 
> These macros are useful in both user and kernel code whenever you want
> to report a pixelformat, therefore put them into videodev2.h.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> [hverkuil-cisco@xs4all.nl: rename v4l2_fourcc_to_conv to v4l2_fourcc_args]
> [hverkuil-cisco@xs4all.nl: add () around ? : expression]
> [hverkuil-cisco@xs4all.nl: add comment about fourcc reuse]
> [hverkuil-cisco@xs4all.nl: update Documentation/media/videodev2.h.rst.exceptions]
> ---
>  .../media/videodev2.h.rst.exceptions          |  2 ++
>  include/uapi/linux/videodev2.h                | 27 +++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/Documentation/media/videodev2.h.rst.exceptions b/Documentation/media/videodev2.h.rst.exceptions
> index adeb6b7a15cb..35eb513d82a6 100644
> --- a/Documentation/media/videodev2.h.rst.exceptions
> +++ b/Documentation/media/videodev2.h.rst.exceptions
> @@ -508,6 +508,8 @@ ignore define VIDEO_MAX_FRAME
>  ignore define VIDEO_MAX_PLANES
>  ignore define v4l2_fourcc
>  ignore define v4l2_fourcc_be
> +ignore define v4l2_fourcc_conv
> +ignore define v4l2_fourcc_args
>  ignore define V4L2_FIELD_HAS_TOP
>  ignore define V4L2_FIELD_HAS_BOTTOM
>  ignore define V4L2_FIELD_HAS_BOTH
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 530638dffd93..aa8acbdc88c9 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -82,6 +82,33 @@
>  	((__u32)(a) | ((__u32)(b) << 8) | ((__u32)(c) << 16) | ((__u32)(d) << 24))
>  #define v4l2_fourcc_be(a, b, c, d)	(v4l2_fourcc(a, b, c, d) | (1U << 31))
>  
> +/**
> + * v4l2_fourcc_conv - Printf fourcc conversion specifiers for V4L2 formats
> + *
> + * Use as part of the format string. The values are obtained using
> + * @v4l2_fourcc_args macro.
> + *
> + * Example ("format" is the V4L2 pixelformat in __u32):
> + *
> + * printf("V4L2 format is: " v4l2_fourcc_conv "\n", v4l2_fourcc_args(format);
> + */
> +#define v4l2_fourcc_conv "%c%c%c%c%s"
> +
> +/**
> + * v4l2_fourcc_args - Arguments for V4L2 fourcc format conversion
> + *
> + * @fourcc: V4L2 pixelformat, as in __u32
> + *
> + * Yields to a comma-separated list of arguments for printf that matches with
> + * conversion specifiers provided by @v4l2_fourcc_conv.
> + *
> + * Note that v4l2_fourcc_args reuses fourcc, so this can't be an expression
> + * with side-effects.
> + */
> +#define v4l2_fourcc_args(fourcc)					\
> +	(fourcc) & 0x7f, ((fourcc) >> 8) & 0x7f, ((fourcc) >> 16) & 0x7f, \
> +	((fourcc) >> 24) & 0x7f, ((fourcc) & (1 << 31) ? "-BE" : "")
> +
>  /*
>   *	E N U M S
>   */

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks,
Ezequiel

