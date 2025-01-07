Return-Path: <linux-media+bounces-24327-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD37FA03BDD
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 11:10:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3105E3A4915
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 10:09:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C3B1E0E16;
	Tue,  7 Jan 2025 10:09:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE581547D2;
	Tue,  7 Jan 2025 10:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736244593; cv=none; b=GQCIabo+BgxpD0qJIeIBmAdDd7bJ0DnAIOK/hav34QuBvXJLPpfjX9SBPKcYmRRePWEJmhbl1d3WwG+K6U2RiDWddSLD0SzfKZD1wI/+N2APZryG0eciFN5vxlyIX4WrniWvbsF+0kw3iLgYfB4EZyDi8LSsr1HPvckpDrCxon4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736244593; c=relaxed/simple;
	bh=vjYONTHokTegxMGg39qB8PY4zZD/EWV+4n/1dZtqq08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YUgz/PmE+yewVLhgBm4DsNNPu5xO/Ir9HjmwfE8TTfOQtq9itpwXZX3249L/2BhG5lg5N0YScDllJMhfF8313HznkxzwWW88Eup/ika52+xRv4z6jevBqRRFY2JmyKN2X7QxMzO9W9inwO7EqpVzUFu14joa3UaLBt1snaKPTmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-85bc7d126b2so6156369241.1;
        Tue, 07 Jan 2025 02:09:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736244589; x=1736849389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/E+SrHAsNPdmLj1CO8TQRypgIBPXIkb9G3IswOG2nBc=;
        b=ggmzXTIy1yADXXOj3fjjERdATNMyNXaKTBoQ57JKOg/XESxHcZDxRH1FlmxLgGEu0n
         CkmFi0DrolC2/D8w6uoyqZEnD3OgowqJHYcrmY3XkWlFRfjBsyh4gs58kfAqwEj32MMb
         0Asazqy6q16jehqwm5j8SZMLQ6zbnfVpENfJ7gsGVKVRCvLvr48jbHWIJ4aRF+NA+9Oq
         fx1+CtLUVK98x6o4co9QTdGzaFbo+KpmPx/44IdKEpLX35hFamwpdcPnOch38VSTAZkt
         mnGd+cYxWNq4TvJUOA3sZIv93QCb69HWvNqvEwdYE4EsBp4t9mP7x7Mbpe6RuOnZLQfe
         aRKg==
X-Forwarded-Encrypted: i=1; AJvYcCUQeqs+Fd6w5IlXM19D5zKVsx++N8GNUm3E/IeRS0imtEU0nDZIktWZTTpAjKzp5X24Fpic2raQXkrbMQ2A7RvWsE0=@vger.kernel.org, AJvYcCWWKIRSFGK2awlq4bkIu1SV9TbnVLyowXmJ3KnCiuT/2IduoQYopXErIg+xZ/C1il0A84W4IBCm4NAxgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZmi5RArC6gxSkM7NWifWYQNRBlvcAxxFFzOjTRXfqFMeJrtM5
	SMrYv5bC2P8/hnztA+MXp/TGlgq+AKTZx2YsKmh5JfUk8l9s5Faq3p8otXxn
X-Gm-Gg: ASbGncuVvGgZU+Y6OvO/QC1Kir3pd6j8k5eiP9umw9ChCQ4Ec9w5Q6ikM9sYIgRGpWy
	JEIlMcl2tzepjDWVoXyUfrfgv0fbxplEYvem7FPWqkapa8JgKTJzmIqpiDPXDdFmeXfJa2oeYzB
	Y8CyxvOsCLvK0ZprHmJda9uDxoeXv5vG7xB+ycOt4O9WBwWu6Cj+cd/ruC5pzZFw7PFBA5QznZi
	0vRRSuiMOI4MvmUQ2h5751xf5sakHMbxtqX1hSQAAnBX9lal0y7xbF+PO0UvSrzV568KuMJdd5m
	HKHMsxrv8JJe+uFsSME=
X-Google-Smtp-Source: AGHT+IGREyIE5osvhoT3VC6ID9XOAoPNTIewmIco8zCrADtAS11fBtnz87dgSW9oqcY9Wm1uA5bSLw==
X-Received: by 2002:a05:6102:38c8:b0:4b2:7534:f26e with SMTP id ada2fe7eead31-4b2cc38e4cdmr48566422137.16.1736244589222;
        Tue, 07 Jan 2025 02:09:49 -0800 (PST)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bfad3c8csm8056487137.32.2025.01.07.02.09.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 02:09:49 -0800 (PST)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-4afed12283eso9922332137.1;
        Tue, 07 Jan 2025 02:09:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUgM4uWoPvQTzutXDA43Uq8slElIrlx12JB1rV2VwrbztRpuDSVmq6gDWhb3jPQBtXrysC9kEi3P0TOGw==@vger.kernel.org, AJvYcCWHPKORRtDQxjZP+CHjP++QBR0zlL9sslZwgL8lhOHBobHdDi35UJmULEneFYKWB7HpQBh4J+BQ91R5bQ2m5epEUUM=@vger.kernel.org
