Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 626A6576463
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 17:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235324AbiGOPWD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 11:22:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233509AbiGOPWB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 11:22:01 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9D5826C0
        for <linux-media@vger.kernel.org>; Fri, 15 Jul 2022 08:22:00 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30AC09DA;
        Fri, 15 Jul 2022 17:21:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657898519;
        bh=FcKfinHiPaD8e8H6sh6gbvPCA9uD0boHjFoL0Slzat8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lEWVe/O5SUJNWkjOKjJ+VFw7uTEZ9D6IMfskDajXXaUKEKjQ6Mtur9KHKVanuUpCG
         uSzxKJljEG+zyqxtLCdWJsI+C9yD35l284PT8TKfHQIR/pNBNnka1qeOyCvCLx0ZiR
         TTBQ5BSsgjrSme2CnE4VD/nsbkIisv4gBeUCURp0=
Date:   Fri, 15 Jul 2022 18:21:27 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [PATCH] media: videodev2.h.rst.exceptions: add missing exceptions
Message-ID: <YtGF9+5ZAauCr+tU@pendragon.ideasonboard.com>
References: <66c7648f-636d-121f-f6f3-c15752e9285e@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <66c7648f-636d-121f-f6f3-c15752e9285e@xs4all.nl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thank you for the patch.

On Fri, Jul 15, 2022 at 05:10:33PM +0200, Hans Verkuil wrote:
> Add new exceptions for V4L2_COLORSPACE_LAST, V4L2_XFER_FUNC_LAST
> and V4L2_YCBCR_ENC_LAST.
> 
> This fixes documentation warnings:
> 
> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-colorspace-last
> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-xfer-func-last
> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-ycbcr-enc-last
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

My bad.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> index 2feea4a5a008..64b2c0b1f666 100644
> --- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> +++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
> @@ -70,6 +70,7 @@ replace symbol V4L2_COLORSPACE_REC709 :c:type:`v4l2_colorspace`
>  replace symbol V4L2_COLORSPACE_SMPTE170M :c:type:`v4l2_colorspace`
>  replace symbol V4L2_COLORSPACE_SMPTE240M :c:type:`v4l2_colorspace`
>  replace symbol V4L2_COLORSPACE_SRGB :c:type:`v4l2_colorspace`
> +replace symbol V4L2_COLORSPACE_LAST :c:type:`v4l2_colorspace`
>  
>  # Documented enum v4l2_xfer_func
>  replace symbol V4L2_XFER_FUNC_709 :c:type:`v4l2_xfer_func`
> @@ -81,6 +82,7 @@ replace symbol V4L2_XFER_FUNC_NONE :c:type:`v4l2_xfer_func`
>  replace symbol V4L2_XFER_FUNC_SMPTE2084 :c:type:`v4l2_xfer_func`
>  replace symbol V4L2_XFER_FUNC_SMPTE240M :c:type:`v4l2_xfer_func`
>  replace symbol V4L2_XFER_FUNC_SRGB :c:type:`v4l2_xfer_func`
> +replace symbol V4L2_XFER_FUNC_LAST :c:type:`v4l2_xfer_func`
>  
>  # Documented enum v4l2_ycbcr_encoding
>  replace symbol V4L2_YCBCR_ENC_601 :c:type:`v4l2_ycbcr_encoding`
> @@ -92,6 +94,7 @@ replace symbol V4L2_YCBCR_ENC_SYCC :c:type:`v4l2_ycbcr_encoding`
>  replace symbol V4L2_YCBCR_ENC_XV601 :c:type:`v4l2_ycbcr_encoding`
>  replace symbol V4L2_YCBCR_ENC_XV709 :c:type:`v4l2_ycbcr_encoding`
>  replace symbol V4L2_YCBCR_ENC_SMPTE240M :c:type:`v4l2_ycbcr_encoding`
> +replace symbol V4L2_YCBCR_ENC_LAST :c:type:`v4l2_ycbcr_encoding`
>  
>  # Documented enum v4l2_hsv_encoding
>  replace symbol V4L2_HSV_ENC_180 :c:type:`v4l2_hsv_encoding`

-- 
Regards,

Laurent Pinchart
