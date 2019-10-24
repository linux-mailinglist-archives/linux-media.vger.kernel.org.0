Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC6F4E2D28
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2019 11:24:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408818AbfJXJYA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 05:24:00 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:40130 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389413AbfJXJYA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 05:24:00 -0400
Received: by mail-ed1-f66.google.com with SMTP id p59so9673855edp.7
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2019 02:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2Fg4OORdS56GYlEdlxxKyHlR08HjtyPW5mXDJkHAU3c=;
        b=LErg4eJHixvsMHo3T4UdsdOcjyo5lbO9XudSeZq6rpgNnkVpGr/b0G90t4XOSP66/E
         yPiEP9VtvxDCkUlH7d1janZhA4XnWhbkjvm/cOE2ToCJXuDoxd+uba3V89MU7eceWGgo
         3dPD97YPgwTyy5neIrYaAT8SNNB8krsO2ClP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2Fg4OORdS56GYlEdlxxKyHlR08HjtyPW5mXDJkHAU3c=;
        b=aa4HS9f4QHg589uYWiIC8ZcHou39hCU0elQhYEJ15SA2eITf4Bs3g9b+ZUnBs5Chd3
         +K+m06b+CcymWce3n1+7Zgsszmqjtzv0CEoVPYH4ORQkgWp81+cBET4dr1O41Zeea35H
         /bXENREf/av3PF8Speqa/g91xzMoymr1tTfA/OwY7X8wRG+HQXxcaxXrb4QB4LRH3EW9
         W4gtAHHXFd6dev7dcC4EN+V+KGzzu2aWyDtBE81OrD/RDyrB2WIbaUU9fWbAbzcpmPa6
         P8/h8/UKvd1Bltg57EWelg1lQ6dVLaoDF5RHpQ/Dmp5HnP1Gns/9tKe5Sgfh0tZXeZPX
         3WtQ==
X-Gm-Message-State: APjAAAV/oRmGzL2OsIS3rMCagJiCRp8s40Q3E0ZUqGtYiWDaIFECqRnB
        oHCCTv9+nxVjmeSiwhz8s+4gXrGxC3bvjA==
X-Google-Smtp-Source: APXvYqw97l5hNIiqAobIibz19XAEm0AunmDtwaB5bKsn0HwzNMOPkMe9nvYN3pC8qbIxopdj6Bjpyg==
X-Received: by 2002:aa7:c257:: with SMTP id y23mr42195699edo.39.1571909038082;
        Thu, 24 Oct 2019 02:23:58 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id t24sm231381edc.56.2019.10.24.02.23.55
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2019 02:23:56 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id o28so25201690wro.7
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2019 02:23:55 -0700 (PDT)
X-Received: by 2002:a5d:6a42:: with SMTP id t2mr2809593wrw.155.1571909035112;
 Thu, 24 Oct 2019 02:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <20191017084033.28299-1-xia.jiang@mediatek.com>
 <20191017084033.28299-6-xia.jiang@mediatek.com> <20191023103945.GA41089@chromium.org>
 <1571906317.6254.64.camel@mhfsdcap03>
