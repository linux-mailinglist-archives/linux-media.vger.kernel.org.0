Return-Path: <linux-media+bounces-32255-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E35AB30A5
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 09:38:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BE3A3AEF88
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 07:37:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B57256C86;
	Mon, 12 May 2025 07:38:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9119B7DA82;
	Mon, 12 May 2025 07:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747035484; cv=none; b=q2vXxHlXPAgA4NsJCIdep0Z5+/a3mfbesLjCVX2Uv5OjxWuxvu6PUB17pMMs0Ok8gHX/GJ3UJEI/6y+1Rk1cncE68cY8yGQvgTb1CjtytGjYS02iEqEz/t1X32fwEZ5/ruon6z6Wqiexgsdq9VY2QQlq/4iTE4ju/0lM9/iM4NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747035484; c=relaxed/simple;
	bh=5Drhw0lH7JV00K5Rc+7Xb4PSYZ5KlaumagsBoyqZTeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qMeRLpDKNLnaRk1sS+LXsq1OhKtyfUs9ZeubTMTwO37yvH3VSuz1DkXrPPr9P3px1Zi5bbIgkZtULJ8svbctikGZktVEehZC2lcjW8YY/AuN180H+MGMkf7UISmSGR6Ry9IasDxjZWFZQ5Z4uFR5ciuPWt4Oeo7YqNk/WkMEGtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-52b2290e290so2946431e0c.1;
        Mon, 12 May 2025 00:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747035480; x=1747640280;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SLp975Qg2zkffLQn42JrqGLDxS+SB9/EcWihl2VTt2c=;
        b=Fjo1UeTUw2UOyKTpEvmeUaUHp9RnDLig9ElVskRuYLpFjYsIAJg4dRYoQROLs4BGWB
         8GCUKJOFHo+o43HeZloG8eSnjCaXLQzspu8/A/Sg37TpXnduLpomiHfSgA559wfU/vpr
         vv8cpLnba3zvaUlDaz9qPK/7azxqyVj5/ZAhpLNx0P7RHjZaat3oHBHOzHHAJpFEnXc3
         HOFFutocjwJbV7Vqoa99tV7ordUUk3X1ABGOUZNCR1I7lRGL5OLTVb8NZ2TJMGg1qlxU
         gais4/YdnseH5N2t80xDxxthlZrTHWTbu1mFzQUMG4YSmejdvofqYQSQcsO5ZDpDiGZR
         xirg==
X-Forwarded-Encrypted: i=1; AJvYcCVPosIoUL3U5OkoLpHb2wOwjwM08B+nXRFpmdep/iuWPUWZ+57NBlWrqhaVnZ+8HoOeqUQuJlV+IR7+Vmo=@vger.kernel.org, AJvYcCVYr/p9ADONXrE1dewPuK1DJijuDYfELv6H0aOwYr2vVdvp3Zok/nrRUJZWQMLk245WlzPxjHZ3CVHfu/0=@vger.kernel.org, AJvYcCWAcpt5NhMTzjCm8OSu886jbP3bdNgYn9aU+bzdMR3yV4ANy8RDnrF1oMkoLuS8pRnPXC1hR750A8HISG9y1tOip2s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwmY20O8K268y7PhtJ4GPbKWpbDX3E0nuB83TmZGJTx2sKTxF9
	9CPXqZgWIQNEaTze3fsj+iyKZKTaXzvfJg76CuNJT/SAxFCsUwEczTdQtbX8
X-Gm-Gg: ASbGnctXg2B2AMd2zMY+kN5svVnFOJZJ9AzXwbxoGQXMtcNuZzpxB3YZ4chyROsFWvQ
	xZ68M53XVM+kbzMX+OdCjhEj2tkXXkryJ5cDTx2242oWXSl2Jy8Ix0eZsB5VzvTtcmyh0vH1Dy+
	WTWEcYEyXEbcaM6JtkIcwPB041maU8/X6lH0R0354o0pG+7AhnDFGc7jzmsmEJRsMIByddysyJq
	QuUSdCghWVvtqez6g1iEch3YbSoQhLGx6tO26rRSFeMBf5trsTiEzDi7uGmcBBlfg4qzhoPa3x7
	yPV5ovLv3QKY2yD746uhcIuQMpDme0SR4O2rCKg77+4vx/4ExVo2w9XXFv1xvgI/yP9DjgAw9xa
	sViK/O4UcGhGDDw==
