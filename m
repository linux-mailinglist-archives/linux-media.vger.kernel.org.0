Return-Path: <linux-media+bounces-28394-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CD4A66CE7
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 08:55:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76CE519A539E
	for <lists+linux-media@lfdr.de>; Tue, 18 Mar 2025 07:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0F41F5822;
	Tue, 18 Mar 2025 07:50:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF991581EE;
	Tue, 18 Mar 2025 07:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742284250; cv=none; b=j5zjIAhQ8Beycbv5SIBV+F1L3mlY7eFPtOpezTC2dk61qPOF208yX+TVs4VCWIVtgsTyQrSQPJiJQtym2JXhCaO5s3lkpLfAtrPw3RNyCqeyBVa4EhVeWUCDPUU3ArgfW/H2DFK+BmwjVYtagmipBdau+gUbH6c6ui76rfORJMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742284250; c=relaxed/simple;
	bh=fOV+R5oRoBTjFCZwULsJ5Ll5SZCLZITb3ohrftzbBAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N6z+I4yXqaAw4AgeOdOxpSC345TB+2I6V7aKyT1AolAxssfzRjTVrXaFWz/T4216wmUrz7mqkPtd67ccMCSdvTv9r+tDy6wvmSivYVsGdCNaPUGPlM9CCX+P0yduJ2iyQD+4s7KW33zdAXC+lAo74KQZ+xYuHjpqNTwHslx2KA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-524038ba657so5112859e0c.0;
        Tue, 18 Mar 2025 00:50:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742284246; x=1742889046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6+4JvqI0yH73eoA6P9++DuYIBm7Dcc/eU5UhzKXwgA=;
        b=fsutWWZVdghGrSHEzVicqsx3N7nBl37K4bgGrcrlDl1SbdLf0SwVBoqXevl7QnUYW6
         7jVyQDmV7wN66Mtxn01n7TBOf4szseRWAC9iOAuo1Mhcf01wiMTmlGKhwbnijMcDl5bt
         knzpoCUPLkHUV3r+NjifWjIbd7Kfz8disUu4990cDDM+lfYdxJGZIdVcfS6+0gpJq/6L
         8f60grPGIiAPptsATSuQiBdopEMV2tM4ZI8BUStcpallb8VzILdtTq9pL+n4dN6OlP6c
         Gr/0OczG+QSEWajpRSJl/mqffnLH84U3zmZnI83XKGffjd646mkK8wcBmKilVt6cD4kh
         CMqA==
X-Forwarded-Encrypted: i=1; AJvYcCWZe1dtwLWdpl+ytx74iI6Ati43q5QD3SzsS7lqMts7JR0Oq7bZboNfxxju3/Tyg6P/Qn5XKiz8kBOnYog=@vger.kernel.org, AJvYcCWlp4ofmr1ZTzCn8hsXdGDneUwa0tt8IHR8NnJ1DN9W+3l7iVQ/ZPmK1QJu1RwUZfQoMIwip9o8XwrJ5mQIMw9+5P8=@vger.kernel.org, AJvYcCXLJWP1V69nvpzyUnpL0cR1JR+sjEAENeVsClP6f57zu2cMwxrUdx3UBUIxfvW80s7zjZQeGVPU8jeo@vger.kernel.org
X-Gm-Message-State: AOJu0YysW2Kof6hArk8LGTzAwT0JE8wiVglpiJjZmA1hN5mNCW/3Vtxv
	htMVxbKGgVoEv84GdNhwMRlVaNzwt5n9HW+bNc1Zg9GEhubRPTyFQtXZyxYv
X-Gm-Gg: ASbGncsFTCASPASfXxuRfRHm8wu6kxKd3p1eeUjS9FLpq+aVCQNcBE7BtrPZKt6TgjQ
	aVSFqHEROJPJXJgmnfuMROA8ZuuE++sbGLZ+fGXfZigJO6L/xel+u0PtL7EOby5d73UgunzPxy8
	aEAI1Po3QmmpiypKPHKFdRdSjSGTokyPkvRtab+fdGpvcyJw4vbntfEkp1Pa29YkNk3KIbPqQGp
	v3zOch2bZcfess/IH6R5D5R+GPgR5v54Wnbvjn1dLoYypnVNalC601WadACmLmHcgGO2ilsNxGP
	PiW046sk88wX/OCoJNX1xRx+eTFDr612+C8jKwfMGofY9hOn98s3syA3sTEJ+soDarYJ/vdZ/vZ
	B5UOQ0GbFDV42CHJMlQ==
