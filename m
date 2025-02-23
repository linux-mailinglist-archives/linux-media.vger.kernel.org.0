Return-Path: <linux-media+bounces-26743-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 924A9A411C2
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 21:57:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86F63170602
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 20:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E61923F407;
	Sun, 23 Feb 2025 20:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fw5yLIDP"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093311E491B;
	Sun, 23 Feb 2025 20:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740344264; cv=none; b=bEa4cI7V21hPsfZT6FmMAeQwm6dliwjKVx4sE21e33b1fN+pbFefRZyU0wIP8nwn052VACJnQyVcksJJCP8CHokNvFKSGbE5aAILFq7VuGbu/2ocAuvxP8nb5MLJIatTyv8oC5JLmzh1MFU/Mo11tteixYYeXDM0YfSVqfHAAZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740344264; c=relaxed/simple;
	bh=EAKiTpYYnVeZO3LS28nMWr+d+FH/vhJSlPIVTjf+Hqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N9TFivhYyk85TDKDH7h4qDZ1tPwBd2Es6vn4RsLeAq5NRYaOzFm3/84lzVYpnyW++n/b075Ao8921nvPz9+zpKNY5YofflhVLjcWODWKqlWZ6vPtuNqoiMgrjlfc8AZLyZhqPVCEQ9nfruDYyIK13l55vzM9HW5fQheJT5BKxQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fw5yLIDP; arc=none smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-8622c3be2f4so959337241.1;
        Sun, 23 Feb 2025 12:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740344261; x=1740949061; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAKiTpYYnVeZO3LS28nMWr+d+FH/vhJSlPIVTjf+Hqo=;
        b=Fw5yLIDPH+mbHesse+AjGnMOSVvdbl3gK7r+F2tKrxc5JHZSMS5afXpOCpEhU3q2Qm
         C2ePAu8mhpfcnc/6cxP8QjsJf4pjceO33QwB8+KrKWMrqAxjM42h4Ot9ZrneF0I5n3Ky
         dfEmmt1OER6O8F1ZS88/X4PbYoP97ZqrG4YcKifI8qB7ZCDSxAZWQWDnELzMyNa43z6T
         VZ6yGeaD9FU3r6+XGdSAHN2VoCOx7srP+oP7pVGMgNKyEXipP+lXCkqNMzK3L2urboR2
         ohZ/F/Y6XtCNyuloGMEo4Igfau/w56Zl1b9+6/M+RpdN42vvYk4uUd5tMPAu77Jy0qhx
         M0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740344261; x=1740949061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EAKiTpYYnVeZO3LS28nMWr+d+FH/vhJSlPIVTjf+Hqo=;
        b=Z8nlPcmOcuXGi4XAkJ0pwe8MkoLJBsux31SVRlxuMApZe/Lc8lJ21JijNk6SkE9VM6
         m/cMnTyGQYsunC7nO4iGUTyxSkzneFeDTqx11s/UaYjW6CHquNH8vebn6Fa4dj0kArQR
         4eoxv6CmZbs7cNiGiJyqGC/Sl4eL6VaZ1+jSVkMS2rJJbeKIzJQtZ5apqnkA39tb0ulI
         fm57weTidoWtdNJPvHBQXa7CYG0J48D6NkKP2eiw4Yq3DCqZV9mkn3RNxto1pe+NnVcu
         vuqkZLi39LkPJfnRzWdC6FAcFpdgj+R29bVXy8TVm2PcH5aZ2rUHZNnPXsRE7pd9iteu
         e+fA==
X-Forwarded-Encrypted: i=1; AJvYcCUhybHgFAN5LMSOciadqo+ACPIZeaW/jAYwMiKmufE7r/Mi3vKGI7WDUX8PbkgeY57elhxSvDv2HjA8@vger.kernel.org, AJvYcCUy70/7Ynmkaf8gMMGDcZlO1CqnQn3I9h3cKtZ+04re+yXJewH6nKWECK8Q2t0VJoFQ40RHD8pMJFQjSFI=@vger.kernel.org, AJvYcCW3JWj1fhLQ2MQIFUQ6mRM816nj7AfWHUw30nqjppScwY6jICr+DreLUgc8Jp99EICAYz/dBgCB0l4RzUj1U8NAxk8=@vger.kernel.org, AJvYcCXq+mzVALpE/P++YH0ZWT/9vnCgtV47mUauTZvvk9lJOrut7uz1XXvAcdyUDyTWn3ZLK9l3o/SSUZTWvNw7@vger.kernel.org
X-Gm-Message-State: AOJu0YwyaPSMWOkYT3hkPqN9fh58sroWij0L4h3O9GVineLO/7oJLk5s
	gUV3D9xUBB182cCi48WK/7YaCiuh6dYAyzHAktGSyuiEEdzTgOWS63C+Kxp3mBij91/VzSLI+Ir
	1vPOmUkwmfJiZucZcmHMKyJUoANo=
X-Gm-Gg: ASbGnctT1mzcmSz/JruTrX3JUczM73Ac1OUqeJxLdId77n/jmLg0AswIdyX2vSP2kMp
	p0jDs0P1A9wQa+i3BWN8xQ/fgH2oX0DkZwudUQXz7BNaadBJKtW3KORFKa2llh9Y2y/9N5028c0
	BlvRDxfDCo5hbi7Oc7Jmbq/smdRbRXhuOawyw3UGR7
X-Google-Smtp-Source: AGHT+IGeFCjx69zKMnS5an7ZsypoU4EhpN2SqDf/S+KSnnPpvbMah+83e5k82NyMDYuPskzDFQ1yzACH+uFeBoXm72o=
X-Received: by 2002:a05:6102:5125:b0:4bb:bf49:9088 with SMTP id
 ada2fe7eead31-4bfc02231f9mr4875201137.16.1740344260843; Sun, 23 Feb 2025
 12:57:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
 <20250221155532.576759-10-tommaso.merciai.xr@bp.renesas.com> <20250223181955.GD8330@pendragon.ideasonboard.com>
In-Reply-To: <20250223181955.GD8330@pendragon.ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 23 Feb 2025 20:57:14 +0000
X-Gm-Features: AWEUYZky0_229ambfWsVcJLM4pj4rdD8SEpYiK-r-awHmSdcJRMIEb31CrqaLW4
Message-ID: <CA+V-a8t3VeK9vuw7k_gbJ=wQAbJHWnvOkZ1xU-k3pc8QdLWiqw@mail.gmail.com>
Subject: Re: [PATCH v2 09/18] media: rzg2l-cru: csi2: Make system clock
 optional for RZ/V2H(P) SoC
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, tomm.merciai@gmail.com, 
	linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Thank you for the review.

On Sun, Feb 23, 2025 at 6:20=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Tommaso,
>
> Thank you for the patch.
>
> On Fri, Feb 21, 2025 at 04:55:23PM +0100, Tommaso Merciai wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The RZ/V2H(P) SoC does not provide a `system` clock for the CSI-2
> > interface. To accommodate this, use `devm_clk_get_optional()` instead
> > of `devm_clk_get()` when retrieving the clock.
>
> The clock shouldn't be optional. On all SoCs but V2H it should remain
> mandatory, and on V2H you shouldn't call clk_get() at all.
>
> I'd recommend adding a flag to the rzg2l_csi2_info structure.
>
Agreed, in this case dtbs_check will not catch this issue if we pass
"video" and "apb" clocks.

Cheers,
Prabhakar

