Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F417C3B4942
	for <lists+linux-media@lfdr.de>; Fri, 25 Jun 2021 21:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229853AbhFYTf7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Jun 2021 15:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbhFYTf6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Jun 2021 15:35:58 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C80A1C061766
        for <linux-media@vger.kernel.org>; Fri, 25 Jun 2021 12:33:37 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id j184so20340175qkd.6
        for <linux-media@vger.kernel.org>; Fri, 25 Jun 2021 12:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=5h4CvJweQMuWs653bHr5NaScBoPp7u+X9uwOAmyOcPY=;
        b=FTI5lNOm8ZH5uaNNKUD5v5gHASBKm1/im7F+FdnpqercIvnJrU4rLhZP1oXK3hh6cA
         L2L8QA4JYaSGSDSylU3hEEolkUzMcTW5jF6QBngkoTsdfWGXOsUaW5ypzwjyGars837n
         l19w5U+HfwXfSa/pKi2gtFtqgY7q3XArbNj7izbgI7Mpe8UI3ryqvyEuV+66SXDtvAz5
         9OuoWnqlDVgvfxyTu+3ng3ze6bLvZa3GTuk8yUgRSkB2mtEdn+12nsW99vdTvqtsKCiW
         YoFa3vA2iWGvqGMbXBZ++VW/iEOX9wCAWlWByufvWsAeJjMSZbVBZUVzDVLLeKJx/sdZ
         DsZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5h4CvJweQMuWs653bHr5NaScBoPp7u+X9uwOAmyOcPY=;
        b=QqNZeK0OXINW5gPRHDjUVLFhmNiOCPtZnEydu5tSzqntqq0qo4XainzOIS0S3JpCyA
         VntGzv5K9CzQkix/d1pYLHSUB4OjZj3YI4DgOgQe4RnwD2NwWiu4ye2BwzDDDseztBqL
         73hZtIkhrc6dRdcytu7gKJGYbjHFq56NCXQt0s3/lQdN+HIHh4WGipDwdeBzUaP/+3XL
         2ba5pDq6pE9TQ/aJvJ6Ps09HQsT1fsFfo2GEJUrY73kZmxznLY3ogYEmNJEHEToSuXry
         KmJopamZb87omuGGGQaStqXjyi88pvbgucF+oOOOcAEP1Nah9PlQ0Zn5rFIx89wkfj0c
         2ZnQ==
X-Gm-Message-State: AOAM531DifC7lvZD3enRgIzsyIRA+CT5wmMN44bii2A55frsgp3I/Kxm
        S1aB67uQ7yCWWypP+dG7s07f6Q==
X-Google-Smtp-Source: ABdhPJygqAmn+kyU0ry5g8gkjwb0dU6g9/glUQYELbM4Qo5YfnAWzGFGz5bVq934YrhDb4+WtqvKWg==
X-Received: by 2002:a37:9b02:: with SMTP id d2mr13064922qke.404.1624649616984;
        Fri, 25 Jun 2021 12:33:36 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id n64sm5669209qkd.79.2021.06.25.12.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 12:33:36 -0700 (PDT)
Message-ID: <d6925e114f142b8844b6e112f837b9ef32566212.camel@ndufresne.ca>
Subject: Re: [PATCH v3 4/8] media: Add P010 video format
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        hverkuil@xs4all.nl, ezequiel@collabora.com, p.zabel@pengutronix.de,
        mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk, jernej.skrabec@gmail.com
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Fri, 25 Jun 2021 15:33:34 -0400
In-Reply-To: <20210618131526.566762-5-benjamin.gaignard@collabora.com>
References: <20210618131526.566762-1-benjamin.gaignard@collabora.com>
         <20210618131526.566762-5-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 18 juin 2021 à 15:15 +0200, Benjamin Gaignard a écrit :
