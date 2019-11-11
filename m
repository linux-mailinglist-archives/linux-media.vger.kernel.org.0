Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9462DF6EDC
	for <lists+linux-media@lfdr.de>; Mon, 11 Nov 2019 08:01:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726768AbfKKHBg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Nov 2019 02:01:36 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:41200 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726791AbfKKHBf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Nov 2019 02:01:35 -0500
Received: by mail-ed1-f66.google.com with SMTP id a21so11078963edj.8
        for <linux-media@vger.kernel.org>; Sun, 10 Nov 2019 23:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=F3TxF+AJbjTFe9CSJ0NILNUnMGyyn7tR/jfpwQuTY6o=;
        b=YMByG+QA9BSSONXzijgH3lT/HJSfJ63osPgOWzCWCYvhB/KtuJhyoZum3mgB+NjmrG
         rJWRy9UXVTVCcWOm/sEn21bSpo0SlcT++UxUxkrfFLaNJgvrQEbXDbDcFcFKygsgPy+6
         Vcou70IW3wEv489ErEOzEfURMA/ZBjdNOisUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=F3TxF+AJbjTFe9CSJ0NILNUnMGyyn7tR/jfpwQuTY6o=;
        b=mcCQ5bjpy/dJ1oeBkzT9q3CN0ZWs2+gL7is+U9loTpK4eirYUwVchedMivPDIJB/rk
         awasSE+bU27Bpk7l7izOyKUXwGyf0VG11Alfvnxl42hA8y8hejdFvbpDXoJ+HYduZ95z
         4npUuaFl+KPUNERd9ZsDHl4Df9lfZ76UTt/fs+U/L7NBpy9hDJHhx7AWHyIqfCoHqCSJ
         KdDc1RDKEGcLqvAbZVEi0DU4VyBOFnNDWQdEGNPpOCHPZUrWfeXignYvKkBqqL1evuJq
         2yjlD8yXVSPxOJ7YwcZZBc51foL+dpRqJqWXfd32BAAr7o9R3ReaDz6/s2ZK3skExNjK
         UmBA==
X-Gm-Message-State: APjAAAXuIu/kcDxzBltW99jT1d0+OG+1hwPAFJ2c0F6Ey9C0PTO8Pt0c
        TishZw8fCZqy91sHFxmDIGUWGK9+U4TWJA==
X-Google-Smtp-Source: APXvYqzKaCxZEY0QDIiESqLKm+NKucejHf49GlJF8EfcNJr1tlQQh517YaJK0oxRlLRFZTXlbnuyDw==
X-Received: by 2002:a50:fe96:: with SMTP id d22mr24880525edt.227.1573455690518;
        Sun, 10 Nov 2019 23:01:30 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id n11sm510692eds.89.2019.11.10.23.01.27
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Nov 2019 23:01:28 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id r10so13362971wrx.3
        for <linux-media@vger.kernel.org>; Sun, 10 Nov 2019 23:01:27 -0800 (PST)
X-Received: by 2002:a05:6000:1206:: with SMTP id e6mr5641649wrx.113.1573455687257;
 Sun, 10 Nov 2019 23:01:27 -0800 (PST)
MIME-Version: 1.0
References: <20191017084033.28299-1-xia.jiang@mediatek.com>
 <20191017084033.28299-6-xia.jiang@mediatek.com> <20191023103945.GA41089@chromium.org>
 <1571906317.6254.64.camel@mhfsdcap03> <CAAFQd5DUF90daBAe96Vu46z9HD43AYG+9rK-_r_aWYey8GxpmQ@mail.gmail.com>
 <1572229558.27439.6.camel@mhfsdcap03>
In-Reply-To: <1572229558.27439.6.camel@mhfsdcap03>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 11 Nov 2019 16:01:13 +0900
X-Gmail-Original-Message-ID: <CAAFQd5DWZXru=a6JvTD8M1aJw8c48MK-vLPXvOmt-O4gVoPGVQ@mail.gmail.com>
Message-ID: <CAAFQd5DWZXru=a6JvTD8M1aJw8c48MK-vLPXvOmt-O4gVoPGVQ@mail.gmail.com>
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

Hi Xia,

On Mon, Oct 28, 2019 at 11:26 AM Xia Jiang <xia.jiang@mediatek.com> wrote:
>
> On Thu, 2019-10-24 at 18:23 +0900, Tomasz Figa wrote:
> > On Thu, Oct 24, 2019 at 5:38 PM Xia Jiang <xia.jiang@mediatek.com> wrot=
e:
> > >
> > > On Wed, 2019-10-23 at 19:39 +0900, Tomasz Figa wrote:
> > > > Hi Xia,
> > > >
> > > > On Thu, Oct 17, 2019 at 04:40:38PM +0800, Xia Jiang wrote:
> > > > > Add mtk jpeg encode v4l2 driver based on jpeg decode, because tha=
t jpeg
> > > > > decode and encode have great similarities with function operation=
.
> > > > >
> > > > > Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> > > > > ---
> > > > > v4: split mtk_jpeg_try_fmt_mplane() to two functions, one for enc=
oder,
> > > > >     one for decoder.
> > > > >     split mtk_jpeg_set_default_params() to two functions, one for
> > > > >     encoder, one for decoder.
> > > > >     add cropping support for encoder in g/s_selection ioctls.
> > > > >     change exif mode support by using V4L2_JPEG_ACTIVE_MARKER_APP=
1.
> > > > >     change MTK_JPEG_MAX_WIDTH/MTK_JPEG_MAX_HEIGH from 8192 to 655=
35 by
> > > > >     specification.
> > > > >     move width shifting operation behind aligning operation in
> > > > >     mtk_jpeg_try_enc_fmt_mplane() for bug fix.
> > > > >     fix user abuseing data_offset issue for DMABUF in
> > > > >     mtk_jpeg_set_enc_src().
> > > > >     fix kbuild warings: change MTK_JPEG_MIN_HEIGHT/MTK_JPEG_MAX_H=
EIGHT
> > > > >                         and MTK_JPEG_MIN_WIDTH/MTK_JPEG_MAX_WIDTH=
 from
