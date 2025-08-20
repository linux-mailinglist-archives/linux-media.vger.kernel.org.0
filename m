Return-Path: <linux-media+bounces-40338-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B90B2D3B3
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 07:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FEF03A9519
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 05:39:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFBCF22D4C3;
	Wed, 20 Aug 2025 05:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f72dcaWx"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F161F2BB5;
	Wed, 20 Aug 2025 05:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755668391; cv=none; b=Wv+xYrlpiTfp0KNtrEHbG6SOZNnGerqsza8HimDNeW1RP4KFhh/onF8Ac6KBorGcMlR720NdKk+nVmyM18dMfRJeKu6HJ8puEieZPJsqUkrNuERifceElw3fVASlhMUkgqixXTOIRHHDWmrA5FCkhxOhUoz72PJD9t6s0fx6+y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755668391; c=relaxed/simple;
	bh=N7yVpy7/MX023VQgG6ZBBN+wGnFtCu8u02qmP0x1N7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uknse6vRHQKUmQpSLBl/+V8SwFcQx3TYDIZGeVDEFWCnjNwe5TCas3cpAfLC2fcjFwHnTZfbCwtEUqCPVicrV/K7cryFbn5OxYELYtQ1SrbR7RpyQyUwGNpfrNXT99ESCHVXIM/pls9etLUPsqTM4CzLe2otzun5cPyVAyPmVwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f72dcaWx; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b9a342e8ffso332913f8f.0;
        Tue, 19 Aug 2025 22:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755668388; x=1756273188; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccknhVRPHaFFv1IUxfvlWqkKeJThBY2h9VPsCt/mOXA=;
        b=f72dcaWx2kka+8Ioewp+0DpMNctQr+WPv/xzA+FyzSpXgCKFfch/lhwqps7+J+2Zeh
         mBB1CDGDSsQ2wmoHwGGmpD4NxZ388MwIhfSSAOCiGSW1tBPafP1ARPH0FyCPzQKaTVuR
         Oi0EKnYm3ZL8Xcxaym7q64xBUQljBjNWjypXjylSM8a3GKBbQk5bh55uamr6zqfe+mow
         4B8Nn7E6rUIsF8eMLDBhgZcXIjyEK+h6Tsb3gg7evK4gdNbyjkxyNAQzEgNjFiT/+O6/
         9gxJbOEQvKDsRO2333XJdyF+8Uu46I4BY4XsPmv4YfcF9ZMOG8/RNYm9LYE59LedyCd4
         67YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755668388; x=1756273188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ccknhVRPHaFFv1IUxfvlWqkKeJThBY2h9VPsCt/mOXA=;
        b=qWtrQbSTTim8wj+h9MXJiV6nqvlJ32iBPyA0+ego5QaxknpCmieDgT9Jt5eRaFBRQH
         46chvirviY1TeevaMmM48aVFbAiZ9FDfpjkaFpEBLkDV3sidnYhYtgArXTnfD9qZiV2n
         wnIwoDv+UeOua8jDLGry9J8UW7BZbL8u02euOWDibB1op6h/n2PjO6T077tI2rXYgreR
         oOjgUHsdWQkW4y9/S029/rCitpRXmorqmMR5evOX2bKhu0Ua/h+fKQa5DnD+U5SPPLNg
         Gr+8N+5XPQoR1uosstJJ1zkRbxmN+Rm6TE7iIV7QG56g26kKrSV20K6LYTbTgxSSBGgN
         zv0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGBUQyvqyGocMnoxnzyWmvhGPr/bHhhWDQ73FekaArY5PXL9lzybipjj2+mQ6G5I5ZwJz5+MMlRWmbkLc=@vger.kernel.org, AJvYcCW+HmwuXRnP/koMmYjehNdnZX7oihXfAtGu0n/XOtYoT3bvoEPDurabKoVIVvvp4xHKt312ZsIEnCXx@vger.kernel.org, AJvYcCW5ZDSoGEnJdmY79PbQFmWDQm4rnSHqcEd9e6GcEbQw++NLpJ4TwYsnFHMBYDev1Pp/JISoG06HkC8H@vger.kernel.org, AJvYcCWQ5i5XriHVB8DR2juS0ONdn+LLxqo3lLyO5Alb1E7/+fUplZraIRanu8K0/+ECtPXlDkmtc01/jTdQaoOq@vger.kernel.org, AJvYcCWbpFFmN2IWg0swueUL0vI9KJoruwe7EABx/1IdeEoD2c4gAtadFDFreaENw/lJlRhfSflrUtNEyaaQbLc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgRY+SJ/txrSIHVcBbwzGTEDGyw/bAQN2CAUHEYR/ZdyWYPdEL
	qedvtpyzE2OxBCUKC4sk40lpQ3rhIeptpFLKMnroc9u6x+tyOkO4MdygEcfpufqeQ/pw5ud6Y23
	PVhNc6hEe1n4iFMaX4plGiib1hn04izc=
