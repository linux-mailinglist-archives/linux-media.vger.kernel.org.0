Return-Path: <linux-media+bounces-40336-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B690DB2D399
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 07:37:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DBDF6286EC
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 05:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B88D29E105;
	Wed, 20 Aug 2025 05:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BfwQZe35"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C7B29B8C7;
	Wed, 20 Aug 2025 05:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755668186; cv=none; b=Aem/IfGr2SvY8q4cMixhepuMJWqyLbZtOE/p8iNJauMV55nCZ19jgUH1nH6KTguB6VCr36vSrOlnU5KfK1fePDRShxjFdba2UML1AmUvjOOCNdDffkERrrz85144KVMCTAdfzYw2orO0M15laj4axkbb/s/CNUgyNuqggMolR4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755668186; c=relaxed/simple;
	bh=HYPoFiFLRxG42Zg9Yow1s/PYyk0iCHliP3CbKVzlxn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NAdnixHPQqfh+XSKvG5U4jhj8ecUnNw00kleZ7Y9ybq3QFYBUAeySNju05f4vIPiaMIqAHLcXnV61LNUNKP095jGK83N4HUHdC9Nh4VLxtvvVeENfiq5X+vliUFbkSmSC5sWNrA3xX34ftsvJC+IwPuUIJQoAIVwUJKc0JeWSRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BfwQZe35; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45a1b00797dso40989115e9.0;
        Tue, 19 Aug 2025 22:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755668183; x=1756272983; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LpZa+JPccDc9KLWdW0+nhzLGDXDPAdvgpyxHtmEgm0M=;
        b=BfwQZe35LklEbC4EmQzu1WgUL+mKJZyQ+UxWuJ7z+rJJ4BfdudK/PFItEb9YcZ0eTT
         pHH+4u38uWe6ELmhNzmdW3jKgwfRVauMIOhXvtITpUKzkKrPdm9AhQijtMf8zEVP7J3X
         uc04dlmf3j3UCBOePXCvWfXDdSZr9xDTsjuMM7BzzrpTb5mDUDkDvFG2BKWlyTIzD1Ix
         rMGhmbwuw57F33YihZ45AbuxlR21Ip2Fp26MwMOIL4G5EFvbjWsUYePUBBS5DImc/oX7
         Gd/zkCfYJGxNyxkwtgrvnRenKfK+IO97MvaWgKoXcjc4LCAVxDjY7+aA+5FRAZlKAAg3
         Aelw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755668183; x=1756272983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LpZa+JPccDc9KLWdW0+nhzLGDXDPAdvgpyxHtmEgm0M=;
        b=OHuRcX9Hve7e4E0ro4z81Xm7hQStQK4hAsr5QJB0JpzXc9I7riNpHMDAYl7qte1ZEx
         BvsOGZZHqW8rHO2KUWswe4QGBuBFAQdLcDvGB46W8bNhAgv+j996pOrQvTfZ7IqJB+ZI
         znFMw6pgijT7q0PgnvHPh2sU8J61dVXlaQuMJ3JoPd0KHSbsDSN0r/XKj9Rxf0cJdd0q
         ZKhKSoszgueujBeShwEkY/2yJh9PJj9WkETVo+tJZfSnobiLldUdJVBkKdkhwJ3mE6Hg
         AhTVt8pkqwrBFcR5l3b+edRz36xtl0zVVURv1mSLhme9MJfT11mZWqaYWLMsBVi4ua/2
         pKwg==
X-Forwarded-Encrypted: i=1; AJvYcCWJYBGqZMhbzuGhQ53YlRYu/Y1k2pTeRgptQPKfWossiUA/2R0LcUbo5GnEHNW9GkbhBYBgLBVL8vco@vger.kernel.org, AJvYcCWlSA/XqhY8C0/Yn0WtcJQUqTAfe8SqzACfZP7E1BGRLOyJ9bpeQUEdxr5vnczD5pLra91pjfzPm15zQPo=@vger.kernel.org, AJvYcCX+GgHNEgkIAQjQLR8wEZkBLaQm52a2k1PYOu/QCpKk7kYzwE/JbyIfRFeqhmaWZAo+rWMnzjn8Upc7kCpY@vger.kernel.org
X-Gm-Message-State: AOJu0YyB20kgcj4nbHCh0BOie602q/X/pfaIplIRCqQOargmCP+V1bju
	rKx2z3cHULquieoNOup7vf0G9EKylbkec+RKLGfoGQU1ae7kMyQhtGvfEtOh8u05UwJ5c9d753X
	JLLLmTV7OoJe1ytgwhkreSWr/i42S010=
