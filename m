Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31CA62B43A9
	for <lists+linux-media@lfdr.de>; Mon, 16 Nov 2020 13:26:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730067AbgKPMZt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Nov 2020 07:25:49 -0500
Received: from lb2-smtp-cloud9.xs4all.net ([194.109.24.26]:47431 "EHLO
        lb2-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730061AbgKPMZt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Nov 2020 07:25:49 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id edZnkedes6LFvedZqkPh9T; Mon, 16 Nov 2020 13:25:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1605529546; bh=bNRWm8pjYKbNlUVCz7AgTgHyvlHgaA9N7uq2lkePLLg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=wTVzcVbojhnQxmBZZVNwMUciZa9r9im36ua4s6YRYT4y1gQlUO4DKB6WPpKZTAYHV
         BEpOIZ7f6W+LrMlA1v4QhhXeKUNaEF/Y1uth8v0WCD4ccoqKzwn4v10mBX7EKk3Cir
         wsnuAuLuOboxxtgP/Z7jQA2HfGvN4r6+8EBuObwOpfHoF9nfMQec5cTUmfQKzEw5kx
         y1KRQBUM2IAStMPgOB70Vm9E1Nm2OS5rn0tAzMwzGU5+g1+RTGHAabpjWgSQ+lu/O0
         ItknQSueYOPvg/Zjn6PpoeYt37AsnLM9EgJnyqt7u0QK0wqoF6CjrCY39YuHQcrOya
         5nbMMEn393C6g==
Subject: Re: [PATCH v2 16/19] media: v4l2: Add a few missing packed YUV 4:4:4
 formats
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Dylan Yip <dylany@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <20201102224102.30292-1-laurent.pinchart@ideasonboard.com>
 <20201102224102.30292-17-laurent.pinchart@ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <680b4749-6f78-c163-6ee1-47321fc397eb@xs4all.nl>
Date:   Mon, 16 Nov 2020 13:25:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201102224102.30292-17-laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGAXdyrZRxmlEwrhqBdM9J0d1aE+RXOtPJYyjLU95VZyl51SewIjInjGncJ6zqMKDvALBUSYg71d3rWQqC12s7zXBJmXJmSoanmFUJy+1G4bzTZEABxb
 HTojWVM14On2AgEvTGdS+r0g4xgJxhfkvx4gCH4WPR5usj5NYa3tN6q9QaICyPB5MZVf9w3maNDH4+MUYjxvdo2TUfiw5G7B9cwZjKMrArsnNzaLVEuV6mfw
 UGOM/WjbRZqoPWZQntZXMVbrQJIe5K2sH0e7JTglxJnSGWHPj+5dXNpYZZANq1qeW2oLWq2XYR74NioSNe/jHgnAJQOckxTMPlJ8SyRe2w5wx+dSVxsv6C/q
 dWoIyq2kHwUVOZt3eG7kuq1ni78pfg==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/11/2020 23:40, Laurent Pinchart wrote:
> Add three new formats belonging to the packed YUV 4:4:4 family. They are
> used by the Xilinx Video Frame Buffer Read/Write IP cores.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../media/v4l/pixfmt-packed-yuv.rst           | 29 +++++++++++++++++++
>  include/uapi/linux/videodev2.h                |  3 ++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
> index 8f0f1405bfe3..6824898122aa 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-packed-yuv.rst
> @@ -170,6 +170,15 @@ the second byte and Y'\ :sub:`7-0` in the third byte.
>        - Byte 2
>        - Byte 3
>  
> +    * .. _V4L2-PIX-FMT-YUV24:
> +
> +      - ``V4L2_PIX_FMT_YUV24``
> +      - 'YUV3'
> +
> +      - Y'\ :sub:`7-0`
> +      - Cb\ :sub:`7-0`
> +      - Cr\ :sub:`7-0`
> +
>      * .. _V4L2-PIX-FMT-YUV32:
>  
>        - ``V4L2_PIX_FMT_YUV32``
> @@ -220,6 +229,26 @@ the second byte and Y'\ :sub:`7-0` in the third byte.
>        - Y'\ :sub:`7-0`
>        - `-`\ :sub:`7-0`
>  
> +    * .. _V4L2-PIX-FMT-YUVA32:
> +
> +      - ``V4L2_PIX_FMT_YUVA32``
> +      - 'YUVA'
> +
> +      - Y'\ :sub:`7-0`
> +      - Cb\ :sub:`7-0`
> +      - Cr\ :sub:`7-0`
> +      - `-`\ :sub:`7-0`

'-' should be A here.

Regards,

	Hans

> +
> +    * .. _V4L2-PIX-FMT-YUVX32:
> +
> +      - ``V4L2_PIX_FMT_YUVX32``
> +      - 'YUVX'
> +
> +      - Y'\ :sub:`7-0`
> +      - Cb\ :sub:`7-0`
> +      - Cr\ :sub:`7-0`
> +      - `-`\ :sub:`7-0`
> +
>  .. note::
>  
>      - The alpha component is expected to contain a meaningful value that can be
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index fab1dbb1a618..afe3619bc77c 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -593,11 +593,14 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_YUV444  v4l2_fourcc('Y', '4', '4', '4') /* 16  xxxxyyyy uuuuvvvv */
>  #define V4L2_PIX_FMT_YUV555  v4l2_fourcc('Y', 'U', 'V', 'O') /* 16  YUV-5-5-5     */
>  #define V4L2_PIX_FMT_YUV565  v4l2_fourcc('Y', 'U', 'V', 'P') /* 16  YUV-5-6-5     */
> +#define V4L2_PIX_FMT_YUV24   v4l2_fourcc('Y', 'U', 'V', '3') /* 24  YUV-8-8-8     */
>  #define V4L2_PIX_FMT_YUV32   v4l2_fourcc('Y', 'U', 'V', '4') /* 32  YUV-8-8-8-8   */
>  #define V4L2_PIX_FMT_AYUV32  v4l2_fourcc('A', 'Y', 'U', 'V') /* 32  AYUV-8-8-8-8  */
>  #define V4L2_PIX_FMT_XYUV32  v4l2_fourcc('X', 'Y', 'U', 'V') /* 32  XYUV-8-8-8-8  */
>  #define V4L2_PIX_FMT_VUYA32  v4l2_fourcc('V', 'U', 'Y', 'A') /* 32  VUYA-8-8-8-8  */
>  #define V4L2_PIX_FMT_VUYX32  v4l2_fourcc('V', 'U', 'Y', 'X') /* 32  VUYX-8-8-8-8  */
> +#define V4L2_PIX_FMT_YUVA32  v4l2_fourcc('Y', 'U', 'V', 'A') /* 32  YUVA-8-8-8-8  */
> +#define V4L2_PIX_FMT_YUVX32  v4l2_fourcc('Y', 'U', 'V', 'X') /* 32  YUVX-8-8-8-8  */
>  #define V4L2_PIX_FMT_M420    v4l2_fourcc('M', '4', '2', '0') /* 12  YUV 4:2:0 2 lines y, 1 line uv interleaved */
>  
>  /* two planes -- one Y, one Cr + Cb interleaved  */
> 