X-Gm-Gg: ASbGnct4UDpOf0NETxEGXOrf4gBYtIXrAt5vNzflnxiLtRaOA5X6YsMHboSTtyqjaOn
	mTgua0YG26/q6A6AdlEvCrH86x7Eq1du8tWQ5DW2+2oIBtaqAQW7h3PelqwO7Iinfepo6Clp1Oe
	dpOQv6yZRZwGyJ4L7Eo5iZ552Y/sETiCWvctuzl0Ugr42c+Ac2qSrUg6Ey8pyP7I1TJCgaoI2LE
	wU5OJHE
X-Google-Smtp-Source: AGHT+IHwCiiCNR7psLFhYIIVfqt8gU87v84Q5qmwWq0pKLvUVOdRq92tkYNwCIUAaI04l/H3wpVbXTn8JTp3UCxiUZw=
X-Received: by 2002:adf:8b05:0:b0:3c3:ae31:717e with SMTP id
 ffacd0b85a97d-3c3ae317631mr152960f8f.4.1755668387612; Tue, 19 Aug 2025
 22:39:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819121631.84280-1-clamor95@gmail.com> <20250819121631.84280-18-clamor95@gmail.com>
 <20250819203007.GA1266319-robh@kernel.org>
In-Reply-To: <20250819203007.GA1266319-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 20 Aug 2025 08:39:36 +0300
X-Gm-Features: Ac12FXzWZ_Nd9h62ySrEyXbVbvxJKlW0WeyZsHY-B28WzAACkjTJONuBotQYEIA
Message-ID: <CAPVz0n2tsE3FHAz7sbdwkWaRQtmXJ5wNg8vvb2B9k8iYuyvUQQ@mail.gmail.com>
Subject: Re: [PATCH v1 17/19] dt-bindings: display: tegra: document Tegra20
 and Tegra30 CSI
To: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dmitry Osipenko <digetx@gmail.com>, 
	Charan Pedumuru <charan.pedumuru@gmail.com>, linux-media@vger.kernel.org, 
	linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 19 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 23:3=
0 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Aug 19, 2025 at 03:16:29PM +0300, Svyatoslav Ryhel wrote:
> > Document CSI hw block found in Tegra20 and Tegra30 SoC.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../display/tegra/nvidia,tegra210-csi.yaml    | 78 +++++++++++++++----
> >  1 file changed, 63 insertions(+), 15 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra210-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra210-csi.yaml
> > index fa07a40d1004..a5669447a33b 100644
> > --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-c=
si.yaml
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra210-c=
si.yaml
> > @@ -16,30 +16,78 @@ properties:
> >
> >    compatible:
> >      enum:
> > +      - nvidia,tegra20-csi
> > +      - nvidia,tegra30-csi
> >        - nvidia,tegra210-csi
> >
> >    reg:
> >      maxItems: 1
> >
> > -  clocks:
> > -    items:
> > -      - description: module clock
> > -      - description: A/B lanes clock
> > -      - description: C/D lanes clock
> > -      - description: E lane clock
> > -      - description: test pattern generator clock
> > -
> > -  clock-names:
> > -    items:
> > -      - const: csi
> > -      - const: cilab
> > -      - const: cilcd
> > -      - const: cile
> > -      - const: csi_tpg
> > +  clocks: true
> > +  clock-names: true
> >
> >    power-domains:
> >      maxItems: 1
> >
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - nvidia,tegra20-csi
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: module clock
> > +
> > +        clock-names:
> > +          items:
> > +            - const: csi
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - nvidia,tegra30-csi
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: module clock
> > +            - description: PAD A clock
> > +            - description: PAD B clock
> > +
> > +        clock-names:
> > +          items:
> > +            - const: csi
> > +            - const: csia_pad
> > +            - const: csib_pad
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - nvidia,tegra210-csi
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: module clock
> > +            - description: A/B lanes clock
> > +            - description: C/D lanes clock
> > +            - description: E lane clock
> > +            - description: test pattern generator clock
> > +
> > +        clock-names:
> > +          items:
> > +            - const: csi
> > +            - const: cilab
> > +            - const: cilcd
> > +            - const: cile
> > +            - const: csi_tpg
> > +
>
> This is longer that what's the same. I think this should be a separate
> schema doc.
>

CSI hw block configuration is similar between generations, the main
difference is the amount of clocks routed. Not sure if it is worth it
to create duplicates with sole difference in number of clocks used.

> Rob

