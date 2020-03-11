Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA05181678
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 12:03:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728975AbgCKLDD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Mar 2020 07:03:03 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:37355 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbgCKLDD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Mar 2020 07:03:03 -0400
Received: by mail-ed1-f68.google.com with SMTP id b23so2343066edx.4
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 04:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jb6YNfpy0i4p0prPq7fXurxyCpu3UioYP/wK0SXZz40=;
        b=OzXiZdZxcla8lff01e5y1xu8R1or7O5akJh7vkF0kGDv+FIl4k+KI5dt7+u7bNa22f
         pEgi1+VeIA0u2roWjwGSIIVN7DccoliwZNCmhlmVo4+QDcI5e0XEPbQld3FfpR1P8z8I
         MP4yhJz3sMk7jvtXq8o0TB7XLMZod2m/M8uIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jb6YNfpy0i4p0prPq7fXurxyCpu3UioYP/wK0SXZz40=;
        b=TaVs+neFhUKSgTvYyNW+Io2Z3vM6v7Vhx0PzeLTkkfkFWIVPaeMgZtYsyOQIAyjQid
         OvCgM/egtFPuUEFYv697+SC6OjYnU3S4wZbEnqQmg5h3iXCqkZrU1x9O7Td67y9C+XXt
         6RR2kX4x0Fy79TtrrMqULINEDDVswT5mXKesiuH7ByQWnhzYjUHwVfCJE8F7XgK74/in
         KsxVA7w9fgYXvwPxu2qfigAPtoy9Fy4RkPxWVFckIf5QMV6Wap7JfSfZeU6TqIsBuPqA
         YJ2NFwVOM96Kig3Tq5N8rl9MwrVriVbeiIEr5PJVxOYZaZt8+avjB1c0opDS/4IDA0vH
         Rj7g==
X-Gm-Message-State: ANhLgQ1qZ6BszEP+G55tcZwVtT8NI9WMEOcxuv+Cli48uOZUH59p0TdJ
        m03YAQtn9h4V+RBmYUBXBXgSK140nbR7NA==
X-Google-Smtp-Source: ADFU+vsMpGpUAf0H5jmqIBqrsbhdtmb5qI8T9J2eZ38QYuli1Z/2EUavPimSgZe20WiLGfMRS7QEOA==
X-Received: by 2002:a17:906:279a:: with SMTP id j26mr1860032ejc.26.1583924581773;
        Wed, 11 Mar 2020 04:03:01 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id x6sm736546edl.61.2020.03.11.04.03.00
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2020 04:03:01 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id z15so2041038wrl.1
        for <linux-media@vger.kernel.org>; Wed, 11 Mar 2020 04:03:00 -0700 (PDT)
X-Received: by 2002:adf:f545:: with SMTP id j5mr3918965wrp.295.1583924580138;
 Wed, 11 Mar 2020 04:03:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200303123446.20095-1-xia.jiang@mediatek.com> <20200303123446.20095-4-xia.jiang@mediatek.com>
In-Reply-To: <20200303123446.20095-4-xia.jiang@mediatek.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 11 Mar 2020 20:02:48 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AA6NtLDsqL3Ph8cwv5=ZYoPOiu4Wa85ky037qOyMH1QQ@mail.gmail.com>
Message-ID: <CAAFQd5AA6NtLDsqL3Ph8cwv5=ZYoPOiu4Wa85ky037qOyMH1QQ@mail.gmail.com>
Subject: Re: [PATCH v7 03/11] media: platform: Improve s_selection flow for
 bug fixing
To:     Xia Jiang <xia.jiang@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        srv_heupstream <srv_heupstream@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Xia,

On Tue, Mar 3, 2020 at 9:35 PM Xia Jiang <xia.jiang@mediatek.com> wrote:
>
> Get correct compose value in mtk_jpeg_s_selection function.

It's a good practice to describe why the current code is wrong and new is good.

>
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Thanks for the patch. Please see my comment inline.

> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index da0dae4b0fc9..fb2c8d026580 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -492,8 +492,8 @@ static int mtk_jpeg_s_selection(struct file *file, void *priv,
>         case V4L2_SEL_TGT_COMPOSE:
>                 s->r.left = 0;
>                 s->r.top = 0;
> -               s->r.width = ctx->out_q.w;
> -               s->r.height = ctx->out_q.h;
> +               ctx->out_q.w = s->r.width;
> +               ctx->out_q.h = s->r.height;
>                 break;
>         default:
>                 return -EINVAL;

The decoder compose target means the visible rectangle of the decoded
image, which comes from the stream metadata. It's not something that
can be set by the userspace.

Best regards,
Tomasz
