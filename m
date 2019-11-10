Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED342F690D
	for <lists+linux-media@lfdr.de>; Sun, 10 Nov 2019 14:13:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbfKJNNf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Nov 2019 08:13:35 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:42698 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726301AbfKJNNe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Nov 2019 08:13:34 -0500
Received: by mail-ed1-f68.google.com with SMTP id m13so9771683edv.9
        for <linux-media@vger.kernel.org>; Sun, 10 Nov 2019 05:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pJs7Gpth0uQ2mylthnATmAIE8Mpkg3WNbYrrmzMAYBM=;
        b=M9NohlAAV158O8/msSSHcTmf9Gsautmx3NmT92PhyysByIW2LM1Ki8dgbrkHJETktp
         oWzUcLDGbs5xbctGlHM8Tow+Eny0fW6uACE7Qf4/rSWSKP3Yg0JBOwh2t5zKeRBWla29
         APPfbOSjn0wX+WfH+XFxvrvNzHybrWBTgbaLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pJs7Gpth0uQ2mylthnATmAIE8Mpkg3WNbYrrmzMAYBM=;
        b=O8nTxi+ApfdRTXW9wl9T2qBPX9ncAHBCVbavaokrvILK3UGG/67/cAaMm8dw1tUiuX
         irSGus14aODMLBRM4Ad7TD5c+2Ie4CP3hnQwzWzL0gjOaxBSbtt4ZVwnljXCxH++f81N
         snyTc7Nf2RAXvKoWt7OqEvEiIEp8LXOa9dDWoKVUHGaR5dXOia/2xjfHna/EdX43nvU3
         cq9RRMWvfCAmBqX8Dr++jPPGgjexfMxtHWUrOEJ4/Ir7c6IPKZ55m2q8ABESUJd0Fn2j
         JXIa/eZ3BnQmDyFhxd70dShQrYA52guFLPnfZw9xL82BilswnshmZyB1YZxLJxfRiwPr
         heuw==
X-Gm-Message-State: APjAAAV9cHf5RKXVuH5uIu2ctVyC1/plC+miV0yj58pnvQoY6k1Wf7nf
        EmFlkZEzFvnmTx+8nwXRbcaopmvjZJTlQg==
X-Google-Smtp-Source: APXvYqyD1dzdY4m+WxlJXWBKcIRngX//F4FwMehzSOy2V5e2lqdgrQakuHA1r5riad5Ti4W1NBwq5g==
X-Received: by 2002:a17:906:1c92:: with SMTP id g18mr17868597ejh.33.1573391611147;
        Sun, 10 Nov 2019 05:13:31 -0800 (PST)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id j19sm118581ejs.88.2019.11.10.05.13.29
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Nov 2019 05:13:30 -0800 (PST)
Received: by mail-wm1-f46.google.com with SMTP id z19so10603905wmk.3
        for <linux-media@vger.kernel.org>; Sun, 10 Nov 2019 05:13:29 -0800 (PST)
X-Received: by 2002:a1c:40c1:: with SMTP id n184mr17408541wma.116.1573391609107;
 Sun, 10 Nov 2019 05:13:29 -0800 (PST)
MIME-Version: 1.0
References: <E1iTgvs-0004qe-3k@www.linuxtv.org>
In-Reply-To: <E1iTgvs-0004qe-3k@www.linuxtv.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Sun, 10 Nov 2019 22:13:16 +0900
X-Gmail-Original-Message-ID: <CAAFQd5C+X+b1BMVicwXRXWZZ=t8SCJDgFQcd3hFs2zWuzUstKg@mail.gmail.com>
Message-ID: <CAAFQd5C+X+b1BMVicwXRXWZZ=t8SCJDgFQcd3hFs2zWuzUstKg@mail.gmail.com>
Subject: Re: [git:media_tree/master] media: mtk-vcodec: Remove extra area
 allocation in an input buffer on encoding
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linuxtv-commits@linuxtv.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hirokazu Honda <hiroh@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro and Hans,

On Sun, Nov 10, 2019 at 3:42 PM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:
>
> This is an automatic generated email to let you know that the following patch were queued:
>
> Subject: media: mtk-vcodec: Remove extra area allocation in an input buffer on encoding
> Author:  Hirokazu Honda <hiroh@chromium.org>
> Date:    Sun Nov 10 07:25:34 2019 +0100

I asked for some more testing on different platforms in my review
reply and we got some offline signals that it might not work on some
platforms, due to some hardware prefetch. (Would be better if that was
reported to the mailing list instead.) We're trying to figure out the
exact requirements here, because half of the frame doesn't sound like
something reasonable. Let's hold off the patch for the time being.

Best regards,
Tomasz

>
> MediaTek encoder allocates non pixel data area for an input buffer every
> plane. As the input buffer should be read-only, the driver should not write
> anything in the buffer. Therefore, the extra data should be unnecessary.
>
> Signed-off-by: Hirokazu Honda <hiroh@chromium.org>
> Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
>
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> ---
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
