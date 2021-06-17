Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AC4D3AB18A
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 12:41:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231756AbhFQKnX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 06:43:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbhFQKnV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 06:43:21 -0400
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64F9CC061574;
        Thu, 17 Jun 2021 03:41:14 -0700 (PDT)
Received: by mail-io1-xd2e.google.com with SMTP id b14so2549087iow.13;
        Thu, 17 Jun 2021 03:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k5h9lWFEFZiq9DqBhAFZW6ZADMIHfKPewEhboCoUBeo=;
        b=CjIntfsRB0lb653kwHywX8oaCwH0zs8tOBtV6/dZ12Oj961cifq9XFJgvD7XrX8M+M
         VO8rcRQLYMugTvc6aakzNYSPbvxFiwyT+sPElt3yIdubRyYDG7wzGmlGQdl8Ey2WzquR
         Tst426PXr4YHGK7Y7WuSs+DJKcp53ylGeRK1nV8Buo6NvmI0b0Vo6B3l4SWCeM3z7aZK
         4LmlfYONs01M7vKWrSU6bLRGDxj3qP4lw4f0WJKAbCMMDnHsHCjQyzP9cSQYnHbUNukx
         kkVpr5I3ftvMHoH8fJA1elFhZPMaXrT1jmg17+IPIoJ4mL8PaXJokTHADO8MSHfqUxRg
         kurw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k5h9lWFEFZiq9DqBhAFZW6ZADMIHfKPewEhboCoUBeo=;
        b=ILNCPQtfgh9xFECG0nmtuMpdBsi/FFHL8H0T8ZeUFoTpenVUMeFhrO0tDz981Qxsb/
         qMETUO5SrLlCXUQddcgTa2vBmpUgIIEy3dnCIQopNTTSyo5ssZpGrXlp1HBbadjgiHDw
         1hV/wcd56lSSKG/R4X0X6CAloKAvqQ3ehsqscc1+DDjILrMbLxIQaricH8Nr9HCW/FkR
         abEtd/jbnW4HN70CgwfOA9zpmoNQmFJI68evFWjEnEqrd/fIEYqVAsGrvgpxxkj6eXkg
         VTEUX8XxeHFXh6Jqza43t/vax/nQazq0KRcGhKeBEkleYujITsCujX67wuy88/Q2pooG
         3U6A==
X-Gm-Message-State: AOAM533AsXBerVR6rTOmDrOe9zLy3BE/zrWwl+ud40BsuDx9Z+aBGZLN
        ahvCykpheOXe2pqbKo75ZGkB2InKfcT98eAjok8=
X-Google-Smtp-Source: ABdhPJzZW0Z79Zpvy5uBSOey3RVZxO7W8bRda487KKxHuBlK5Y8u3PSSKBjE1BKY3xvz5YBo4H+uN60Cz8Q1GbjoFBU=
X-Received: by 2002:a6b:6205:: with SMTP id f5mr3248085iog.60.1623926473727;
 Thu, 17 Jun 2021 03:41:13 -0700 (PDT)
MIME-Version: 1.0
References: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
 <1621508727-24486-7-git-send-email-dillon.minfei@gmail.com> <d9d2a893-a159-1681-866f-e905609ce9d0@xs4all.nl>
In-Reply-To: <d9d2a893-a159-1681-866f-e905609ce9d0@xs4all.nl>
From:   Dillon Min <dillon.minfei@gmail.com>
Date:   Thu, 17 Jun 2021 18:40:37 +0800
Message-ID: <CAL9mu0JcL37XtA2NEEDUJ5MWu0gSt6sh=kmVCER9AWWHRnGDYQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] media: v4l2-mem2mem: add v4l2_m2m_get_unmapped_area
 for no-mmu platform
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        mchehab+huawei@kernel.org, ezequiel@collabora.com,
        gnurou@gmail.com, Pi-Hsun Shih <pihsun@chromium.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@foss.st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Patrice CHOTARD <patrice.chotard@foss.st.com>,
        hugues.fruchet@foss.st.com,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Thu, Jun 17, 2021 at 5:58 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 20/05/2021 13:05, dillon.minfei@gmail.com wrote:
