Return-Path: <linux-media+bounces-28384-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B16CAA65DCE
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 20:21:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E16117EE94
	for <lists+linux-media@lfdr.de>; Mon, 17 Mar 2025 19:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA761E833E;
	Mon, 17 Mar 2025 19:21:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF7515573A;
	Mon, 17 Mar 2025 19:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742239285; cv=none; b=UGDMHcCnZMLljl3iAlYsOr9GhcpZmFFIRcuguQu63WpQ5eK8JG0bDpy5f9zcHsfZ/bIqSOwcIcGwKTEDesBNN865+4xh4jty03z6LxC5X3EbVB2bbFMHz3NfIBLkt/ichsOh+cExO2UmQwZiGWtKm/gYlOE0neH/tAJydDTN72M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742239285; c=relaxed/simple;
	bh=wkVsqyROJ6ieH6gcue6Rp/qjBWB4Ee1Skd4MjvFuxmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EoukFCLPaCXXIo5Q21EyNAX7I997eG935jSCTdxxsxC/9VEL4jXaL1+Oujz1yLBs6jLA++6cXmi/FEVPv96RzWzUcAFI2fzasXULXnsWpUqY16J2D4CiPvBmOhtI5hM4YKG4EQlHLF3yZiNCXd/uMiZBMQ2gJi2Ap3HO0ntcS/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-523f721bc63so5055256e0c.0;
        Mon, 17 Mar 2025 12:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742239282; x=1742844082;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nD+I8b+msehWqplW+2DYKyuCBc9yCa+wKRHm53nPIXs=;
        b=rQtWeV6Vx/o6phRUoRC5xl+fP6xYcbeyPJvSqfUV2DaBn6+JmLKRYZqYQ8x99P5snb
         RJsoxKqaX0F/j20RH/je41/M8Qc5LHkIiE34GvwuPLmMlBxKze7ia/00+S/3JtM/2bWy
         N6Pbkc2m0e1rU0mJPL2Nyui3b5/HFAM947lA5sBzdW9LZarmRlQqQunbOIzVJnSq+QOd
         XD2fzPlnObXk8rSHHjeNDEi5ShKvoruqrKfij2U8DI90TNkOS6aOmdNGP37Ii+Mt66Uk
         d3cYRGgNvdh1ZltqdBng5KW9s8Btuvhz8xF70A/lcr3C/yszN45T80IfAZ24a21I1OaW
         u//Q==
X-Forwarded-Encrypted: i=1; AJvYcCVi6sLaqrW7+xO0UXfQb/iTRsMYvsxR1De3cI/mlYdGMHoPeTFGK83BtSjoT1BivElmQJs5x7nr3RoiO/c=@vger.kernel.org, AJvYcCXP74ppgERA3eZodli0XG31T4aleQNOLwZnLMwZTo0H870KcRqk01FNNRWvXfvBbwydbUY0quM9KFLjAMEprMK8opY=@vger.kernel.org, AJvYcCXegOKuVx8xFU2D6NgQN6ZXlO1hacJU3PH1L+l7/F67WyN0aYm7hB5WyxgF+wvCydmgwa2etFdxBhds@vger.kernel.org
X-Gm-Message-State: AOJu0YwonrzGL6HABW6szNKA6QQx5J6Oqt9BVaCZhSbYCtW4V8rgwSHK
	pUML5B9tksImjEphVug8/ggPafnMtO0Z/3yq2ohMwsIWTG3Mn3bA2bAqhuZR
X-Gm-Gg: ASbGncvPhCjkBAhknZVS4218naySjjl6pqXS8k+XHkO6oMQ+nZlk6ZLhZauIo++dTbC
	QvTswAa29y93SdY+EHDaor66qn7D3LwbNGIzd/4pSZRgpgP1CeUs2FTouyGuqvOe38mtdezJFFB
	QOr/EaDOwqc55hPrQybyHh3WdJl1Ua1JpyiPvQi8w5ibhTpNidJGYuk86kOjblvX2MdLSx1sVMk
	9q8RV6SRe3iviVO/tZrHjYmaHc4bMp85D60Kstokuco9zUGIrMpIdCaxfAwDm9luSI0fEv3B3Pd
	Q4cFGKCwTNFfayvaP3RIjcbFOva1YFlZsUVQFuBuc9ullmf40Jq7XeMQQFchoVFnKHU/Xy+3d1K
	t3rXEhgoeibY=
