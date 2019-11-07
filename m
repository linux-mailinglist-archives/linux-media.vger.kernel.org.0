Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01846F2610
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 04:39:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733051AbfKGDj1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 22:39:27 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:42111 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727279AbfKGDj0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Nov 2019 22:39:26 -0500
Received: by mail-ed1-f65.google.com with SMTP id m13so666780edv.9
        for <linux-media@vger.kernel.org>; Wed, 06 Nov 2019 19:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4QNlRTLGQr37mhizIFRLl8TgY9SBjAFUyhyF2JeZyVA=;
        b=Bz3+znqk7TnIZHoZzBYIEZeHa1gUhSjnWdchWVDNXV5CRRegeHogkTvHi39lad8Gde
         +AMSXXKWIiBiFwAEAJKqT1UDffdQSrskvm9w+5o8hjOGVEeFLYyCKwhNOZyaJyOHlMmF
         97U6Blkq786w6QCPKD5KWleQKeLEKx/N//Po8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4QNlRTLGQr37mhizIFRLl8TgY9SBjAFUyhyF2JeZyVA=;
        b=kktrEk9GZaGP2cpnTgfdkNgnelhIZqfdmDb1p607RG/YeTbcn3ZRWmhCcO8omXBZkC
         Hj6inGf4yh6HD0FuyYF8VtyOAeqdgiim+gssOtXZ62encNh37/Ymvl8lCbYw5sd5SlIZ
         Xp4HMsfPB6NT/M1MALLTUkos2b2FTxmxgY4ti4erJmChU0kfYFYr0w9fBUOJk6oLgdoN
         L2QvMTwDzx8aoq5xuDMAmSGZhIhTsCYn+49nMiXQnQKx27QzrI3I//SCz+z2WffWBwBh
         mFIhyDvSDYAA+s6sz+k+0fhuj19Wv41QrP1Fo6c8d1j0iKlrIA0cm1KVN4W+Rk7YH/gO
         bdEg==
X-Gm-Message-State: APjAAAWaBHOnZ4jjv83HbCMWU5gFj7TDi6Rd7S/pqMNckEX6Dk+v6zgC
        gAhNl9iJRF4P1vDtyHrb4MGqwA8IlLZudg==
X-Google-Smtp-Source: APXvYqyykIazp7gFTPU3TT5UmGbnSbPHeewNpHfbPOIIYswuOrLE+jJVba+QrwsVwkuFyy9r8M2uNQ==
X-Received: by 2002:a17:906:1942:: with SMTP id b2mr1025699eje.36.1573097964795;
        Wed, 06 Nov 2019 19:39:24 -0800 (PST)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com. [209.85.128.43])
        by smtp.gmail.com with ESMTPSA id t17sm24327edv.96.2019.11.06.19.39.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2019 19:39:24 -0800 (PST)
Received: by mail-wm1-f43.google.com with SMTP id c22so761469wmd.1
        for <linux-media@vger.kernel.org>; Wed, 06 Nov 2019 19:39:24 -0800 (PST)
X-Received: by 2002:a7b:cbd9:: with SMTP id n25mr816484wmi.64.1573097963552;
 Wed, 06 Nov 2019 19:39:23 -0800 (PST)
MIME-Version: 1.0
References: <20191107033057.238603-1-hiroh@chromium.org>
In-Reply-To: <20191107033057.238603-1-hiroh@chromium.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 7 Nov 2019 12:39:12 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Buphd-1Z7+AjQ8fpdvMYY7QWPJBAYRTFF-46KM1LZ4GQ@mail.gmail.com>
Message-ID: <CAAFQd5Buphd-1Z7+AjQ8fpdvMYY7QWPJBAYRTFF-46KM1LZ4GQ@mail.gmail.com>
Subject: Re: [PATCH] media: mtk-vcodec: Remove extra area allocation in an
 input buffer on encoding
To:     Hirokazu Honda <hiroh@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?B?VGlmZmFueSBMaW4gKOael+aFp+ePiik=?= 
        <tiffany.lin@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Nov 7, 2019 at 12:31 PM Hirokazu Honda <hiroh@chromium.org> wrote:
>
> MediaTek encoder allocates non pixel data area for an input buffer every
> plane. As the input buffer should be read-only, the driver should not write
> anything in the buffer. Therefore, the extra data should be unnecessary.
>
> Signed-off-by: Hirokazu Honda <hiroh@chromium.org>
> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index fd8de027e83e..6aad53d97d74 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -332,14 +332,12 @@ static int vidioc_try_fmt(struct v4l2_format *f,
>
>                 pix_fmt_mp->num_planes = fmt->num_planes;
>                 pix_fmt_mp->plane_fmt[0].sizeimage =
> -                               pix_fmt_mp->width * pix_fmt_mp->height +
> -                               ((ALIGN(pix_fmt_mp->width, 16) * 2) * 16);
> +                       pix_fmt_mp->width * pix_fmt_mp->height;
>                 pix_fmt_mp->plane_fmt[0].bytesperline = pix_fmt_mp->width;
>
>                 if (pix_fmt_mp->num_planes == 2) {
>                         pix_fmt_mp->plane_fmt[1].sizeimage =
> -                               (pix_fmt_mp->width * pix_fmt_mp->height) / 2 +
> -                               (ALIGN(pix_fmt_mp->width, 16) * 16);
> +                               (pix_fmt_mp->width * pix_fmt_mp->height) / 2;
>                         pix_fmt_mp->plane_fmt[2].sizeimage = 0;
>                         pix_fmt_mp->plane_fmt[1].bytesperline =
>                                                         pix_fmt_mp->width;
> @@ -347,8 +345,7 @@ static int vidioc_try_fmt(struct v4l2_format *f,
>                 } else if (pix_fmt_mp->num_planes == 3) {
>                         pix_fmt_mp->plane_fmt[1].sizeimage =
>                         pix_fmt_mp->plane_fmt[2].sizeimage =
> -                               (pix_fmt_mp->width * pix_fmt_mp->height) / 4 +
> -                               ((ALIGN(pix_fmt_mp->width, 16) / 2) * 16);
> +                               (pix_fmt_mp->width * pix_fmt_mp->height) / 4;
>                         pix_fmt_mp->plane_fmt[1].bytesperline =
>                                 pix_fmt_mp->plane_fmt[2].bytesperline =
>                                 pix_fmt_mp->width / 2;
> --
> 2.24.0.rc1.363.gb1bccd3e3d-goog
>

Thanks for the patch!

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Now I'd also appreciate if there is anyone who could help testing this
further, especially on a platform that is not a Chromebook.

Best regards,
Tomasz
