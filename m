Return-Path: <linux-media+bounces-5056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 515EA852B4A
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 09:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3717B228E4
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 08:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 294A01865B;
	Tue, 13 Feb 2024 08:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="M+l6xsqK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED88D1C6AB
	for <linux-media@vger.kernel.org>; Tue, 13 Feb 2024 08:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707813378; cv=none; b=JRyEp8u/EEIKg/obi72sGl8LDzXRSyXF8AbEVkul0IFlD5AAnka8Pma1ig4V+fi5PHIjjV8y9S6WOrkq1eGo9FcxH1M2XqHO+0crY0U0LAYi4ye1q5al867I4wuvVBXJNHkYsK7E1JtjftxwTndSWrmeqO0I8kKPCY7ES82r4j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707813378; c=relaxed/simple;
	bh=mDukPBKr3Xk8Mefu28gVTkdEH0Hv2hGdWUSm5teWlBg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FYFGYnSeOHqGOiODKU1+5zrUneZ1kjliAouj2kPA0/JlCXN+jtLK99wUtNiYgU4gcklnQDGQyUb7OmBjfxFWr0tBH56ObluvoSbNjG94UuFROO5QnOWFsxNF1QCjUj1d+lcY0ej5oX7B6JA61DSFLJHASNrZkKLDOZmLuU+Fcv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=M+l6xsqK; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6002317a427so36618017b3.2
        for <linux-media@vger.kernel.org>; Tue, 13 Feb 2024 00:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1707813376; x=1708418176; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kajttsvUANHUaNsyP3l39ol7GX1p8iwx0Lu08hUgqCU=;
        b=M+l6xsqKIooUaJcqGvFgs/IvCdEZf3z4yv6vaoAvIM/Q+q+j85duDzQogsVY8g87NK
         QLw08TswC+YMnlgG15SFxBeCp4hOKG+6NsHdRROi7L3UwnxEsrwfKheJ8rUrXiPdEcAO
         FlOLfxjS5ddUzDSnj6yEE5dxvkjGfodIMtzduNMCJ2ouwPj/YKjOQ/DRJCNnC3zugz2U
         I3GZTNWK/gCzQ7QT62xQP2ENI5bXUGF8p1D2Str0OIJf1NHNX0QwHwkXMsyOEGRT56rU
         e2PSYHbBNuelIn5B2ptd4VUfw3abaoFgo1cdattN3rBGEp/yYkSHxXS5JXjMYxhorZgA
         F4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707813376; x=1708418176;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kajttsvUANHUaNsyP3l39ol7GX1p8iwx0Lu08hUgqCU=;
        b=akQxwzL1xdbcGpuWAis6UU2xQ7v2cyFGmQrMsxiq6vz9oNaWIt2cIv6RE40HSos2ka
         Weh4eZUSBQwlcoEk7KooRSmh26m/bu0rR7maMlo1B4wLTkIh4EJSi9i7l6U+Hgm6hF17
         UUa89ErsVX27yaHq6/XAdngv0Kzb5C6NxjNBb/pMRXF8+iJ2aTBYDfih3M+oqU7ZsApZ
         nynvyF9Wdodadr7zMJWEy4/YB7KskpN2tJYPO7lckAE2m9ZG8ciSGe9HOD49suciXD/w
         XWY7AzTA8F2Fpad099+mifjW/x+HU7zJhIJDaSNXGa5qrPzVh6sKzJNJ1JNVPo/kx2ZA
         jObw==
X-Gm-Message-State: AOJu0Yx/I4xAilm/oO8JxurakE6d/Vy47zBZBR7Uk1MhF9xBE3zs6qgt
	xu6VF3DWbOX4xsI3CWQ6fL3KHXXFBOrlpycPFLn06iOE/BQMpxNlMY+71y62ACHUK4iNWeZgCwA
	JqHauWINd+/NznRBXcexThnVcPKmeYraF2NiCSQ==