> P010 is a YUV format with 10-bits per pixel with interleaved UV.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> version 2:
>  - Add documentation about P010 padding
>  - Fix the number of bits per component (16)
> 
>  .../media/v4l/pixfmt-yuv-planar.rst           | 78 ++++++++++++++++++-
>  drivers/media/v4l2-core/v4l2-common.c         |  1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c          |  1 +
>  include/uapi/linux/videodev2.h                |  1 +
>  4 files changed, 79 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> index 090c091affd2..af400d37c8fd 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> @@ -100,8 +100,13 @@ All components are stored with the same number of bits per component.
>        - Cb, Cr
>        - No
>        - 64x32 macroblocks
> -
> -        Horizontal Z order
> +    * - V4L2_PIX_FMT_P010
> +      - 'P010'
> +      - 16
> +      - 4:2:0
> +      - Cb, Cr
> +      - No
> +      - Linear
>      * - V4L2_PIX_FMT_NV12MT_16X16
>        - 'VM12'
>        - 8
> @@ -171,6 +176,7 @@ horizontally.
>  .. _V4L2-PIX-FMT-NV21:
>  .. _V4L2-PIX-FMT-NV12M:
>  .. _V4L2-PIX-FMT-NV21M:
> +.. _V4L2-PIX-FMT-P010:
>  
>  NV12, NV21, NV12M and NV21M
>  ---------------------------
> @@ -470,6 +476,74 @@ number of lines as the luma plane.
>        - Cb\ :sub:`33`
>        - Cr\ :sub:`33`
>  
> +.. _V4L2_PIX_FMT_P010:
> +
> +P010
> +----
> +
> +The number of bytes in one luminance row must be divisible by 16,
> +which means there will be padded 0 in the right edge when necessary.
> +
> +.. raw:: latex
> +
> +    \begingroup
> +    \small
> +    \setlength{\tabcolsep}{2pt}
> +
> +.. tabularcolumns:: |p{2.6cm}|p{0.70cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
> +
> +.. flat-table:: P010 16 Bits per component
> +    :header-rows:  2
> +    :stub-columns: 0
> +
> +    * - Identifier
> +      - Code
> +      - :cspan:`7` Byte 0 in memory
> +
> +      - :cspan:`7` Byte 1
> +    * -
> +      -
> +      - 7
> +      - 6
> +      - 5
> +      - 4
> +      - 3
> +      - 2
> +      - 1
> +      - 0
> +
> +      - 7
> +      - 6
> +      - 5
> +      - 4
> +      - 3
> +      - 2
> +      - 1
> +      - 0
> +    * - ``V4L2_PIX_FMT_P010``
> +      - 'P010'
> +
> +      - Y\ :sub:`9`
> +      - Y\ :sub:`8`
> +      - Y\ :sub:`7`
> +      - Y\ :sub:`6`
> +      - Y\ :sub:`5`
> +      - Y\ :sub:`4`
> +      - Y\ :sub:`3`
> +      - Y\ :sub:`2`
> +
> +      - Y\ :sub:`1`
> +      - Y\ :sub:`0`
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +      - 0
> +
> +.. raw:: latex
> +
> +    \endgroup
>  
>  Fully Planar YUV Formats
>  ========================
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
> index 04af03285a20..37b5d82359dd 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -266,6 +266,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
>  		{ .format = V4L2_PIX_FMT_NV61,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 2, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_NV24,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 1, .vdiv = 1 },
>  		{ .format = V4L2_PIX_FMT_NV42,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .hdiv = 1, .vdiv = 1 },
> +		{ .format = V4L2_PIX_FMT_P010,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 2, 2, 0, 0 }, .hdiv = 2, .vdiv = 1 },
>  
>  		{ .format = V4L2_PIX_FMT_YUV410,  .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 4, .vdiv = 4 },
>  		{ .format = V4L2_PIX_FMT_YVU410,  .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 3, .bpp = { 1, 1, 1, 0 }, .hdiv = 4, .vdiv = 4 },
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 2673f51aafa4..6404d5b6e350 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1282,6 +1282,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_PIX_FMT_NV61:		descr = "Y/CrCb 4:2:2"; break;
>  	case V4L2_PIX_FMT_NV24:		descr = "Y/CbCr 4:4:4"; break;
>  	case V4L2_PIX_FMT_NV42:		descr = "Y/CrCb 4:4:4"; break;
> +	case V4L2_PIX_FMT_P010:		descr = "10-bit Y/CrCb 4:2:0"; break;
>  	case V4L2_PIX_FMT_NV12M:	descr = "Y/CbCr 4:2:0 (N-C)"; break;
>  	case V4L2_PIX_FMT_NV21M:	descr = "Y/CrCb 4:2:0 (N-C)"; break;
>  	case V4L2_PIX_FMT_NV16M:	descr = "Y/CbCr 4:2:2 (N-C)"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 9260791b8438..e5f7acde0730 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -602,6 +602,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_NV24    v4l2_fourcc('N', 'V', '2', '4') /* 24  Y/CbCr 4:4:4  */
>  #define V4L2_PIX_FMT_NV42    v4l2_fourcc('N', 'V', '4', '2') /* 24  Y/CrCb 4:4:4  */
>  #define V4L2_PIX_FMT_HM12    v4l2_fourcc('H', 'M', '1', '2') /*  8  YUV 4:2:0 16x16 macroblocks */
> +#define V4L2_PIX_FMT_P010    v4l2_fourcc('P', '0', '1', '0') /* 15  Y/CbCr 4:2:0 10-bit per pixel*/
>  
>  /* two non contiguous planes - one Y, one Cr + Cb interleaved  */
>  #define V4L2_PIX_FMT_NV12M   v4l2_fourcc('N', 'M', '1', '2') /* 12  Y/CbCr 4:2:0  */


