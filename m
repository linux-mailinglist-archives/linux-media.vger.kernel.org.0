Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B73A39FBDE
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2019 09:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbfH1HdV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Aug 2019 03:33:21 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:33928 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbfH1HdV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Aug 2019 03:33:21 -0400
Received: by mail-io1-f66.google.com with SMTP id s21so4047482ioa.1
        for <linux-media@vger.kernel.org>; Wed, 28 Aug 2019 00:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=B/tH3RdlaqfDevaRszeKuzoma9dqc91+yjGGb3NOxOw=;
        b=EEMGEdKeWolNfI/KooBfRZc/Q+OmhNR1y2gBIBqBmjrn4rM9Hw/6LcXR/mLjl1iHJs
         s80DsCvYOTbhDqAxUSB4W49DEn3MNVo4EfV3Czqdeni+peW7ElAIfU7Q/CcoqM+TtzuE
         S7nqxdB74qcxFqm7XWNGSdt0ypJSogVkpoWxssjvJ5AbqqE5SmQ6Ejcl3D6+vUGaquLp
         XrcxcyfiRAZrObjKdgHxBmgASOfwbkKtcz7FZuXknMLB/w3oRuN/3wgtEXLz15DVvS+c
         U1xYdmO/m7i4yot972KQQpfS4Jx1JRxwed+y1B03CrDUdZi01EQ0mrQAxNf8x20YCjOo
         GbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=B/tH3RdlaqfDevaRszeKuzoma9dqc91+yjGGb3NOxOw=;
        b=lPMqjBA9wvgK8bzs3rZOG804KG/vhPQZskcndKUyoKPR8tWKQJnMJLB0tUJIhUiqrs
         WyhVgLXEb9REQMxfEGYOYjQNY8SIHB8+r1splPKJUD+eWsc85Tp+fxyH/A/771epylA7
         yOBnHN+mgrC2xFxemd5Z8114uSFuFOcKamCoL+9l3aMkCSBTkEFFxoFti/l8ofJuM25+
         3vPQSlE8ZUeb3gyh5qLAL0zvkGQSo5+o72Aj7TieefL1wbziHthVW4AWcpVOS5/zTPAP
         vpRf54MpIKfABe7An0cDI1FnYg3Y2aTC6beLt0R5mVJnttCHYWcrQPI7+i1HGcI6g6FK
         AsSg==
X-Gm-Message-State: APjAAAVFuhzXfL8z0wFHixF5Wto+gZYlOuHc8+irfiPd0HlwJSeKq5CO
        +Qxj7JiJjG6e+Qk82UR371vcMe2LVUzz/W+WltlQpQ==
X-Google-Smtp-Source: APXvYqwOjNI+i+/HB7m+y+971nBx96PG4X7ieZWlCQ3DG1WaX6qUh9J5Pye64Etxjg0B9PMLJFz9Jzg7RitiVF2UobE=
X-Received: by 2002:a5d:9746:: with SMTP id c6mr913068ioo.235.1566977600395;
 Wed, 28 Aug 2019 00:33:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190725131257.6142-1-brgl@bgdev.pl> <CAK8P3a1FXyRRi5q48h-=egFjgoRJvy6_zuO9MQaAOMA-bsJKRA@mail.gmail.com>
 <CAMRc=Me_7aw_RvU_tZnVUgduN2wWYGqJ7hQirQ2RLzxGiPujvQ@mail.gmail.com>
In-Reply-To: <CAMRc=Me_7aw_RvU_tZnVUgduN2wWYGqJ7hQirQ2RLzxGiPujvQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 28 Aug 2019 09:33:09 +0200
Message-ID: <CAMRc=MdCviMA4gakqFS3+F-nU2XkdmmZbCb-m1mBJdGRHufKGg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] ARM: make DaVinci part of the ARM v5 multiplatform build
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Sekhar Nori <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>,
        David Lechner <david@lechnology.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

pon., 5 sie 2019 o 10:31 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(a=
):
>
> czw., 25 lip 2019 o 16:57 Arnd Bergmann <arnd@arndb.de> napisa=C5=82(a):
> >
> > On Thu, Jul 25, 2019 at 3:13 PM Bartosz Golaszewski <brgl@bgdev.pl> wro=
te:
> > >
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > This series makes DaVinci part of the multiplatform build for ARM v5.
> > >
> > > First three patches fix build errors spotted and fixed by Arnd with v=
1.
> > >
> > > The fourth patch adds necessary bits and pieces for davinci to suppor=
t
> > > multiplatform build and the last one actually adds all davinci boards
> > > to multi_v5_defconfig.
> > >
> > > Tested on da850-lcdk with both multi_v5 as well as davinci_all defcon=
figs.
> > >
> > > v1 -> v2:
> > > - added patches from Arnd that fix build errors spotted when building
> > >   random configurations (much appreciated)
> > > - rebased on top of v5.3-rc1
> >
> > > Arnd Bergmann (3):
> > > staging: media/davinci_vpfe: fix pinmux setup compilation
> > >  media: davinci-vpbe: remove obsolete includes
> > >  davinci: fix sleep.S build error on ARMv4
> > >
> > > Bartosz Golaszewski (2):
> > >  ARM: davinci: support multiplatform build for ARM v5
> > >  ARM: multi_v5_defconfig: make DaVinci part of the ARM v5 multiplatfo=
rm build
> >
> >
> > Thanks a lot for reposting the series!
> >
> > I wonder how we shoud deal with the dependencies now that the two media
> > patches got merged in the linux-media tree.
> >
> > It would be tempting to just merge the arch/arm/ changes, but that crea=
tes
> > a bisection problem when the vpbe driver is enabled. I don't care
> > about the staging driver really as that one is broken anyway, but inclu=
ding
> > the "media: davinci-vpbe: remove obsolete includes" fix would be better
> > here.
> >
> > Mauro, any idea for how to handle that? Should we apply an identical
> > patch to the davinci tree, or maybe only have it the ARM tree and you
> > drop it from your tree (I don't know if you have a rule against rebasin=
g).
> > Sorry for not coordinating with Bartosz before I sent the patch again
> > earlier this week.
> >
> >
> >       Arnd
>
> Hi Arnd,
>
> is there any action required from me for this series?
>
> Bart

Ping.
