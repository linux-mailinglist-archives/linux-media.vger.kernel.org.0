Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B3308143E
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2019 10:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbfHEIbr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 04:31:47 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:46145 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727357AbfHEIbr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 04:31:47 -0400
Received: by mail-io1-f68.google.com with SMTP id i10so52249482iol.13
        for <linux-media@vger.kernel.org>; Mon, 05 Aug 2019 01:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/9onNqSu8H6T4t+v8bvPux5C3Ze/nalI4ApJroQRttg=;
        b=aywESScdkNjlGJf+foMrGaH30r3yFivVONl+3QF/vs9mPZxQ7Z9lCSqAyevZxfhXBV
         p8Y71cVlfFNUQTlqv3fAISo5KNCajOU6OqFY8zXEiQwtgIDNHjm1JLQM8mcmBfK/Essk
         Vs1iZN+Zd9qsQCZfwGrN71p0/vxpdh1yVob0V5Kddk+Z/nd7sQKhLstCHf0Usgxwwjk9
         EJQmEKFdpnBimhSdaDaq4sVIY93TaBb8vY1+OPKgg+jhPAp0s/NgDOZ5ohrGB3Cz7R22
         +L0+ioeTc9pYBSuDbEdoGHFvdgHuYL79kuicaVTPqh+hvyhAcJoXbtOht/1sFRJngb0w
         qquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/9onNqSu8H6T4t+v8bvPux5C3Ze/nalI4ApJroQRttg=;
        b=R/hoV56hsthPBXhGFjh08YVb2/ks5iR2ZWHCkNPvEOYpHXYnRP+30tmTjOzSL0lijW
         TNicBeNu06uYzDR9rFltQCk10nFsOYP8ijBL9GTzij8SKbf/s8KFd0IFpo8/kULB4oc4
         2rMO8w5KlMlxX+cxk2otXfwBusG4m6ULZis1ASGCRLnfcIu5x/DtJ9ecF6eECq6sChxr
         KbVVp0zDratCOFZqIH9BtzITG/1srokU9JJ1s1FEMpFRsa4NSpGZPBePopttqGOseS37
         WollBlOc0BEStYc81kwGAQjMXY7dW9GUSjqpnzO210tLvk3kQAAVQ4Dju/lXyv/EHcMz
         JMAQ==
X-Gm-Message-State: APjAAAVox3FbfQJM7Rtvnqt4D6bTT5rIYayKRYyX5zB8Adjc9YYspIJm
        CBC7lttZItNLd2q0EH0B/qlRjyJWcVhzojCjkLs=
X-Google-Smtp-Source: APXvYqwdH5YrXmNOdQLqeqaHrEbB41XdZAI+QgVn/WPhGXhazC5gC+vdAsxaH69ckpH1PS09DzXuJmzKdsOLUZS7P9M=
X-Received: by 2002:a02:5b05:: with SMTP id g5mr147889176jab.114.1564993906173;
 Mon, 05 Aug 2019 01:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190725131257.6142-1-brgl@bgdev.pl> <CAK8P3a1FXyRRi5q48h-=egFjgoRJvy6_zuO9MQaAOMA-bsJKRA@mail.gmail.com>
In-Reply-To: <CAK8P3a1FXyRRi5q48h-=egFjgoRJvy6_zuO9MQaAOMA-bsJKRA@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 5 Aug 2019 10:31:35 +0200
Message-ID: <CAMRc=Me_7aw_RvU_tZnVUgduN2wWYGqJ7hQirQ2RLzxGiPujvQ@mail.gmail.com>
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

czw., 25 lip 2019 o 16:57 Arnd Bergmann <arnd@arndb.de> napisa=C5=82(a):
>
> On Thu, Jul 25, 2019 at 3:13 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote=
:
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > This series makes DaVinci part of the multiplatform build for ARM v5.
> >
> > First three patches fix build errors spotted and fixed by Arnd with v1.
> >
> > The fourth patch adds necessary bits and pieces for davinci to support
> > multiplatform build and the last one actually adds all davinci boards
> > to multi_v5_defconfig.
> >
> > Tested on da850-lcdk with both multi_v5 as well as davinci_all defconfi=
gs.
> >
> > v1 -> v2:
> > - added patches from Arnd that fix build errors spotted when building
> >   random configurations (much appreciated)
> > - rebased on top of v5.3-rc1
>
> > Arnd Bergmann (3):
> > staging: media/davinci_vpfe: fix pinmux setup compilation
> >  media: davinci-vpbe: remove obsolete includes
> >  davinci: fix sleep.S build error on ARMv4
> >
> > Bartosz Golaszewski (2):
> >  ARM: davinci: support multiplatform build for ARM v5
> >  ARM: multi_v5_defconfig: make DaVinci part of the ARM v5 multiplatform=
 build
>
>
> Thanks a lot for reposting the series!
>
> I wonder how we shoud deal with the dependencies now that the two media
> patches got merged in the linux-media tree.
>
> It would be tempting to just merge the arch/arm/ changes, but that create=
s
> a bisection problem when the vpbe driver is enabled. I don't care
> about the staging driver really as that one is broken anyway, but includi=
ng
> the "media: davinci-vpbe: remove obsolete includes" fix would be better
> here.
>
> Mauro, any idea for how to handle that? Should we apply an identical
> patch to the davinci tree, or maybe only have it the ARM tree and you
> drop it from your tree (I don't know if you have a rule against rebasing)=
.
> Sorry for not coordinating with Bartosz before I sent the patch again
> earlier this week.
>
>
>       Arnd

Hi Arnd,

is there any action required from me for this series?

Bart
