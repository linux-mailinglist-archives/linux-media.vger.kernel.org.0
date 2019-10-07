Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42CC6CDCD4
	for <lists+linux-media@lfdr.de>; Mon,  7 Oct 2019 10:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727295AbfJGIGo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Oct 2019 04:06:44 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:41125 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726889AbfJGIGo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Oct 2019 04:06:44 -0400
Received: from [IPv6:2001:983:e9a7:1:3d61:cdd2:8085:cc8] ([IPv6:2001:983:e9a7:1:3d61:cdd2:8085:cc8])
        by smtp-cloud7.xs4all.net with ESMTPA
        id HO2RiKOhMjZ8vHO2Si5BtB; Mon, 07 Oct 2019 10:06:40 +0200
Subject: Re: [Patch v2 19/21] media: v4l2-common: add pixel encoding support
To:     Benoit Parrot <bparrot@ti.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191004162952.4963-1-bparrot@ti.com>
 <20191004162952.4963-20-bparrot@ti.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <0118836c-f6d9-dccf-4e90-ede802c8be33@xs4all.nl>
Date:   Mon, 7 Oct 2019 10:06:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191004162952.4963-20-bparrot@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfMycd0OdHAjJH/NXrMDbLFIHdx94nRUWjCaUsgX+qJJZ0Emhn9jtC9nQrltLqupEt7kfk75gSAMxFR+dOIriQ48MBNet3BJ47/RnLrU84VczGc2No66R
 pMUnNpn9bR+Fg71AnSrkxbLddN74gpvsHdqncD+Omb1bY6E3TcUQJ2eifZ7cNR+z37/YkyCIazOMb6BzdxaeKjYlq5WPJGjl+ApH+rS3+9XCzLpBKFvBM4+E
 I+F3gSXSKr6w4vQoSs9CgQZ+yO4qUF3l4znIL5bRGrGxZ6SM0mO8zgvOqujxVlLEIfzu18C7CzmnrpeHgK9TJ7HSeaLKt3z10lD8W0EPEXx4zbnYIbaNCHBd
 Fo+73dvNlmCeykukGqqGD4b6t6xfkQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/4/19 6:29 PM, Benoit Parrot wrote:
