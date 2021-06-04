Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC67139BCDB
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 18:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbhFDQTI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 12:19:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbhFDQTH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 12:19:07 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19F5DC061766
        for <linux-media@vger.kernel.org>; Fri,  4 Jun 2021 09:17:07 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id 76so9813153qkn.13
        for <linux-media@vger.kernel.org>; Fri, 04 Jun 2021 09:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=qN/2EXSzrNrSJ2eI4wRjb2nY4GWCrDNun+VmRgfF6d4=;
        b=jqImbONOeFQVmJP/JYb0n0GulrzmxpM9bbRfKggC/R72mc5wMzVuN78Wwp5WlEpthJ
         h/b6JCBoLptruNAlOocWrYQxO3bh+7cPIVWwplkMXQ+TdZr9Pq2zHIBof4G2WnywvhG8
         EVu8ZjZEUQqOeMDdPG6hwnPi5On34cQBNFoBYUKyRFJG+PxmdzSe7n3XukWYSSm8XTJK
         G/OBy1Djv4PlgvfrxRX4g5tcNuGDug8/GfA3YuAHwnEgRTHtv4MHBC5vEoGA5ZGvrd4F
         l6jXbUJ4FSsvAvNgkpDACGSKGn63vfsXhXNNwzZkaLzVYzIatGBmL3q4VR7h6rLZKYu+
         0/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=qN/2EXSzrNrSJ2eI4wRjb2nY4GWCrDNun+VmRgfF6d4=;
        b=W047cPsq08UU15Ac/1F7JqIfpgEH8T6SSqjUF4Un9niM6e8aB8lJzF1FnCtXD9cTOP
         YvUfEfH2cVMFlJ4er1LXJ/TW1RURGp0E2W9XdiK+z+h+vqhikwfWKzwyu94hk07ZQAid
         ngNk6iHAcT7YdWcZEQKab0YaJ+mTU7QvlFakfe/OpIikzqEyCn0PBc1GlcMdJcVNbZ50
         e/kym7t5bbs7zaRGkgGORxcRXvOt77G5VkW8eZcWoiw8BGI9lYqtGp8y7XmhBcimr67O
         /SjBx/mfh5e/ebm+Qgw5ytmI1AHrlfJb8G2bAyRifdeOpFMGlHj5NKQ2gneX2iu9q0te
         8jvg==
X-Gm-Message-State: AOAM531eLOS1yfQlkImP20fY9waYjRZnavMOS77BCUdpGSi1FAJuzw+k
        fgrvcoF/Msc5pbFcdZk4l5/sfg==
X-Google-Smtp-Source: ABdhPJy7xCqOxafQpNrZp+802ZsPDOdPMTghQNsAmOxmIH1a7H0XHFHP28C7LJKqAPO5/AZ/xma1Bw==
X-Received: by 2002:a37:9701:: with SMTP id z1mr5063823qkd.253.1622823426136;
        Fri, 04 Jun 2021 09:17:06 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id x66sm2824568qkc.100.2021.06.04.09.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 09:17:05 -0700 (PDT)
Message-ID: <f9fccfc4325e32022fac5f2c7b11c5e6b42e6fc8.camel@ndufresne.ca>
Subject: Re: [PATCH 4/8] media: Add P010 video format
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        hverkuil@xs4all.nl, ezequiel@collabora.com, p.zabel@pengutronix.de,
        mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Fri, 04 Jun 2021 12:17:03 -0400
In-Reply-To: <20210604130619.491200-5-benjamin.gaignard@collabora.com>
References: <20210604130619.491200-1-benjamin.gaignard@collabora.com>
         <20210604130619.491200-5-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.1 (3.40.1-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le vendredi 04 juin 2021 à 15:06 +0200, Benjamin Gaignard a écrit :
> P010 is a YUV format with 10-bits per pixel with interleaved UV.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  .../userspace-api/media/v4l/pixfmt-yuv-planar.rst         | 8 ++++++++
>  drivers/media/v4l2-core/v4l2-common.c                     | 1 +
>  drivers/media/v4l2-core/v4l2-ioctl.c                      | 1 +
>  include/uapi/linux/videodev2.h                            | 1 +
>  4 files changed, 11 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> index 090c091affd2..71fed70c03ec 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> @@ -100,6 +100,13 @@ All components are stored with the same number of bits per component.
>        - Cb, Cr
>        - No
>        - 64x32 macroblocks
> +    * - V4L2_PIX_FMT_P010
> +      - 'P010'
> +      - 10
> +      - 4:2:0
> +      - Cb, Cr
> +      - No
> +      - Linear
>  
>          Horizontal Z order
>      * - V4L2_PIX_FMT_NV12MT_16X16
> @@ -171,6 +178,7 @@ horizontally.
>  .. _V4L2-PIX-FMT-NV21:
>  .. _V4L2-PIX-FMT-NV12M:
>  .. _V4L2-PIX-FMT-NV21M:
> +.. _V4L2-PIX-FMT-P010:

The NV12/21 documentation is not sufficient to describe this format. While it
shares the layout (two planes Y and interleaved UV), it does not share the
packing. In this case, assuming this is P010 (and not the P010 the Rockchip
tried to upstreamed previously), each 10bit worth of pixel data would be pakced
into 16 bits with the least significant 6 bit being padding bits.

>  
>  NV12, NV21, NV12M and NV21M
>  ---------------------------
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


