Return-Path: <linux-media+bounces-59015-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDxIAEwo4mkY2QAAu9opvQ
	(envelope-from <linux-media+bounces-59015-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 14:32:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8906D41B3D3
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 14:32:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 40C1130B4A10
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 12:30:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B44538AC8C;
	Fri, 17 Apr 2026 12:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dizukVIj"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2519840DFCD
	for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 12:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776429046; cv=pass; b=iiWns5syIJcyrpor5IDUN2BZAWKMwGUutSOgEbEwwKXfJnRaOek+oAURijZ9hLYHhwSigiVeXhFoBs0NNhYPVqUg8HnI5a3xVQXQrPECMbm92ot91+TUUbYw5+VWIMkAqykjq8WoSV82RXjsLUIYLP/5gByT6dO+U3B+VSjeH7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776429046; c=relaxed/simple;
	bh=ZEh9eTjwFPZ3QnfRFXk0+uFn/4lL3yczZsSKU/HfvO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BOKXUtDA09JQ+IfU6TrmVCGtnzgGYl8a9tLt3IR44zrQG0ON6Chjh5jxopqvKj15NAinJFnNFI0RqqUOPx0fxiYbSE1FMA1O1P2dbpAtvtoblIjK2/8R1AtrRzK/SfIWhM9472hfc9Dpj7pLqRvTLyM96lbxiGea7ECZ8EIo2G0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dizukVIj; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43cff5dafc3so454016f8f.1
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2026 05:30:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776429043; cv=none;
        d=google.com; s=arc-20240605;
        b=H58FGClofzjltoUicuT+1SFmPck/uzKYlVHFY5f9xbzJN0hiuEOqx1CbYMysl1qb9z
         D3JJGWDY+rIIZRTf9DpCdgHsP80/Ckq7g7mYFikxUqNNoGK7591C9Lpi3RyEAdZRDgU5
         kXppDeuCZXpd+r4xRvs0gGJaWNd06Do9LPBqdPNzvM2+R7VLxZPaUGEKPoQ4jB0M6CPy
         xPKCFs0HkXDpyvA/6gdMFAzji9wK3yRnFvR/6X623O0HwTQ0xzQVp6vXd1ag9BmkSRCj
         ILmJJGLCbg0GmT2k6u5FM2K4mbDVh46nBKeQqnJN8HmssA46TUSqIqwdpjQTf7N6VNyU
         lRuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3RbDXw7oOLyQBxsRsPjm752yvj7/SEG0Ag12AzayEHM=;
        fh=GFBkn6iyhN7zq//CsR0Q6gJ/UY0+3qBX58V4/P9jTwU=;
        b=LGjnOfYn0GJXIBplH/E0iPr/rVamF0oQoxTHriRpDFQIxUX+ht8UPlKI3nPS3C1eC0
         rWTD8KiW6INGHrzxuHaziauGv4h5XXfbzrlO6dTYPzO428wg5Kq10QfCk2Ool7meu3ds
         5i2XggDjOCdct7QBGiU41uFvbHvnNtCJwBYnW0mp/B5P3gnpPpm+yR3o2v0cfPfij+OR
         x6azQSfJDj/MGqMviYi3Iv9GuCCf9X3RcYI67qxEWmAuDg2h5XA54ajf1tsF5n9lZUvx
         AQfAswI/qf1TEcR1BcvrXWsD1Dz5OvrH2lOO3tM35uLCJbaK2mqSBcBmbl00iu7BI27h
         5loA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776429043; x=1777033843; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3RbDXw7oOLyQBxsRsPjm752yvj7/SEG0Ag12AzayEHM=;
        b=dizukVIjeYZqOYLQNuIA7/7LSPp9W2Dvp17OWDzNpdeQa8NfymHBByQ3YPHm5OQH0k
         CrdHjVqEzUSEzejUMFEY9tMfhHMNe9fBxkEV6Pr6jtbreBjwUDoun/hOZ9TS27cT3c9g
         +krfz2qIe+rNoS5N3XCirWrCtyZjKQz0qg6fT6i8ekALk2rkLtmmtQTQV/X1NVGOLiER
         QuJK/YlDN7YJFVixyu/mGnRThnTu5ufRv8kU60WAUVxc8I+krjjmQmPHANsXGaR3OVeb
         XjU33MLRbKl6oXl9RQaONCMsPPcdE9LUcd2jsybfsP3yXAd+sZh7X1UwCle5MI4xLz4C
         K7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776429043; x=1777033843;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3RbDXw7oOLyQBxsRsPjm752yvj7/SEG0Ag12AzayEHM=;
        b=G1X7ugEc2jggPF4e2Io9fPMCCVYU5V5WNQl+ZSiOazQsn93Kpwca9pFJTBzut+OdrH
         lV06aI2jCStN5jYxrKrkMgAmf+gHjYp22+evFPEb17d+H2C2kQO6ADfJAqkv2KJeIxKh
         ROpjSqmUtRVZe14AWUW0mHhODrgBnoVp6qvStRhEl1ZzIaREEyODMfdeXCLi7tI3AqeE
         6R4Vkk9Q11fasykzefqdxhWRW8Sy1AD3h2jixbSZbajNvoF3dHa6bmqnO+8d6axQPGNV
         x0VnVVWEHW7an8otW/nt9JV5AnVcAu89CXep0arApJ9joM4N2zNFznwddmqggLM5M829
         gjMw==
X-Forwarded-Encrypted: i=1; AFNElJ8Z/UGIDJfEhWmQbq3xcllLKuFN8hwL5ONlF8+X1aZYppSe70lviNm29Ev1ycukrq0lXozRSvPpKCCfOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeSA1JrNh6J1H7LyCqyha+IDyTEjnOYlwGOIj1bkKvokuKAgod
	hHEVH2dxw3G+5HSTCIVsDUsFLKlBXj2TCmeM9yd+3m426EWIxd0zaa5axSRdUp4GRTQ1JSf3tIK
	NODKd89FAJ1QhYQp1rMXy8CTz9eOmV3g=
X-Gm-Gg: AeBDievwJTNYHm6ej10pjRKBWWM07BYCrLGMggR7VMMPASaVQLY0v/rXdE57hiQ8aZh
	ejEJSqqKskblOC68lbI0/RpGnt+B9nLFacSQzdjk9Cbcy2bGTAjWbnr1+SUT1tV004W9bMJXURh
	ACPzFBg0PshakLe6npWRRfRIdCNF02/J28xBlr/RQD9UZAsoZSglU5XxGSUeynjaVjzdvQQ/D3M
	nLTMw+ZrnGt/o1DEbJkghKE32BOkJRlOhoo8ODth5ISc3IYp7JXk1ln8UOXvQHuhlymB2b2EjeA
	lIoRKd6wPHrXcr665QU=
X-Received: by 2002:a05:6000:2890:b0:43d:77c6:be78 with SMTP id
 ffacd0b85a97d-43fe3e16c4dmr4209904f8f.39.1776429043184; Fri, 17 Apr 2026
 05:30:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417114226.100033-1-clamor95@gmail.com> <20260417114226.100033-6-clamor95@gmail.com>
 <aeIkBR4cx54OVmGo@kekkonen.localdomain>
In-Reply-To: <aeIkBR4cx54OVmGo@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 17 Apr 2026 15:30:30 +0300
X-Gm-Features: AQROBzA1dd8_0NTxSqGN0BqxldytYvwtdWN7VaTpfF2Ohg6pumR-lzUZ706dVSo
Message-ID: <CAPVz0n3wi2yzVc0noYe=5=VR2NWEeyXke3EPKJpSPm81qrpp4Q@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] dt-bindings: leds: Document TI LM3560 Synchronous
 Boost Flash Driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [3.34 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59015-lists,linux-media=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20251104];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	NEURAL_SPAM(0.00)[0.353];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.1:email,devicetree.org:url,intel.com:email,mail.gmail.com:mid,0.0.0.53:email]
