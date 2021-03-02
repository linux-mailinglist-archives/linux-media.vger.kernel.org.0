Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C83FB32A888
	for <lists+linux-media@lfdr.de>; Tue,  2 Mar 2021 18:51:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344354AbhCBRmq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Mar 2021 12:42:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241545AbhCBRjB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Mar 2021 12:39:01 -0500
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC288C0617A7
        for <linux-media@vger.kernel.org>; Tue,  2 Mar 2021 09:38:39 -0800 (PST)
Received: by mail-qt1-x834.google.com with SMTP id 18so12730119qty.3
        for <linux-media@vger.kernel.org>; Tue, 02 Mar 2021 09:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=NgErhWjVYS40cse08ZsXc39yhag5uGkh43eRrKni6lg=;
        b=ur8sCkRb3FMUhgW+QJadn9dMy4JISPa7I7yRBZGwGimMjGgjJvScQD944W2s39N1KK
         5ZwY/Uref8JP5Hz0AoZk7uJej9PkNpVO5lnBNAd1BNMQLDR3FeLf5o3O2/Nl9o52Jz6c
         Mkl8fwYqr2OqxRunNzd9U2N5r/AG1omvgceB2aliRb5FS4hQJJHBiTYgLL9O1hr5jyqH
         0mVCAU7VU9tlR+GoEy4FhWqk4WtQr03iwT7iAhKCfE+b/QojvK4/Na3r+NROo6aI6Rqg
         ZcitjEHBOZg2knRRNRzkoZxcHDVvk3aPSYJBewyYgbapyQ4VkDGgyFlqgXTcEheiJK9j
         rlCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=NgErhWjVYS40cse08ZsXc39yhag5uGkh43eRrKni6lg=;
        b=U0WFY1wUJ8R1/a5Uc6b7rj9Sv1y6Gdxv3VdjpWAu1f09ayKGOpJbGrY6jCw5wI6zYy
         q1SL+xqvQO4rY3t/XBuhtKUrum8zsQOMnjmf4e0+U+JrDa0IuvyM5T8Xu0ELFLGUZrZc
         ewiTnkgd1mrPRPrz6irn293D8a1/qSV9una3ZyCclo+dcrchGyU1oslKqBxWDBP29hAh
         n/RWHXr4jyk75tq33ZCfmv1jP00hQsttpLCFh2udptuzcmf4lO7rp2nEbobLOTryVYlo
         FSOuTaPlINsGn+mP/LfHhpJJAhNsm637FkZmOSp3a+xNdhd23NNQZZfjYGUoJxjzSkG3
         8+QQ==
X-Gm-Message-State: AOAM533qOwtJrvDh2LfRgR2BwrIkwfLHRB4pByGDqImH6s52/R7dN6gI
        RGdDh4MPCbJd5RJbGvs3dqhtyw==
X-Google-Smtp-Source: ABdhPJzEX9/PYCZJ0v5bnw+DU56A+H6y1W46NuNaqvaLGR+HDtIUxBzjsqJkyYMBHNTVe1V5W92Okg==
X-Received: by 2002:ac8:4249:: with SMTP id r9mr18127959qtm.285.1614706718945;
        Tue, 02 Mar 2021 09:38:38 -0800 (PST)
