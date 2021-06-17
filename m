Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED3323AB121
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 12:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231994AbhFQKRc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Jun 2021 06:17:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229887AbhFQKRb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Jun 2021 06:17:31 -0400
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25ABAC061574;
        Thu, 17 Jun 2021 03:15:24 -0700 (PDT)
Received: by mail-io1-xd33.google.com with SMTP id o5so707203iob.4;
        Thu, 17 Jun 2021 03:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KGL/4St8CT2Ac963azeQRyk+IlITL+qEpVPNlHM/37o=;
        b=bKwHB0IKV5OjeMW4X7r3ZB08hgO7efxr9ryo6e32en43D2rUiBX017lGE/UFlz1grh
         U/qx4ESV7D/TSrZHIw6iYvTxd4GeVbV1uwkabZhjNnIiDC19As3hxCeiM9Qa9YbGYyzs
         Dfq/20Vh27eRY6FV06PXE+/eL+23GBwPZYUJkj9ObL++f8+NmIaG8iKsUArb+pNpE18c
         F2zmJy29m2PkjPXFhXUru6Mgr2GD/rdx0QvLK3dkvTYCLK1SCrr6Pwfh2MBaKYaSYFLp
         pSnqxRj/umVc/AWGsRizGiharAiQBsnWIUrCnLPRAfEXP/O9onaDzwhJeC0ttSCuW47A
         mX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KGL/4St8CT2Ac963azeQRyk+IlITL+qEpVPNlHM/37o=;
        b=gq8afAOAvqQasNpa/lbzhO03f3lUL4w7yhB1oT/9IBGZTz6AHIOzOIVUc9+u+pNKOW
         PNcOfbh4+IKAiQgaHCZPE6ZEhOI4xwNHfYPCf6QdnQKWizZpEBibZ+ARlX8qoGXNmLba
         QZN0gWxzB9+/U+OIcjCgm6ehJMyL8GdpJYbs/z9775w6bnINHaDfTCD2+NjmPK2D+kso
         y0WNWtqIg3H/vKnyQR5FsX8FE8L4acmrfemV331Nu0odQbNKMXdIYBPoZGehT9h8OGwI
         Lor1GbVQFoL4jxSvItD6XzS5vHuJmVdT4EMMu7cIy13rulWoEDbjgqmFGYviLFnx3Z05
         1AUg==
X-Gm-Message-State: AOAM533bRiGeQDlPfmTLLC0oWzLusrH+7Rtv3DXBEbdy5LSbDy2wqRr5
        0s9s+8B4KL6kFP/LNu2nBo2bzIJHpLE6GvoQvC4=
X-Google-Smtp-Source: ABdhPJzbB+2xozr5c3nEbDgidEIonumRpZapZoSLiEZmV8b80pA0Y6QT5+aRwOkO+0YwvNKs3B2sbAuiL7VqpUym2fM=
X-Received: by 2002:a02:5b45:: with SMTP id g66mr3970817jab.62.1623924923627;
 Thu, 17 Jun 2021 03:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <1621508727-24486-1-git-send-email-dillon.minfei@gmail.com>
 <1621508727-24486-2-git-send-email-dillon.minfei@gmail.com> <0f3145ce-3a01-3a77-2b65-85450bf9d920@xs4all.nl>
In-Reply-To: <0f3145ce-3a01-3a77-2b65-85450bf9d920@xs4all.nl>
From:   Dillon Min <dillon.minfei@gmail.com>
Date:   Thu, 17 Jun 2021 18:14:47 +0800
Message-ID: <CAL9mu0KeZ9Fq5wN-jJwK5S94N0qPXmsENtZXUx-KfjWxNjjecw@mail.gmail.com>
Subject: Re: [PATCH 1/7] media: admin-guide: add stm32-dma2d description
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alexandre TORGUE <Alexandre.torgue@foss.st.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        mchehab+huawei@kernel.org, ezequiel@collabora.com,
        gnurou@gmail.com, Pi-Hsun Shih <pihsun@chromium.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans

Thanks for your review on my code.

On Thu, Jun 17, 2021 at 5:56 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wro=
te:
>
> On 20/05/2021 13:05, dillon.minfei@gmail.com wrote:
> > From: Dillon Min <dillon.minfei@gmail.com>
> >
> > add stm32-dma2d description for dma2d driver
> >
> > Signed-off-by: Dillon Min <dillon.minfei@gmail.com>
> > ---
> >  Documentation/admin-guide/media/platform-cardlist.rst | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/admin-guide/media/platform-cardlist.rst b/Do=
cumentation/admin-guide/media/platform-cardlist.rst
> > index 261e7772eb3e..ac73c4166d1e 100644
> > --- a/Documentation/admin-guide/media/platform-cardlist.rst
> > +++ b/Documentation/admin-guide/media/platform-cardlist.rst
> > @@ -60,6 +60,7 @@ s5p-mfc            Samsung S5P MFC Video Codec
> >  sh_veu             SuperH VEU mem2mem video processing
> >  sh_vou             SuperH VOU video output
> >  stm32-dcmi         STM32 Digital Camera Memory Interface (DCMI)
> > +stm32-dma2d        STM32 Chrom-Art Accelerator Unit
>
> I have to ask: it is really 'Chrom-Art' and not Chrome-Art or Choma-Art?

Yes, I just double checked it from [1], it's really 'Chrom-Art' :)
it's should not be an spelling mistake, i check the soc's datasheet,
reference Manuel, all used 'Chrom-Art'.

...
Graphics

Chrom-ART Accelerator=E2=84=A2 (DMA2D), graphical hardware accelerator
enabling enhanced graphical user interface with minimum CPU load
...


[1] https://www.st.com/en/microcontrollers-microprocessors/stm32f469ni.html

Thanks.

Best Regards
Dillon

>
> It's probably correct, but I have to check this :-)
>
> Regards,
>
>         Hans
>
> >  sun4i-csi          Allwinner A10 CMOS Sensor Interface Support
> >  sun6i-csi          Allwinner V3s Camera Sensor Interface
> >  sun8i-di           Allwinner Deinterlace
> >
>
