Return-Path: <linux-media+bounces-63897-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JPDDIHXDImqAdQEAu9opvQ
	(envelope-from <linux-media+bounces-63897-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 14:39:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F936483BF
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 14:39:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PlBTn5hW;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63897-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63897-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9942E302514A
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 12:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C01BB39EF3D;
	Fri,  5 Jun 2026 12:38:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A701DF736;
	Fri,  5 Jun 2026 12:38:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780663138; cv=none; b=XsiEi5jnSPs8uP4Wd3wJoxr+oom3xOFigHUodG4V+wXRCtM9KMnCCvAq1Bpj6/GV9eu2hoPcpG7U8aSre0IA+i4rjKUFmNfhdUm9Mjk+NNOuK4wlM/Wngos85kGlnwxyms6enG3Kg1g92Dho7K0yCTWaOUdqQ7PtWgdgyaUhzgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780663138; c=relaxed/simple;
	bh=YLNPJVApQ5YJHYhSmcyvqq6mB2Tg9uRg05HxIBBhx5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uESn69DPLAEnKHTtFwhhzhT9vUox9ksFqDtv9X2rzEePA2u+f9bSTQAX7lQBcxyMu1A32HtkjtLxrp8Qe3YYtDfiM8qIpqvD2ovPRE4QD0KGSfOPdtiZiTmNfKfuCq+9qw/u937UkigTcyNDRgrrkQKFnmYfMwDMhUkOB33xz+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PlBTn5hW; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C451F00893;
	Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780663136;
	bh=FIuZQvtcgLJeuxURR1CuTYIPq0LKsmcWVw+zndeRffc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PlBTn5hWJ179+lHVhTd2X/9v1ALp3XHNirUmqmXZuX6KVpNxWWAUYZdH9uzRfn6Qp
	 38Rr6kGNthHb9HnhQcLl1W/dyE2FfcAnf97tM/WDuvr3XOr7gjT7QGhqh8bF6goAvT
	 DX0L9xXjrL3mUk/YRnaT4LYMAtWK9VC0PtqVo58NbipQfPqXI8qyfj6M5kyz8INzeh
	 nlsrUxcm0pS2wQB6fguxVjpZeujvgCD4bSGMRu73Vuplz3tXEgQisqt8sh5GW4EKHn
	 M+2//dKZKh+j2Y73Mp1B0IJghI1ny7QqS+2obCHrdGtEtuDI/oTX0N2AJl29JvQsMe
	 ldQ8LAHK3j5Xg==
Date: Fri, 5 Jun 2026 14:38:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: add aptina,mt9m113
Message-ID: <20260605-gainful-malachite-clam-31b6bd@quoll>
References: <20260605-submit-media-mt9m113-v3-0-dc3e07d5d70b@herrie.org>
 <20260605-submit-media-mt9m113-v3-1-dc3e07d5d70b@herrie.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260605-submit-media-mt9m113-v3-1-dc3e07d5d70b@herrie.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63897-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,devicetree.org:url,quoll:mid,herrie.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E9F936483BF

On Fri, Jun 05, 2026 at 09:03:00AM +0200, Herman van Hazendonk wrote:
> +++ b/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.yaml
> @@ -0,0 +1,127 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/aptina,mt9m113.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Aptina MT9M113 1.3 Megapixel CMOS Digital Image Sensor
> +
> +maintainers:
> +  - Herman van Hazendonk <github.com@herrie.org>
> +
> +description: |-

Drop |-, also in other places when not needed for formatting.

> +  The Aptina MT9M113 is a 1.3 Megapixel CMOS digital image sensor with
> +  1280x1024 active pixels. It supports dual context operation:
> +  Context A (640x480 preview mode with binning) and Context B (1280x1024
> +  capture mode). It is programmable through an I2C interface and outputs
> +  image data over a 1-lane MIPI CSI-2 connection.
> +
> +properties:
> +  compatible:
> +    const: aptina,mt9m113
> +
> +  reg:
> +    description: I2C device address
> +    enum:
> +      - 0x3c
> +      - 0x48
> +      - 0x5d
> +
> +  clocks:
> +    description: EXTCLK clock signal (24 MHz typical)
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description:
> +      Core digital voltage supply, 1.8V
> +
> +  vddio-supply:
> +    description:
> +      I/O digital voltage supply, 1.8V or 2.8V
> +
> +  vaa-supply:
> +    description:
> +      Analog voltage supply, 2.8V
> +
> +  reset-gpios:
> +    description: |-
> +      Reference to the GPIO connected to the RESET_BAR pin, if any (active

s/Reference to the//

> +      low).
> +
> +  powerdown-gpios:
> +    description: |-
> +      Reference to the GPIO connected to the STANDBY/PWDN pin, if any (active
> +      high). When asserted, the sensor enters low-power standby mode.
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
> +          bus-type:
> +            const: 4
> +            description: MIPI CSI-2 D-PHY
> +
> +          link-frequencies: true
> +          remote-endpoint: true

Drop both

> +          data-lanes:
> +            minItems: 1
> +            maxItems: 1
> +
> +        required:
> +          - bus-type
> +          - link-frequencies
> +          - data-lanes
> +
> +    required:
> +      - endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - vdd-supply
> +  - vddio-supply
> +  - vaa-supply
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/media/video-interfaces.h>
> +
> +    i2c0 {

i2c

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +

Best regards,
Krzysztof