X-Rspamd-Queue-Id: 8906D41B3D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

=D0=BF=D1=82, 17 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 15:1=
3 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> Thanks for the set.
>
> This patch should be the first one in the set, or at least before those
> using the bindings defined here.
>

Maybe before conversion, but definitely not the first. I would like to
avoid patch multiplication caused by schema adjustments after every
single commit if possible.

> On Fri, Apr 17, 2026 at 02:42:26PM +0300, Svyatoslav Ryhel wrote:
> > Document TI LM3560 Synchronous Boost Flash Driver used for camera flash
> > LEDs.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../devicetree/bindings/leds/ti,lm3560.yaml   | 134 ++++++++++++++++++
> >  1 file changed, 134 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.ya=
ml
> >
> > diff --git a/Documentation/devicetree/bindings/leds/ti,lm3560.yaml b/Do=
cumentation/devicetree/bindings/leds/ti,lm3560.yaml
> > new file mode 100644
> > index 000000000000..460ea1fbc1e5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/ti,lm3560.yaml
> > @@ -0,0 +1,134 @@
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
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ti,lm3559
> > +      - ti,lm3560
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
> > +  ti,peak-current-microamp:
> > +    description:
> > +      The LM3560 features 4 selectable current limits 1.6A, 2.3A, 3A, =
and 3.6A.
> > +      When the current limit is reached, the LM3560 stops switching fo=
r the
> > +      remainder of the switching cycle.
> > +    enum: [16000000, 23000000, 30000000, 36000000]
> > +    default: 36000000
> > +
> > +  ti,max-flash-timeout-ms:
> > +    description:
> > +      Maximum flash timeout in ms with step 32ms.
> > +    minimum: 32
> > +    maximum: 1024
> > +    default: 1024
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
> > +      ti,max-flash-current-microamp:
> > +        description:
> > +          Maximum flash current in uA with step 62500uA.
> > +        minimum: 62500
> > +        maximum: 1000000
> > +        default: 1000000
> > +
> > +      ti,max-torch-current-microamp:
>
> Don't the LED flash bindings already have standardised properties for
> these?
>

Oh, they do! Thanks for pointing out. led-max-microamp,
flash-max-microamp and flash-max-timeout-us. Very nice, I will adjust
in the v2.

> > +        description:
> > +          Maximum flash current in uA with step 31250uA.
> > +        minimum: 31250
> > +        maximum: 250000
> > +        default: 250000
> > +
> > +    required:
> > +      - reg
>
> I'd say the max current properties are required as well, same for the
> timeouts. Or make the lowest the default. The lowest values are very seld=
om
> used in practice though.
>

I have transferred from the driver which uses maximum values as
default one. I can change to minimum if needed, that is not a big
deal.

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
> > +            ti,peak-current-microamp =3D <16000000>;
> > +            ti,max-flash-timeout-ms =3D <1024>;
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
> > +                ti,max-flash-current-microamp =3D <562500>;
> > +                ti,max-torch-current-microamp =3D <156250>;
> > +            };
> > +
> > +            led@1 {
> > +                reg =3D <1>;
> > +
> > +                label =3D "yellow::flash";
> > +                linux,default-trigger =3D "flash";
> > +
> > +                ti,max-flash-current-microamp =3D <562500>;
> > +                ti,max-torch-current-microamp =3D <156250>;
> > +            };
> > +        };
> > +    };
>
> --
> Kind regards,
>
> Sakari Ailus

