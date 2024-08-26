Return-Path: <linux-media+bounces-16773-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 582CE95EDCE
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 11:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0123A1F21CD4
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 09:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9781A1465A9;
	Mon, 26 Aug 2024 09:56:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EFE145B0F;
	Mon, 26 Aug 2024 09:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724666198; cv=none; b=bNEZRo2MiGeg8ZPaIRC8wJZ4ohnyPRE+47z4NxFSSuAa89+PTf9RmymEFqgYZSRd+zTqH7fFFG/BbgxEGj9fkJLJwIlVnHOV8oRZ+M9jeiP52JS5xh0BrkdmYVz0x9011nT0FDLnvIGh3ELsEPVzy5WTuev031dxo59WZpRV6iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724666198; c=relaxed/simple;
	bh=zI9/MZ906dcQQ7OCq/ndqcDMzj8nC91tmnmFUhjWnxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HBq+oawPalwrMX0KAdGtnLADnWAX6wIRSs7stTnuWNZzk4xaePDWg5vHoe4viQ79vygAFLsR29lfKQZ+I+Sf38NV5CCHuEfRCiYOQEGpPktA468d0d2n3BxOIlYS5gJxXS5ElY7GpFQ2hy5cY6DbwTcOxc1NQZc6T08hHBAFNkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6b3afc6cd01so39345547b3.1;
        Mon, 26 Aug 2024 02:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724666195; x=1725270995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JleScZlBh8qW20TkJdLDIyUdAIrIwI6sGhdfX/+Pdfo=;
        b=R9UEDkJ8cK28SWPHQA/Ccg5290I9BWuvjevWkOej4pl73Kx7YToWUjEzZrRwBKK3gs
         L3eBFecOnq4NOR/yoapQI9fou9W2kXGEPB/fuyNs7zx+0EGJ9UL7JvgrsPHJwYMYJW2n
         +4Ye9Cl2rhUaxTnjaqKG3/6eN+XhDLwoo4EK/np4iXo/TaQXbLJcnoxZnnUprDSlyQLp
         X078BSEQgzW06Yw0cNprwxJAUVQkw4bxQu/U+CtruXAroU0oracuz2tyx5AN7My7HDIu
         GpaevG+nI/0Ue6tk/cBZQ2gBn4yyDSUdzWsILcB/OCYCh8JaDnMt8Y5XY4S8a91q9Koe
         Fp9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWpnUXO9IbRND/aAo/I9qcQbPhoGFH4ZO1aP4VVyE1niknDR1DrHg0IPNKbOegSwvzgtcoaf30BF1DdC991isvWOmk=@vger.kernel.org, AJvYcCXNY/e1CCsgqdCwSafbp78oYNFPQo1N5jm1HQq8yajErwjwSmU0XLommOkzvNPWB6yCH5yeIIo43+pOvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAswFRHxuAmb07IBTCjoawiIo7PdTX163rRCMADQf29ultUpmU
	G2L8S+HKUSZywD+avcoCMXqVCoHBPdj+G6XFBB136CpXXOQXxB+WEmBCoDXY
X-Google-Smtp-Source: AGHT+IEr80Cy56eTi+lSc+YGKTwbfXwYPC9Yk7dO21soIS3OOtIFVylaYXGUgW+H9RKS9owwee3T/A==
X-Received: by 2002:a05:690c:f93:b0:673:251f:b2eb with SMTP id 00721157ae682-6c6035aaae4mr79917687b3.23.1724666194618;
        Mon, 26 Aug 2024 02:56:34 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39a75666fsm14809097b3.55.2024.08.26.02.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 02:56:33 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6cdae28014dso5698987b3.1;
        Mon, 26 Aug 2024 02:56:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVC76Gzz/XMsrzWk5ZDx3ciJdCviEVv3EBYggA8HS0gy7ad8hE0dFXPi6VaarrT33sKqkCJ5g1aK639KQ==@vger.kernel.org, AJvYcCVTliA5RDIgCL4/aADBLwzV/2nij7X6u/3WEWZqi4HQ6jAzOwPNrWRoIjy/E5vbgAB3S32F3Haf2jg5Bck03uNXa8Y=@vger.kernel.org
