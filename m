Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 420F6391B63
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 17:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235320AbhEZPPa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 11:15:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235242AbhEZPP3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 11:15:29 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62F74C061756;
        Wed, 26 May 2021 08:13:57 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id z24so1364159ioi.3;
        Wed, 26 May 2021 08:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3qPykI9Vl0g+l1diro0mn4V5oV+hTvs8iIgisKTfzIs=;
        b=LsICM2yqWbp7f1/mE1DXUtRamm8V6o3/PdYUqrnuIzM/s1RE4erZFSakM5QKFZssEJ
         WaxQizcEJ1EHQG750kwNseF5UHrkQ8szZBUqWvcEOL+2qsqj1olvqWW6hLOQpy16lmxN
         tDF62By0P9XUriFaIbbtB4VBI4vVqeMsOq/drh8zSFf1LhJsjc9Jt0FPH5Q5emVqWgE5
         BdJDtXqFzLE7UmKrqiK8ohQOn5qODH3obu7Vyxxk+nBUhAd6g71S5WbfDAHIR2zron4g
         euAREeBRPvY9cshrWFLkRbZuqjAsUObrLD64q2cJ2bEH+lpMtoSxVzLU/G9iuBEOdXJd
         XbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3qPykI9Vl0g+l1diro0mn4V5oV+hTvs8iIgisKTfzIs=;
        b=TnkHG1kveqy+XCS2AnfKvV76ESs4bhuer2XUQnm/xnd/+DxzO2tywAnnUiY9brkqe+
         t7fAbn120mi9amPuikDo+MGMQ2YXRcD1fdR9EElfK+PEE8VB8tu/ba6zVWOR05779MGD
         TSF1rtSFAG1dZD324NJmE5C90tlrC5/4Z2jjjziyXw2oC/4451KeAXfc+j0AmHKbM3ke
         XKRYIF5ELef4N9cftftOZ1cznyvVmL8Em9BUML84BJ7Qrr4YKI4NSXmRxCPaiMPoQ7hL
         nmj5McV7e8VhfBPLhaPWxZtomlrywh2v/uOC4pKmSV7gmNb68es+5VnO7uzaSzfWLZpd
         eD4Q==
X-Gm-Message-State: AOAM533h5qdBp3KHtnCWv/WU95hxo6+trWDn4m+98Qemj/k1yjMkiNch
        qCBNTJPG/fYoPkDAq4AodNRw2LWviTOxnG/QvBz6Ek9GsbHwnw==
X-Google-Smtp-Source: ABdhPJzHgPGtpbtDw+zp60SQvXxeSf8NQoHscvz/NE64L8NtXp9zTaZvCaY1dQiBpwpzQ26VbOivSQ3OSMXi0fsOCfA=
X-Received: by 2002:a05:6602:3426:: with SMTP id n38mr22185879ioz.3.1622042036700;
 Wed, 26 May 2021 08:13:56 -0700 (PDT)
MIME-Version: 1.0
References: <1620706164-28856-1-git-send-email-dillon.minfei@gmail.com> <2193bb5c-89c3-cb1a-f2ef-1389ccfb7d61@xs4all.nl>
In-Reply-To: <2193bb5c-89c3-cb1a-f2ef-1389ccfb7d61@xs4all.nl>
From:   Dillon Min <dillon.minfei@gmail.com>
Date:   Wed, 26 May 2021 23:13:19 +0800
Message-ID: <CAL9mu0+bTrVsUVmZv8jFWxP1Wkcb7VQoj3k3j6Yzhe5W=5sY3Q@mail.gmail.com>
Subject: Re: [PATCH] media: s5p-g2d: Fix a memory leak on ctx->fh.m2m_ctx
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     mchehab+huawei@kernel.org, a.hajda@samsung.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for the reply.

On Wed, May 26, 2021 at 9:41 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 11/05/2021 06:09, dillon.minfei@gmail.com wrote:
> > From: Dillon Min <dillon.minfei@gmail.com>
> >
> > The m2m_ctx resources was allocated by v4l2_m2m_ctx_init() in g2d_open()
> > should be freed from g2d_release() when it's not used.
> >
> > Fix it
> >
> > Fixes: 918847341af0 ("[media] v4l: add G2D driver for s5p device family")
> > Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> > ---
> >  drivers/media/platform/s5p-g2d/g2d.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/media/platform/s5p-g2d/g2d.c b/drivers/media/platform/s5p-g2d/g2d.c
> > index 15bcb7f6e113..0818fdd3e984 100644
> > --- a/drivers/media/platform/s5p-g2d/g2d.c
> > +++ b/drivers/media/platform/s5p-g2d/g2d.c
> > @@ -279,6 +279,9 @@ static int g2d_release(struct file *file)
> >       v4l2_ctrl_handler_free(&ctx->ctrl_handler);
> >       v4l2_fh_del(&ctx->fh);
> >       v4l2_fh_exit(&ctx->fh);
> > +     mutex_lock(&dev->mutex);
> > +     v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> > +     mutex_unlock(&dev->mutex);
>
> This should be moved up to just before the v4l2_ctrl_handler_free() call.

On my mistake, thanks for pointing it out. will be moved up to
v4l2_ctrl_handler_free() in v2.

Best regards.
Dillon

>
> Regards,
>
>         Hans
>
> >       kfree(ctx);
> >       v4l2_info(&dev->v4l2_dev, "instance closed\n");
> >       return 0;
> >
>
