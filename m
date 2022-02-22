Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34B3A4BF957
	for <lists+linux-media@lfdr.de>; Tue, 22 Feb 2022 14:29:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231535AbiBVNaD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Feb 2022 08:30:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232448AbiBVN3y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Feb 2022 08:29:54 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9B79BB569
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 05:29:28 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id l25so8788034oic.13
        for <linux-media@vger.kernel.org>; Tue, 22 Feb 2022 05:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QHFXI90m0RJ3kwLM8ZJkKu1To5a2f6RmA6ygpe8hn0g=;
        b=I6eGBbn2oPcIKpibsT3Wn9/Nc3HJ2FSAr5qfR+t5s5gIKDnF4oqYcAxoE2+2zwsFaC
         LMrRHhWbErf9eIeYYeon5t6OUWuRxfBh2sPk2LB27qxRobiJaOl9Ab8tV5YYOfMWqcDq
         EKUu0yFFVR0kbCZfKLN5UAiWt/A1NY+k7cakD5ZuW2E8rh28FkY1Zu4Vf3NpCVv6c0C3
         zlVJHNjoUXhnBLFyCbV1XvbfqCPZGQ1K2VhJB82Ql2nJCCqubN5X9j5TlPzEOq6Z1J1P
         hblAFQFVI03C8fHUB4ublhzBn4R/AFci0tDtthFf8CRxRukguA2o0M0Y6S+j+SPy5iqK
         5eUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QHFXI90m0RJ3kwLM8ZJkKu1To5a2f6RmA6ygpe8hn0g=;
        b=od2cnitdxAEkU+YieYh90FFbMmEkKhVUik2art/KHZvodhCsR4uNxp3YhX2abPgxfd
         Vhor5mzg9WLxtewr1DQQ0NO7LKro4q5CcudvGkzp+7+NZHcZAIZUGq6sbOCasrm+A9WV
         T11sZQiJMoFo/Hfjp2r+/qFNeMBpt1AaxYXGfsDPi0Y0NmmUm2lM9+6LFmeehRlqrHSz
         K8GBeSNGZb5TDBwE4yfNgf8eYKzuMh77SIlWOXlVoOECorAVrnxhErmwna4mD+vxyvi1
         3LpvzKFZXY1nkBUpbbFjG7lrBnCPOwLOLVQqQlX165ZfuX9+pUD9+PAxaz3HXmzOJ6BW
         hI3Q==
X-Gm-Message-State: AOAM530qEv8DzxCzVNVkdYIV/PAHwPF+mwMuADTVOOFOT/oamWnLgfXE
        vvrlu0+1DLXuyF04z916NeW8mA==
X-Google-Smtp-Source: ABdhPJxF+9nDD4LQbOOAPDsVyWUyDbNOx+OUkpdIHb3iuiP79zBsEhMXu9LNl/VtgAS9kTWT+2thKA==
X-Received: by 2002:a05:6808:1407:b0:2cd:9d4d:ff9f with SMTP id w7-20020a056808140700b002cd9d4dff9fmr1774455oiv.45.1645536568223;
        Tue, 22 Feb 2022 05:29:28 -0800 (PST)
Received: from eze-laptop ([190.194.87.200])
        by smtp.gmail.com with ESMTPSA id u2sm4786931ots.15.2022.02.22.05.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 05:29:27 -0800 (PST)
Date:   Tue, 22 Feb 2022 10:29:23 -0300
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To:     Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>, kernel@collabora.com,
        yunfei.dong@mediatek.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] doc: media: Document MM21 tiled format
Message-ID: <YhTlMyjH6r8i+5Cr@eze-laptop>
References: <20220221191202.805745-1-nicolas.dufresne@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220221191202.805745-1-nicolas.dufresne@collabora.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 21, 2022 at 02:12:01PM -0500, Nicolas Dufresne wrote:
> MM21 has been documented through two software implementation [0] in libyuv and
> [2] GStreamer. This format is similar to other tiled format, though it uses
> uneven tile sizes. The luma tiles are 16x32 while the chroma tile have a
> subsampled size of 16x16. This is the uncompressed cousin of V4L2_PIX_FMT_MT21C
> and shares its tiling pattern and alignment.
> 
> [0] https://chromium.googlesource.com/libyuv/libyuv/+/b4ddbaf549a1bf5572bf703fd2862d1eb7380c6a
> [1] https://gitlab.freedesktop.org/gstreamer/gstreamer/-/commit/c9b127dae3af4b3fe78468e697cb491902425254
> 
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

> ---
>  .../userspace-api/media/v4l/pixfmt-reserved.rst   | 15 ++++-----------
>  .../userspace-api/media/v4l/pixfmt-yuv-planar.rst |  6 ++++++
>  2 files changed, 10 insertions(+), 11 deletions(-)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> index 2f2133b4cd9ce..cabfa34b7db5a 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> @@ -233,19 +233,12 @@ please make a proposal on the linux-media mailing list.
>  
>        - ``V4L2_PIX_FMT_MT21C``
>        - 'MT21'
> -      - Compressed two-planar YVU420 format used by Mediatek MT8173.
> -	The compression is lossless.
> -	It is an opaque intermediate format and the MDP hardware must be
> +      - Compressed two-planar YVU420 format used by Mediatek MT8173, MT8192,
> +        MT8195 and more. The compression is lossless. This format have
> +	similitude with ``V4L2_PIX_FMT_MM21`` in term of alignment and tiling.
> +	It remains an opaque intermediate format and the MDP hardware must be
>  	used to convert ``V4L2_PIX_FMT_MT21C`` to ``V4L2_PIX_FMT_NV12M``,
>  	``V4L2_PIX_FMT_YUV420M`` or ``V4L2_PIX_FMT_YVU420``.
> -    * .. _V4L2-PIX-FMT-MM21:
> -
> -      - ``V4L2_PIX_FMT_MM21``
> -      - 'MM21'
> -      - Non-compressed, tiled two-planar format used by Mediatek MT8183.
> -	This is an opaque intermediate format and the MDP3 hardware can be
> -	used to convert it to other formats.
> -
>  .. raw:: latex
>  
>      \normalsize
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> index 3a09d93d405b2..570791fbc5c8b 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
> @@ -296,6 +296,12 @@ tiles linearly in memory. The line stride and image height must be
>  aligned to a multiple of 32. The layouts of the luma and chroma planes are
>  identical.
>  
> +``V4L2_PIX_FMT_MM21`` store luma pixel in 16x32 tiles, and chroma pixels
> +in 16x16 tiles. The line stride must be aligned to a multiple of 16 and the
> +image height must be aligned to a multiple of 32. The number of luma and chroma
> +tiles are identical, even though the tile size differ. The image is formed of
> +two non-contiguous planes.
> +
>  .. _nv12mt:
>  
>  .. kernel-figure:: nv12mt.svg
> -- 
> 2.35.1
> 