In-Reply-To: <1571906317.6254.64.camel@mhfsdcap03>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 24 Oct 2019 18:23:43 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DUF90daBAe96Vu46z9HD43AYG+9rK-_r_aWYey8GxpmQ@mail.gmail.com>
Message-ID: <CAAFQd5DUF90daBAe96Vu46z9HD43AYG+9rK-_r_aWYey8GxpmQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] media: platform: Add jpeg dec/enc feature
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
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 24, 2019 at 5:38 PM Xia Jiang <xia.jiang@mediatek.com> wrote:
>
> On Wed, 2019-10-23 at 19:39 +0900, Tomasz Figa wrote:
> > Hi Xia,
> >
> > On Thu, Oct 17, 2019 at 04:40:38PM +0800, Xia Jiang wrote:
> > > Add mtk jpeg encode v4l2 driver based on jpeg decode, because that jp=
eg
> > > decode and encode have great similarities with function operation.
> > >
> > > Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> > > ---
> > > v4: split mtk_jpeg_try_fmt_mplane() to two functions, one for encoder=
,
> > >     one for decoder.
> > >     split mtk_jpeg_set_default_params() to two functions, one for
> > >     encoder, one for decoder.
> > >     add cropping support for encoder in g/s_selection ioctls.
> > >     change exif mode support by using V4L2_JPEG_ACTIVE_MARKER_APP1.
> > >     change MTK_JPEG_MAX_WIDTH/MTK_JPEG_MAX_HEIGH from 8192 to 65535 b=
y
> > >     specification.
> > >     move width shifting operation behind aligning operation in
> > >     mtk_jpeg_try_enc_fmt_mplane() for bug fix.
> > >     fix user abuseing data_offset issue for DMABUF in
> > >     mtk_jpeg_set_enc_src().
> > >     fix kbuild warings: change MTK_JPEG_MIN_HEIGHT/MTK_JPEG_MAX_HEIGH=
T
> > >                         and MTK_JPEG_MIN_WIDTH/MTK_JPEG_MAX_WIDTH fro=
m
> > >                         'int' type to 'unsigned int' type.
> > >                         fix msleadingly indented of 'else'.
> > >
> > > v3: delete Change-Id.
> > >     only test once handler->error after the last v4l2_ctrl_new_std().
> > >     seperate changes of v4l2-ctrls.c and v4l2-controls.h to new patch=
.
> > >
> > > v2: fix compliance test fail, check created buffer size in driver.
> > > ---
> > >  drivers/media/platform/mtk-jpeg/Makefile      |   5 +-
> > >  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 731 +++++++++++++++-=
--
> > >  .../media/platform/mtk-jpeg/mtk_jpeg_core.h   | 123 ++-
> > >  .../media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h |   7 +-
> > >  .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 175 +++++
> > >  .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h |  60 ++
> > >  .../platform/mtk-jpeg/mtk_jpeg_enc_reg.h      |  49 ++
> > >  7 files changed, 1004 insertions(+), 146 deletions(-)
> > >  create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c
> > >  create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h
> > >  create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_reg.=
h
> > >
> >
> > First of all, thanks for the patch!
> >
> > Please check my comments below.
> >
> > My general feeling about this code is that the encoder hardware block i=
s
> > completely orthogonal from the decoder block and there is very little c=
ode
> > reuse from the original decoder driver.
> >
> > Moreover, a lot of existing code now needs if (decoder) { ... } else {.=
.. }
> > segments, which complicates the code.
> >
> > Would it perhaps make sense to instead create a separate mtk-jpeg-enc
> > driver?
> >
> Dear Tomasz,
>
> Thanks for your comments.
>
> My reasons about the architecture of jpeg enc driver are as follows:
>
> The first internal design and realization of jpeg enc driver was a
> separate driver, but found that mtk_jpeg_core.c and mtk_jpeg_enc_core.c
> have lots of reuse.Because that  the core.c mainly contains realization
> of v4L2 ioctl functions and some logic which are high similarity between
> encoder and decoder.
>
> The jpeg encoder and decoder are two independent hardwares exactly, so
> the code about hardware specification(register setting) are
> separated(mtk_jpeg_enc_hw.c and mtk_jpeg_dec_hw.c).
>
> As for 17 existing code segments contain if(decoder){} else {}, they are
> not complicated IMHO.The complicated(multilayer nested) functions are
> separated in V4 version as Hans recommendation.
>
> By the way,the upstreamed module s5p-jpeg
> (https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/s5=
p-jpeg/jpeg-core.c#L1998) also use encoder and decoder mode in the common c=
ore.c, but their encoder and decoder are the same hardware.Maybe our jpeg e=
nc and dec are designed into one hardware in the future.In that case the cu=
rrent architecture is more compatible.
>
> So I prefer the current design.
>

Would you be able to give some numbers to show the code reuse to
justify using the same driver? From my observation, a new driver would
result in a significantly cleaner code. If there is a further hardware
architecture change, that would likely require another driver, because
it wouldn't be compatible with existing programming model anyway.

Regardless of that, if we end up with reusing the same driver, I'd
like you to fix the issues existing in the current base before adding
the encoder functionality.

Best regards,
Tomasz
