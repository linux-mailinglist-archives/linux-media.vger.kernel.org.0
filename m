Return-Path: <linux-media+bounces-35131-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0640CADE4B7
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 09:44:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1F7C3BB95F
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 07:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D239C27EFE4;
	Wed, 18 Jun 2025 07:44:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D5727EC73;
	Wed, 18 Jun 2025 07:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750232660; cv=none; b=hXOs7ZKy9ws9paZBDOfIOvAGbnf3odbxfh1AwnEv1FXMZl/bI/16HBQdM8ODNamCRZ3ttEb1KyDU4GHF32i0tuxFvo5xJdGTcr423VchKq63osobLmN6ujKIhoMahiR/1s/c/gAk1eXkxJ1BvHc7DebDoqEub+Z1mXKTpGpPnaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750232660; c=relaxed/simple;
	bh=+6JCNSmcJH66Vvoa6fs7uvoBEwQUUi/pIhzK2bkWgi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ocM9i/qFid9PqB/MY4MjNRu6/b5Vfvb+HD7a+WKp9lfkcKBtCHN5IGDTfCS2h1BHl7BFLvYcYP5tNAjwrsG7jV/ihooHTxiJVAnffaAE24H1Os8tMQTY89trPnOLAcoa5aHynmAVO42IIYmsR3QuL48unPXEVz7EzDr0EQ2kFYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5308b451df0so1840780e0c.2;
        Wed, 18 Jun 2025 00:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750232655; x=1750837455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnXnD5onTpfbeMAbM123OnpKL++zgz8w2KsvI2hVzKA=;
        b=Pm5JJxQxpzeyDObtYC9C2/HZP+uxwA1yLaJ7cz1sg3i/AgmhCNRlFQjXiwgpnPOW/S
         KEM759o0QD1mEcUoCLl9YwKKkIBMKE5ke7tx7kzIB4cevxYz2Blz+b+8eyObZqHvlo1K
         P/6YnXFMkLK3lN11FenFttwOplgAfCVaEtbVrekaH8NTcqLqFFtNVxAGZRYeBpJ4FoOs
         eAZKRXfANTM5OnU7APQ1H7EZIyB3BnEtAGLrCaxGcz3g6UDPTm2v13slMUEE6KGhmnIR
         566/SNoleBB2lNv4gxSaRy2igsZBPnguO0K7g4yzCNgL/E077nI7JOsZqZa/0hB2njia
         L2HA==
X-Forwarded-Encrypted: i=1; AJvYcCUZw9Lfsr3jgHFswnAEzLB+7nqF6Ok+veeaxb2oG3mGCKMSFdMdnrC1o8r8RO3Jg5+yXacgKkoLpHoW7w==@vger.kernel.org, AJvYcCWkCn5AK1ZmX1FxLwwoE0B4nPgaw3j9dk93Hcv92F7NY3TKChivPrdA0dwhhJ+GumwB6ddBqD1yPyI92KjVFVezuDA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh0/4DgYKdj9GqWIluZcQjfSql9ZUXWMWEJKEE6M2NdSqURmK5
	l23tIs+QsEM5lTtrIcUOZLL+TBYgxPZSkdxXnDGLJRGre+WznQ/81QOQeQUSXqKF
X-Gm-Gg: ASbGncuJ7iGlKaPSD2nAW0+HPE2ju1Pko6rQ03pVHPl4wben6CJqK8/dbfiy7FYZIbj
	9mFuA1JWL8RJX/NIUYpRLP+1K4H6qxOCAGE5KGdBoUG2RlBM9JMvfTK9vD8s6EIt094BDMnL5F2
	0Och2VetIhqgjE0/zYbP/vYvZgcOj0DTy3kb4cnqTimtgUUjskoVnNcgz7vAQtUep/arxha95O1
	TH6HqxK9GL3VTVnJcdMphO3d1sYBvNpzj/2k1foD3D5e9AlhrBzGPoS26CgNmcMQkL/gHo7u+6+
	x0xaBcVN0JPYAbFr01CElYdTKFduF8bqRiZE/104w+rNeHPylO6YiwUo0r0VoJSJerDdj54dZQn
	Avrr7veAgLlU+SoN8mvd3COsb
