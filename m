Return-Path: <linux-media+bounces-64020-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id a3fDMwcXJGra2wEAu9opvQ
	(envelope-from <linux-media+bounces-64020-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 14:48:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0749564D82F
	for <lists+linux-media@lfdr.de>; Sat, 06 Jun 2026 14:48:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=hh7M+Mhk;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64020-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64020-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0735E303FF8B
	for <lists+linux-media@lfdr.de>; Sat,  6 Jun 2026 12:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83E2B3AD520;
	Sat,  6 Jun 2026 12:42:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145F44C81;
	Sat,  6 Jun 2026 12:42:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780749771; cv=none; b=Rrn77WDxz6/FdhoGySlVBnQD80/c27LCMJ0T4orZAdfzcX4GBdvkKb0ApfGu1lV1BlLdQE5Ir7zU4lP+JZLjsfl6nPH3w39xzVu5lLH4lon4NYDnTzmPtaqL/MCgnl9aRecyCyss2HEGjzjF8Z1fLaJsBPckooenDYWvKSAnhjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780749771; c=relaxed/simple;
	bh=7RsOpDmxKWnkMQcWXMbFpf34xrJzbd4E8CSdEajis1A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=baB137t/G5ykYxAaumdpAjP+eaw6cWt5tMLh/owW/Ha9ioJJCA3UcZAgdxxi30GWpAgHWW29xPdLl1YjE5tLWcAKObX4IaD32wx8l4pCjCERpUkqPtLFdJUm4ikmSOVdX+9/MWVj62DQXIVsg+i8u+JISM4LN5SHvmORcoepM2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hh7M+Mhk; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79B71F00898;
	Sat,  6 Jun 2026 12:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780749769;
	bh=y2lR0tg2DloQKXJEIQ+ZTOeNYj5Yn1yjM0AX3488hO4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hh7M+MhkNWd9vXY/3gYKxoDxy31eGCra2wUYP5AmvWM09QN7sWGaaoCsr9jaRvOjX
	 bw/IhMqVbQ6rOrMaORSvHEJp989Wv92qpxfnBirVvNvZyliAM4sVZLmEyjWtWqgXQy
	 UpzIBGl72Kz3TzivvzQXy3r1/eZM3Kuqg6HN2BSEBbZaffyUZNhWFcOJACblwCa5aM
	 +wJLhyQmc5HldJbACo+prVt6kGTLtLxipXMrESadiuFIuVEwMYYtbZkhOp9MJlMm8M
	 spBBPbPkDRr1FA/lIMEsc/UU+gr5kY7QKFDD5UgVyDQEOb3rQAlcMkHJmj7ulnac+B
	 WxZCL3LqxY8og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/2] dt-bindings: media: i2c: add aptina,mt9m113
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk via B4 Relay" <devnull+github.com.herrie.org@kernel.org>
Cc: robh@kernel.org, linux-media@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260606-submit-media-mt9m113-v5-1-2088c7358e11@herrie.org>
References: <20260606-submit-media-mt9m113-v5-1-2088c7358e11@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 12:42:49 +0000
Message-Id: <20260606124249.B79B71F00898@smtp.kernel.org>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sashiko.dev:url,lists.linux.dev:replyto,herrie.org:email,smtp.kernel.org:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_FROM(0.00)[bounces-64020-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:devnull+github.com.herrie.org@kernel.org,m:robh@kernel.org,m:linux-media@vger.kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:devnull@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	TAGGED_RCPT(0.00)[linux-media,github.com.herrie.org,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0749564D82F

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The schema lacks a `data-lanes` constraint, allowing invalid config=
urations to pass validation.
--

commit 79e83e3556be09a3d2a83b67549cbb782161a0a4
Author: Herman van Hazendonk <github.com@herrie.org>

dt-bindings: media: i2c: add aptina,mt9m113

This commit adds the device tree binding schema for the Aptina MT9M113
1.3 megapixel CMOS digital image sensor. It describes I2C addressing,
regulators, clocks, GPIOs, and the MIPI CSI-2 connection port.

> diff --git a/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.y=
aml b/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.yaml
> new file mode 100644
> index 0000000000000..72b827c47b1d2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.yaml

[ ... ]

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

[Severity: Low]
The commit message mentions that the sensor outputs image data over a
1-lane MIPI CSI-2 connection. Should this endpoint block include a
constraint for the data-lanes property to restrict it to a single lane?

Since video-interfaces.yaml permits up to 8 data lanes, omitting a
data-lanes restriction here (such as maxItems: 1) would allow invalid
multi-lane device tree configurations to silently pass schema validation.

> +
> +        required:
> +          - bus-type
> +          - link-frequencies

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606-submit-med=
ia-mt9m113-v5-0-2088c7358e11@herrie.org?part=3D1

