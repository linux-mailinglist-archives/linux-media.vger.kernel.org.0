Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0FCA9697
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 00:40:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729877AbfIDWkE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Sep 2019 18:40:04 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:34568 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727722AbfIDWkD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Sep 2019 18:40:03 -0400
Received: by mail-qt1-f195.google.com with SMTP id a13so464782qtj.1;
        Wed, 04 Sep 2019 15:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=HnUeqUgvHmEsTezEaxVg2P6RFT85Zk7uuJIhbn7279Y=;
        b=pHvO1Y9pNOVKwRDHUIFgh/rciGlFlYVWTkT0XBPv3nosE3PGDq9qMpuxybiiIAGv+e
         u1DXeKgOt8lvb3xWzxLbn3rXD8Y543Cn6/f/S0fTlQJ6G6vexCPK09TX1fpmWfEW3VC8
         1O0W2KL70cG2ClE3xVKoRW1RCvdz6CGu49Pfadneo99ROd27P3CrwHzIN1Jt/qytAZI0
         yu4BMgLor1zn5Z75g9el0823gTTlROvmhmqDtDpQxLhA/g08zB7EKeAgCWJXY7qsw8YF
         w1NOUlfLyLJ49HAykmfTN7k1d5tqxaRCuCVdRD7PEISkHjDWi3NxNA0FDU+aUcrH4K39
         RKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HnUeqUgvHmEsTezEaxVg2P6RFT85Zk7uuJIhbn7279Y=;
        b=GgMZ8czmYgoGpPrbAZ8e+r1Kbs45YJ/wfZpdhDSP0TP0U4xlF9esDrpI3q2ZoFOCUC
         PVdwV0m5uZR25dNTONyNO2mbusV1NBCW/U6M0lI9s4LZ/aROvcQa16FMBNrLhbQNDoui
         8dZClNb/c/V/xbBxHKkmwQEqErwc4H2itcFMVXGEpza6qU7EiA0ZwqzlGlCc6NOpZKGn
         Cj1XvQpIdYvyzYkg8U8sxVFy9ONAHzXCc/H6puKwZQ5D/UPcsFCWaJNipKyH98PY/TAG
         4KtCyfhaBJhYjK5VvdL2HMqOfE89oy4yptOwDzuLQ9IgUDFx7+vCVarDnDaVcU5DQ+d4
         agfQ==
X-Gm-Message-State: APjAAAVI/tzUl/MdZW5bDHOnRZViJ0AUnOvDXJoGGYD+07sSHooCXYZf
        6aB+KfX2l6YUlYCkbOSn2PeTlhrgXcKtZXzD8YM=
X-Google-Smtp-Source: APXvYqyH3l5wJ+MhaBXYfkRtMRlhZBfMa58sa4xh3qswk4Z/y/j0Dvr7JPVsQW+3Jh0f/2/JjsSBQjhIBEdTRPhtZ3M=
X-Received: by 2002:a0c:fba4:: with SMTP id m4mr74237qvp.136.1567636802622;
 Wed, 04 Sep 2019 15:40:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190904082232.GA171180@LGEARND20B15> <20190904084525.GB4925@kroah.com>
In-Reply-To: <20190904084525.GB4925@kroah.com>
From:   Austin Kim <austindh.kim@gmail.com>
Date:   Thu, 5 Sep 2019 07:39:53 +0900
Message-ID: <CADLLry5WHSTyWzRa0bg0Dsnm8rO-cVF=i1CkzKN+DMXv9wq-Xw@mail.gmail.com>
Subject: Re: [PATCH] media: meson: Add NULL check after the call to kmalloc()
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     mchehab@kernel.org, khilman@baylibre.com, mjourdan@baylibre.com,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

2019=EB=85=84 9=EC=9B=94 4=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 5:45, Gr=
eg KH <gregkh@linuxfoundation.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Wed, Sep 04, 2019 at 05:22:32PM +0900, Austin Kim wrote:
> > If the kmalloc() return NULL, the NULL pointer dereference will occur.
> >       new_ts->ts =3D ts;
> >
> > Add exception check after the call to kmalloc() is made.
> >
> > Signed-off-by: Austin Kim <austindh.kim@gmail.com>
> > ---
> >  drivers/staging/media/meson/vdec/vdec_helpers.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/=
staging/media/meson/vdec/vdec_helpers.c
> > index f16948b..e7e56d5 100644
> > --- a/drivers/staging/media/meson/vdec/vdec_helpers.c
> > +++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
> > @@ -206,6 +206,10 @@ void amvdec_add_ts_reorder(struct amvdec_session *=
sess, u64 ts, u32 offset)
> >       unsigned long flags;
> >
> >       new_ts =3D kmalloc(sizeof(*new_ts), GFP_KERNEL);
> > +     if (!new_ts) {
> > +             dev_err(sess->core->dev, "Failed to kmalloc()\n");
>
> Did you run this through checkpatch?  I think it will say that this line
> is not ok.
>
> > +             return;
>
> Shouldn't you return an -ENOMEM error somehow?

I agreed with your feedback.
Let me take a look at the code more and then resend the patch if necessary.

Thanks,
Austin Kim
>
> thanks,
>
> greg k-h