> > From: Dillon Min <dillon.minfei@gmail.com>
> >
> > For platforms without MMU the m2m provides a helper method
> > v4l2_m2m_get_unmapped_area(), The mmap() routines will call
> > this to get a proposed address for the mapping.
> >
> > More detailed information about get_unmapped_area can be found in
> > Documentation/nommu-mmap.txt
>
> I'm getting checkpatch.pl --strict warnings:
>
> CHECK: Alignment should match open parenthesis
> #31: FILE: drivers/media/v4l2-core/v4l2-mem2mem.c:971:
> +unsigned long v4l2_m2m_get_unmapped_area(struct file *file, unsigned long addr,
> +               unsigned long len, unsigned long pgoff, unsigned long flags)
>
> CHECK: Alignment should match open parenthesis
> #62: FILE: include/media/v4l2-mem2mem.h:500:
> +unsigned long v4l2_m2m_get_unmapped_area(struct file *file, unsigned long addr,
> +               unsigned long len, unsigned long pgoff, unsigned long flags);

Okay, I will add the "--strict" check to my regular patch submission.
Thanks for the reminder.

Best Regards
Dillon

>
> Regards,
>
>         Hans
>
> >
> > Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> > ---
> >  drivers/media/v4l2-core/v4l2-mem2mem.c | 20 ++++++++++++++++++++
> >  include/media/v4l2-mem2mem.h           |  4 ++++
> >  2 files changed, 24 insertions(+)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
> > index e7f4bf5bc8dd..f82a18ecab2f 100644
> > --- a/drivers/media/v4l2-core/v4l2-mem2mem.c
> > +++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
> > @@ -966,6 +966,26 @@ int v4l2_m2m_mmap(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
> >  }
> >  EXPORT_SYMBOL(v4l2_m2m_mmap);
> >
> > +#ifndef CONFIG_MMU
> > +unsigned long v4l2_m2m_get_unmapped_area(struct file *file, unsigned long addr,
> > +             unsigned long len, unsigned long pgoff, unsigned long flags)
> > +{
> > +     struct v4l2_fh *fh = file->private_data;
> > +     unsigned long offset = pgoff << PAGE_SHIFT;
> > +     struct vb2_queue *vq;
> > +
> > +     if (offset < DST_QUEUE_OFF_BASE) {
> > +             vq = v4l2_m2m_get_src_vq(fh->m2m_ctx);
> > +     } else {
> > +             vq = v4l2_m2m_get_dst_vq(fh->m2m_ctx);
> > +             pgoff -= (DST_QUEUE_OFF_BASE >> PAGE_SHIFT);
> > +     }
> > +
> > +     return vb2_get_unmapped_area(vq, addr, len, pgoff, flags);
> > +}
> > +EXPORT_SYMBOL_GPL(v4l2_m2m_get_unmapped_area);
> > +#endif
> > +
> >  #if defined(CONFIG_MEDIA_CONTROLLER)
> >  void v4l2_m2m_unregister_media_controller(struct v4l2_m2m_dev *m2m_dev)
> >  {
> > diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
> > index 5a91b548ecc0..91269227c265 100644
> > --- a/include/media/v4l2-mem2mem.h
> > +++ b/include/media/v4l2-mem2mem.h
> > @@ -495,6 +495,10 @@ __poll_t v4l2_m2m_poll(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
> >  int v4l2_m2m_mmap(struct file *file, struct v4l2_m2m_ctx *m2m_ctx,
> >                 struct vm_area_struct *vma);
> >
> > +#ifndef CONFIG_MMU
> > +unsigned long v4l2_m2m_get_unmapped_area(struct file *file, unsigned long addr,
> > +             unsigned long len, unsigned long pgoff, unsigned long flags);
> > +#endif
> >  /**
> >   * v4l2_m2m_init() - initialize per-driver m2m data
> >   *
> >
>
