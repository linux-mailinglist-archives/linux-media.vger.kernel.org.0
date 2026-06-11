Return-Path: <linux-media+bounces-64557-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0RmKJ9d8KmqwqwMAu9opvQ
	(envelope-from <linux-media+bounces-64557-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 11:16:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED13867050C
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 11:16:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="L/O6gOxk";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64557-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64557-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13E2B32F3D53
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 09:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB3F83BADA2;
	Thu, 11 Jun 2026 09:11:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636EB368D4A;
	Thu, 11 Jun 2026 09:11:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781169077; cv=none; b=tVJ9hsFsJWCjL570saidQpC0YKNGkLTnYMId/GGUJLhNJUZBJklMrqjTqGCE/0ZqAj2+B7oCt02KZmcqy6u+nTjrGObebkydZt5fEt/DSC+wWnziYe/KQJaBYWr1+pVeB33GHkey0CuojsA6Y382WpM0D+RPMIPrORCXniQf/fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781169077; c=relaxed/simple;
	bh=NAU8VKqenZvqGZd4PWSx1Yx2j+N7BsMozSDP6s7YrIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DKn7SD3dNmA4hf7mhAMRhXUWWxkCMhuXx1ZYH7kl254qZ9VMD64ZZR7FTwtHtE0vDB13xOQ3vXPJFr9Gr+Gh4sHljNWNIZsf+kh/eUvF7r9mPz8eoKC20EgoPdDMhHgDjTfy8ZJI2WxI8kXBTJlri/dFOO6l/oW8vN2lxgM1zsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L/O6gOxk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E6D1F00893;
	Thu, 11 Jun 2026 09:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781169076;
	bh=lzXA25URE+Z/E5E0m7kyKvf5l04TxbOXv1Cr7KL0nNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L/O6gOxkcdGkahO3ZcEeCmWCstQzOYodjryBqWFDBpewPmLuSXaK5nD90m8jnkAcW
	 0t638v0UGOqWLQDL/HS530NuJL8eFfOdRBV3pgtdT240I/4TaLALPaS4iXZbhJFLxB
	 aZ6QtkdIzsyuUSEDr9GbPBXgpsadFUhCpbscl1xKOD76iigVgKul3pDaw2i+g3Ps+S
	 Kg5sWZ/N0k/dpjji8LXdfl6sa7qT9+mfYIF57gN9B/MlMqT7efkwJBh3VA7VwifVUs
	 6BOgp4QrVYBOGpPPTqyb/z4r7gGG5NBkQ4y1dKvDUTKB65BbWH7C3ejevR6kIyiKf9
	 KpK70uKEQY98A==
Date: Thu, 11 Jun 2026 11:11:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ramshouriesh <rshouriesh@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, 
	Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Aleksandrs Vinarskis <alex@vinarskis.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 2/9] media: dt-bindings: Add Himax HM1092 NIR sensor
Message-ID: <20260611-fluffy-dark-ammonite-e3d5ed@quoll>
References: <20260610-a14-himax-hm1092-v1-0-0c9907da47ed@gmail.com>
 <20260610-a14-himax-hm1092-v1-2-0c9907da47ed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260610-a14-himax-hm1092-v1-2-0c9907da47ed@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:rshouriesh@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mchehab@kernel.org,m:bryan.odonoghue@linaro.org,m:vladimir.zapolskiy@linaro.org,m:loic.poulain@oss.qualcomm.com,m:bod@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:alex@vinarskis.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-phy@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-64557-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,devicetree.org:url,quoll:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED13867050C

On Wed, Jun 10, 2026 at 04:39:27PM +0530, Ramshouriesh wrote:
> Add a dt-binding schema for the Himax HM1092 1MP monochrome
> near-infrared CMOS sensor, used as the face-authentication IR camera on
> Snapdragon X laptops such as the ASUS Zenbook A14. The sensor streams
> 10-bit RAW over 1 or 2 MIPI CSI-2 data lanes.
> 
> The optional generic "leds" property (video-interface-devices.yaml)
> associates an IR illuminator flash LED with the sensor, which the
> driver strobes while streaming.
> 
> Signed-off-by: Ramshouriesh <rshouriesh@gmail.com>
> ---
>  .../bindings/media/i2c/himax,hm1092.yaml           | 118 +++++++++++++++++++++
>  1 file changed, 118 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
> new file mode 100644
> index 000000000000..085001493a20
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
> @@ -0,0 +1,118 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/himax,hm1092.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Himax HM1092 Monochrome NIR Sensor
> +
> +maintainers:
> +  - Ramshouriesh <rshouriesh@gmail.com>
> +
> +description:
> +  The Himax HM1092 is a 1 megapixel monochrome near-infrared CMOS image
> +  sensor with a MIPI CSI-2 interface, commonly used as the IR camera for
> +  face authentication on laptops. It supports 10 bit RAW output at
> +  1288x728 over 1 or 2 CSI-2 data lanes. An optional infrared
> +  illuminator LED may be associated with the sensor through the generic
> +  "leds" property; the driver strobes it while the sensor is streaming
> +  so the scene stays lit for IR capture.
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: himax,hm1092
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  avdd-supply:
> +    description: Analogue circuit voltage supply.
> +
> +  dovdd-supply:
> +    description: I/O circuit voltage supply.
> +
> +  dvdd-supply:
> +    description: Digital circuit voltage supply.
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: Active low GPIO connected to the XSHUTDOWN pad.
> +
> +  leds:

Drop, unevaluatedPropertes already allows that.

> +    description:
> +      Optional phandle to an infrared illuminator flash LED strobed by
> +      the driver while streaming.
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    additionalProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        additionalProperties: false

use unevaluatedProperties here

> +
> +        properties:
> +          data-lanes:
> +            minItems: 1
> +            maxItems: 2
> +          link-frequencies: true
> +          remote-endpoint: true

And drop these two

> +
> +        required:
> +          - data-lanes
> +          - link-frequencies
> +          - remote-endpoint

Why do you need this? Which other binding did you take as an
example/starting point?

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks

Supplies are required

> +  - port
> +
> +unevaluatedProperties: false

Best regards,
Krzysztof


