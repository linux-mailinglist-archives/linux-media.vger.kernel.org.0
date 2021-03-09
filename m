Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1113E332574
	for <lists+linux-media@lfdr.de>; Tue,  9 Mar 2021 13:26:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbhCIMZu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Mar 2021 07:25:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbhCIMZ0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Mar 2021 07:25:26 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC39AC06174A
        for <linux-media@vger.kernel.org>; Tue,  9 Mar 2021 04:25:26 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 578BCE9;
        Tue,  9 Mar 2021 13:25:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615292724;
        bh=rShHSVGzflM+/+DqoTZSwD4Z3A2d/ZksFojMAcGo2oc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=R72m069JlUfBwf+pskY+2BZ5b6thYCat+WWp5w4kMEH/lKn5WWG9BgnAeNQYgdeth
         9i2LPg7t91zZ6SOb54zGaaSRpaEFJXj14rcbHwMWCIa0Xukcg0IUPIopVhp8Buiqb3
         JwiERLbTvb4rMzv8JsXQTYPNFdvidr+qmJIq4MJY=
Date:   Tue, 9 Mar 2021 14:24:53 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Prabhakar Lad <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH] vpbe_osd.h/uvcvideo.h includes: fix trivial kernel-doc
 warnings
Message-ID: <YEdpFa3Fz/q7lCdS@pendragon.ideasonboard.com>
References: <e184e57d-3739-98c6-6d64-adfc8f7c5777@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e184e57d-3739-98c6-6d64-adfc8f7c5777@xs4all.nl>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Tue, Mar 09, 2021 at 01:22:37PM +0100, Hans Verkuil wrote:
> Fix these kernel-doc warnings:
> 
> include/media/davinci/vpbe_osd.h:77: warning: Enum value 'PIXFMT_YCBCRI' not described in enum 'osd_pix_format'
> include/media/davinci/vpbe_osd.h:77: warning: Enum value 'PIXFMT_YCRCBI' not described in enum 'osd_pix_format'
> include/media/davinci/vpbe_osd.h:77: warning: Excess enum value 'PIXFMT_YCrCbI' description in 'osd_pix_format'
> include/media/davinci/vpbe_osd.h:77: warning: Excess enum value 'PIXFMT_YCbCrI' description in 'osd_pix_format'
> include/media/davinci/vpbe_osd.h:232: warning: expecting prototype for enum davinci_cursor_v_width. Prototype was for enum
> osd_cursor_v_width instead
> include/uapi/linux/uvcvideo.h:98: warning: Function parameter or member 'ns' not described in 'uvc_meta_buf'
> include/uapi/linux/uvcvideo.h:98: warning: Function parameter or member 'sof' not described in 'uvc_meta_buf'
> include/uapi/linux/uvcvideo.h:98: warning: Function parameter or member 'length' not described in 'uvc_meta_buf'
> include/uapi/linux/uvcvideo.h:98: warning: Function parameter or member 'flags' not described in 'uvc_meta_buf'
> include/uapi/linux/uvcvideo.h:98: warning: Function parameter or member 'buf' not described in 'uvc_meta_buf'
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> diff --git a/include/media/davinci/vpbe_osd.h b/include/media/davinci/vpbe_osd.h
> index e1b1c76aa50f..a4fc4f2a56fb 100644
> --- a/include/media/davinci/vpbe_osd.h
> +++ b/include/media/davinci/vpbe_osd.h
> @@ -54,9 +54,9 @@ enum osd_win_layer {
>   * @PIXFMT_4BPP: 4-bits-per-pixel bitmap
>   * @PIXFMT_8BPP: 8-bits-per-pixel bitmap
>   * @PIXFMT_RGB565: 16-bits-per-pixel RGB565
> - * @PIXFMT_YCbCrI: YUV 4:2:2
> + * @PIXFMT_YCBCRI: YUV 4:2:2
>   * @PIXFMT_RGB888: 24-bits-per-pixel RGB888
> - * @PIXFMT_YCrCbI: YUV 4:2:2 with chroma swap
> + * @PIXFMT_YCRCBI: YUV 4:2:2 with chroma swap
>   * @PIXFMT_NV12: YUV 4:2:0 planar
>   * @PIXFMT_OSD_ATTR: OSD Attribute Window pixel format (4bpp)
>   *
> @@ -210,7 +210,7 @@ enum osd_cursor_h_width {
>  };
> 
>  /**
> - * enum davinci_cursor_v_width
> + * enum osd_cursor_v_width
>   * @V_WIDTH_1: vertical line width is 1 line
>   * @V_WIDTH_2: vertical line width is 2 lines
>   * @V_WIDTH_4: vertical line width is 4 lines
> diff --git a/include/uapi/linux/uvcvideo.h b/include/uapi/linux/uvcvideo.h
> index f80f05b3c423..8288137387c0 100644
> --- a/include/uapi/linux/uvcvideo.h
> +++ b/include/uapi/linux/uvcvideo.h
> @@ -76,11 +76,11 @@ struct uvc_xu_control_query {
> 
>  /**
>   * struct uvc_meta_buf - metadata buffer building block
> - * @ns		- system timestamp of the payload in nanoseconds
> - * @sof		- USB Frame Number
> - * @length	- length of the payload header
> - * @flags	- payload header flags
> - * @buf		- optional device-specific header data
> + * @ns: system timestamp of the payload in nanoseconds
> + * @sof: USB Frame Number
> + * @length: length of the payload header
> + * @flags: payload header flags
> + * @buf: optional device-specific header data
>   *
>   * UVC metadata nodes fill buffers with possibly multiple instances of this
>   * struct. The first two fields are added by the driver, they can be used for

-- 
Regards,

Laurent Pinchart