X-Google-Smtp-Source: AGHT+IEMItoeWHQRuLaFTjWYlOnzm8rUiLd3l6rm8Z5WEXb6j8dRjcI3xGBnxrlYWDEfCk85e2Vt3Q==
X-Received: by 2002:a05:6122:2329:b0:523:e4c6:dddb with SMTP id 71dfb90a1353d-52481d94c3cmr815559e0c.0.1742239282561;
        Mon, 17 Mar 2025 12:21:22 -0700 (PDT)
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com. [209.85.221.178])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-86d90e74811sm1728145241.25.2025.03.17.12.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 12:21:22 -0700 (PDT)
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5240a432462so4059585e0c.1;
        Mon, 17 Mar 2025 12:21:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVhxe5BuzQWt3wDsNa3EcL53s/0Um6gOn/KupKpgqw9yVwvMotwQFKkdMIwlNukNHBTzJ0CKtW6DXAH@vger.kernel.org, AJvYcCW3lSgdWBfCW2510c3j2jW8/bF7FBUHL7uh5zIwF4hNhpr2AiRyKxPtbQ+q9iSPrgY5FZDdNhOqxWVBDkM=@vger.kernel.org, AJvYcCWTdqenFPUd/Ugxqfb7bOU1x5HRnSn9YY279gFlKZWWunbk281O9xwaxGuAWzYCaxl73exZbke2GUqzLgfFlzw3ZjI=@vger.kernel.org
X-Received: by 2002:a05:6122:354c:b0:524:2fe0:3898 with SMTP id
 71dfb90a1353d-524823cf7aamr880578e0c.5.1742239282127; Mon, 17 Mar 2025
 12:21:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se>
 <20250315152708.328036-2-niklas.soderlund+renesas@ragnatech.se>
 <20250317-furry-independent-clam-33db01@krzk-bin> <20250317115006.GB868399@ragnatech.se>
 <5876368b-1549-4ce0-af43-80f712f457c8@kernel.org> <20250317153726.GC919085@ragnatech.se>
In-Reply-To: <20250317153726.GC919085@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Mar 2025 20:21:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXU4JxDe-L+UcUwzndariz=mfed7UyVXW2Mv0yggXZw4w@mail.gmail.com>
X-Gm-Features: AQ5f1Jq3SgmdTUM0DmydvoKJECL4JtNlREH1938wu1_ioAKVT-7rOVxl_myqbSE
Message-ID: <CAMuHMdXU4JxDe-L+UcUwzndariz=mfed7UyVXW2Mv0yggXZw4w@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: media: renesas,isp: Add ISP core
 function block
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Mon, 17 Mar 2025 at 16:37, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2025-03-17 15:57:31 +0100, Krzysztof Kozlowski wrote:
> > On 17/03/2025 12:50, Niklas S=C3=B6derlund wrote:
> > > On 2025-03-17 12:33:07 +0100, Krzysztof Kozlowski wrote:
> > >> On Sat, Mar 15, 2025 at 04:27:02PM +0100, Niklas S=C3=B6derlund wrot=
e:
> > >>>    ports:
> > >>>      $ref: /schemas/graph.yaml#/properties/ports
> > >>> @@ -103,10 +138,14 @@ properties:
> > >>>  required:
> > >>>    - compatible
> > >>>    - reg
> > >>> +  - reg-names
> > >>>    - interrupts
> > >>> +  - interrupt-names
> > >>>    - clocks
> > >>> +  - clock-names
> > >>>    - power-domains
> > >>>    - resets
> > >>> +  - reset-names
> > >>
> > >> Another point, this will spawn bunch of warnings for no real reason.
> > >> Just drop all the xxx-names from properties and from here.
> > >
> > > I'm sorry maybe I'm missing something, but if I drop them from
> > > properties how can I add checks to makesure the names are either "cs"=
 or
> >
> > Why do you need to check for the names? There will be no names, so
> > nothing to check for.
>
> Ahh I see. But I would like to have names if possible.
>
> The driver is backward compatible with the old bindings, and going
> forward we have better bindings with names. All users are updated in the
> next commits in this series so the warnings will go way rather quickly.

Note that the driver does not _have_ to obtain the "cs" clock by name,
as it will always be the first clock anyway ("make dtbs_check" will
sort-of enforce that).  So you can simplify the code by obtaining
the first clock without specifying a name, and the second (optional)
clock with a name.

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

