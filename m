Return-Path: <linux-media+bounces-39401-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25415B20114
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 10:01:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97C951663AC
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 08:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA51C2DAFAE;
	Mon, 11 Aug 2025 08:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BST4RaTp"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EDA20B7F9;
	Mon, 11 Aug 2025 08:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754899260; cv=none; b=bXR6mb7d6CWIJ3+VQ1dFwCIGYUdKRFV3Hw0Pt1VjkD18f7QkdLwaaR5vWowQg9DHP6V7jsZhoB9bmiynvNxzXvQmSiaOdynu8J33TOQR9iEsl4joKD94qLqAa2JoPIZ1UO4stm61P/sMGBhHOTwdth2nhEzL3e7kV8nH3qDa3D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754899260; c=relaxed/simple;
	bh=srkUTP+YUtpEUUTBY0f0QKZb5Nq7ktoTvVw8gPJrI4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q1NS7tiCT6ow5OXelFcyuVNwyGcoIIjWdvu7yECHFhStExnVr+3MYVerm/H3HHmtVOmhkfmHyJSrPCvmLhaAk/hrJJuBAkNgnGu8pdolNygJ2NdPhj1mr/7wRNVxhdpDaOWIrE5B2TQYR08TVz4xNIwixlLDtVZ8Pj6GtkXFQZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BST4RaTp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA9DEC4CEED;
	Mon, 11 Aug 2025 08:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754899259;
	bh=srkUTP+YUtpEUUTBY0f0QKZb5Nq7ktoTvVw8gPJrI4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BST4RaTpjHP8ItttfIowfKeh0pqkoeEBV4Vnoq4Oz8gDhVzuBRcgJBFGNzis6dgHl
	 vCfir7NSUpdKq4mzd6cQSwrZGWqE5AaaYDDuHDgnNYOxNDwVXdfNAXTgwv9h4iRfsZ
	 aekPgle3MI50jEWQDSwU5jkM9WbycrPYMz515EKHUhLn9+wTYlegpIHoo9DqA8uDd+
	 QiyfZ9cYMweQqLL5ZnMOMM5yvg6bGVaqk3rN4NH/2Es9hBN4wQnEpEM+PMJokbOc65
	 h3vt3mqHMpp/yt6iwv8cbimBerBEyTPQ4TIvSgeY3szdTCTr13VSuHS0eHmETKi0DW
	 Z0OAUMX99h0Pw==
Date: Mon, 11 Aug 2025 10:00:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Will Whang <will@willwhang.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: media: Add Sony IMX585 CMOS image
 sensor
Message-ID: <20250811-successful-military-dragon-d72486@kuoka>
References: <20250810220921.14307-1-will@willwhang.com>
 <20250810220921.14307-2-will@willwhang.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250810220921.14307-2-will@willwhang.com>

On Sun, Aug 10, 2025 at 11:09:18PM +0100, Will Whang wrote:
> +description:
> +  IMX585 sensor is a Sony CMOS sensor with 4K and FHD outputs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - sony,imx585
> +      - sony,imx585-mono

I don't understand this second compatible. Is this different hardware?
Can you point me to "mono" datasheet?

Your description should explain this. Commit msg as well, instead of
speaking about driver (in fact drop all driver related comments).

> +
> +  reg:
> +    maxItems: 1
> +
> +  assigned-clocks: true
> +  assigned-clock-parents: true
> +  assigned-clock-rates: true

Drop all three.

> +
> +  clocks:
> +    description: Clock frequency 74.25MHz, 37.125MHz, 72MHz, 27MHz, 24MHz
> +    maxItems: 1
> +
> +  vana-supply:
> +    description: Analog power supply (3.3V)
> +
> +  vddl-supply:
> +    description: Interface power supply (1.8V)
> +
> +  vdig-supply:
> +    description: Digital power supply (1.1V)
> +
> +  reset-gpios:
> +    description: Sensor reset (XCLR) GPIO
> +    maxItems: 1
> +
> +  sony,sync-mode:
> +    description: |
> +      Select the synchronisation mode of the sensor
> +        0 =E2=80=93 internal sync, leader (default)
> +        1 =E2=80=93 internal sync, follower
> +        2 =E2=80=93 external sync
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    enum: [ 0, 1, 2 ]

Previous comments not applied.

> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            oneOf:
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +              - items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +
> +          link-frequencies: true

Drop

> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - port
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        imx585@1a {

Nothing improved.

You replied that you applied comment, but send the same.


Best regards,
Krzysztof


