Return-Path: <linux-media+bounces-53688-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OD+GJcJ1oWkPtQQAu9opvQ
	(envelope-from <linux-media+bounces-53688-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 11:45:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B52941B624A
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 11:45:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6EA7B3050E69
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 10:45:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA0393E9F9C;
	Fri, 27 Feb 2026 10:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zhw5zAn0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B6D3C198F;
	Fri, 27 Feb 2026 10:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772189106; cv=none; b=rbnpZt6xOzYuCVueeS8FDKwEnsQDFIMfyyjoLoWzB6Dc48x8Y6dOgqJpvmpMb92OrR/HzmzV3bekkuSqZY4FE5B6cqR76tasv0SwiWctIDsRKzwj7kGrympV4oDJGqhIhCrEBRCwJyKdY6wFNp+cwSlTtrWFel7h4GvW/6Fwia8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772189106; c=relaxed/simple;
	bh=xt6m21T316YRs2MqjpM0+Vlxf7fBnTeYJucPWPyF2y8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GekaGl8gKHeartcDh9dbmoE2URXX9qlRUhfew2e1XwRF4ZIpY5N2mocV9EcL/RQ2gLKbfl7isphf2W1tSKAan0Sdm7gPzQm8o4JrvXIQONR1QzvJmUq11g/oAzWpNQ4EcGtG6hZw7yGhSxK5oAtWn8WfIAZ1x5Z8NSS79JXXxcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zhw5zAn0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34864C116C6;
	Fri, 27 Feb 2026 10:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772189105;
	bh=xt6m21T316YRs2MqjpM0+Vlxf7fBnTeYJucPWPyF2y8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zhw5zAn0HKwQEoqL1ZQN3doeLB+2Bp8zaBcnJEmXgL4yZL974df66p+9+Nmn+JMSh
	 USW2fOjXMg/Xn6AGFLo6bHhsKzGGJ0ItGvWlIopVpCP4bRRo19bhUET9aE56GTc+Oy
	 ZpkH6SkogdLShZHZCuooSqASIPk6TzrwcHPCYzjaE3ijGVUJSFw2ykL5VoDEzuxG1D
	 puMnxG/UG2RXWOK4ijkn09BNQBl55jAT8ewNb92p1FBqZStlalJYqW60r7/QWV99e9
	 rqLKl2zk/gQU7cmMDT/nZVt5wZUwOuNBBiNspGSrrWKH6k3heRDyRnIxBXHBqLZ7Xi
	 JZavIov09nQQg==
Date: Fri, 27 Feb 2026 11:45:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jimmy Su <jimmy.su@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH 1/8] dt-bindings: media: i2c: document Omnivision OV08D10
 CMOS image sensor
Message-ID: <20260227-imported-benevolent-stingray-e97dfd@quoll>
References: <20260226-ov08d10-v1-0-c3a916368123@emfend.at>
 <20260226-ov08d10-v1-1-c3a916368123@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260226-ov08d10-v1-1-c3a916368123@emfend.at>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53688-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,emfend.at:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: B52941B624A
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 09:56:01AM +0100, Matthias Fend wrote:
> Add YAML bindings for the Omnivision OV08D10 CMOS image sensor.

Drop YAML. You add DT bindings, not YAML. No YAML is bound here to
anything.

> 
> Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> ---
>  .../bindings/media/i2c/ovti,ov08d10.yaml           | 101 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 102 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..96dbf61cf7c188544f4120216ae2b8e0155128b7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov08d10.yaml
> @@ -0,0 +1,101 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/i2c/ovti,ov08d10.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Omnivision OV08D10 1/4-Inch 8MP CMOS color image sensor
> +
> +maintainers:
> +  - Jimmy Su <jimmy.su@intel.com>
> +
> +description:
> +  The Omnivision OV08D10 is a 1/4-Inch 8MP CMOS color image sensor with an
> +  active array size of 3280 x 2464. It is programmable through I2C
> +  interface. Image data is transmitted via MIPI CSI-2 using 2 lanes.
> +
> +allOf:
> +  - $ref: /schemas/media/video-interface-devices.yaml#
> +
> +properties:
> +  compatible:
> +    const: ovti,ov08d10
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: MCLK input clock (6 - 27 MHz)
> +    maxItems: 1
> +
> +  reset-gpios:
> +    description: Active low XSHUTDN pin

So maybe rather powerdown-gpios, see gpio-consumer-common.yaml?

> +    maxItems: 1

Best regards,
Krzysztof