X-Google-Smtp-Source: AGHT+IHxx7MEDaAesY0paOqmuyej7DqN+tfa0P+HDkgtIvrOk6hrZ1Dyw4h+Okl7joKm/RR7iXy9+w==
X-Received: by 2002:a05:6122:3117:b0:520:5185:1c71 with SMTP id 71dfb90a1353d-52c53ca9ddbmr9989881e0c.7.1747035480516;
        Mon, 12 May 2025 00:38:00 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f6297d64sm4672760241.30.2025.05.12.00.38.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 00:38:00 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-8797ade0b5aso2470250241.3;
        Mon, 12 May 2025 00:38:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXKUv4mw5yrxhHtmBK5FzuJb8hUhNyCfLcoJloRvzjAYxPSOyXY7EN70VhoLxCD0isI1enB6TC9SOqYsnI=@vger.kernel.org, AJvYcCXe1+a/9b1wlXugcxEgA764z5TkBd3Y7aG+54YYyb5Snu4gPzaWMFzMXzPOj2OT2HyReimghMk4dOjxEVirfZvgSs8=@vger.kernel.org, AJvYcCXrqPRO9h3cQ67FAJz+RLXSqlObRh6bWnlFkvMBXeR4J3K4Vb6GhbDzc6Xbx8IIUlw9at9KmPZsxhf0x9s=@vger.kernel.org
X-Received: by 2002:a05:6102:1586:b0:4c1:a15c:ab5c with SMTP id
 ada2fe7eead31-4deed3cf763mr8900141137.20.1747035479952; Mon, 12 May 2025
 00:37:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511174730.944524-1-niklas.soderlund+renesas@ragnatech.se>
 <20250511174730.944524-5-niklas.soderlund+renesas@ragnatech.se>
 <10d2ae58-8da8-4802-95be-951d8b376551@oracle.com> <20250511200333.GA2365307@ragnatech.se>
In-Reply-To: <20250511200333.GA2365307@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 May 2025 09:37:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUbMRBFV-7hDMQ3-UKAhzfbGM5yZJz05aGAHpOKZ5eKcQ@mail.gmail.com>
X-Gm-Features: AX0GCFv4mK9yFSt4H6ZSbJXJ35sEvvzAc6m6xC4P1ntDvWSO0by1MSAp2bcf0I0
Message-ID: <CAMuHMdUbMRBFV-7hDMQ3-UKAhzfbGM5yZJz05aGAHpOKZ5eKcQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] media: rcar-csi2: Add D-PHY support for V4H
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: ALOK TIWARI <alok.a.tiwari@oracle.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Sun, 11 May 2025 at 22:03, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2025-05-12 00:37:09 +0530, ALOK TIWARI wrote:
> > On 11-05-2025 23:17, Niklas S=C3=B6derlund wrote:
> > > +   rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0=
x0404);
> > > +   rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0=
x040c);
> > > +   rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0=
x0414);
> > > +   rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, 0=
x041c);

 [...]

> > Instead of manually writing each call, it could use a loop ?
> >
> > for (int i =3D 0x0404; i <=3D 0x07fc; i +=3D 0x08) {
> >     rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG, i);
>
> Unfortunately the values are not all sequential, see the progression
> 0x061c -> 0x0623 and 0x071c -> 0x0723 for example.
>
> > or if values are not strictly sequential, iterating over the array.
> > static const u16 register_values[]=3D {0x0404, 0x040c, 0x0414 etc,,}
> > rcsi2_write16(priv, V4H_CORE_DIG_COMMON_RW_DESKEW_FINE_MEM_REG,
> > register_values[i]);
>
> I agree with you, a array of values would make this look a tad less
> silly and would reduce the number of lines. I considered this while
> writing it but opted for this. My reason was as most of the register
> writes needed to setup the PHY are not documented in the docs I have and
> I wanted to keep the driver as close to the table of magic values I have
> to make it easy to compare driver and the limited documentation.
>
> I guess it's really a matter of style. I have no real strong opinion, if
> people think an array would be nicer I have no issue switching to that.

Have you looked at the impact on kernel size?

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

