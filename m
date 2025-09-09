Return-Path: <linux-media+bounces-42126-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 918FDB502D8
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 18:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E47755E30FA
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 16:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD5E352065;
	Tue,  9 Sep 2025 16:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A508Glue"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5412345755;
	Tue,  9 Sep 2025 16:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757435957; cv=none; b=EDr1PI/8ia3zoJrRpOEMp6iwYHa6K7OQD0ykEBodAXJJIM8aK60vKIfc1oVNq5fvUwVYQ7jlLq9PBfURbi/b1ANGBYdPur+t5ASaOsX3e+Be9ea/2KUskPbpTTKAx1OXUXdh0MdpfuPhijMlmj0mBQtEdEWJQhsE+jKqC13KffQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757435957; c=relaxed/simple;
	bh=vzzlxFmChzLl8FdVDTjiE5WB1MyfDuE6zrwWMhxvoiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tIc3KevUYHSbbEgmXOmyW+lP8Xv/q+GcETEDeNVL8zt8IIa63k2HaDnd/R1CrVNGRLv3ZPCzCZ5lmCP6gSze5pOuRoyaCelLBskZ+jQOoSFO4FtoMwiMP6gV0G8nmDKxLk4uJHpE7pVBcwCygmuRETdF68usLtuTbYCyH7zbtlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A508Glue; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3e4b5aee522so2023180f8f.1;
        Tue, 09 Sep 2025 09:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757435954; x=1758040754; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KxhOPZTQq7sqGJRVTULQC/P4pZE3c3LY5+Q2+xI6GjA=;
        b=A508Glue0bQQtH6/x4CLRVjJEjRGs/smawDYG/4jNmYhmbCM0o1Br9ms67xmrCk1fu
         +qLcuikVWmqHD+K1zUszmgrTtDMUHNgH4CDQAbVKQTz6MSG88BVgfR6gWc7fW8f5Rryo
         RxISlhZjmH3Pfu6YI7G0umNnPZjOROCOpHfahLa+1iNlCskk2Lx1VFy9GGUH4wqtvVrV
         7OYAUr+VIWKItRQW93IBbY/pXG0vQuHSuOItiZfiTofEWRR0pnreLQeit2vWt6z2xdnr
         O3qAhcCpedDfWD914j5/voL2Pgs7NHEgsnGg/6jlLtZARg9EAWnQm96N1NCbdZKh7lAH
         t69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757435954; x=1758040754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxhOPZTQq7sqGJRVTULQC/P4pZE3c3LY5+Q2+xI6GjA=;
        b=uFfUWFK8qmdRYWE78u66Q3YY2CAwNiaK4Yajjj7VI7gApyAOQRCg6ee/5S4MMpf1rY
         tB/YwMENMwkYlODfe2WAFRIFClnWcwDFrg5BYu2ui8SGmBn9FUBAvsL0ZF8BHjmb+ec/
         djjszttLT/myDWy8CkDQV7NS5BTCt1K49DD4FN3Esw0d7cKMTncorCU0m/kg4nLjT0ly
         LgihGndVQPTXmK1qfhsomFpV903hqhNg9vFZX6pfEaesgDhzYpwoljBurClQLgz7lsFg
         Wuk8W8gOOpgix4fCI+11/KUmj0xr/AqrV/bB8rhvjKRelICi3i/1Xx6kUKg6STFJeXiG
         lzGg==
