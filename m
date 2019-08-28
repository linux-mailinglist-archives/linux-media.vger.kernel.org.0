Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA629FC45
	for <lists+linux-media@lfdr.de>; Wed, 28 Aug 2019 09:55:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbfH1HzN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Aug 2019 03:55:13 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:42255 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726322AbfH1HzN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Aug 2019 03:55:13 -0400
Received: by mail-oi1-f194.google.com with SMTP id o6so1363289oic.9
        for <linux-media@vger.kernel.org>; Wed, 28 Aug 2019 00:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QGf5uExDLqVSJFepg+5EOK0njK0xgdtyZsXSdS638Is=;
        b=RQZ1DIRip5iFVGB1jBJbo7s3cIvEnWa5dQY/G/eK4GTRkLuPTK2DZMl+Jh2AinnwYD
         cBLb2XIWRMmRlxHTMUN9vB9IdTsK/W4Wd97XkHCgwSmR0FY1HewwY0kZHgjofcA8cPDM
         bEIjgaNjTLgj5eTtdQI07MU2xj7Fck8WScdaYW4Sid7H/CU9ZnYDXwRV3E3B+FvTbtmq
         O/3BMVFNOJgLzhGNFcgfoYj75hJhe57SJM5TkiV05F+3GtuwSxSGFoAGWMnx8DDhWSQ0
         7ZkuGYcG/U5BZGtq53ZrCdnD5fPIbdnJbqABFhQDFBLSvTeNHvAdNSd9ZZQ0SlqbzF7S
         IqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QGf5uExDLqVSJFepg+5EOK0njK0xgdtyZsXSdS638Is=;
        b=Y+34y2BQU7NdoefUVPi4hwAcaioTqmTsa4Z3DY787IOuJOosY+0DuLmWsHBwDttxmB
         ew5JXg7tR/E8tRp1NozcZh5EvavFRIgz3drV5oRA9ln2aSDfafLcjlRLkK8XH/KBpJyO
         t62T/VqXWhItSetvr3pZCS9c/L3IJxgGodgElhrUjdB+KOGSo7BzaoUswN9Tx8mTGGzK
         NTovUpRN/dp9pbmw5JWc7CN+w2VJialD4/fzf5z08aqFcwQNntire/oPnF414Sf4jfc9
         Kiiza8PhbpqcYbcbyjq6Xb5g9rGl91GA7esygl8cfoSNYh43LHHyDYzWsuhY4u08jjRo
         hLkA==
X-Gm-Message-State: APjAAAXveYBkd/oORv1b78W9sarceCgFkzbost+Sa6ZJ5Re8XdqgYdnz
        0gM+MHlYoCf0tor6K9WeieTKyQmMR+pwtfGRfjgGPg==
X-Google-Smtp-Source: APXvYqxfuRjsm98zALpH9qES7Ui44tXIsVlQP5NaBZKe/uP0yYHdn/6rR/wrfjhEuycjLFIH4qH5636ewokO2qDfWtE=
X-Received: by 2002:aca:5652:: with SMTP id k79mr1817021oib.175.1566978912617;
 Wed, 28 Aug 2019 00:55:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190725131257.6142-1-brgl@bgdev.pl> <CAK8P3a1FXyRRi5q48h-=egFjgoRJvy6_zuO9MQaAOMA-bsJKRA@mail.gmail.com>
 <CAMRc=Me_7aw_RvU_tZnVUgduN2wWYGqJ7hQirQ2RLzxGiPujvQ@mail.gmail.com>
 <CAMRc=MdCviMA4gakqFS3+F-nU2XkdmmZbCb-m1mBJdGRHufKGg@mail.gmail.com> <27eb964a-bc6c-3a0d-c2c4-48e908465986@ti.com>
In-Reply-To: <27eb964a-bc6c-3a0d-c2c4-48e908465986@ti.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 28 Aug 2019 09:55:01 +0200
Message-ID: <CAMpxmJX7osgdzx1Lc=627RpHZDs+ha8a6=AnhaQJ5HkLVp-xKg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] ARM: make DaVinci part of the ARM v5 multiplatform build
To:     Sekhar Nori <nsekhar@ti.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@kernel.org>,
        David Lechner <david@lechnology.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

=C5=9Br., 28 sie 2019 o 09:44 Sekhar Nori <nsekhar@ti.com> napisa=C5=82(a):
>
> On 28/08/19 1:03 PM, Bartosz Golaszewski wrote:
> > pon., 5 sie 2019 o 10:31 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=
=82(a):
> >>
> >> czw., 25 lip 2019 o 16:57 Arnd Bergmann <arnd@arndb.de> napisa=C5=82(a=
):
> >>>
> >>> On Thu, Jul 25, 2019 at 3:13 PM Bartosz Golaszewski <brgl@bgdev.pl> w=
rote:
> >>>>
> >>>> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >>>>
> >>>> This series makes DaVinci part of the multiplatform build for ARM v5=
.
> >>>>
> >>>> First three patches fix build errors spotted and fixed by Arnd with =
v1.
> >>>>
> >>>> The fourth patch adds necessary bits and pieces for davinci to suppo=
rt
> >>>> multiplatform build and the last one actually adds all davinci board=
s
> >>>> to multi_v5_defconfig.
> >>>>
> >>>> Tested on da850-lcdk with both multi_v5 as well as davinci_all defco=
nfigs.
> >>>>
> >>>> v1 -> v2:
> >>>> - added patches from Arnd that fix build errors spotted when buildin=
g
> >>>>   random configurations (much appreciated)
> >>>> - rebased on top of v5.3-rc1
> >>>
> >>>> Arnd Bergmann (3):
> >>>> staging: media/davinci_vpfe: fix pinmux setup compilation
> >>>>  media: davinci-vpbe: remove obsolete includes
> >>>>  davinci: fix sleep.S build error on ARMv4
> >>>>
> >>>> Bartosz Golaszewski (2):
> >>>>  ARM: davinci: support multiplatform build for ARM v5
> >>>>  ARM: multi_v5_defconfig: make DaVinci part of the ARM v5 multiplatf=
orm build
> >>>
> >>>
> >>> Thanks a lot for reposting the series!
> >>>
> >>> I wonder how we shoud deal with the dependencies now that the two med=
ia
> >>> patches got merged in the linux-media tree.
> >>>
> >>> It would be tempting to just merge the arch/arm/ changes, but that cr=
eates
> >>> a bisection problem when the vpbe driver is enabled. I don't care
> >>> about the staging driver really as that one is broken anyway, but inc=
luding
> >>> the "media: davinci-vpbe: remove obsolete includes" fix would be bett=
er
> >>> here.
> >>>
> >>> Mauro, any idea for how to handle that? Should we apply an identical
> >>> patch to the davinci tree, or maybe only have it the ARM tree and you
> >>> drop it from your tree (I don't know if you have a rule against rebas=
ing).
> >>> Sorry for not coordinating with Bartosz before I sent the patch again
> >>> earlier this week.
> >>>
> >>>
> >>>       Arnd
> >>
> >> Hi Arnd,
> >>
> >> is there any action required from me for this series?
> >>
> >> Bart
> >
> > Ping.
>
> I dont think the multi-platform parts can be merged in v5.4 since we
> dont have DM365 converted successfully to use clocksource driver yet.
>
> But other parts of the series can be merged and hopefully we resolve
> that pending issue for v5.5
>
> Thanks,
> Sekhar

Actually I tested this without the clocksource conversion and it works
- the previous driver still selects relevant config options. But I
think you're right - it's worth picking up all the bug fixes from this
series and then merging the rest once dm365 issue is fixed.

Bart
