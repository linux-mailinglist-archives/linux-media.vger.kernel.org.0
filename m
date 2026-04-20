Return-Path: <linux-media+bounces-59167-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OzFFrBd5ml6vQEAu9opvQ
	(envelope-from <linux-media+bounces-59167-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 19:09:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C32644309F5
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 19:09:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D5174311F1C2
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 16:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FCB4355055;
	Mon, 20 Apr 2026 16:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0aIgab6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D701034D4E2
	for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 16:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702939; cv=pass; b=l88oZ8dqpj6OLzVrSWNoVZCBupQmAnrcE6Lj9Fq7Mh0b1NflEObqqDMkCp55WcK2+Tq/jiJFsA4F3iyfFBT12K87LTEU3y/ouHIrpWRpAAwNQIBfvB19Xc3zRJo6U/mlDsGsXqhDS9dJeO4wOGmw47/9szmLXVG1+hsypoY+V4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702939; c=relaxed/simple;
	bh=dm4VEkAvxh363XWDUknSCcCouYOtOHI7Nni0i+AXBJ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CzJnpMeU/MyNz2ZnqH96zVP5IOvpkZTcOJS35Ou9xgzOaVJsdG6VnSL9hT5LXEqYzjcf2K7LDckBSo2vxQDYcJJwpPCa/lm7C5AsvSH8MrxXAg0pln9E86E/YZtkC2djkKOTcLh1H+pmQoLHCZoagJdISJxwXDBeHfNwaUxRTu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0aIgab6; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43cfde3c3f3so3602446f8f.3
        for <linux-media@vger.kernel.org>; Mon, 20 Apr 2026 09:35:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776702936; cv=none;
        d=google.com; s=arc-20240605;
        b=HykPPLtR4eO9UCM8QlaoOVGdtopjlWUKCCDCLOoyaLg5t01JFHY0oRZOCQrtQI2djT
         tpAUY6xDiktNmcVpOjEc257pKmaXThgvb+7O0GdNayT8EaN9WJpL5zD62tDoryus1oh2
         M/2V6GRZAVpM2Y5eWR57J9tkE01lzm1H/oSxH8L314tt6/9UwQqNpm3NzLEwUE7sX/h1
         XxkK0b2pKQANjtx5+gsv4mOLAA8KDxH9rsZmdlwinPqqRjEW22vyCemv4V0hXU5pPYHs
         JfnDGqvAXARyJeTnapYZDq82Bzmb0m8Jc0QrwEOz2fQIz0b76JQ+nahzgyLdqsF7fGw2
         aScg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/NzBywcAbSbcv7VKhOwZIiQyYm6oCAIzmcwL6dNhx9I=;
        fh=5jhe7EBv1v5/22iNlZZZPpVIkhWA6DZxyup3yn756Ls=;
        b=A+cj/JB2pAzLMxZpZpMu6+yNBwcUqM47TKxKWsg861bZ9VeaQXnHC2vn85uu6tefvK
         FF7T+aGpxb8h48tRGbcGCUB/H1pQ1Mv9o5p2yV6Ahbtlfht3iJ7lytxBN7TYTwrrNbaT
         r7DXFF+n6QoB56HHGGUgV7FW6KApkZYyks9gaRHBNE8fnuJ2QurlW/LsEQju70lj4ucV
         Hp7dNIKt5lYohIxvvyOq1zfo4nSZS2OVEv9suYhvk0jjU7S5vQ9VW26NZklw02e5f718
         v0h05qkZHkYT0ydSHaxARSWi74VtQbZ5S+m4oKnh8RmTZHd2VqsNUaNi2J6goxWA87h3
         ze/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776702936; x=1777307736; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/NzBywcAbSbcv7VKhOwZIiQyYm6oCAIzmcwL6dNhx9I=;
        b=Y0aIgab68xhSo9pLmILN7F6LeQo1C5aLJZ1pql3C6JZ4sUGOP8MBbCHN1yMVfM/j1E
         2qlY61CSkPmSI8XxAnyzBoRInslJNtKjhsZd3ITWv2nw0AIliB7UkQC3zMb+YSjetpA4
         maJPp6tXuygmjv9cPsMNczKA3NNyjabbzV7dLQu/3kXnIA0wE67x+CnyoCeXbIjZNH90
         TALWggwxiHMJ50w4iW3fNPASGXL2vRSYzpf7oy8EEOSnJXZj+Ax6+f+X8aoXlm79Qr6K
         WwkVJadiaNU8MgnP+G7yHi4KAlNm7qlmwrUsZsa+goyJW6hsT1+GEzi8ndr9K3zmntaq
         v2Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776702936; x=1777307736;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/NzBywcAbSbcv7VKhOwZIiQyYm6oCAIzmcwL6dNhx9I=;
        b=I/5C1NXdXw1U4PWLt1XP6oAm2OQjFPwTMqy1T1y3bphl25KwnGuUz5v9CKMPQ6iqU5
         jgsOxLOiG4rI1CRjg/Fs+3panSfSWxTiD9XYgWDHZ6w/R5ff7JO+skZY0lHkhZMziCyP
         uXowZMAq0MC39gr2HhSRGNKBfhQJBlRgGTkmJZ5Uj8lzLT/oYCBgnlFwOlAT9/BRzboY
         rpbxAiizjKvRMWf42wox7WjfniUxWLRC9kBzWe6ybkWBYKmjro4uAoQISR7N3AEY6znF
         pXG/0cz5mRMq/JVQfRJVwXySH8xT3iRodLpix5FzwO0AII0+DHU+pTFkbwV66xSAM+Wv
         9Vzw==
X-Forwarded-Encrypted: i=1; AFNElJ9620O0UjxQI5zhxgewza5n2Hdu2WSQhh+e8nrN1gojiVwxIebyxjGozGrEb2+8vTyn4NVRF7AdT2++MQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyByElHA5Hh+J5AGx1E+DFn2rUUTBuIW/MGXdeGz4/Fh/t95sru
	AbeGjwqbecLgoF21EVzl07/NfwKFn/TNO2EsCUtRSRjoynbHrC864vEjx2lIMV5QajaMtD0ePsV
	lXiC79q9owgzKxLAeRK/YeHS9oab5go8=
X-Gm-Gg: AeBDiesp2LilDKyvJQUxiMUwh83IJu1FagOZkZ/XARrpcg+RX5qW1p4k1SUoDehDTCH
	JCp85cOSIRAMcLmbHNiEKmuDEAeSYy2gufDgXOtPi34oLhy5FK4lSmLdgpyG3eQB1yE+HaSqStu
	o5BpWLzL4Ur+8VYeY9wcbbimZZfOMN1+vhClsBWDUmkABeP0zVOnVxIRfpWyxGGPXV4gdg8hD3v
	Aj3UY6vHD9nzJzYba2gkfiaYy8vflpZfP7cAwTQ60wtHczwwn1TTy9N6hYSm1nuBmxgRkPzimPd
	22zOg2n8LYHbVkaFHM4=
X-Received: by 2002:a05:6000:144c:b0:43d:6a0c:9571 with SMTP id
 ffacd0b85a97d-43fe3dd339emr22528757f8f.11.1776702936000; Mon, 20 Apr 2026
 09:35:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419093412.40796-1-clamor95@gmail.com> <20260419093412.40796-2-clamor95@gmail.com>
 <20260420-affection-ferocious-e28cd29f360a@spud>
In-Reply-To: <20260420-affection-ferocious-e28cd29f360a@spud>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 20 Apr 2026 19:35:23 +0300
X-Gm-Features: AQROBzDU7oJToDi9XY48OuEZo2_fLXR3JR-e25Teo--fz4-F-ARVoBLm8Mnqm74
Message-ID: <CAPVz0n269feZqC=RoR5fjTTvtnJ4bxUWOLS3Aj9N4EX4+DLoCQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: leds: Document TI LM3560 Synchronous
 Boost Flash Driver
To: Conor Dooley <conor@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-59167-lists,linux-media=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.53:email];
	NEURAL_HAM(-0.00)[-0.619];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url,0.0.0.1:email]
