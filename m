Return-Path: <linux-media+bounces-34612-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FE7AD6ED9
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 13:20:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5EE0171361
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 11:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C368823C8D5;
	Thu, 12 Jun 2025 11:20:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B333EC2;
	Thu, 12 Jun 2025 11:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749727203; cv=none; b=Hs9wyQB98zYVW34++ZBJbgeumSGZLmQ1FQh574CNFq8ck5emEr2DVoh2XwtJkuHWO+kZkw9TQP1J4IybRJsKYnDdwKT2XSCaORPLXcYdspoSysnL8Ksntdv3mDq1Wl3QCeyGXxaWV3Jy/6l/SoLTNkbfWkBrwRVhQsEY40TMf1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749727203; c=relaxed/simple;
	bh=YqHsxaxpI8FsGsfWWK1FEDhyIw1Uvbz7gYjTt9gIXVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RZh4eg6jtyRjI8f2EsAJC4XbxtzVZzJkx+Xe5wUhVO/BBf5VA8O1a1frcrt2NI7Pklk9UTqRBiqtCF4Hb+QD0vV9u/xU9nO0/m9PuKdMCxaed+oFIh2qzQxJ3iBx/EVqPLcnIKdmXQSSRX9Et5ZNzs+EbIehxekLtJgPph2OLRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-53133c3840dso106039e0c.0;
        Thu, 12 Jun 2025 04:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749727199; x=1750331999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TD3QIUg5vFTzQEXDYZJibnSN+u3ERO545tprLcdmPQo=;
        b=nj5GXQUy9YgA8abknxAamAaH1sKCAFAmT3HxeMFac3b40JqJQqf/twwM0tgyAYCr1Y
         8JS2w4V/mKZOa4oDmvRhVZ7z+JSkFYOJN1BlQJXvpDgngZvE783fSXTPGQ9nuMxz/1G2
         v9YsrY9Llc8NljM+Ol/iwl0qFHOw5p7KwP5hnDnCO/3ewhRCd2f+wC1BDwzJVwOb18ht
         OYBUjgZOJMUXdf8Nv+mrb6QrQ/d66tQG6ozH2gMcukYE6X31nMK0XdHa7clQ3sIteVZt
         k7cdfA9TQhoJe5HUgOEZJFryi5zzJ4pVaENTUPRi4/DZgOhYzBSUC8lHFwrHcloEruwD
         xf+g==
X-Forwarded-Encrypted: i=1; AJvYcCWqt1qoR7YQ7SdsXVGdeMl3LirBrrAg1k7JH2XySNZoL1vX3q4oUj20RrU2cerettWuVe4Ggt0ugXt0vDaRZ9rFLKQ=@vger.kernel.org, AJvYcCXMBTHHRkiQ2fgvhDNTwBJD0TRYTxJMVwPRxtjzOtRBHsU+S56fZaqnRpL3vtjmFD+nTiA+eG8z7YLa0Vo=@vger.kernel.org, AJvYcCXXhCpJmcYkrwfn/WJ2+z/b7C0pMUbRuu2Z+pOdRQ7tq/uoy7MT396uM0s4yv429Mr1X1R5QcFAnr5kMP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVPoy704n/vBYn/EPWE/arr/C6HWaXOJiPjwGi+M5syvV7DwmI
	fyeZPI7L7FVSEvzBlTcQM3H6wo27LIoGlq/lPQlvseQ8bAuL6bDOHZQ599h/akoj
X-Gm-Gg: ASbGncvw9XEcS4A/YwYn0lk4tU8Bin5i00EPf/Kspsxp685WX6YHRpMQb0GmMtalTIg
	R0v6ltHytuaNCOyvjC26hipjJ6n016SqW9qpRpev6h1VLGAuhHQIVii2iLD7tftAprwsUTY7/8u
	OYrLB1+cWqKAmIH2dmQjdy0PGNcQPuShHRRdIh8KAff0RHlT/t6AK+rIjTmgFg2+JuLZzrSBiHp
	FxuN2u3lp2ObIbp5PxfbtGg6riUNkiEtyetBakbNi8B2qWGCAb6qRy2BUwfqFpTUCuMr5Anv8UB
	yT1TDc22RPDcfHcN1ANG1tZzNQNRXaZhOlyyGV+09ZVNsmdmOkveQSArKLAcBHHF/b/BxUy9dKm
	uyS5WDL63wTAKC/VBKQYOT1f0