X-Gm-Gg: ASbGncsI9QxkeY0PINn0Q+HDKgR7eZ541j367S5og4SNHKnhAulvrffe5WqBpy5vC6v
	kuZHV+4UK3g6VP3MeJ5Cd2D2YEJHUvv9SjcCY3/P5EW5H7que2JI6RZnpgDPTeULfsk114ye7tQ
	uM8BZzrvsb9pZwOfbCn44323i9KkPCZ0r3Pnui2QYnICpz6Sdk65yAwgPNuIjP7MBAgVKI1VbbK
	eUa/XhV
X-Google-Smtp-Source: AGHT+IFCGRUhyg5MEnt8Z7ehVIISHI73hg764i8d03hFNfXUKIfBV7mBy4zClBQs+uDpUF9hcHMP58immWi39AxH54U=
X-Received: by 2002:a05:600c:1910:b0:45b:47e1:ef69 with SMTP id
 5b1f17b1804b1-45b47e1f727mr6649275e9.36.1755668182818; Tue, 19 Aug 2025
 22:36:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819120428.83437-1-clamor95@gmail.com> <20250819120428.83437-2-clamor95@gmail.com>
 <20250819202542.GA1254999-robh@kernel.org>
In-Reply-To: <20250819202542.GA1254999-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 20 Aug 2025 08:36:11 +0300
X-Gm-Features: Ac12FXz4o5j9EQTZbSCDH24-D7MsVs5e4lTkXJPmutwJNw7AWvoVJ9DQFlQCgbA
Message-ID: <CAPVz0n1ETyYiaaw_ixEUeJM7xTqoRgcqmB0APige6=NNWsRDPg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: media: i2c: document Sony IMX111 CMOS sensor
To: Rob Herring <robh@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dongcheng Yan <dongcheng.yan@intel.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, Jingjing Xiong <jingjing.xiong@intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 19 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 23:2=
5 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Aug 19, 2025 at 03:04:26PM +0300, Svyatoslav Ryhel wrote:
> > Add bindings for Sony IMX111 CMOS Digital Image Sensor found in LG
> > Optimus 4X (P880) and Optimus Vu (P895) smartphones.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../bindings/media/i2c/sony,imx111.yaml       | 126 ++++++++++++++++++
> >  1 file changed, 126 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,im=
x111.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx111.ya=
ml b/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
> > new file mode 100644
> > index 000000000000..52d88f5d477e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
> > @@ -0,0 +1,126 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/i2c/sony,imx111.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sony IMX111 8MP CMOS Digital Image Sensor
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +description:
> > +  IMX111 sensor is a Sony CMOS active pixel digital image sensor with =
an active
> > +  array size of 2464H x 3280V. It is programmable through I2C interfac=
e. Image
> > +  data is sent through MIPI CSI-2, through 1 or 2 lanes.
> > +
> > +allOf:
> > +  - $ref: /schemas/media/video-interface-devices.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: sony,imx111
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    description: EXTCLK with possible frequency from 6 to 54 MHz
> > +    maxItems: 1
> > +
> > +  reset-gpios:
> > +    maxItems: 1
> > +
> > +  iovdd-supply:
> > +    description: Digital IO power supply (1.8V)
> > +
> > +  dvdd-supply:
> > +    description: Digital power supply (1.2V)
> > +
> > +  avdd-supply:
> > +    description: Analog power supply (2.7V)
> > +
> > +  eeprom:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      A phandle to the node of the eeprom, that holds sensors configur=
ation data.
>
> This assumes the eeprom is dedicated to the sensor. What if it is just a
> subset of some eeprom or other storage. Perhaps this should use nvmem
> binding.
>
> > +
> > +  flash-leds: true
> > +  lens-focus: true
> > +
> > +  orientation: true
> > +  rotation: true
>
> Use 'unevaluatedProperties' instead and drop these.
>
> > +
> > +  assigned-clocks: true
> > +  assigned-clock-rates: true
> > +  assigned-clock-parents: true
>
> Always allowed on nodes with 'clocks', so drop.
>

All your suggestions are valid and were applied, thank you!

