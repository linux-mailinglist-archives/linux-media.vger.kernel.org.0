Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD9F43E5B
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2019 17:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389085AbfFMPsw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jun 2019 11:48:52 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35076 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731719AbfFMJQq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jun 2019 05:16:46 -0400
Received: by mail-wm1-f65.google.com with SMTP id c6so9314135wml.0
        for <linux-media@vger.kernel.org>; Thu, 13 Jun 2019 02:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=P4N1UtPKJVcelijw7QBQ1XLSRt7ridPaKRyOBmFmp0w=;
        b=zoB+I1qMrXW5msQjRKnTgAM/Hh9auE47o+cxvqiEVcyurJ9wsx1RAYtZBDnCaKqDof
         m1Ka4fuQ842iFh57kWp7h+yZO+dKcLrZpYRtQolBfQ39M/3DG3mCMDtqhEsHLr6dNRla
         y/Uc11TrqvR08utOekpguuKCeTIWNQmbKCYf+sSd2FAqk+FEFwpdJVTvb+qSjd7GAa/s
         kBpbAdqYwmGMqkkI3YhCUFXD8oa+rDgIdLyeq5ym0FbmIKsEItDizEy0cX6vyncJePWp
         BZ7zlU7oGjUbfvuB7MiLU354VdrVer90caAiU3wh9nfbR3emhxaBGhOhkrpW/MC3+Qus
         KRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=P4N1UtPKJVcelijw7QBQ1XLSRt7ridPaKRyOBmFmp0w=;
        b=AUCMUsPKDAkohXhLzu/KBr8EBBqjyBJCbibCUUoQZk0tuwo3lUpgu5aEB1ay4Lr0M1
         jmykMHWUaziF9i8jjlUnuLiGR0oqR1l2icBOCz5g3yrNSykN56UXBuW24loXB6zE++Gf
         K5ZBitC3NxG3Qo5IrNtrNA28cfv8262Q/ayrywLAyERBEPQnmBbiU5iMhe6Ber/VIj9q
         3c+xrGSs3g1YRqsG+zSwGtgXJ+fJK/CGFGtgBIuq3vyb1ByRDNJ5H951UH8EbBKTTJ1M
         RKZ/GpP5LlkLYRyxEZLYuo9DC4uBZ587SEpMhPn0ouTX9nVx7PAal/yGw/OhSVwiDq2z
         N9Lw==
X-Gm-Message-State: APjAAAW6UiMuOfJ6rwi5mwp0LegSppCNntVmbdDz6vk+z2bFbepiStKS
        sOOrDBKOEca4+nw31RF2mJoNPKgQIISnrso3KneRdA==
X-Google-Smtp-Source: APXvYqya9k5qn89YYNprL6zry6x5KHz6UoRI9nvUtHBgDzPVPTHE/ALR4XfG2GiQ1hwNRfaH+VxDHQlRLeGVdjjdK7k=
X-Received: by 2002:a1c:700b:: with SMTP id l11mr2827093wmc.106.1560417403085;
 Thu, 13 Jun 2019 02:16:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190612170027.13dbb84b@canb.auug.org.au> <c526a510-a08f-8b99-a396-4274590e904f@infradead.org>
In-Reply-To: <c526a510-a08f-8b99-a396-4274590e904f@infradead.org>
From:   Maxime Jourdan <mjourdan@baylibre.com>
Date:   Thu, 13 Jun 2019 11:16:31 +0200
Message-ID: <CAMO6nazLss_4cfAJZZLA+Ydrx0wPCxMYrZM2NQKDw1AmvSj_0Q@mail.gmail.com>
Subject: Re: linux-next: Tree for Jun 12 (staging/media/meson/)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Randy,
On Wed, Jun 12, 2019 at 11:50 PM Randy Dunlap <rdunlap@infradead.org> wrote=
:
>
> On 6/12/19 12:00 AM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20190611:
> >
>
>
> on i386:
>
> ../drivers/staging/media/meson/vdec/vdec.c: In function =E2=80=98vdec_rec=
ycle_thread=E2=80=99:
> ../drivers/staging/media/meson/vdec/vdec.c:59:2: error: implicit declarat=
ion of function =E2=80=98kthread_should_stop=E2=80=99 [-Werror=3Dimplicit-f=
unction-declaration]
>   while (!kthread_should_stop()) {
>   ^
> ../drivers/staging/media/meson/vdec/vdec.c: In function =E2=80=98vdec_sta=
rt_streaming=E2=80=99:
> ../drivers/staging/media/meson/vdec/vdec.c:324:3: error: implicit declara=
tion of function =E2=80=98kthread_run=E2=80=99 [-Werror=3Dimplicit-function=
-declaration]
>    sess->recycle_thread =3D kthread_run(vdec_recycle_thread, sess,
>    ^
> ../drivers/staging/media/meson/vdec/vdec.c:324:24: warning: assignment ma=
kes pointer from integer without a cast [enabled by default]
>    sess->recycle_thread =3D kthread_run(vdec_recycle_thread, sess,
>                         ^
> ../drivers/staging/media/meson/vdec/vdec.c: In function =E2=80=98vdec_sto=
p_streaming=E2=80=99:
> ../drivers/staging/media/meson/vdec/vdec.c:389:4: error: implicit declara=
tion of function =E2=80=98kthread_stop=E2=80=99 [-Werror=3Dimplicit-functio=
n-declaration]
>     kthread_stop(sess->recycle_thread);
>     ^
>
> Full randconfig file is attached.
>

This is fixed with "media: meson: vdec: Add missing kthread.h" from
Yue Haibing [0]. The patch is sitting in media_tree/master.

[0] https://patchwork.kernel.org/patch/10989333/

Regards,
Maxime

>
> --
> ~Randy
>