X-Google-Smtp-Source: AGHT+IEoQEWgSGE+IJLTqdVYg4rfxE2g68QkqkNSm7kTuq7Y4ErohYnH6IE8QFUvbOUjOJJvMnMKww==
X-Received: by 2002:ac5:ce87:0:b0:523:dbd5:4e7f with SMTP id 71dfb90a1353d-524822a129cmr1426300e0c.3.1742284246382;
        Tue, 18 Mar 2025 00:50:46 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5243a581484sm1919884e0c.10.2025.03.18.00.50.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 00:50:46 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-86d6fd581f4so5188165241.1;
        Tue, 18 Mar 2025 00:50:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVUYNvXcLPZKwJZW1Ts6ik9Lb6i/ybC7l99rBU46Nrnin8GYYNrCRX17KKoEBN7pXqh+Vj1BCJS9SUP@vger.kernel.org, AJvYcCVt2bOMucz4tRC0c1k+PdTzfM1bFdY7quDTCWI9H+YT1SMKV5gPRchgTbdy30UJwPaqICKFEKaJt/cpN+g=@vger.kernel.org, AJvYcCXWIHCUFxe5r1/pJDHhPEJ9PSok8/Wb1GweSY3lFOVm1pNEHGoTnEM1tG/3EwDhDqv43VJDAtRydSmDiIcPtIrFp1I=@vger.kernel.org
X-Received: by 2002:a05:6102:570d:b0:4c0:435b:5dd2 with SMTP id
 ada2fe7eead31-4c4da49d31fmr1813440137.1.1742284245735; Tue, 18 Mar 2025
 00:50:45 -0700 (PDT)
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
 <CAMuHMdXU4JxDe-L+UcUwzndariz=mfed7UyVXW2Mv0yggXZw4w@mail.gmail.com> <20250317194419.GB949127@ragnatech.se>
In-Reply-To: <20250317194419.GB949127@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Mar 2025 08:50:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUn2zfxMDmYeRTdFXkhfYEybBuAi2-9WCDfZrKGqvmmMg@mail.gmail.com>
X-Gm-Features: AQ5f1JriXaLKhSkN-yEfzmicju7NPN9Q4AmTiGxARo3dMUV9-RiRKaZ5fYfQFak
Message-ID: <CAMuHMdUn2zfxMDmYeRTdFXkhfYEybBuAi2-9WCDfZrKGqvmmMg@mail.gmail.com>
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

On Mon, 17 Mar 2025 at 20:44, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On 2025-03-17 20:21:14 +0100, Geert Uytterhoeven wrote:
> > On Mon, 17 Mar 2025 at 16:37, Niklas S=C3=B6derlund
> > <niklas.soderlund+renesas@ragnatech.se> wrote:
> > > On 2025-03-17 15:57:31 +0100, Krzysztof Kozlowski wrote:
> > > > On 17/03/2025 12:50, Niklas S=C3=B6derlund wrote:
> > > > > On 2025-03-17 12:33:07 +0100, Krzysztof Kozlowski wrote:
> > > > >> On Sat, Mar 15, 2025 at 04:27:02PM +0100, Niklas S=C3=B6derlund =
wrote:
> > > > >>>    ports:
> > > > >>>      $ref: /schemas/graph.yaml#/properties/ports
> > > > >>> @@ -103,10 +138,14 @@ properties:
> > > > >>>  required:
> > > > >>>    - compatible
> > > > >>>    - reg
> > > > >>> +  - reg-names
> > > > >>>    - interrupts
> > > > >>> +  - interrupt-names
> > > > >>>    - clocks
> > > > >>> +  - clock-names
> > > > >>>    - power-domains
> > > > >>>    - resets
> > > > >>> +  - reset-names
> > > > >>
> > > > >> Another point, this will spawn bunch of warnings for no real rea=
son.
> > > > >> Just drop all the xxx-names from properties and from here.
> > > > >
> > > > > I'm sorry maybe I'm missing something, but if I drop them from
> > > > > properties how can I add checks to makesure the names are either =
"cs" or
> > > >
> > > > Why do you need to check for the names? There will be no names, so
> > > > nothing to check for.
> > >
> > > Ahh I see. But I would like to have names if possible.
> > >
> > > The driver is backward compatible with the old bindings, and going
> > > forward we have better bindings with names. All users are updated in =
the
> > > next commits in this series so the warnings will go way rather quickl=
y.
> >
> > Note that the driver does not _have_ to obtain the "cs" clock by name,
> > as it will always be the first clock anyway ("make dtbs_check" will
> > sort-of enforce that).  So you can simplify the code by obtaining
> > the first clock without specifying a name, and the second (optional)
> > clock with a name.
>
> I understand that, and for this fix this would be acceptable. I'm just
> trying to think a head, something I should have done when first writing
> these bindings...
>
> I'm fearing a scenario where we will need to add a 3rd reg region or
> clock. I don't think we will need that for the compatible values we have
> here, but then I never though we get the documentation that now allows
> us to describe the second region...
>
> If you and Krzysztof are happy without names I can move forward with
> that too, I'm just trying to learn from my mistakes ;-) I will give it a
> few days and then head down this road without names.

I would still specify the names in the bindings, so full ISPs have
all names.

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