Received: from nicolas-tpx395.lan (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id t6sm15339867qkd.127.2021.03.02.09.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 09:38:38 -0800 (PST)
Message-ID: <4cb93f828695f7f6307077da466a58ba478c9824.camel@ndufresne.ca>
Subject: Re: [PATCH v2 3/8] media: add Mediatek's MM21 format
From:   Nicolas Dufresne <nicolas@ndufresne.ca>
To:     Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Date:   Tue, 02 Mar 2021 12:38:37 -0500
In-Reply-To: <20210225101612.2832444-4-acourbot@chromium.org>
References: <20210225101612.2832444-1-acourbot@chromium.org>
         <20210225101612.2832444-4-acourbot@chromium.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3 (3.38.3-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Le jeudi 25 février 2021 à 19:16 +0900, Alexandre Courbot a écrit :
> Add Mediatek's non-compressed 8 bit block video mode. This format is
> produced by the MT8183 codec and can be converted to a non-proprietary
> format by the MDP3 component.
> 
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  Documentation/userspace-api/media/v4l/pixfmt-reserved.rst | 7 +++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c                      | 1 +
>  include/uapi/linux/videodev2.h                            | 1 +
>  3 files changed, 9 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> index c9231e18859b..187ea89f7a25 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> @@ -242,6 +242,13 @@ please make a proposal on the linux-media mailing list.
>         It is an opaque intermediate format and the MDP hardware must be
>         used to convert ``V4L2_PIX_FMT_MT21C`` to ``V4L2_PIX_FMT_NV12M``,
>         ``V4L2_PIX_FMT_YUV420M`` or ``V4L2_PIX_FMT_YVU420``.
> +    * .. _V4L2-PIX-FMT-MM21:
> +
> +      - ``V4L2_PIX_FMT_MM21``
> +      - 'MM21'
> +      - Non-compressed, tiled two-planar format used by Mediatek MT8183.
> +       This is an opaque intermediate format and the MDP3 hardware can be
> +       used to convert it to other formats.
>      * .. _V4L2-PIX-FMT-SUNXI-TILED-NV12:

The SUNXI one was a mistake,  it's linear layout 32x32 tiles. The problem with
calling this a vendor format, is that other vendor might be using it too. But
they won't know and the format might endup duplicated, even if it's the same
one.

So here's my request, have you tried to understand a bit more what the tiling
layout is ? Could be tiled + SAND, could use zigzag layout like Samsung do. I
think if we can avoid vendor formats, we can preserve the pixel format list
sanity here. Most of the HW I've encoutered was very easy to reverse, even if
undocumented (except the compressed one).

If not possible, I would like to suggest:

  V4L2_PIX_FMT_MTK_NV21

The important part is to add a clear seperation for the vendor name, it easy to
recognize then.

>  
>        - ``V4L2_PIX_FMT_SUNXI_TILED_NV12``
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-
> core/v4l2-ioctl.c
> index 31d1342e61e8..0b85b2bbc628 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1384,6 +1384,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>         case V4L2_PIX_FMT_TM6000:       descr = "A/V + VBI Mux Packet"; break;
>         case V4L2_PIX_FMT_CIT_YYVYUY:   descr = "GSPCA CIT YYVYUY"; break;
>         case V4L2_PIX_FMT_KONICA420:    descr = "GSPCA KONICA420"; break;
> +       case V4L2_PIX_FMT_MM21:         descr = "Mediatek 8-bit block format";
> break;
>         case V4L2_PIX_FMT_HSV24:        descr = "24-bit HSV 8-8-8"; break;
>         case V4L2_PIX_FMT_HSV32:        descr = "32-bit XHSV 8-8-8-8"; break;
>         case V4L2_SDR_FMT_CU8:          descr = "Complex U8"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 79dbde3bcf8d..e6890dae76ec 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -731,6 +731,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_Y12I     v4l2_fourcc('Y', '1', '2', 'I') /* Greyscale
> 12-bit L/R interleaved */
>  #define V4L2_PIX_FMT_Z16      v4l2_fourcc('Z', '1', '6', ' ') /* Depth data
> 16-bit */
>  #define V4L2_PIX_FMT_MT21C    v4l2_fourcc('M', 'T', '2', '1') /* Mediatek
> compressed block mode  */
> +#define V4L2_PIX_FMT_MM21     v4l2_fourcc('M', 'M', '2', '1') /* Mediatek 8-
> bit block mode, two non-contiguous planes */
>  #define V4L2_PIX_FMT_INZI     v4l2_fourcc('I', 'N', 'Z', 'I') /* Intel Planar
> Greyscale 10-bit and Depth 16-bit */
>  #define V4L2_PIX_FMT_SUNXI_TILED_NV12 v4l2_fourcc('S', 'T', '1', '2') /*
> Sunxi Tiled NV12 Format */
>  #define V4L2_PIX_FMT_CNF4     v4l2_fourcc('C', 'N', 'F', '4') /* Intel 4-bit
> packed depth confidence information */


