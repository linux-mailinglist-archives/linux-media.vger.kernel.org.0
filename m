Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A378ACEEB
	for <lists+linux-media@lfdr.de>; Sun,  8 Sep 2019 15:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728202AbfIHNbp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 8 Sep 2019 09:31:45 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:45864 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726591AbfIHNbp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 8 Sep 2019 09:31:45 -0400
Received: by mail-io1-f66.google.com with SMTP id f12so22765349iog.12
        for <linux-media@vger.kernel.org>; Sun, 08 Sep 2019 06:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=X36wmf2pELzyiFZg2q0AZrLC5LYQSeOEO3rN3+H57xE=;
        b=BimSHKNEyNzWb8hT9o7lZ2Nhdz/s4+lbiuzgpmVLSurdU1us2dnPcX4TK/Wg+cAbKH
         oVd2ZhdQAxE+a4fHS932+8og+uPsHLydHNkwp28Au5hrNzHhD8cr3C07Up6dpjg1L5We
         JVyoJQxbUyyXkNyXqmLr0TlbDB0A0f1mnJnrP+RO3nZlF62DmwCnrNEka/VcHUNZxe51
         9sRid72T1Jwe7r5ctCkCBVTqG6Qtm+a82yBZGA1Nj4Vop0YsfYVXoC7E267+P503exA7
         CzR0t2upSy3AgcUA0Vj9I+mnENWe6Wc3v0eLkyYP4tAeZKwM2W5A6U7VsWdj+FSfltr8
         tltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=X36wmf2pELzyiFZg2q0AZrLC5LYQSeOEO3rN3+H57xE=;
        b=LoeTLIXLR4QiFpoKvbFLQrxqrADtj1br9QEg7YTxsQ0mOnLdvjPqS02VB5HQzSfMTx
         S51MAhE+uctZ0VBq8a8nkIL4Uxwjmldgsp8r4KXVPFDRJvbWNPnbP5A2dGJMciRHausf
         MrMF8iA+WBdqMh063Z3NvDlC9Y0ZD5rt9rUZm1zhFN7snCxPsbK1my7jSgkKid9Z+dsH
         9d2B3lTO1PZcNGbLZ6i2A9ksfp3fPpSDhlt6AO6To1ARkFX9Ya7Db9lny99OsD8YQQ4P
         YhQzyP8lM1qHsIbeuonf2TVjr7CcgtYkfdBYEs0OJ4w6bscigOxFhoXePAe/NLFEyxWd
         QyeQ==
X-Gm-Message-State: APjAAAVmJXEFTedLIVws0vUvigpeD6wFxiO66k65/WPpSvvdVVrGSR3r
        rQB5DnXqk9oGOh7sd+tD4OBuVbEuwUlpd4rx/3Mi6Q==
X-Google-Smtp-Source: APXvYqwzM2/smviUmWv4GATCXByKYmZBZv6kVqGnmRGoYGjQ1Na3OObolYsXeau8eo8I2KisMILUm2hc4DvR+jJL9Aw=
X-Received: by 2002:a5d:8457:: with SMTP id w23mr3350922ior.189.1567949504203;
 Sun, 08 Sep 2019 06:31:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190725131257.6142-1-brgl@bgdev.pl> <CAK8P3a1FXyRRi5q48h-=egFjgoRJvy6_zuO9MQaAOMA-bsJKRA@mail.gmail.com>
 <CAMRc=Me_7aw_RvU_tZnVUgduN2wWYGqJ7hQirQ2RLzxGiPujvQ@mail.gmail.com>
 <CAMRc=MdCviMA4gakqFS3+F-nU2XkdmmZbCb-m1mBJdGRHufKGg@mail.gmail.com>
 <27eb964a-bc6c-3a0d-c2c4-48e908465986@ti.com> <CAMpxmJX7osgdzx1Lc=627RpHZDs+ha8a6=AnhaQJ5HkLVp-xKg@mail.gmail.com>
 <CAK8P3a0+kfDbGrcFi5TLxNNpoOM6u6KRW+PaLFNSQJ9BTxX=-w@mail.gmail.com>
In-Reply-To: <CAK8P3a0+kfDbGrcFi5TLxNNpoOM6u6KRW+PaLFNSQJ9BTxX=-w@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sun, 8 Sep 2019 15:31:33 +0200
Message-ID: <CAMRc=Mdsfbh1nF1a23Anig=w42s7=WzS3Uz7KK1P1aRNP2kFvg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] ARM: make DaVinci part of the ARM v5 multiplatform build
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Sekhar Nori <nsekhar@ti.com>,
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

sob., 7 wrz 2019 o 10:21 Arnd Bergmann <arnd@arndb.de> napisa=C5=82(a):
>
> On Wed, Aug 28, 2019 at 9:55 AM Bartosz Golaszewski
> <bgolaszewski@baylibre.com> wrote:
> > =C5=9Br., 28 sie 2019 o 09:44 Sekhar Nori <nsekhar@ti.com> napisa=C5=82=
(a):
> >
> > Actually I tested this without the clocksource conversion and it works
> > - the previous driver still selects relevant config options. But I
> > think you're right - it's worth picking up all the bug fixes from this
> > series and then merging the rest once dm365 issue is fixed.
>
> I just had another look at the series and found that the driver fixes
> (patches 1 and 2) are queued in linux-next, and patch 3 was merged.
>
> If you like, I could put the remaining two patches into the arm/late bran=
ch
> and send that after the media and staging trees are merged into mainline.
>
>       Arnd

Sure! Makes sense.

Sekhar: this series doesn't break current mainline (i.e. without the
clocksource series) so I think we're safe even for dm365.

Bart
