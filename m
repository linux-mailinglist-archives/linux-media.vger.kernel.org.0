Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 952722B6833
	for <lists+linux-media@lfdr.de>; Tue, 17 Nov 2020 16:05:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729689AbgKQPFb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Nov 2020 10:05:31 -0500
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22]:59955 "EHLO
        lb1-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728819AbgKQPFb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Nov 2020 10:05:31 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id f2XtkpH5J6LFvf2XwkVTy8; Tue, 17 Nov 2020 16:05:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1605625529; bh=ZSqZCQhD/TW/LF6xhf2spnM6rmyZefhEgDOR06U79OU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Mebizmsj4UpW1qZME8CMPEjjLMloVtWSAn5NkCYhGJqLfP0sWr8qqgTeSDkVcJ/qr
         cgobFpNJGw2CcVToCvqwbzbdxieXDyELVbDJJdZl0ZFoEEUHEJd2IJUml+p6LgjzIj
         BTzy2pMcX6cGZIOT0979p8Xqio/qydGPjOM4QyEQgDfwTF4+0JcACvIv4FBRF05qHr
         iy90Tzw8OIQfxnI3Dr0sMX7R/iVwARC1wuJTiNb7Zg5FxYXCV46EiHRAiJuWfUNTfR
         X9SRNwiXS1AfmSxc3TKNa0DXiETVsups5myHr+1mOyJawsD5SUVZXiFxCWjOIBiMcp
         9+67ZKLQdy8OQ==
Subject: Re: [PATCH v3 20/21] media: v4l2: Add 10- and 12-bpc luma-only
 formats with linear packing
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <20201116185207.13208-1-laurent.pinchart@ideasonboard.com>
 <20201116185207.13208-21-laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <fe721b35-f61b-4297-2bb6-43bc2d3221d2@xs4all.nl>
Date:   Tue, 17 Nov 2020 16:05:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201116185207.13208-21-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfI337FIR3xQpZ3ExEXtu2aAGZjxJmmmSEJCUbBqgEsL3cyjNBKF7NKYnZxRjQZBfNJy5+FXvc1X1PsBzKVupYBGTSsYEtGI9LIHe9bJL5U7ROBBYqMSR
 u0ypu9lY6NkXykZVvu13fPDH/UY4cgRGfFlEUudAjIzizaXvL0TyYtbBHlLJuMbaZcl1dbHmZZESJygqYVwhmActbvWrdkzepopXdSxI1Zy7xdTWELi80fHD
 PlbqomcQIO6laEuad/MnvWAnkvXQ+CS+kOVMvQ00mBtLIML+J2mGgFbyYeUUiyHYgbd3MMjTmc6jQLgIX3+L40IVZ7yp0TXGzwItWlp7yDarrf21+qtIGKr8
 4uwDOW3WOayrwY/DtL9cLcRYKqbv3w==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/11/2020 19:52, Laurent Pinchart wrote:
> Add two new formats storing luma only in 10- and 12-bpc variants, with
> linear packing. They are used by the Xilinx Video Frame Buffer
> Read/Write IP cores.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../media/v4l/pixfmt-yuv-luma.rst             | 23 +++++++++++++++++++
>  include/uapi/linux/videodev2.h                |  2 ++
>  2 files changed, 25 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> index 0c8c5e0a380e..cc06d6d960b1 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
> @@ -17,6 +17,7 @@ are often referred to as greyscale formats.
>     - Y'\ :sub:`x`\ [9:2] denotes bits 9 to 2 of the Y' value for pixel at colum
>       `x`.
>     - `0` denotes padding bits set to 0.
> +   - `-` denotes padding bits with undefined values.
>  
>  
>  .. flat-table:: Luma-Only Image Formats
> @@ -75,6 +76,17 @@ are often referred to as greyscale formats.
>        - Y'\ :sub:`3`\ [9:2]
>        - Y'\ :sub:`3`\ [1:0] Y'\ :sub:`2`\ [1:0] Y'\ :sub:`1`\ [1:0] Y'\ :sub:`0`\ [1:0]
>  
> +    * .. _V4L2-PIX-FMT-Y10X:
> +
> +      - ``V4L2_PIX_FMT_Y10X``
> +      - 'Y10X'
> +
> +      - Y'\ :sub:`0`\ [7:0]
> +      - Y'\ :sub:`1`\ [5:0] Y'\ :sub:`0`\ [9:8]
> +      - Y'\ :sub:`2`\ [3:0] Y'\ :sub:`1`\ [9:6]
> +      - `- -` Y'\ :sub:`2`\ [9:4]

- - -> x x

> +      - ...
> +
>      * .. _V4L2-PIX-FMT-Y12:
>  
>        - ``V4L2_PIX_FMT_Y12``
> @@ -86,6 +98,17 @@ are often referred to as greyscale formats.
>        - ...
>        - ...
>  
> +    * .. _V4L2-PIX-FMT-Y12X:
> +
> +      - ``V4L2_PIX_FMT_Y12X``
> +      - 'Y12X'
> +
> +      - Y'\ :sub:`0`\ [7:0]
> +      - Y'\ :sub:`1`\ [3:0] Y'\ :sub:`0`\ [11:8]
> +      - Y'\ :sub:`1`\ [11:4]
> +      - Y'\ :sub:`2`\ [7:0]
> +      - `- - - -` Y'\ :sub:`2`\ [11:8]

Ditto.

Regards,

	Hans

> +
>      * .. _V4L2-PIX-FMT-Y14:
>  
>        - ``V4L2_PIX_FMT_Y14``
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 5cdbd1a2fddb..cf9288d270c6 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -576,6 +576,8 @@ struct v4l2_pix_format {
>  /* Grey bit-packed formats */
>  #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /* 10  Greyscale bit-packed */
>  #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10  Greyscale, MIPI RAW10 packed */
> +#define V4L2_PIX_FMT_Y10X    v4l2_fourcc('Y', '1', '0', 'X') /* 10  Greyscale, 3 pixels in 4 bytes */
> +#define V4L2_PIX_FMT_Y12X    v4l2_fourcc('Y', '1', '2', 'X') /* 12  Greyscale, 4 pixels in 5 bytes */
>  
>  /* Palette formats */
>  #define V4L2_PIX_FMT_PAL8    v4l2_fourcc('P', 'A', 'L', '8') /*  8  8-bit palette */
> 

