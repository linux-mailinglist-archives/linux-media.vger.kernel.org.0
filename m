Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38C0B2099BC
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 08:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389966AbgFYGOL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 02:14:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389678AbgFYGOK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 02:14:10 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37F6BC061573
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2020 23:14:09 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id d4so4248537otk.2
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2020 23:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0yPP+c5tZH39HY9MAIE7qFR4ievS4DiE0UUqKAXhLjo=;
        b=LsYn/uj25XTnMsoDnb909V6+5oNqRX/G+udpcIh0m6hgzw7yaAlKBYazg42fl4ZxSc
         U7KiaXTLOfj37zcNQdO/eEg/h2MuM6Po/QmyRv8a5QSlxXHpQZAzD2kTcywvaDm2lF79
         mdib1mVdhaeDLesFtADptclI4yRkjSaYEdnR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0yPP+c5tZH39HY9MAIE7qFR4ievS4DiE0UUqKAXhLjo=;
        b=GysGJd2lvBIRZHnZLc2hxubKl1vH2m2QUmdoWpaJyHrJlHPXqcGi6aA46G/ZpYJfj6
         3JVTdyTO0A2fEyteFKpuLCP6EjZnEneTyinbIH1igi5Bph2JHJ8j0amngFfhRY+jphD3
         2k7aZy79P20aq9ARI5piOv9LXrXF/8MH4cwOG5bXMvwd51z+L7ADljtxCvaBgrPBrQm3
         0aUNvy70ldphLXMfNFjxC/k0aHBG0JzLQlm4uOfigzGVZ4D9g9fPA0xemJi9k51x9Xu/
         xq46uZPY43Z26gmhnSwOSFys89THVRZFS1HGQZVOFvvN1WS+mV9VufgGELwIt024rscz
         Jmgw==
X-Gm-Message-State: AOAM531mMu9OTiw4MqFvRTKuntIlD8m1DSnaDUF/FZp4X5HCv6o8/SQY
        NBmkZliqkJg9GmO6uGp7xK/UEnPONxY=
X-Google-Smtp-Source: ABdhPJxQ87KI/V9l3ZK1r4mTPATv7O6KMguPFxihD/S57fjafVz+ftQYqjx4/06njA8wFyJFq6je9A==
X-Received: by 2002:a4a:e89a:: with SMTP id g26mr26245154ooe.14.1593065648018;
        Wed, 24 Jun 2020 23:14:08 -0700 (PDT)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com. [209.85.167.170])
        by smtp.gmail.com with ESMTPSA id b11sm5212879oii.55.2020.06.24.23.14.06
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2020 23:14:07 -0700 (PDT)
Received: by mail-oi1-f170.google.com with SMTP id p82so4021096oif.1
        for <linux-media@vger.kernel.org>; Wed, 24 Jun 2020 23:14:06 -0700 (PDT)
X-Received: by 2002:a54:4d96:: with SMTP id y22mr938012oix.55.1593065646237;
 Wed, 24 Jun 2020 23:14:06 -0700 (PDT)
MIME-Version: 1.0
References: <E1iTgvs-0004qe-3k@www.linuxtv.org> <CAAFQd5C+X+b1BMVicwXRXWZZ=t8SCJDgFQcd3hFs2zWuzUstKg@mail.gmail.com>
 <ef927bf9-57ad-3be0-c9af-30da4751fdb8@xs4all.nl> <CAAFQd5BrTcC+bavoPoBsfKKuFLe7AdD=7BM17BSY59t9R4SL6w@mail.gmail.com>
 <CAAFQd5BNGZSFY2b9uebpiJ58tLsD_eeVm+6S=WbNBdwwyDdR+A@mail.gmail.com>
In-Reply-To: <CAAFQd5BNGZSFY2b9uebpiJ58tLsD_eeVm+6S=WbNBdwwyDdR+A@mail.gmail.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Thu, 25 Jun 2020 15:13:54 +0900
X-Gmail-Original-Message-ID: <CAPBb6MWuhJGq_etJN4WX0NOBXK0cA7rxVCMx70xCg7Uzmj_cMw@mail.gmail.com>
Message-ID: <CAPBb6MWuhJGq_etJN4WX0NOBXK0cA7rxVCMx70xCg7Uzmj_cMw@mail.gmail.com>
Subject: Re: [git:media_tree/master] media: mtk-vcodec: Remove extra area
 allocation in an input buffer on encoding
