Return-Path: <linux-media+bounces-63860-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JFmsK1hHImqEUgEAu9opvQ
	(envelope-from <linux-media+bounces-63860-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 05:49:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6E2644F1A
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 05:49:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dPTP4IwC;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63860-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63860-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 570703040C5E
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 03:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29EA13F23C9;
	Fri,  5 Jun 2026 03:49:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49413264DD;
	Fri,  5 Jun 2026 03:49:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780631376; cv=none; b=oFEfn0FcMbjsONiGr1pNdTyKrYKA5IZMK8vZ7vy3X7RinKj4vKjJGbtPkgu+KN03dxnumY5rvrBszQ5eXeko94jboIm4dFyAkBLKoOLt/VtxM53wccIedYsC0thJWzYpcwl+JxFhIt5MISBFnj1nJvuKe6HJZwWfyMZiFuHXX6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780631376; c=relaxed/simple;
	bh=lXTpcmAkaEpwn5t82yvuAd3o09rJpVtkSBabO4ghCt8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YxDZObPZE3q5UM8lA9lIYstt8eB7Rv0p5PP4GMDL99QYxecYr58SUNBB9zNz/jRX/5i+qKCwAG62ZQQbAJGZ5i+vcPlD1Tg2ztBeOWAZFS42ZJR8KevBzuIWEhp5KXclDsEEo1uOhEwITtcdlwDkWkVXqbfDBinIIKDGkBXmoPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dPTP4IwC; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F15F11F00893;
	Fri,  5 Jun 2026 03:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780631375;
	bh=V+i9sV626KtxQpclHZKn0AzcvWcKSOmXs1bxRGOkc64=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dPTP4IwCwZrRzBHac8U76uJIDHGlycobotNozHRVU1du7R6rk4jYAQneLUvDkGesZ
	 liCxUeQMiXYXZV/PWV02Jre62Kkvu0drr8TkP/Ywz5luvTftsm8G8AGs4mgu393vfX
	 S4N/rjF1GzeGuK1HmT47hIUqOoPJIcIE5yeo2V3Daw33Ji69ypAnGzuJGivaROWSDq
	 P3npfTCRm5LjSY2fkofv2TQXeiZEz0VMGXbqoFY9eGSwwGMLaHrb4KWmR0B7WOn9s3
	 YfHvj870E6GGQXfGmESvHAT1jJ42dLzxlEXGTMdqPwZUu2+AX+8ykk+5Uy/rz3VW6b
	 W7cfanAiwV22A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: media: i2c: add aptina,mt9m113
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk via B4 Relay" <devnull+github.com.herrie.org@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20260605-submit-media-mt9m113-v2-1-de1cc807f4cf@herrie.org>
References: <20260605-submit-media-mt9m113-v2-1-de1cc807f4cf@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 03:49:34 +0000
Message-Id: <20260605034934.F15F11F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smtp.kernel.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,herrie.org:email,vger.kernel.org:from_smtp,sashiko.dev:url,lists.linux.dev:replyto];
	TAGGED_FROM(0.00)[bounces-63860-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:devnull+github.com.herrie.org@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:linux-media@vger.kernel.org,m:devnull@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,github.com.herrie.org,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2C6E2644F1A

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Missing schema length constraints for `reset-gpios` and `powerdown-=
gpios` arrays.
- [Low] Binding strictly rejects standard camera properties by not referenc=
ing `video-interface-devices.yaml`.
--

commit 63f988e66ed5aa2849614f19a1ca36bc01146bb7
Author: Herman van Hazendonk <github.com@herrie.org>

dt-bindings: media: i2c: add aptina,mt9m113

Adds a new device tree binding for the Aptina MT9M113 1.3 megapixel image
sensor. The binding details the I2C address, optional GPIOs, regulators, and
the MIPI CSI-2 port configuration.

> diff --git a/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.y=
aml b/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.yaml
> new file mode 100644
> index 0000000000000..7fa7cb2fedf96
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.yaml
> @@ -0,0 +1,127 @@
[ ... ]
> +  vaa-supply:
> +    description:
> +      Analog voltage supply, 2.8V
> +
> +  reset-gpios:
> +    description: |-
> +      Reference to the GPIO connected to the RESET_BAR pin, if any (acti=
ve
> +      low).
> +
> +  powerdown-gpios:
> +    description: |-
> +      Reference to the GPIO connected to the STANDBY/PWDN pin, if any (a=
ctive
> +      high). When asserted, the sensor enters low-power standby mode.

[Severity: Low]
Should these properties include a maxItems: 1 constraint?=20

In Device Tree schemas, properties with the -gpios suffix map to arrays.
Without an explicit maximum length, dt-schema validation might allow arrays
of any length to pass. Since the hardware has exactly one reset pin and one
standby pin, enforcing a limit of 1 seems appropriate here to ensure strict
validation.

> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
[ ... ]
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

[Severity: Low]
Does this schema need a reference to=20
/schemas/media/video-interface-devices.yaml# before strictly disallowing
additional properties?

Camera sensors frequently require standard physical properties like rotatio=
n,
orientation, or flash-leds to describe how they are mounted on the board.
Setting additionalProperties to false without including the standard video
interface device schema will erroneously reject valid device trees that use
these common properties.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-submit-med=
ia-mt9m113-v2-0-de1cc807f4cf@herrie.org?part=3D1

