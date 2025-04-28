Return-Path: <linux-media+bounces-31183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E397FA9ED78
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 12:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5402F3B18CA
	for <lists+linux-media@lfdr.de>; Mon, 28 Apr 2025 10:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50B2025FA29;
	Mon, 28 Apr 2025 10:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="XuDAen29"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A7225E81D
	for <linux-media@vger.kernel.org>; Mon, 28 Apr 2025 10:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745834660; cv=none; b=TovVUFNxhEjrjpHpUru2a9Hhq9y2QP5hfAFsqyZHKTBv5blKDnqvhjPaMtSMtIEfTx4VGk2wz98StSH2cP/B92z542+9yRQQNQpweGETenkca/fY/zGE3QBdQlaC4pzMCHTIqoezfNmoLvuh+HVfgNQxhcYqJYlJtm3rZML5o9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745834660; c=relaxed/simple;
	bh=7fEi7r0yARLjuil18ZtvROfpnOhugcWbqFxzNrQ7poA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r78zqnWegslUi4WMcaVtV6HN+UVUkELWuRcjhlruDDtUvgG/rli/+yTXe9uWh4vu2BKRgG5He2HYq6b/H7kN85CcFRuM8oHdncN9T+l1ImNskPdhkHnzAIqQyXzv/qGyMFGlSfLCbE857u+lPmVwxDECMvNi81Vu9cg8p7POGFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=XuDAen29; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6feab7c5f96so41267827b3.3
        for <linux-media@vger.kernel.org>; Mon, 28 Apr 2025 03:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1745834656; x=1746439456; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ucZUAd/InboFfZClRnamk8ZirwH9aq8qtdNhcPq2zyw=;
        b=XuDAen29ddH33YH+K6Bzi31F76xCI9G395V361MsYx+HnpruYe+JR6/IadUAKIkbWi
         7nIdnGbgVzMP3ijtTnU2f5+YY5KEbgFxoqFaRi1n9SqrztbA5nvmIpBmm8MVbe2ebs8J
         0Mj9sfYerMOU1U4ZwGncImyE5wOTMKGDW7WZWCvz9Q3e0PiC9KBJbPbS9ohQlH2j2bT2
         qIsE0kUnf1ITEahJYNT6DKHpnf2RUitQe4r4BU6NQ+bW6Ul4J+9vuKm0WGYAX12GDpjN
         EOkGBuu0rfK4oMhPgq87DhhGmi0ZF7koc5cN0kAU/kn1D8qKCu7eyRdD9r0GAFHSBenK
         mMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745834656; x=1746439456;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucZUAd/InboFfZClRnamk8ZirwH9aq8qtdNhcPq2zyw=;
        b=VpUuiOHUo7qVS6Pj2TNUdBcTEB4BzzkFDHqhlg5+mvnVzRoG3MsU2LocH0+KrQN7Hv
         LxkHoe4nqXoyNd8YXxqWeb8DJI5YCAA8bnBwwYQtRh1hVhwiXfR99p9LpUVJhjHZYtbz
         sFfdK6JiAYC8ftUu1Bqihzs7WkgiSv3QmLi+vlCuqsnoqlZLp8iy59JE50oRtFK2XUfv
         n9FmJchEAVTTFfjMeL4Pg0KO2PJsy+Amw56KfxjwbT9MoriRBzjQU1QY1uDSv0FuZwoa
         LuJLPQuOYp7tZmpXXCrBhAaR6tB9/dF9WFvVC8JzyoKrOmq7avgklypKj8n/P/SqF8Fw
         R8Eg==
X-Forwarded-Encrypted: i=1; AJvYcCXt378D8BT3qLyJpKJZN7VjIHoQVAS9N4/DHTAt50EcrornViied0Nr8T2zIK3udXkmy70sVo0uNjG0rw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7A1mF53u4VPSDi5f0Sui7PC9DsCabRIN8mIO7Uvqt73YKH811
	vl98z/EGPGKt9SWE7OgxMjrQYFNj8Pd0NFMg4D+x0KKS5/3CO69x+qP6lWN1gFpzAtGLCQb+dYe
	PAELSYlBmSgfY1ZWhA/4eI5nLhtvSDxqVfQFQIA==
X-Gm-Gg: ASbGnct6MZdcvyCJnuNlKFlV3slVJ3r0yF/GPQG/N7FKUGhC91Q6yLwgNQoPbSPHAl1
	NHIPR8otNFxefiHeZYBfVbPB6VLCz7g5KTWzDXC5jzqwAyj4bhwJf14Kkgc5THB0jVatS0nqlUe
	WPE8d3vx+CetVdpH1riGe1kA==