> It is often useful to figure out if a pixel_format is either YUV or RGB
> especially for driver who can perform the pixel encoding conversion.
> 
> Instead of having each driver implement its own "is_this_yuv/rgb"
> function based on a restricted set of pixel value, it is better to do
> this in centralized manner.
> 
> We therefore add a pix_enc member to the v4l2_format_info structure to
> quickly identify the related pixel encoding.
> And add helper function to find/check pixel encoding.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> ---
>  drivers/media/v4l2-core/v4l2-common.c | 162 ++++++++++++++++----------
>  include/media/v4l2-common.h           |  20 ++++
>  2 files changed, 119 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 62f7aa92ac29..474cdb5863f4 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -236,77 +236,77 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
>  {
>  	static const struct v4l2_format_info formats[] = {
>  		/* RGB formats */
> -		{ .format = V4L2_PIX_FMT_BGR24,   .mem_planes = 1, .comp_planes = 1, .bpp = { 3, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_RGB24,   .mem_planes = 1, .comp_planes = 1, .bpp = { 3, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_HSV24,   .mem_planes = 1, .comp_planes = 1, .bpp = { 3, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_BGR32,   .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_XBGR32,  .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_BGRX32,  .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_RGB32,   .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_XRGB32,  .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_RGBX32,  .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_HSV32,   .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_ARGB32,  .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_RGBA32,  .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_ABGR32,  .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_BGRA32,  .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_GREY,    .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_BGR24,   .pix_enc = V4L2_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 3, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_RGB24,   .pix_enc = V4L2_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 3, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_HSV24,   .pix_enc = V4L2_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 3, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_BGR32,   .pix_enc = V4L2_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_XBGR32,  .pix_enc = V4L2_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_BGRX32,  .pix_enc = V4L2_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_RGB32,   .pix_enc = V4L2_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_XRGB32,  .pix_enc = V4L2_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_RGBX32,  .pix_enc = V4L2_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_HSV32,   .pix_enc = V4L2_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_ARGB32,  .pix_enc = V4L2_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_RGBA32,  .pix_enc = V4L2_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_ABGR32,  .pix_enc = V4L2_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_BGRA32,  .pix_enc = V4L2_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 4, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_GREY,    .pix_enc = V4L2_ENC_RGB, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>  
>  		/* YUV packed formats */
> -		{ .format = V4L2_PIX_FMT_YUYV,    .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_YVYU,    .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_UYVY,    .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_VYUY,    .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_YUYV,    .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_YVYU,    .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_UYVY,    .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_VYUY,    .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 2, .vdiv = 1 },
>  
>  		/* YUV planar formats */
> -		{ .format = V4L2_PIX_FMT_NV12,    .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2 },
> -		{ .format = V4L2_PIX_FMT_NV21,    .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2 },
> -		{ .format = V4L2_PIX_FMT_NV16,    .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_NV61,    .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_NV24,    .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_NV42,    .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -
> -		{ .format = V4L2_PIX_FMT_YUV410,  .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 4, .vdiv = 4 },
> -		{ .format = V4L2_PIX_FMT_YVU410,  .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 4, .vdiv = 4 },
> -		{ .format = V4L2_PIX_FMT_YUV411P, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 4, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_YUV420,  .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 2 },
> -		{ .format = V4L2_PIX_FMT_YVU420,  .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 2 },
> -		{ .format = V4L2_PIX_FMT_YUV422P, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_NV12,    .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2 },
> +		{ .format = V4L2_PIX_FMT_NV21,    .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2 },
> +		{ .format = V4L2_PIX_FMT_NV16,    .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_NV61,    .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_NV24,    .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_NV42,    .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +
> +		{ .format = V4L2_PIX_FMT_YUV410,  .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 4, .vdiv = 4 },
> +		{ .format = V4L2_PIX_FMT_YVU410,  .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 4, .vdiv = 4 },
> +		{ .format = V4L2_PIX_FMT_YUV411P, .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 4, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_YUV420,  .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 2 },
> +		{ .format = V4L2_PIX_FMT_YVU420,  .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 2 },
> +		{ .format = V4L2_PIX_FMT_YUV422P, .pix_enc = V4L2_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 1 },
>  
>  		/* YUV planar formats, non contiguous variant */
> -		{ .format = V4L2_PIX_FMT_YUV420M, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 2 },
> -		{ .format = V4L2_PIX_FMT_YVU420M, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 2 },
> -		{ .format = V4L2_PIX_FMT_YUV422M, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_YVU422M, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_YUV444M, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_YVU444M, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 1, .vdiv = 1 },
> -
> -		{ .format = V4L2_PIX_FMT_NV12M,   .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2 },
> -		{ .format = V4L2_PIX_FMT_NV21M,   .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2 },
> -		{ .format = V4L2_PIX_FMT_NV16M,   .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_NV61M,   .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_YUV420M, .pix_enc = V4L2_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 2 },
> +		{ .format = V4L2_PIX_FMT_YVU420M, .pix_enc = V4L2_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 2 },
> +		{ .format = V4L2_PIX_FMT_YUV422M, .pix_enc = V4L2_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_YVU422M, .pix_enc = V4L2_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 2, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_YUV444M, .pix_enc = V4L2_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_YVU444M, .pix_enc = V4L2_ENC_YUV, .mem_planes = 3, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 1, .vdiv = 1 },
> +
> +		{ .format = V4L2_PIX_FMT_NV12M,   .pix_enc = V4L2_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2 },
> +		{ .format = V4L2_PIX_FMT_NV21M,   .pix_enc = V4L2_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 2 },
> +		{ .format = V4L2_PIX_FMT_NV16M,   .pix_enc = V4L2_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_NV61M,   .pix_enc = V4L2_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 1 },
>  
>  		/* Bayer RGB formats */
> -		{ .format = V4L2_PIX_FMT_SBGGR8,	.mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_SGBRG8,	.mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_SGRBG8,	.mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_SRGGB8,	.mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_SBGGR10,	.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_SGBRG10,	.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_SGRBG10,	.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_SRGGB10,	.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_SBGGR10ALAW8,	.mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_SGBRG10ALAW8,	.mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_SGRBG10ALAW8,	.mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_SRGGB10ALAW8,	.mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_SBGGR10DPCM8,	.mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_SGBRG10DPCM8,	.mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_SGRBG10DPCM8,	.mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_SRGGB10DPCM8,	.mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_SBGGR12,	.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_SGBRG12,	.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_SGRBG12,	.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> -		{ .format = V4L2_PIX_FMT_SRGGB12,	.mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_SBGGR8,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_SGBRG8,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_SGRBG8,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_SRGGB8,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_SBGGR10,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_SGBRG10,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_SGRBG10,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_SRGGB10,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_SBGGR10ALAW8,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_SGBRG10ALAW8,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_SGRBG10ALAW8,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_SRGGB10ALAW8,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_SBGGR10DPCM8,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_SGBRG10DPCM8,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_SGRBG10DPCM8,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_SRGGB10DPCM8,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 1, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_SBGGR12,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_SGBRG12,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_SGRBG12,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_SRGGB12,	.pix_enc = V4L2_ENC_BAYER, .mem_planes = 1, .comp_planes = 1, .bpp = { 2, 0, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>  	};
>  	unsigned int i;
>  
> @@ -317,6 +317,42 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
>  }
>  EXPORT_SYMBOL(v4l2_format_info);
>  
> +bool v4l2_is_format_rgb(u32 format)
> +{
> +	const struct v4l2_format_info *f;
> +
> +	f = v4l2_format_info(format);
> +	if (f && f->pix_enc == V4L2_ENC_RGB)
> +		return true;
> +
> +	return false;

This can be simplified to:

	return f && f->pix_enc == V4L2_ENC_RGB;

Same for the other two functions below.

> +}
> +EXPORT_SYMBOL(v4l2_is_format_rgb);
> +
> +bool v4l2_is_format_yuv(u32 format)
> +{
> +	const struct v4l2_format_info *f;
> +
> +	f = v4l2_format_info(format);
> +	if (f && f->pix_enc == V4L2_ENC_YUV)
> +		return true;
> +
> +	return false;
> +}
> +EXPORT_SYMBOL(v4l2_is_format_yuv);
> +
> +bool v4l2_is_format_bayer(u32 format)
> +{
> +	const struct v4l2_format_info *f;
> +
> +	f = v4l2_format_info(format);
> +	if (f && f->pix_enc == V4L2_ENC_BAYER)
> +		return true;
> +
> +	return false;
> +}
> +EXPORT_SYMBOL(v4l2_is_format_bayer);

That said, I am not sure I like these three functions. It leads to
usage like this (from patch 21/21):

	if (v4l2_is_format_yuv(src_fmt->fmt.pix_mp.pixelformat) &&
	    v4l2_is_format_rgb(dst_fmt->fmt.pix_mp.pixelformat)) {

which is quite inefficient since v4l2_format_info() is called twice, so
the same for-loop there is also done twice.

I think the caller should just call v4l2_format_info(), then test f->pix_enc.

You can also add something like this to v4l2-common.h:

static inline bool v4l2_is_format_yuv(const struct v4l2_format_info *f)
{
	return f && f->pix_enc == V4L2_ENC_YUV;
}

I'm fine with that.

> +
>  static inline unsigned int v4l2_format_block_width(const struct v4l2_format_info *info, int plane)
>  {
>  	if (!info->block_w[plane])
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index c070d8ae11e5..27041cf2b818 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -456,9 +456,25 @@ int v4l2_s_parm_cap(struct video_device *vdev,
>  
>  /* Pixel format and FourCC helpers */
>  
> +/**
> + * enum v4l2_pixel_encoding - specifies the pixel encoding value
> + *
> + * @V4L2_ENC_UNKNOWN:	Pixel encoding is unknown/un-initialized
> + * @V4L2_ENC_YUV:	Pixel encoding is YUV
> + * @V4L2_ENC_RGB:	Pixel encoding is RGB
> + * @V4L2_ENC_BAYER:	Pixel encoding is Bayer
> + */
> +enum v4l2_pixel_encoding {
> +	@V4L2_ENC_UNKNOWN = 0,
> +	V4L2_ENC_YUV = 1,
> +	V4L2_ENC_RGB = 2,
> +	V4L2_ENC_BAYER = 3,
> +};

Just plain _ENC_ is a bit too generic. I'd change this to _PIXEL_ENC_.

> +
>  /**
>   * struct v4l2_format_info - information about a V4L2 format
>   * @format: 4CC format identifier (V4L2_PIX_FMT_*)
> + * @pix_enc: Pixel format encoding (see enum v4l2_pixel_encoding above)

Drop the 'format' word.

>   * @mem_planes: Number of memory planes, which includes the alpha plane (1 to 4).
>   * @comp_planes: Number of component planes, which includes the alpha plane (1 to 4).
>   * @bpp: Array of per-plane bytes per pixel
> @@ -469,6 +485,7 @@ int v4l2_s_parm_cap(struct video_device *vdev,
>   */
>  struct v4l2_format_info {
>  	u32 format;
> +	u8 pix_enc;

I would prefer pixel_enc instead of pix_enc.

>  	u8 mem_planes;
>  	u8 comp_planes;
>  	u8 bpp[4];
> @@ -479,6 +496,9 @@ struct v4l2_format_info {
>  };
>  
>  const struct v4l2_format_info *v4l2_format_info(u32 format);
> +bool v4l2_is_format_rgb(u32 format);
> +bool v4l2_is_format_yuv(u32 format);
> +bool v4l2_is_format_bayer(u32 format);
>  
>  void v4l2_apply_frmsize_constraints(u32 *width, u32 *height,
>  				    const struct v4l2_frmsize_stepwise *frmsize);
> 

Regards,

	Hans