To:     Tomasz Figa <tfiga@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linuxtv-commits@linuxtv.org,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Hirokazu Honda <hiroh@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 19, 2019 at 6:31 PM Tomasz Figa <tfiga@chromium.org> wrote:
>
> Hi Hans,
>
> On Tue, Dec 17, 2019 at 3:46 PM Tomasz Figa <tfiga@chromium.org> wrote:
> >
> > +Alexandre Courbot
> >
> > On Sun, Nov 10, 2019 at 10:36 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> > >
> > > On 11/10/19 2:13 PM, Tomasz Figa wrote:
> > > > Hi Mauro and Hans,
> > > >
> > > > On Sun, Nov 10, 2019 at 3:42 PM Mauro Carvalho Chehab
> > > > <mchehab@kernel.org> wrote:
> > > >>
> > > >> This is an automatic generated email to let you know that the following patch were queued:
> > > >>
> > > >> Subject: media: mtk-vcodec: Remove extra area allocation in an input buffer on encoding
> > > >> Author:  Hirokazu Honda <hiroh@chromium.org>
> > > >> Date:    Sun Nov 10 07:25:34 2019 +0100
> > > >
> > > > I asked for some more testing on different platforms in my review
> > > > reply and we got some offline signals that it might not work on some
> > > > platforms, due to some hardware prefetch. (Would be better if that was
> > > > reported to the mailing list instead.) We're trying to figure out the
> > > > exact requirements here, because half of the frame doesn't sound like
> > > > something reasonable. Let's hold off the patch for the time being.
> > >
> > > I'll repost my last pull request, including a revert of this patch.
> > >
> > > The state of this patch in patchwork is changed back to New.
> > >
> > > I'll wait for your feedback on what to do with this patch.
>
> Let's drop this patch indeed. Apparently some implementations of this
> hardware do read-ahead up to 32 lines, so the extra space is needed.

Sorry to revive this, but I see that this patch is currently merged:

Merged a first time in 3192b2ca79b3f72fbc0eab9cd95432e3c317ab0d,
Reverted in dca6b3733a4a46e63603496f544ece8ace541fde
Merged again in  81735ecb62f882853a37a8c157407ec4aed44fd0

Could that last merge be an error? As far as I know the final call was
that hardware read-ahead required the initial alignment, and with the
patch v4l2-compliance has one more failure on G_FMT.

The last merge came before Tomasz last email, and this patch is also
not in the Chrome OS tree, so unless someone speaks up I will consider
this should have been reverted and will do it in the next iteration of
my mtk-vcodec encoder series.

>
> Best regards,
> Tomasz
>
> > >
> > > Regards,
> > >
> > >         Hans
> > >
> > > >
> > > > Best regards,
> > > > Tomasz
> > > >
> > > >>
> > > >> MediaTek encoder allocates non pixel data area for an input buffer every
> > > >> plane. As the input buffer should be read-only, the driver should not write
> > > >> anything in the buffer. Therefore, the extra data should be unnecessary.
> > > >>
> > > >> Signed-off-by: Hirokazu Honda <hiroh@chromium.org>
> > > >> Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> > > >> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> > > >> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > > >>
> > > >>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 9 +++------
> > > >>  1 file changed, 3 insertions(+), 6 deletions(-)
> > > >>
> > > >> ---
> > > >>
> > > >> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > > >> index fd8de027e83e..6aad53d97d74 100644
> > > >> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > > >> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> > > >> @@ -332,14 +332,12 @@ static int vidioc_try_fmt(struct v4l2_format *f,
> > > >>
> > > >>                 pix_fmt_mp->num_planes = fmt->num_planes;
> > > >>                 pix_fmt_mp->plane_fmt[0].sizeimage =
> > > >> -                               pix_fmt_mp->width * pix_fmt_mp->height +
> > > >> -                               ((ALIGN(pix_fmt_mp->width, 16) * 2) * 16);
> > > >> +                       pix_fmt_mp->width * pix_fmt_mp->height;
> > > >>                 pix_fmt_mp->plane_fmt[0].bytesperline = pix_fmt_mp->width;
> > > >>
> > > >>                 if (pix_fmt_mp->num_planes == 2) {
> > > >>                         pix_fmt_mp->plane_fmt[1].sizeimage =
> > > >> -                               (pix_fmt_mp->width * pix_fmt_mp->height) / 2 +
> > > >> -                               (ALIGN(pix_fmt_mp->width, 16) * 16);
> > > >> +                               (pix_fmt_mp->width * pix_fmt_mp->height) / 2;
> > > >>                         pix_fmt_mp->plane_fmt[2].sizeimage = 0;
> > > >>                         pix_fmt_mp->plane_fmt[1].bytesperline =
> > > >>                                                         pix_fmt_mp->width;
> > > >> @@ -347,8 +345,7 @@ static int vidioc_try_fmt(struct v4l2_format *f,
> > > >>                 } else if (pix_fmt_mp->num_planes == 3) {
> > > >>                         pix_fmt_mp->plane_fmt[1].sizeimage =
> > > >>                         pix_fmt_mp->plane_fmt[2].sizeimage =
> > > >> -                               (pix_fmt_mp->width * pix_fmt_mp->height) / 4 +
> > > >> -                               ((ALIGN(pix_fmt_mp->width, 16) / 2) * 16);
> > > >> +                               (pix_fmt_mp->width * pix_fmt_mp->height) / 4;
> > > >>                         pix_fmt_mp->plane_fmt[1].bytesperline =
> > > >>                                 pix_fmt_mp->plane_fmt[2].bytesperline =
> > > >>                                 pix_fmt_mp->width / 2;
> > >