X-Google-Smtp-Source: AGHT+IHLAwgs2jvyhndbI9eeTcAvfYwmKCKu2Wwt19IFmNuoMlsiM2VhTNy+bvMEOC6zz520PPUY1yZ92SlmTgkYlVM=
X-Received: by 2002:a05:690c:7084:b0:702:4eb0:6af with SMTP id
 00721157ae682-7085f252950mr116417097b3.31.1745834655665; Mon, 28 Apr 2025
 03:04:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
 <20250423-media-rpi-hevc-dec-v3-3-8fd3fad1d6fb@raspberrypi.com> <20250425-inescapable-beagle-of-bliss-8ae3ff@kuoka>
In-Reply-To: <20250425-inescapable-beagle-of-bliss-8ae3ff@kuoka>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 28 Apr 2025 11:03:57 +0100
X-Gm-Features: ATxdqUGx5uUk2kPmuSg5gFgBWEs3E2SY1xjorpWkszYXuV-kigFS84yL46qfHpo
Message-ID: <CAPY8ntCWzp9cRKwLg44G20jG17q2KhavZa_8qpodhGUGS2Bc7Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] media: dt-bindings: media: Add binding for the
 Raspberry Pi HEVC decoder
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, John Cox <john.cox@raspberrypi.com>, 
	Dom Cobley <dom@raspberrypi.com>, review list <kernel-list@raspberrypi.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, John Cox <jc@kynesim.co.uk>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof

On Fri, 25 Apr 2025 at 08:53, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Wed, Apr 23, 2025 at 06:20:20PM GMT, Dave Stevenson wrote:
> > Adds a binding for the HEVC decoder found on th +maintainers:
> > +  - John Cox <john.cox@raspberrypi.com>
> > +  - Dom Cobley <dom@raspberrypi.com>
> > +  - Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> > +  - Raspberry Pi internal review list <kernel-list@raspberrypi.com>
>
> Drop, no mailing lists in bindings maintainers. These must be people.

Ack

> > +
> > +description:
> > +  The Raspberry Pi HEVC decoder is a hardware video decode accelerator block
> > +  found in the BCM2711 and BCM2712 processors used on Raspberry Pi 4 and 5
> > +  boards respectively.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - brcm,bcm2711-hevc-dec
> > +          - brcm,bcm2712-hevc-dec
> > +      - const: raspberrypi,hevc-dec
>
> Not what Rob asked. You should use specific SoC compatible as fallback.

In which case I don't understand what Rob was asking for.
I asked for clarification in [1], but got no reply. Sending a new
version has at least got an answer, but I'm none the wiser.

Staring at this trying to work out your meaning, you want the generic
first, and SoC specific second? ie
+  compatible:
+    items:
+      - const: raspberrypi,hevc-dec
+      - enum:
+          - brcm,bcm2711-hevc-dec
+          - brcm,bcm2712-hevc-dec

> You referred to file "raspberrypi,pisbe.yaml" before, but there is no
> such file in the next.

Typo.
https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/media/raspberrypi%2Cpispbe.yaml
Reviewed by Rob only just over a year ago [2]

> Before you reply that there is a binding using different rules: well,
> there is always poor code. Above two comments are repeated, especially
> this about specific compatible - all the time, so these are not new
> rules. These are given in reviews since some years.

My Google-foo is totally failing with the only directly relevant
mention of "fallback compatible" I find is [3], which just says to use
them.

You're effectively saying I can't take anything in the kernel tree as
being a valid example as it could be poor code, and a layman such as
myself has no way of telling.
Could you please point me at documentation and examples I can rely on,
or educate me with what is wanted in this situation to avoid me having
to guess?

A further mailing list search has brought up [4] which is a thread
with yourself from 2 years ago which looks to be a very similar
situation. Other than missing the const on the SoC strings (although
that isn't in the merged version of cnm,wave521c.yaml), and two SoC
specific strings, I'm not seeing an obvious difference between there
and here either.

Many thanks
  Dave

> Best regards,
> Krzysztof

[1] https://lore.kernel.org/linux-media/CAPY8ntD3Frq5HzV06OrS1051QfjJFzvqs9H4mUkVnd4QKqiMhg@mail.gmail.com/
[2] https://www.spinics.net/lists/linux-media/msg250095.html
[3] https://www.kernel.org/doc/html/latest/devicetree/bindings/writing-bindings.html#properties
[4] https://patchwork.kernel.org/project/linux-arm-kernel/patch/20230929-wave5_v13_media_master-v13-6-5ac60ccbf2ce@collabora.com/#25567148

