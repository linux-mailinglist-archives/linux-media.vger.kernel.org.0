Return-Path: <linux-media+bounces-45843-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34036C15DB0
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 17:38:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D81AD3BE9C6
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 16:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9546D2E8B83;
	Tue, 28 Oct 2025 16:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mBoMXEwD"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0735B33032A
	for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 16:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761669008; cv=none; b=RN+ns+MH99pLn6e9LhsDHe8Ilz9EaS5OB7nrijN0EBaQ36M9tfZKhqjOZuqHKdbrrwOtTMYmmxlg7sjIYedAsCSulPoNpBf+OpMinJAVqp2HD6BdsfJCYgy2Kin4ehWD+z73VAjrUK072mjQKijmzBpGYNBBYniceMZyq86I8RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761669008; c=relaxed/simple;
	bh=vEJyVeW39Pode9RTYwDr6fsdalld4CL9rZ6fznN/mPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PrkOsd9YOtC52u6ogX8L0QYUqMEauGAwiLkKQkJkcEOzl7U7mBQ9k+JmeU2shgM/NrRHOq+LptNM0StmU7QCK0dCuaCLIBT2Znmc4CYK+0TyuqSwZDqG//VvNNm7+rhBh8AmXUC2Jld0m4dHmZXo7DA3pnh+OJBrCeReFioZBzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mBoMXEwD; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4285169c005so2931472f8f.0
        for <linux-media@vger.kernel.org>; Tue, 28 Oct 2025 09:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761669004; x=1762273804; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYWi3kUOD7uIG7yabDe41nV3YwEiScd0j0WIlkffe/I=;
        b=mBoMXEwDpJIQtVjDWluPiaNNK2XYXB4gCIbAKhECbz669gsP5v+/myjl5l+u6Q6YoV
         ya1FXUyUTIDWSAcaiyWecKtNZDHp4+4YRgHhJ1e5JlGRSsjbpnbVCO5++tSUn248r7Kr
         uFD/6hOMpK27A9gCKyD2vWKy/vgqhusw6HgLGQdmY3LZkASzaoi++UxWnSKzNGWLl1n4
         kP4sTmRBWJXE8cRiHK/s9sR0uupJM9Icx660kNvZ8jQRaK6bthSV2xVmoV1+Ns8Wdjyx
         ZTB+/A3ebDyWTfHD7cjytcuj3mdhI+FNWVXcCDh1wh+4clb7heNuWa2JsDND+6akKxkF
         ynNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761669004; x=1762273804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYWi3kUOD7uIG7yabDe41nV3YwEiScd0j0WIlkffe/I=;
        b=rxosXqLdBmhdzz2L6Kg40t46XfKfswLx7QetEdx5ALyNBk4vWSCr0sc1TbK8uiyAFg
         fMqgK0ZsuBUt8lOxS+/4se78Dta3ksPINeT20ziMnEpU8mBal5BbWv5jsFu6P9QXf4Rm
         E2Yd+Iofr4KKTvM8aqQO+t0iIUZhgOGRzxtdlQVUWTlPLx/ST0569QlqAQdQexzDz4nv
         EdWYUdbUmxTKegVB/rT2epemz+jqz3sPwbqHxLGEDuZpYt2XgYypwTDnz+jF4inSwHe5
         I9FWCEMgABfmoo5+YaK92vQSPKuLXN3xljsZaJagjVYqfWo/o+fThkU3yoFzDd5vSIzb
         KtGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYMLQJG0fp8JGG2d0EjCCV5+7gaj/YNmdH/7DbITLTybm96QzNq5JD6PydQ1uT0nls4PwbLpmgdW4Pcw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq1XJhusww19zumRStbrq3xIG/fffrpO/hacbjo7ccL6iwVzAj
	qZOah/0UHdBtUs0uQwIfUGkWxY5vJ3onFrg+FCxyEqe+N9KPRD0xo15qAsezUf6SICgRtPxV7M5
	gUUGLGPfPnlePwNIU4DpMsLlCArYy/lk=
X-Gm-Gg: ASbGnctI2IolAntt6/q0BdIpTA+Fz8smwyKygiYDS0j5OY7qHivRNzDiFIDEL7GjGXo
	6SciAsNk57dauDLIVYAF850uG8RcWte5yfKI4YA90UY5x+pKwk47VuTNgGc5DO1YwzIYYayIaX3
	JXVMGhhDMy/51qNYtKJVUAG6sM8N8oQHoxKnDT8kdsSrTB7GGzagXxgCaxcSm17jM80C/iBDxvt
	FQJXHgDuhhkl9zLuIsWNLjhlGJ0sO1BNMRgXWewCoGVRzGYYYWy2FyH2HYl8Q==