X-Received: by 2002:a05:690c:6209:b0:6ad:756b:9448 with SMTP id
 00721157ae682-6c3075a1698mr117593527b3.22.1724666192913; Mon, 26 Aug 2024
 02:56:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240824182120.320751-1-biju.das.jz@bp.renesas.com>
 <6f16a3f7-99bb-47c4-9034-c1f0ccd59546@tuxon.dev> <TY3PR01MB11346F3C71013AD71C1556BA1868B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <20240826094311.GA27596@pendragon.ideasonboard.com> <TY3PR01MB113465A694F44326ED0A5AA19868B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113465A694F44326ED0A5AA19868B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Aug 2024 11:56:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWbVZCntawwKp17PLZMLveGGBxdBSrV+8wwaM4p2x8A2w@mail.gmail.com>
Message-ID: <CAMuHMdWbVZCntawwKp17PLZMLveGGBxdBSrV+8wwaM4p2x8A2w@mail.gmail.com>
Subject: Re: [PATCH v3] media: platform: rzg2l-cru: rzg2l-video: Move
 request_irq() to probe()
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Marc Zyngier <maz@kernel.org>, "Claudiu.Beznea" <claudiu.beznea@tuxon.dev>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"biju.das.au" <biju.das.au@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Mon, Aug 26, 2024 at 11:50=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > On Mon, Aug 26, 2024 at 08:08:33AM +0000, Biju Das wrote:
> > > On Monday, August 26, 2024 8:27 AM, claudiu beznea wrote:
> > > > On 24.08.2024 21:21, Biju Das wrote:
> > > > > @@ -270,9 +270,14 @@ static int rzg2l_cru_probe(struct platform_d=
evice *pdev)
> > > > >         cru->dev =3D &pdev->dev;
> > > > >         cru->info =3D of_device_get_match_data(&pdev->dev);
> > > > >
> > > > > -       cru->image_conv_irq =3D platform_get_irq(pdev, 0);
> > > > > -       if (cru->image_conv_irq < 0)
> > > > > -               return cru->image_conv_irq;
> > > > > +       irq =3D platform_get_irq(pdev, 0);
> > > > > +       if (irq < 0)
> > > > > +               return irq;
> > > > > +
> > > > > +       ret =3D devm_request_irq(&pdev->dev, irq, rzg2l_cru_irq, =
IRQF_SHARED,
> > > > > +                              KBUILD_MODNAME, cru);
> > > >
> > > > Because this is requested w/ IRQF_SHARED the free_irq() ->
> > > > __free_irq() [1] will call the IRQ handler to simulate an IRQ SHARE
> > > > scenario where other device generate an interrupt.
> >
> > Good point, I had missed that.
> >
> > > Currently CSI driver is not registered any interrupts and CRU is the =
single user.
> >
> > Regardless, the fact that the IRQ is requested with IRQF_SHARED means t=
hat the IRQ handler needs to be
> > prepared to be called at any time from the point of registration to the=
 point the IRQ is freed. This
> > is tested by CONFIG_DEBUG_SHIRQ=3Dy, which you should enable for testin=
g.
>
> For single user, testing CONFIG_DEBUG_SHIRQ=3Dy this does not make any se=
nse. See [1]
> [1] https://elixir.bootlin.com/linux/v6.11-rc5/source/kernel/irq/manage.c=
#L1965
>
> >
> > If you don't need to share the interrupt with any other device, you can=
 drop the IRQF_SHARED.
>
> I will drop IRQF_SHARED flags instead as there is single user
> and will send RFC for dropping calling IRQ handler for single user
> with CONFIG_DEBUG_SHIRQ=3Dy
>
> Please let me know is it fine for you?

IMHO the latter is not a good idea: if you register an interrupt handler
with IRQF_SHARED, you should be prepared for the handler being called
at any time, and test that. Regardless of whether there is only a
single user or not.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

