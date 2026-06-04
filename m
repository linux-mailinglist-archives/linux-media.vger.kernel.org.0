Return-Path: <linux-media+bounces-63817-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vpCBEIGPIWqkIwEAu9opvQ
	(envelope-from <linux-media+bounces-63817-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 16:45:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 860BD641010
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 16:45:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Ye2mmJqT;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63817-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-63817-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8725D310E364
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 14:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E41EB47F2DB;
	Thu,  4 Jun 2026 14:30:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A42A2C21F1;
	Thu,  4 Jun 2026 14:30:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780583418; cv=none; b=jgNgVup6V1mlJRoyKEOMQSl+lGHnvYIzMc7O5peYtsOlrtu/gxfAbqwMhMfxkMqH49dZEg27HzDNG7HI3Dj/mcTLND2dle5ZDI7ESqx0WzA2b5XhROX9R9a6cAZyKU4iMFARwhyRvhFaiM74lNRcrEAtvSa0UKsPD23LI8leoEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780583418; c=relaxed/simple;
	bh=f33nvWVS0wLcCnQrCnimC0uHmwfyqwlD6Rgwq2wHOA8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Tj9TcE5J/0u0xLRV/3BeB4Kk9PSR55xamDbD0hWTooScw416c7UPI6ngx3+3/mEcede6/5GgyjnEtvDXl3IdZsqDBiKafRjWqkm5dxFlf1RAd67Kl5FctXFzih7u80HKa6uOeXhRH5o2eWbLkX2XWWcD2iWMktRxUCBgUBa49gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ye2mmJqT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC0851F00893;
	Thu,  4 Jun 2026 14:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780583417;
	bh=qr3uSoDHa8AKynQpgdBlkH9nuI2aY3kRPTak651Pxhs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ye2mmJqTAoHQOCS8ub3t9GUZl42jYhFFzd6xedFYmXuewwyHIIJFk85oc0xsjr7J8
	 X/EgkHBcvvjsEHc09LdFAE12K7SVjX3euCiz9gsYj+UcmgxDEk9RNvw7MuanGBK8r1
	 vsNUNBP6aVZZMpiZxngiUN60UPtJxZBQ1KXdMWRbbCUTbU/p8dWZ5LNBCEsn0c/Vo2
	 aS5xCdVKpMBP26vDlN7L00iqaQMzZ3lHeVVbY8HORSlnqA12tbL/1pw0i/QbshD5rs
	 gUj7AOTT6jhx7Xz5neyBg51zOXaD8c8SdEEfSMDmFnhN/yDpIRal5C2D0MpF8iEPOa
	 7Q6jCSbeCarYA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 07/22] dt-bindings: media: i2c: max96712: add
 support for I2C ATR
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dumitru Ceclan via B4 Relay" <devnull+dumitru.ceclan.analog.com@kernel.org>
Cc: linux-media@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260604-gmsl2-3_serdes-v13-7-9d8a4919983b@analog.com>
References: <20260604-gmsl2-3_serdes-v13-7-9d8a4919983b@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 14:30:15 +0000
Message-Id: <20260604143016.BC0851F00893@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lists.linux.dev:replyto,sashiko.dev:url,smtp.kernel.org:mid];
	TAGGED_FROM(0.00)[bounces-63817-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:devnull+dumitru.ceclan.analog.com@kernel.org,m:linux-media@vger.kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:conor+dt@kernel.org,m:devnull@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 860BD641010

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The numeric constraints `minimum` and `maximum` for the `reg` prope=
rty are incorrectly placed under an `items` dictionary, causing them to be =
silently ignored during schema validation.
--

commit c417c9ed09d3bf57f1a0ad62e4ec0a271c4f0578
Author: Cosmin Tanislav <demonsingur@gmail.com>

dt-bindings: media: i2c: max96712: add support for I2C ATR

Document the capability of the MAX96712 and MAX96724 to change the I2C
address of connected serializers. This adds the i2c-atr object and
required properties to the device tree bindings.

> diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.y=
aml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> index 583bbd60157c6..abacc3c874a9f 100644
> --- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
[ ... ]
> @@ -36,6 +36,30 @@ properties:
> =20
>    enable-gpios: true
> =20
> +  i2c-alias-pool:
> +    maxItems: 4
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
> +    patternProperties:
> +      '^i2c@[0-3]$':
> +        $ref: /schemas/i2c/i2c-controller.yaml#
> +        unevaluatedProperties: false
> +        properties:
> +          reg:
> +            items:
> +              minimum: 0
> +              maximum: 3

[Severity: Low]
Is this the correct way to specify numeric constraints for the reg property?

In dt-schema, the reg property is evaluated as an array of arrays of intege=
rs.
By nesting minimum and maximum inside items, these numeric constraints appl=
y to
the outer array's elements (which are arrays), and JSON Schema silently ign=
ores
numeric constraints evaluated against non-numeric instances.

This allows device trees with out-of-bounds register values (e.g., reg =3D =
<4>)
to pass dt_binding_check without generating warnings.

Should the constraints be placed directly under reg instead, which dt-schema
automatically translates?

Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml seems to ha=
ve
the same logic error for its reg bounds introduced in this patchset.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-gmsl2-3_se=
rdes-v13-0-9d8a4919983b@analog.com?part=3D7

