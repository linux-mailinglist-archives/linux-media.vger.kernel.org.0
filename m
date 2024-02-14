Return-Path: <linux-media+bounces-5113-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DAB854396
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 08:45:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAC4B28516A
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 07:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E7711715;
	Wed, 14 Feb 2024 07:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2UX6Z6j"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6F2125A1;
	Wed, 14 Feb 2024 07:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707896704; cv=none; b=MxqUBENW9MoZu4ZxukLTjFS2+udUnkmww/0UdCrqD741zlZSeUH9ek+4hpvKesVLDHjPyKb5BmKTdoSeIUmeTC7Bm4gd1lwmfgpyi90qsXdsO6Mi1/gkwvtj8YNyd+LaFsQMG3Rwphsn/xqjIQvmQGl6OGucvFI4HCzUaxi3V3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707896704; c=relaxed/simple;
	bh=fOwff+6CQdTSZygLgxTLEpg7fy4rHn2jnXH3jt43fcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=MsHgbfAzCkcvnvacJwZmI4SfMz8Cx/5vu3JZiW6IrjGEj09ajf/gejlXRR/y+Y4ZSkWRfYQaiCbKEETbbVbsK1scGdBhKHqc/QerTBtLaAscUq/ssXI1gaS+P64ZtH4Gn391Vg+fH4cIrFI/tPjeNW0O6lxnf1qtjxxfWvgtVVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2UX6Z6j; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-55a8fd60af0so6890638a12.1;
        Tue, 13 Feb 2024 23:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707896700; x=1708501500; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOwff+6CQdTSZygLgxTLEpg7fy4rHn2jnXH3jt43fcA=;
        b=Z2UX6Z6jVjkJWNlAGitJ0kAbKuMBl7xC95PEun33bKSIvWVsL1OGcfT1cZzuNBznss
         x4WV8s6MU0tIxEDJ/4V7m8PpsWvtRY2QL9pXPwZz0gVY47pjwYlEzH2zGNUieQSnvaNy
         xqe/o8rSL3mKypYwUvu7hSlFE4XSrS2nNj6DNQkQvJX1mIZjgMh+z6udckO/KDoP6zts
         F0at4iZ9YOmOY4YWicbnyM5hWgAVJXnI9zcMVob/HQDyoTZrMct64EiO38g+1bmoDUqR
         4Vv7vtclAM7g2rP5a7iCNv/qfpxh87bRIKH20hC5ZAtKOtX8E7EkHyXNFrRmnWueE+O8
         RzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707896700; x=1708501500;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOwff+6CQdTSZygLgxTLEpg7fy4rHn2jnXH3jt43fcA=;
        b=Zm2a/Hx5Rb5+u3yaVGl325j0baqNhzShr8a6XCUknQnt+Q5h4Y+p2vYqivJ1sOHT/u
         jfQqvDWpdcSfMP0b3mgQPQoaO3iYIE+0WiMatBiGX0SyaAFCGGhg92mbsB6HuvxxEn5J
         /Nu9/MfMIp71crgRZGRsXKwA7Xfmc411rzKNgOJBE1iJN/4mGYZtLncxkK1nxv3JTnau
         bYfktIW//z/OE7GTfRsBlp+wo9HFGccO5JDF2meQ5FUA+yK6wC7CbnmSTvX7Vzv9Y6L+
         HNtMuZ87i8iq/e/O/HSTb1UZR5MfONYT9B/mCyIKNMmtbTqTR4OqlS0be7Aep3nc3JLw
         1CFw==
X-Forwarded-Encrypted: i=1; AJvYcCXSPQ8Y6winn2ggsRASaKqZObbZa7QLnUj/r2vIau4zDGW/e9FmbdsBCb3GNeXjd4kIz/DUPO6TYBpBgen7F61AtrM9QTU3vqX5H1R5PfFGlCoIqC1lgawks/4J+cNKYlsAvaeRjhyqmTmGcfsyeA==
X-Gm-Message-State: AOJu0YzSXVfb818zj9XpgCR6pRj4PMLP7hz91OV2MLzlc2g771PPj1Mv
	oY05hXjbCMEO0T/IJBbx6X5yhCUaJTQ6DjLVKiPHNfzDUdzR3UQzmlLQOMN/WQAezM2+eNZ3dr6
	IsHXHc+lRUyyE0J3gbz6bSL992JY=
X-Google-Smtp-Source: AGHT+IHEuDexQwyJdWezdLjlCwizN1xemvnR257NZKKFUwGPofali+GCSUD9yLmulApulBb7F1iDeosBZe0zYyl2V4g=
X-Received: by 2002:aa7:d4cd:0:b0:561:fec0:cd44 with SMTP id
 t13-20020aa7d4cd000000b00561fec0cd44mr1554605edr.27.1707896700271; Tue, 13
 Feb 2024 23:45:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240213140240.159057-1-biju.das.jz@bp.renesas.com>
 <20240213140240.159057-2-biju.das.jz@bp.renesas.com> <ZcvsyRfVwC0aJ5fb@shikoro>
In-Reply-To: <ZcvsyRfVwC0aJ5fb@shikoro>
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 14 Feb 2024 07:44:48 +0000
Message-ID: <CADT+UeDNFBTvRMHd4_J85Yz0RYED4ioG9wjUe4C0X4x6LzVD9w@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: i2c: ov5645: Move the register 0x3008 from ov5645_global_init_setting
To: Wolfram Sang <wsa@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

Thanks for the feedback.

On Tue, Feb 13, 2024 at 10:27=E2=80=AFPM Wolfram Sang <wsa@kernel.org> wrot=
e:
>
> Hi Biju,
>
> I couldn't find a datasheet for the OV5645 but the one for OV5642 looked
> pretty similar when it comes to the issues mentioned here.

I don't have the data sheet. I am just debugging with a picoscope.

>
> > Testing OV5645 with i2c bus frequency @400kHz on RZ/G2L SMARC EVL platf=
orm
> > shows issues like the captured image is either greenish or it is not
> > capturing the image at all. However, It is working ok when the i2c
> > frequency is 100kHz. From this, it is clear that we have a timing issue
> > at high speed. The testing also shows that if we add a delay >=3D 1 mse=
c
>
> That could match the "VDD stable to sensor stable" delay in the
> datasheet.

I think it is different here. That 1 msec is delay associated with
applying hardware power see [1]

[1]
https://elixir.bootlin.com/linux/latest/source/drivers/media/i2c/ov5645.c#L=
667


>
> > after register write {0x3008, 0x82}, then the captured image is always
> > good. So, move the register 0x3008 and 0x3103 from ov5645_*_init_settin=
g
> > to a new table ov5645_global_init_setting.
> >
> > Drop the unnecessary entry { 0x3008, 0x42 } from ov5645_*init_setting
> > table at the start.
>
> It seems this is not needed to fix your issue? Then, this would be a
> seperate change with a dedicated reason, I'd think. There is another
> pair of activating power-down mode and immediately disabling it again.
> Either we simplify it, too, or we leave both in place. Or at least make
> sure there wasn't a reason for them. I'd just leave them.

My bad. I thought as per [2], there are 2 writes for 0x3008, so I
should take out the redundant one.
I will restore it.

[2]
https://patchwork.kernel.org/project/linux-renesas-soc/patch/20240126133116=
.121981-6-biju.das.jz@bp.renesas.com/#25706558

Cheers,
Biju

