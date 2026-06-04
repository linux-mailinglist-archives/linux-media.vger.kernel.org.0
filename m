Return-Path: <linux-media+bounces-63818-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dHFPMpGPIWqpIwEAu9opvQ
	(envelope-from <linux-media+bounces-63818-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 16:45:37 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29137641023
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 16:45:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=JVeKnTyV;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63818-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63818-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 778743116E51
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 14:31:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4C247ECFA;
	Thu,  4 Jun 2026 14:31:27 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6B42DECDF;
	Thu,  4 Jun 2026 14:31:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780583487; cv=none; b=PZ4SY1uPlFPHE+txRlCaF3krGpzZHir/Pm+rFxgXFchIu0t5z1Kgpl/KWYprTKYnj8mD2hkxCKgtsfx9H1En+YIP6lUHNoQQuRDS6907ALjm/mAvUHbbpUOTr3lvfwGGneWcc/N6EtARfgC/cVgGNDRfXVeNXoXtlQvsQjI0Blc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780583487; c=relaxed/simple;
	bh=vdqCPMsfk6VMhS3Kw51jUq9KVBlolRkr3oAkXhEZoOY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ov89LMBNwZqW2DHuzn/LzE+hCrpcKLBhZbU4WICH5GcCqU5cdXVRpSfZW3tHagT/p0/5LKLp5pAr4io+iGbc/K4AoFiLA9y69dtWihRtpNqUs8/iwNiMsxasL45Y+7nScYTWYJehrxtqzfQT4CXLF209t8Av3pe/UgKxKycJ9Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JVeKnTyV; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 207491F00893;
	Thu,  4 Jun 2026 14:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780583485;
	bh=VHuK8ekaPrSgCX880FM/DAKYuDyx4cHnsY8r4Dbloiw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JVeKnTyVpKcfO5ACIxUK7dTAnqjtXjDMhTyG8KewiLMXi/RW8JX4PHHt8UmE3Ju3I
	 aD2iaNEygRZPz+5gfc/puMczhqmq1OsHxXjz8WWqZzMbDUL6phmS8oXNUWhbixAzxJ
	 yZ9woGEwcid+shPostHWu4xWy47LM4XnT2TNRq+G8r5eO6eQoIE2A3g5GCBj7NXfcg
	 WsLWZNiXjGdZhkVLfJK2/uasW5xOwNo7uVZZwQtm/VaNtXTbhbNZfMlj12cG9Sz24E
	 IO1KgaUCkDI3A1qz+HuGKTfQxiSshzXtAqBqjZxH2MdWGgv7/wwcZz0p1b2+DOzAe9
	 GuL7cCrhRECOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 02/22] dt-bindings: media: i2c: max96717: add
 support for I2C ATR
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan via B4 Relay" <devnull+dumitru.ceclan.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-media@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260604-gmsl2-3_serdes-v13-2-9d8a4919983b@analog.com>
References: <20260604-gmsl2-3_serdes-v13-2-9d8a4919983b@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 14:31:24 +0000
Message-Id: <20260604143125.207491F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,sashiko.dev:url,lists.linux.dev:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TAGGED_FROM(0.00)[bounces-63818-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:devnull+dumitru.ceclan.analog.com@kernel.org,m:devicetree@vger.kernel.org,m:robh@kernel.org,m:linux-media@vger.kernel.org,m:conor+dt@kernel.org,m:devnull@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dumitru.ceclan.analog.com,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 29137641023

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `i2c-atr` node and its child nodes omit mandatory properties=
 from their `required` lists and lack appropriate array constraints in the =
device tree bindings.
--

commit 92e28a019c543a99bd1f06cdc7c8d1709ad721cf
Author: Cosmin Tanislav <demonsingur@gmail.com>

dt-bindings: media: i2c: max96717: add support for I2C ATR

This commit adds support for I2C Address Translation (ATR) to the MAX96717
bindings, maintaining I2C gate support for compatibility.

> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.y=
aml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> index d1e8ba6e368ec..976f6dd2c164c 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
> @@ -91,6 +91,30 @@ properties:
>        incoming GMSL2 link. Therefore, it supports an i2c-gate
>        subnode to configure a sensor.
> =20
> +  i2c-alias-pool:
> +    maxItems: 2
> +
> +  i2c-atr:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +

[Severity: Medium]
Since the i2c-atr node acts as a bus container for child nodes with unit
addresses, should #address-cells and #size-cells be included in a required
list here to ensure they are always present?

> +    patternProperties:
> +      '^i2c@[01]$':
> +        $ref: /schemas/i2c/i2c-controller.yaml#
> +        unevaluatedProperties: false
> +        properties:
> +          reg:
> +            items:
> +              minimum: 0
> +              maximum: 1

[Severity: Medium]
The child nodes define a reg property for their unit addresses, but they do
not specify it as mandatory.

Should there be a required list containing reg for the ^i2c@[01]$ nodes to
prevent them from silently passing validation without a unit address?

Additionally, the reg property applies items constraints but lacks a maxIte=
ms
limit.=20

Could this technically allow malformed arrays with multiple valid items=20
(like reg =3D <0 1>) to pass schema validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-gmsl2-3_se=
rdes-v13-0-9d8a4919983b@analog.com?part=3D2