X-Google-Smtp-Source: AGHT+IHJzEzSyd53b9+rOHzNSx0pPrmjRSMLLeRT+ICU1LSnVG3IxoWBOiuUlkvuIv1eKcVs5zDUhk1ngnfzPZ9QKOw=
X-Received: by 2002:a81:77d7:0:b0:604:7b59:4472 with SMTP id
 s206-20020a8177d7000000b006047b594472mr6769809ywc.31.1707813375646; Tue, 13
 Feb 2024 00:36:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240209164825.166800-1-jacopo.mondi@ideasonboard.com>
 <20240209164825.166800-7-jacopo.mondi@ideasonboard.com> <7f7979af-8eda-48cd-a334-bb64ddf5b9b8@linaro.org>
 <myfjzqh4wqa3lf4dcrgaswrarlh7sril6vz3mtnbz646rwxylt@oz75b5j5srot>
 <b55f4d1e-2e77-4539-8d18-8d8f2185b501@linaro.org> <5db2c830-2615-4416-9bb1-18fcd2a3a980@ideasonboard.com>
In-Reply-To: <5db2c830-2615-4416-9bb1-18fcd2a3a980@ideasonboard.com>
From: Naushir Patuck <naush@raspberrypi.com>
Date: Tue, 13 Feb 2024 08:35:39 +0000
Message-ID: <CAEmqJPo-A4wiAiuCa2pb84UU_rTTo9i5P9Kj6eo78MFEs1Y45w@mail.gmail.com>
Subject: Re: [PATCH 6/8] media: dt-bindings: Add bindings for Raspberry Pi
 PiSP Back End
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Plowman <david.plowman@raspberrypi.com>, 
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Sakari Ailus <sakari.ailus@iki.fi>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Tomi,

On Tue, 13 Feb 2024 at 07:28, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> Hi,
>
> On 12/02/2024 11:05, Krzysztof Kozlowski wrote:
> > On 12/02/2024 09:50, Jacopo Mondi wrote:
> >
> >>>> +properties:
> >>>> +  compatible:
> >>>> +    const: raspberrypi,pispbe
> >>>
> >>> Nothing more specific? No model name, no version? It's quite generic
> >>> compatible which in general should not be allowed. I would assume that
> >>> at least version of Pi could denote some sort of a model... unless
> >>> version is detectable?
> >>>
> >>
> >> The driver matches on a version register and that should be enough to
> >> handle quirks which are specific to an IP revision in the driver
> >> itself.
> >>
> >> Considering how minimal the integration with the SoC is (one clock, one
> >> interrupt and one optional iommu reference) even if we'll get future
> >> revisions of the SoC I don't think there will be any need to match on
> >> a dedicated compatible for bindings-validation purposes.
> >>
> >> However I understand that to be future-proof it's good practice to
> >> allow a more flexible scheme, so we can have a generic fallback and a
> >> revision-specific entry.
> >>
> >> Would
> >>
> >>    compatible:
> >>      items:
> >>        - enum:
> >>          - raspberrypi,pipspbe-bcm2712
> >
> > bcm2712 is manufactured by Broadcom, not Raspberry Pi, so it should be
> > rather Pi model?
>
> Indeed, this is something I don't get. If the BE is in the bcm2712, is
> it not a broadcom IP? Why is raspberrypi in the compatible name at all?
>
> Naush, Dave?

The Backend (and Frontend) IP are both owned solely by Raspberry Pi,
and the BE is instantiated on the BCM2712.  So I think "raspberry" in
the compatible string is correct here.

>
> >>        - const: raspberrypi,pispbe
> >>
> >> do in this case ?
> >>
> >> Also, let's see what RPi think as they are certainly more informed
> >> than me on what a good revision-specific match could be
> >
> > I am fine with auto-detection, though.
> >
> > ...
> >
> >>>> +
> >>>> +examples:
> >>>> +  - |
> >>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> >>>> +
> >>>> +    rpi1 {
> >>>
> >>> soc {
> >>>
> >>
> >> Are you sure ? This will only ever live in the 'rp1' node.
> >
> > What is "rp1" node? Does not look like a generic name.
>
> I don't think this is right. RP1 is a separate chip, an IO controller,
> on raspberrypi 5. BE is not in the RP1.

Oops, missed this.  Yes, I think it should be the "soc" node.

Regards,
Naush

>
>   Tomi
>