X-Rspamd-Queue-Id: C32644309F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D0=BF=D0=BD, 20 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 19:2=
0 Conor Dooley <conor@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, Apr 19, 2026 at 12:34:08PM +0300, Svyatoslav Ryhel wrote:
> > Document TI LM3560 Synchronous Boost Flash Driver used for camera flash
> > LEDs.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../devicetree/bindings/leds/ti,lm3560.yaml   | 131 ++++++++++++++++++
> >  1 file changed, 131 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.ya=
ml
> >
> > diff --git a/Documentation/devicetree/bindings/leds/ti,lm3560.yaml b/Do=
cumentation/devicetree/bindings/leds/ti,lm3560.yaml
> > new file mode 100644
> > index 000000000000..c6c553ad23f9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/ti,lm3560.yaml
> > @@ -0,0 +1,131 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/ti,lm3560.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: TI LM3560 Synchronous Boost Flash Driver
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +description:
> > +  The LM3560 is a 2-MHz fixed frequency synchronous boost converter wi=
th two
> > +  1000-mA constant current drivers for high-current white LEDs. The du=
al high-
> > +  side current sources allow for grounded cathode LED operation and ca=
n be
> > +  tied together for providing flash currents at up to 2 A through a si=
ngle LED.
> > +  An adaptive regulation method ensures the current for each LED remai=
ns in
> > +  regulation and maximizes efficiency.
> > +
> > +allOf:
> > +  - $ref: /schemas/leds/common.yaml
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ti,lm3559
> > +      - ti,lm3560
>
> What differentiates these devices to the point that fallback compatibles
> are not suitable?
>