X-Google-Smtp-Source: AGHT+IEa7zeGhyT0RmxCLLGgZ1eH878CR1Pv5FGvD4iydaCcEoTXICnk0U+B0vuc6SRQDuU6ji5fMA==
X-Received: by 2002:a05:6122:91e:b0:530:6e61:d1e1 with SMTP id 71dfb90a1353d-531494ba97amr11636824e0c.4.1750232654853;
        Wed, 18 Jun 2025 00:44:14 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5313dba3573sm2032983e0c.0.2025.06.18.00.44.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 00:44:14 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-87f0efa51c0so1155660241.1;
        Wed, 18 Jun 2025 00:44:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVWS+KBeLzzSxh4VWCaQeBpZFY2sRJvoNuAn9rpCCqEGj2tqmdeMBuqbzoUkawGdeI2BvIjLDIHpmSdkw==@vger.kernel.org, AJvYcCX6e4wNkkE+f0wb4TDqdRK0g7O1YfebGLL9suGFN5cQCzPAwYw8H0QVlj0PI+UuU1uPLpMHnEhu5YiMhlZiyMlBiuw=@vger.kernel.org
X-Received: by 2002:a05:6102:c8f:b0:4df:84d5:543e with SMTP id
 ada2fe7eead31-4e7f61629cdmr11384618137.7.1750232653963; Wed, 18 Jun 2025
 00:44:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606182606.3984508-1-niklas.soderlund+renesas@ragnatech.se>
 <20250606182606.3984508-8-niklas.soderlund+renesas@ragnatech.se> <20250612231504.GE10542@pendragon.ideasonboard.com>
In-Reply-To: <20250612231504.GE10542@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Jun 2025 09:44:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWn01G-kyFgM+7e+TDaoN4ekSuM=c0kcByFLDsVBVvgwA@mail.gmail.com>
X-Gm-Features: Ac12FXx7wB3ARXOrISSEYyeg1Q2SF8gecVzzBb79xE5qRIJANDhJqZjRy8DeCzc
Message-ID: <CAMuHMdWn01G-kyFgM+7e+TDaoN4ekSuM=c0kcByFLDsVBVvgwA@mail.gmail.com>
Subject: Re: [PATCH v5 07/12] media: rcar-vin: Merge all notifiers
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Tue, 17 Jun 2025 at 21:48, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Jun 06, 2025 at 08:26:01PM +0200, Niklas S=C3=B6derlund wrote:
> > The VIN usage of v4l-async is complex and stems from organic growth of
> > the driver of supporting both private local subdevices (Gen2, Gen3) and
> > subdevices shared between all VIN instances (Gen3 and Gen4).
> >
> > The driver used a separate notifier for each VIN for the private local
> > ones, and a shared group notifier for the shared ones. This was complex
> > and lead to subtle bugs when unbinding and later rebinding subdevices i=
n
> > one of the notifiers having to handle different edge cases depending on
> > if it also had subdevices in the other notifiers etc.
> >
> > To simplify this have the Gen2 devices allocate and form a VIN group
> > too. This way all subdevices on all models can be collect in a
> > single group notifier. Then there is only a single complete callback fo=
r
> > all where the video devices and subdevice nodes can be registered etc.
> >
> > Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatec=
h.se>
> > Tested-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

[ deleted 132 lines of quoted patch ]

> > @@ -417,6 +452,12 @@ static int rvin_group_notifier_init(struct rvin_de=
v *vin, unsigned int port,
> >               if (!(vin_mask & BIT(i)))
> >                       continue;
> >
> > +             /* Parse local subdevice. */
> > +             ret =3D rvin_parallel_parse_of(vin->group->vin[i]);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             /* Prase shared subdevices. */
>
> s/Prase/Parse/
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks, but please trim your replies, I had to scroll three times
through your email to find this ;-)

[ deleted 262 lines of quoted patch ]

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