X-Google-Smtp-Source: AGHT+IHADb2QWE6ixPqVKHBkjJRfRAtZ126uBgTNHUzgvYzRkxhDy9SHWGuh3n+pBuaIX0SDJwLoA+lYxFyX0QSEUsI=
X-Received: by 2002:a05:6000:2908:b0:3e0:c28a:abbb with SMTP id
 ffacd0b85a97d-429a7e4ec21mr3568957f8f.13.1761669003948; Tue, 28 Oct 2025
 09:30:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028092200.7003-1-clamor95@gmail.com> <20251028092200.7003-2-clamor95@gmail.com>
 <aQDuotTgvEyzgHnv@kekkonen.localdomain>
In-Reply-To: <aQDuotTgvEyzgHnv@kekkonen.localdomain>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 28 Oct 2025 18:29:51 +0200
X-Gm-Features: AWmQ_bkYwYMcdqG9iiQmTj6L33lDtpgUCjNIDpHFy8HLbHs5MypfRj8MwOiVwW0
Message-ID: <CAPVz0n1=xuue8btcEAc6fX_k-9Y_=_A_h5yuYyxwwgf00EZDcQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2 RESEND] dt-bindings: media: i2c: document Sony
 IMX111 CMOS sensor
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hansg@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dongcheng Yan <dongcheng.yan@intel.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 28 =D0=B6=D0=BE=D0=B2=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 18:2=
6 Sakari Ailus <sakari.ailus@linux.intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Hi Svyatoslav,
>
> On Tue, Oct 28, 2025 at 11:21:59AM +0200, Svyatoslav Ryhel wrote:
> > Add bindings for Sony IMX111 CMOS Digital Image Sensor found in LG
> > Optimus 4X (P880) and Optimus Vu (P895) smartphones.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../bindings/media/i2c/sony,imx111.yaml       | 112 ++++++++++++++++++
> >  1 file changed, 112 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,im=
x111.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx111.ya=
ml b/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
> > new file mode 100644
> > index 000000000000..a70017588891
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx111.yaml
> > @@ -0,0 +1,112 @@
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
> > +  - $ref: /schemas/nvmem/nvmem-consumer.yaml#
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
> > +  port:
> > +    additionalProperties: false
> > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > +
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/media/video-interfaces.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          data-lanes: true
> > +          bus-type: true
> > +          link-frequencies: true
> > +
> > +        required:
> > +          - data-lanes
> > +          - bus-type
>
> Can you drop bus-type? I.e. is the sensor D-PHY-only?
>

Yes, there were suggestions from schema maintainers and I have
included them locally, but forgot about them since no review from
media maintainers. Please skip this patch and review the driver
itself. I will include all schema maintainers suggestions along side
your suggestions regarding the driver in v3.

> > +          - link-frequencies
> > +
> > +    required:
> > +      - endpoint
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - port
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/media/video-interfaces.h>
> > +
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        camera@10 {
> > +            compatible =3D "sony,imx111";
> > +            reg =3D <0x10>;
> > +
> > +            clocks =3D <&imx111_clk>;
> > +
> > +            iovdd-supply =3D <&camera_vddio_1v8>;
> > +            dvdd-supply =3D <&camera_vddd_1v2>;
> > +            avdd-supply =3D <&camera_vdda_2v7>;
> > +
> > +            orientation =3D <1>;
> > +            rotation =3D <90>;
> > +
> > +            nvmem =3D <&eeprom>;
> > +            flash-leds =3D <&led>;
> > +            lens-focus =3D <&vcm>;
> > +
> > +            reset-gpios =3D <&gpio 84 GPIO_ACTIVE_LOW>;
> > +
> > +            port {
> > +                imx111_output: endpoint {
> > +                    data-lanes =3D <1 2>;
> > +                    bus-type =3D <MEDIA_BUS_TYPE_CSI2_DPHY>;
> > +                    link-frequencies =3D /bits/ 64 <271200000>;
> > +                    remote-endpoint =3D <&csi_input>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +...
>
> --
> Regards,
>
> Sakari Ailus

