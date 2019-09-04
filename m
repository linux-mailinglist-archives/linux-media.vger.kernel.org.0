Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75104A96AF
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 00:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730059AbfIDWrt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Sep 2019 18:47:49 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:41155 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728008AbfIDWrt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Sep 2019 18:47:49 -0400
Received: by mail-qt1-f195.google.com with SMTP id j10so428559qtp.8;
        Wed, 04 Sep 2019 15:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CKyHosvEnb91lwk3iCp8C93MqyR+kvMHU7ULcRus+7I=;
        b=qx5Z70JbBnAHWChlfXFE5EcvHvuUeZjp0pNuSkBiAK4wxUKeeemJ240MWaAqAXJup6
         L/6DwaJW80L776VdT8vX/kDYIxrwUBFUh47iJCETmYZBlzVeRhrRF2qfTKQUfNg9CwsU
         bHCYMewVtXjnvT5I2plewmkYMEK4oLVLz2poKjWltxRLermJ/7BHUoF8eMhgUEeRpUss
         e3g1nDrySwS29cKYneZUgpPDWvio7J0SPrXVpCLqxLX7/xfeEgG309tTWjTXe1hlNTls
         8CTgWlig0f9VUs7K3VJKAG3bJ7HOJI/E2R/FiF4l8GPGV1otIkvvq75A/CxAALguD7PZ
         /PPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CKyHosvEnb91lwk3iCp8C93MqyR+kvMHU7ULcRus+7I=;
        b=CJt22H3pwhyo3+eC8gEw7GqaEUJAtm8T2fuEWueC9dxLsCWf8coIfozplxABj01e0k
         h9NeQIOOjM3sJNdEsfmRUsfhKkLioe+2TiauYGA1HF31epwm2zSPJuuZqOVZYusmOvzo
         ZXjDTBldFMJjkP6gLqwDAmuUJ3nPLNL43Knqm6QQQkt1XA8U2HwyilaXp6QVvzUAU6sd
         wavdilUkJDlxpYZTRIG6JlLYZX2thiAd+cVaHzkaYzHgQ4CbCad8pwtw05P2jIiqh51X
         NwyduhlsfPFMSyDhqpgGUSdpfvqPiOQR6bYB25s8066lGo94uaO8o3VfbpaDbovA05iJ
         EMnQ==
X-Gm-Message-State: APjAAAWrUjCSdvCpQQXPJXkEhP1yK4Z0VdMBbOxR26/YSY0G3a/vpKK2
        3xXAAY/F1o19IZKg9dsjCTxTxOvpNsbT5/+Oj6E=
X-Google-Smtp-Source: APXvYqxHz3NP2NmOFPlG2V4YfgrtnS7CaVm8XSVUZfgCbTTa3LE71JKOBFGtZLN4+eA+Rjux7wZV78pzYvlgwg0s/qE=
X-Received: by 2002:ac8:51c4:: with SMTP id d4mr543637qtn.17.1567637268581;
 Wed, 04 Sep 2019 15:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190904082232.GA171180@LGEARND20B15> <a9ca05ec-55a9-a58c-267a-334771a1480a@rasmusvillemoes.dk>
In-Reply-To: <a9ca05ec-55a9-a58c-267a-334771a1480a@rasmusvillemoes.dk>
From:   Austin Kim <austindh.kim@gmail.com>
Date:   Thu, 5 Sep 2019 07:47:39 +0900
Message-ID: <CADLLry6WYJRWz1mkgO-fvKeRmOhOJQ3S_hXH1sBW11TujT-a1g@mail.gmail.com>
Subject: Re: [PATCH] media: meson: Add NULL check after the call to kmalloc()
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     mchehab@kernel.org, khilman@baylibre.com, mjourdan@baylibre.com,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-amlogic@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

2019=EB=85=84 9=EC=9B=94 4=EC=9D=BC (=EC=88=98) =EC=98=A4=ED=9B=84 5:43, Ra=
smus Villemoes <linux@rasmusvillemoes.dk>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:
>
> On 04/09/2019 10.22, Austin Kim wrote:
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
> > +             return;
> > +     }
> >       new_ts->ts =3D ts;
> >       new_ts->offset =3D offset;
>
> No need to printk() on error, AFAIK the mm subsystem should already make
> some noise if an allocation fails.

Thanks for valuable feedback.
BTW, if the kmalloc return NULL, mm subsystem throws error log with 100%?
If no, please share error signature of kernel.

> This is not a proper fix - you need to make the function return an error
> (-ENOMEM) to let the caller know allocation failed, and allow that to
> propagate the error. There's only one caller, which already seems
> capable of returning errors (there's an -EAGAIN), so it shouldn't be
> that hard - though of course one needs to undo what has been done so far.
>
> Also, unrelated to the kmalloc() handling: amvdec_add_ts_reorder() could
> be moved to esparser.c and made static, or at the very least the
> EXPORT_SYMBOL can be removed since vdec_helpers.o is linked in to the
> same module as the sole user. That probably goes for all the
> EXPORT_SYMBOL(amvdec_*).

I agreed with your feedback.
- On memory allocation failure, it should have returned (-ENOMEM)
rather than 'return' statement.
- The call to amvdec_add_ts_reorder() is only made by esparser_queue().

Let me resend the patch if necessary.

Thanks,
Austin Kim
>
> Rasmus