X-Forwarded-Encrypted: i=1; AJvYcCVJd1DGJbK+MJOK+LZwLk7JjX/edXmoYhal3irD1gqNSB4R7fGKe0GDh4CVNGiGn0kc2pD+fjHa12yZ@vger.kernel.org, AJvYcCWCzugXS9n7gbIPtHuBVI97TtR60YkyPRW2W41pEXRGUxPPYrKx96u3H3s9y2YzODYDI4HVCL0uVUJ+IJY=@vger.kernel.org, AJvYcCWkZoPjbuBsJBt+Gpllov22n/ktRaccU7GcVUPNUaP4hGoKJ+io9/djcNel2vFyhGI0sTtWRXfjahdjYV0Q@vger.kernel.org, AJvYcCWpAQkCX7VgV5wBR9oHCkLHkyEC1NRou0B5XYlvlcL6j7uJbD99oy31byDhBdSsKZfSShOn72KBaXuZBZ8=@vger.kernel.org, AJvYcCXmW1BY9i1u/1eY1oL1SKYs4RVEG/FPvVtAkBIvgsYjlxhKyikLnww7sbFIy0T7Ef2wLSMYKzMjM2oD@vger.kernel.org
X-Gm-Message-State: AOJu0YyJPSRP96wo0Gz3Y8mbBqkgh8vaxzTlIrXp32PXBHSsMxATr4GE
	rtLxSYyroik7FqEFQs1GQDbljljNr+CgpHvxvwpO0iHm1FT/a4v2HAfkHVmOpAuYT9Narc3Lu8d
	ZsU52BLJei5NDghN1G/BRwyNNMxWbiGk=
X-Gm-Gg: ASbGncurQAp78ts5lKilnZ3WiKsaR5hL4Bq44nwtQV3RbLwoW44VUc24+wpgu2vCUOX
	14o325A0cFsfPFClqJ3bpUXmufI2Ay3rc85kSafuM/IV7OCM9GK2ezungha19YAzrks/89nvr0z
	Wx4A5ATMCLIMQN7QJGFcdZXUAeaNdk1LYge+Iv4ekK9f+YPNy1XzGTNleLkyVoKdfdFK/l3gAls
	JBAnpWHSidwT+fD85k=
X-Google-Smtp-Source: AGHT+IE719pON7bjW3h7Pxo6Zwv7j4wO6C6yHv1+0gkBov4ncj4aRc8dSsBEqve/XMqO38b0jRKxjfPeR4SSiGc+93Y=
X-Received: by 2002:a05:6000:2007:b0:3e4:957d:d00 with SMTP id
 ffacd0b85a97d-3e646256c26mr9490870f8f.58.1757435953630; Tue, 09 Sep 2025
 09:39:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250906135345.241229-1-clamor95@gmail.com> <20250906135345.241229-22-clamor95@gmail.com>
 <20250909162600.GA3311232-robh@kernel.org>
In-Reply-To: <20250909162600.GA3311232-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 9 Sep 2025 19:39:02 +0300
X-Gm-Features: AS18NWAimCnhRNNI0ZxJa9Ij71gTHj2WzcPOMYpvIbqR0Xml1RRy19Xe-mETbJU
Message-ID: <CAPVz0n2Hafvnk4BBXfhWLWCfTg336DLOr=xN9vKBGc2xEWYrMw@mail.gmail.com>
Subject: Re: [PATCH v2 21/23] dt-bindings: display: tegra: document Tegra20
 and Tegra30 CSI
To: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Osipenko <digetx@gmail.com>, =?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
	Charan Pedumuru <charan.pedumuru@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 9 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 19:26 Rob H=
erring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, Sep 06, 2025 at 04:53:42PM +0300, Svyatoslav Ryhel wrote:
> > Document CSI HW block found in Tegra20 and Tegra30 SoC.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../display/tegra/nvidia,tegra20-csi.yaml     | 104 ++++++++++++++++
> >  .../display/tegra/nvidia,tegra30-csi.yaml     | 115 ++++++++++++++++++
> >  2 files changed, 219 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvi=
dia,tegra20-csi.yaml
> >  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvi=
dia,tegra30-csi.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra20-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegr=
a20-csi.yaml
> > new file mode 100644
> > index 000000000000..1a2858a5893c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-cs=
i.yaml
> > @@ -0,0 +1,104 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-csi.ya=
ml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NVIDIA Tegra20 CSI controller
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nvidia,tegra20-csi
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  avdd-dsi-csi-supply:
> > +    description: DSI/CSI power supply. Must supply 1.2 V.
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  "#nvidia,mipi-calibrate-cells":
> > +    description: The number of cells in a MIPI calibration specifier.
> > +      Should be 1. The single cell specifies an id of the pads that
> > +      need to be calibrated for a given device.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    const: 1
>
> This property goes in the provider. Is the parent node the provider? You
> don't really need any of it if it's all one block.
>