noted

> Cheers,
> Conor.
>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  enable-gpios:
> > +    description: GPIO connected to the HWEN pin.
> > +    maxItems: 1
> > +
> > +  vin-supply:
> > +    description: Supply connected to the IN line.
> > +
> > +  flash-max-timeout-us:
> > +    minimum: 32000
> > +    maximum: 1024000
> > +    default: 32000
> > +
> > +  ti,peak-current-microamp:
> > +    description:
> > +      The LM3560 features 4 selectable current limits 1.6A, 2.3A, 3A, =
and 3.6A.
> > +      When the current limit is reached, the LM3560 stops switching fo=
r the
> > +      remainder of the switching cycle.
> > +    enum: [16000000, 23000000, 30000000, 36000000]
> > +    default: 16000000
> > +
> > +patternProperties:
> > +  '^led@[01]$':
> > +    description: LED control bank nodes.
> > +    $ref: /schemas/leds/common.yaml#
> > +    unevaluatedProperties: false
> > +
> > +    properties:
> > +      reg:
> > +        description: Control bank selection (0 =3D bank A, 1 =3D bank =
B).
> > +        maximum: 1
> > +
> > +      flash-max-microamp:
> > +        minimum: 62500
> > +        maximum: 1000000
> > +
> > +      led-max-microamp:
> > +        minimum: 31250
> > +        maximum: 250000
> > +
> > +    required:
> > +      - reg
> > +      - flash-max-microamp
> > +      - led-max-microamp
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - '#address-cells'
> > +  - '#size-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        led-controller@53 {
> > +            compatible =3D "ti,lm3560";
> > +            reg =3D <0x53>;
> > +
> > +            enable-gpios =3D <&gpio 28 GPIO_ACTIVE_HIGH>;
> > +            vin-supply =3D <&vdd_3v3_sys>;
> > +
> > +            flash-max-timeout-us =3D <1024000>;
> > +            ti,peak-current-microamp =3D <16000000>;
> > +
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            led@0 {
> > +                reg =3D <0>;
> > +
> > +                label =3D "white::flash";
> > +                linux,default-trigger =3D "flash";
> > +
> > +                flash-max-microamp =3D <562500>;
> > +                led-max-microamp =3D <156250>;
> > +            };
> > +
> > +            led@1 {
> > +                reg =3D <1>;
> > +
> > +                label =3D "yellow::flash";
> > +                linux,default-trigger =3D "flash";
> > +
> > +                flash-max-microamp =3D <562500>;
> > +                led-max-microamp =3D <156250>;
> > +            };
> > +        };
> > +    };
> > --
> > 2.51.0
> >