> > > > >                         'int' type to 'unsigned int' type.
> > > > >                         fix msleadingly indented of 'else'.
> > > > >
> > > > > v3: delete Change-Id.
> > > > >     only test once handler->error after the last v4l2_ctrl_new_st=
d().
> > > > >     seperate changes of v4l2-ctrls.c and v4l2-controls.h to new p=
atch.
> > > > >
> > > > > v2: fix compliance test fail, check created buffer size in driver=
.
> > > > > ---
> > > > >  drivers/media/platform/mtk-jpeg/Makefile      |   5 +-
> > > > >  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 731 ++++++++++++=
+++---
> > > > >  .../media/platform/mtk-jpeg/mtk_jpeg_core.h   | 123 ++-
> > > > >  .../media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h |   7 +-
> > > > >  .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c | 175 +++++
> > > > >  .../media/platform/mtk-jpeg/mtk_jpeg_enc_hw.h |  60 ++
> > > > >  .../platform/mtk-jpeg/mtk_jpeg_enc_reg.h      |  49 ++
> > > > >  7 files changed, 1004 insertions(+), 146 deletions(-)
> > > > >  create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_=
hw.c
> > > > >  create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_=
hw.h
> > > > >  create mode 100644 drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_=
reg.h
> > > > >
> > > >
> > > > First of all, thanks for the patch!
> > > >
> > > > Please check my comments below.
> > > >
> > > > My general feeling about this code is that the encoder hardware blo=
ck is
> > > > completely orthogonal from the decoder block and there is very litt=
le code
> > > > reuse from the original decoder driver.
> > > >
> > > > Moreover, a lot of existing code now needs if (decoder) { ... } els=
e {... }
> > > > segments, which complicates the code.
> > > >
> > > > Would it perhaps make sense to instead create a separate mtk-jpeg-e=
nc
> > > > driver?
> > > >
> > > Dear Tomasz,
> > >
> > > Thanks for your comments.
> > >
> > > My reasons about the architecture of jpeg enc driver are as follows:
> > >
> > > The first internal design and realization of jpeg enc driver was a
> > > separate driver, but found that mtk_jpeg_core.c and mtk_jpeg_enc_core=
.c
> > > have lots of reuse.Because that  the core.c mainly contains realizati=
on
> > > of v4L2 ioctl functions and some logic which are high similarity betw=
een
> > > encoder and decoder.
> > >
> > > The jpeg encoder and decoder are two independent hardwares exactly, s=
o
> > > the code about hardware specification(register setting) are
> > > separated(mtk_jpeg_enc_hw.c and mtk_jpeg_dec_hw.c).
> > >
> > > As for 17 existing code segments contain if(decoder){} else {}, they =
are
> > > not complicated IMHO.The complicated(multilayer nested) functions are
> > > separated in V4 version as Hans recommendation.
> > >
> > > By the way,the upstreamed module s5p-jpeg
> > > (https://elixir.bootlin.com/linux/latest/source/drivers/media/platfor=
m/s5p-jpeg/jpeg-core.c#L1998) also use encoder and decoder mode in the comm=
on core.c, but their encoder and decoder are the same hardware.Maybe our jp=
eg enc and dec are designed into one hardware in the future.In that case th=
e current architecture is more compatible.
> > >
> > > So I prefer the current design.
> > >
> >
> > Would you be able to give some numbers to show the code reuse to
> > justify using the same driver? From my observation, a new driver would
> > result in a significantly cleaner code. If there is a further hardware
> > architecture change, that would likely require another driver, because
> > it wouldn't be compatible with existing programming model anyway.
> >
> > Regardless of that, if we end up with reusing the same driver, I'd
> > like you to fix the issues existing in the current base before adding
> > the encoder functionality.
> Dear Tomasz,
> I've counted about 1000 lines of code that can be reused.The reused code
> is 75 percent of the original code.
>
> If you agree to reuse the same driver,I will fix the issues existing in
> the current driver.

Sorry, I was out of the office.

Okay, let's reuse the driver. I guess the hardware programming part
itself is smaller than the V4L2 boiler plate needed for it and that's
where the 1000 lines of code comes from.

The first step I'd suggest then would be running the latest
v4l2-compliance, from the master branch of v4l2-utils [1] and making
sure there are no issues.

Then check if any comments I posted to the new code added by your
patch apply to the existing code as well and fixing those issues in a
prerequisite patches, at the beginning of the series.

[1] https://git.linuxtv.org/v4l-utils.git/

Best regards,
Tomasz