Yes parent node is provides and channel is one of receivers, other one
is DSI node.

> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +patternProperties:
> > +  "^channel@[0-1]$":
> > +    type: object
> > +    description: channel 0 represents CSI-A and 1 represents CSI-B
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      reg:
> > +        maxItems: 1
>
> Instead:
>
> maximum: 1
>
>
> > +
> > +      nvidia,mipi-calibrate:
> > +        description: Should contain a phandle and a specifier specifyi=
ng
> > +          which pads are used by this DSI output and need to be
> > +          calibrated. 0 is for CSI-A, 1 is for CSI-B, 2 is for DSI.
> > +        $ref: /schemas/types.yaml#/definitions/phandle-array
>
> Is DSI applicable here?
>

It is because CSI is calibration provider. I can move it up into
#nvidia,mipi-calibrate-cells which may be more appropriate place.

> > +
> > +      "#address-cells":
> > +        const: 1
> > +
> > +      "#size-cells":
> > +        const: 0
> > +
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: port receiving the video stream from the sensor
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/media/video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              data-lanes: true
>
> Drop. No need unless you have some constraints like number of lanes?
>
> > +
> > +            required:
> > +              - data-lanes
> > +
> > +        required:
> > +          - endpoint
>
> Drop.
>
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: port sending the video stream to the VI
> > +
> > +    required:
> > +      - reg
> > +      - "#address-cells"
> > +      - "#size-cells"
> > +      - port@0
> > +      - port@1
> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - power-domains
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +
> > +# see nvidia,tegra20-vi.yaml for an example
> > diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra30-csi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegr=
a30-csi.yaml
> > new file mode 100644
> > index 000000000000..ea5ebd2f3c65
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra30-cs=
i.yaml
> > @@ -0,0 +1,115 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/tegra/nvidia,tegra30-csi.ya=
ml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NVIDIA Tegra30 CSI controller
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nvidia,tegra30-csi
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: module clock
> > +      - description: PAD A clock
> > +      - description: PAD B clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: csi
> > +      - const: csia-pad
> > +      - const: csib-pad
>
> Looks like clocks are the only difference? I think these 2 schemas can
> be merged.
>
> > +
> > +  avdd-dsi-csi-supply:
> > +    description: DSI/CSI power supply. Must supply 1.2 V.
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  "#nvidia,mipi-calibrate-cells":
> > +    description: The number of cells in a MIPI calibration specifier.
> > +      Should be 1. The single cell specifies an id of the pads that
> > +      need to be calibrated for a given device.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    const: 1
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +patternProperties:
> > +  "^channel@[0-1]$":
> > +    type: object
> > +    description: channel 0 represents CSI-A and 1 represents CSI-B
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      reg:
> > +        maxItems: 1
> > +
> > +      nvidia,mipi-calibrate:
> > +        description: Should contain a phandle and a specifier specifyi=
ng
> > +          which pads are used by this DSI output and need to be
> > +          calibrated. 0 is for CSI-A, 1 is for CSI-B, 2 is for DSI-A a=
nd
> > +          3 is for DSI-B
> > +        $ref: /schemas/types.yaml#/definitions/phandle-array
> > +
> > +      "#address-cells":
> > +        const: 1
> > +
> > +      "#size-cells":
> > +        const: 0
> > +
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: port receiving the video stream from the sensor
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/media/video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              data-lanes: true
> > +
> > +            required:
> > +              - data-lanes
> > +
> > +        required:
> > +          - endpoint
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: port sending the video stream to the VI
> > +
> > +    required:
> > +      - reg
> > +      - "#address-cells"
> > +      - "#size-cells"
> > +      - port@0
> > +      - port@1
> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - power-domains
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +
> > +# see nvidia,tegra20-vi.yaml for an example
> > --
> > 2.48.1
> >

Every comment which was not answered will be applied, thank you

