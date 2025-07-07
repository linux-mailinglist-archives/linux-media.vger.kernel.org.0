Return-Path: <linux-media+bounces-36946-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3BFAFACA4
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 09:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E16B3B6651
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 07:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162342868AC;
	Mon,  7 Jul 2025 07:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pzx2rAga"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A67F27AC48;
	Mon,  7 Jul 2025 07:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751871711; cv=none; b=KOf2FSS/c/a7wxux9SaIaaj/DCzcsnQc0rsHBt3LqxaLaK70TQ7ivPbq0+JIbbPkxjQh5rYt8q6nRkZa71SlNhdbm4EB3D0GY/onW6R3PoFOb9zI6elEX6jbA1nCm6E0pZu5q3MzCNpLo6nNbwhFFZqLN715XLiZGhy+r/QNFm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751871711; c=relaxed/simple;
	bh=9ahq02cohoNR+foDAFJMfZIF5F/Fa4v6CbCiyG7PpJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uei3iyNHvavtrwsIz9GC7VjLn3Bt+ydupk8dJpFfqcdjRgPouBandQLQEFIIkZq6lRwCdM2B8WmxvZQJziOmZ1Hm026h7oiK5AAL5fYY7MU32GhBxzcJUtMkBRJUaI1UxBskf759Nz8v2T8RrywsSvhkzlgwtcxfgxqK67ns2I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pzx2rAga; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B398C4CEE3;
	Mon,  7 Jul 2025 07:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751871711;
	bh=9ahq02cohoNR+foDAFJMfZIF5F/Fa4v6CbCiyG7PpJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pzx2rAgaDSMTqCdsMQAZzcI60zpddtZZXP3MPU/Q2kyKr/NHBzLVj2c30LiWuh7qh
	 ioXzgDGjdc1uIVuzM0XE90IwUs3WE8ktA/y9x31tvkj+zahhSqtvji/j18jEXCF2x6
	 InrfatdgvcM37KbdMgLRHKZO812uQSnnvv123mCNuZRNATAa6xAhEMXib9N8uuondR
	 b5ao/iR1S0BLl521Q0teBAYJZFSRbQPdnYfTjJksvJ5qdeKxgaBwhUte+gNfte2akq
	 P6A8E/Xqmrr5wUbpoznVgDc45x3m2OfhI9TsIH+cMGKYrrgnhZ92Pe1/R55d0FrzAX
	 x7KyRftNihRsg==
Date: Mon, 7 Jul 2025 09:01:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-media@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Alice Yuan <alice.yuan@nxp.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: media: add i.MX parallel csi support
Message-ID: <20250707-mustard-avocet-of-success-e68cbf@krzk-bin>
References: <20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com>
 <20250703-imx8qxp_pcam-v2-1-188be85f06f1@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250703-imx8qxp_pcam-v2-1-188be85f06f1@nxp.com>

On Thu, Jul 03, 2025 at 02:33:06PM -0400, Frank Li wrote:
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: fsl,imx8qxp-pcif
> +      - items:
> +          - enum:
> +              - fsl,imx91-pcif
> +          - const: fsl,imx93-pcif
> +      - const: fsl,imx93-pcif

This one should be an enum with imx8qxp.


> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: pixel
> +      - const: ipg
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base

Use the properties/port schema instead, you do not have any properties
here (although then question - don't you need anything from video
interfaces?)

> +        unevaluatedProperties: false
> +        description:
> +          Input port node.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/$defs/port-base

Same here

> +        unevaluatedProperties: false
> +        description:
> +          Output port node.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/imx93-clock.h>
> +    #include <dt-bindings/power/fsl,imx93-power.h>
> +
> +    pcif@4ac10070 {

That's a CPI bus from MIPI so cpi@, no?

Best regards,
Krzysztof