X-Google-Smtp-Source: AGHT+IF28ebF8Mg7CzSisDVubvhdnfj5OxKqmZy2OajHlscguj6cAa9QRfsaA5G8EIdpN59aphAKuA==
X-Received: by 2002:a05:6122:1c1:b0:52a:ee1d:f7fd with SMTP id 71dfb90a1353d-5312227726cmr5129135e0c.8.1749727199067;
        Thu, 12 Jun 2025 04:19:59 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5312f2ce812sm264785e0c.0.2025.06.12.04.19.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 04:19:58 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-87ee848a74bso214453241.2;
        Thu, 12 Jun 2025 04:19:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUbtXfJGvnSe2dlkjcIGPNwjzPHQsKzCjt+VRyaMqlOGB5vUWF71Kyq4yqlQM3Oi3QP7J9PXwbLUrJv7YMoX8D547U=@vger.kernel.org, AJvYcCX4r+WP9cTxo1o493VUdg9mIzX94nzn3DiNLWSZxHJWLpaxMI6GVFOtUNLzf2oslPSYhh8GIwvLC64hdP0=@vger.kernel.org, AJvYcCXfGvrOQXN83yADEVIewzy/i0JUNuebNsTiF7MzitmG/veJGAUUP5gXGmm6qpnUMv2AvZ2UmPfZ/x0fxpo=@vger.kernel.org
X-Received: by 2002:a05:6102:c48:b0:4e4:5e11:6832 with SMTP id
 ada2fe7eead31-4e7bae9d35emr6100563137.7.1749727198094; Thu, 12 Jun 2025
 04:19:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611154445.123412-1-niklas.soderlund+renesas@ragnatech.se>
 <20250611154445.123412-5-niklas.soderlund+renesas@ragnatech.se>
 <20250611230412.GO24465@pendragon.ideasonboard.com> <20250612100112.GH330732@ragnatech.se>
In-Reply-To: <20250612100112.GH330732@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 13:19:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVueS4Dhu0e5DJSEDD1Pt-3Ay3tmjs5Jm-5Z2xQXr4XVQ@mail.gmail.com>
X-Gm-Features: AX0GCFu6xrIMQdM-0ntmPWVxsgReft2rzNEKQKIMX4TRdYgrZvSUQ6KwwPHdPFc
Message-ID: <CAMuHMdVueS4Dhu0e5DJSEDD1Pt-3Ay3tmjs5Jm-5Z2xQXr4XVQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] media: rcar-csi2: Add D-PHY support for V4H
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Jun 2025 at 12:01, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2025-06-12 02:04:12 +0300, Laurent Pinchart wrote:
> > > --- a/drivers/media/platform/renesas/rcar-csi2.c
> > > +++ b/drivers/media/platform/renesas/rcar-csi2.c
> > > +   if (mbps >=3D 80) {
> > > +           if (mbps >=3D 2560)
> > > +                   val =3D 6;
> > > +           else if (mbps >=3D 1280)
> > > +                   val =3D 5;
> > > +           else if (mbps >=3D 640)
> > > +                   val =3D 4;
> > > +           else if (mbps >=3D 320)
> > > +                   val =3D 3;
> > > +           else if (mbps >=3D 160)
> > > +                   val =3D 2;
> > > +           else if (mbps >=3D 80)
> > > +                   val =3D 1;
> >
> > You could possibly replace this with
> >
> >               val =3D ilog2(mbps / 80) + 1;
> >
> > Up to you.
>
> I opted to keep it as is to make it easier to match with the datasheet.
> The ilog2() is clever but I will never remember why it was used ;-)

+1 for ilog2() ;-)

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