X-Received: by 2002:a05:6102:951:b0:4b1:1a24:e19c with SMTP id
 ada2fe7eead31-4b2cc35fe84mr48361755137.7.1736244588878; Tue, 07 Jan 2025
 02:09:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250104195548.1915578-1-niklas.soderlund+renesas@ragnatech.se>
 <20250104195548.1915578-3-niklas.soderlund+renesas@ragnatech.se>
 <Z3znj0MOWvIhbOxj@kekkonen.localdomain> <20250107095219.GF2766897@ragnatech.se>
In-Reply-To: <20250107095219.GF2766897@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 Jan 2025 11:09:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXwvrysvnSyp1qNgrabRHHddzgRDmaFYaEbMR9MEv2Nog@mail.gmail.com>
X-Gm-Features: AbW1kvbPnynrC8jF5hTpZTptI7D3BhmUxtb0uFvhPQeyRLtvyIbPhQRKjzknwr8
Message-ID: <CAMuHMdXwvrysvnSyp1qNgrabRHHddzgRDmaFYaEbMR9MEv2Nog@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: v4l: fwnode: Parse CSI-2 C-PHY line-orders
 like bus-type
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Tue, Jan 7, 2025 at 10:52=E2=80=AFAM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2025-01-07 08:36:31 +0000, Sakari Ailus wrote:
> > On Sat, Jan 04, 2025 at 08:55:48PM +0100, Niklas S=C3=B6derlund wrote:
> > > Provided a safe-guard from the raw values used in device tree sources
> > > and the in-kernel defines used to describe the different line orders.
> > > This mimics what have been done for the bus-type property to provide =
the
> > > same safe-guard.
> > >
> > > The macros used in device tree sources are defined in video-interface=
s.h
> > > (MEDIA_BUS_CSI2_CPHY_LINE_ORDER_*) and are only visible to DTS source
> > > files. These raw values map directly to the in-kernel names by fwnode
> > > defines in v4l2-fwnode.h (V4L2_FWNODE_CSI2_CPHY_LINE_ORDER_*). These
> > > fwnode defines are finally translated to defines which are exposed to
> > > drivers to act on (V4L2_MBUS_CSI2_CPHY_LINE_ORDER_*).
> > >
> > > Previously the translation to values provided to drivers have exploit=
ed
> > > the fact that the numerical value for each setting are the same for t=
he
> > > defines used in device tree sources. While this is unlikely to change
> > > this harmonises the bus-type and line-orders parsing to work using th=
e
> > > same mechanics, while at the same time make the large CSI-2 parsing
> > > function a little more readable.
> >
> > Do we in fact need the V4L2_MBUS_ definitions of the line orders at all=
?
>
> I'm not sure :-)
>
> Geert pointed out in [1] that in comparison to the V4L2_MBUS_ bus-type
> definitions the line-order definitions did not have this intermediary
> step as a safe guard between values used in DTS files and values used in
> V4L2 drivers.
>
> Looking at the original functionality,
>
>     bus->line_orders[i] =3D array[i];
>
> Seems a bit "hack" compared to what this patch do,
>
>
>     bus->line_orders[i] =3D v4l2_fwnode_line_order_to_mbus(array[i]);
>
> But if it's worth the extra churn, and if it in reality provides us with
> a safe-guard between DTS-files and V4L2-drivers I'm not sure. I'm on the
> fence on this one, the one good thing is that it aligns how V4L2_MBUS_
> macros are parsed.

If you decide to keep the V4L2_MBUS_* definitions, there are other
(simpler) alternatives than adding explicit translation code:

    enum v4l2_mbus_csi2_cphy_line_orders_type {
            V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC =3D
MEDIA_BUS_CSI2_CPHY_LINE_ORDER_ABC,
            V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ACB =3D
MEDIA_BUS_CSI2_CPHY_LINE_ORDER_ACB,
            ...
> +};

or

    BUILD_BUG_ON(V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC !=3D
MEDIA_BUS_CSI2_CPHY_LINE_ORDER_ABC);
    BUILD_BUG_ON(V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ACB !=3D
MEDIA_BUS_CSI2_CPHY_LINE_ORDER_ACB);
    ...

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

