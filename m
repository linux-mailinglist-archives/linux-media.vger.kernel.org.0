Return-Path: <linux-media+bounces-63870-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0o6OL3Z5Imo6YAEAu9opvQ
	(envelope-from <linux-media+bounces-63870-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 09:23:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A675D645ED1
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 09:23:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PK0AKcwJ;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63870-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63870-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 08E0C3099049
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 07:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C52478842;
	Fri,  5 Jun 2026 07:11:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFBA44B679;
	Fri,  5 Jun 2026 07:11:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780643475; cv=none; b=iksuOhXBqO+e97+W7iJEpM35nx2/ls5f3eGXEURSeJMajA2lLBPFcCKxMLm8VZrIGsslZkfrvpzcbvNLoG+2WErspRE2RW5t2jj6YzbGYA0NHPLxwugtVJ8LpbdBNZ/nMx2MA2mScxGniA+WY4cQ6R5GqfnncHCxM1o/A+kFIgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780643475; c=relaxed/simple;
	bh=8ZHl3fJD8laa5crkQ9mMUIKrNEUr2OTcdR2h/z0amwc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Np/ZJ1PAVqbDHf41d4njBinIG6FxUHFvAOdDsGLhjwUY4f9zdXQJzf6cqUQoJvG28hebv/Hhg+lcKQ8mTq8OTYlAKMfv/17fyrxN/SQgWkmBhatGhL+SnUOZ2y5Y9MOh9nFEe3bIHyZn5Af+sEJh/5k8ZN2SbIt14IgIfcCiy88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PK0AKcwJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DAC71F00898;
	Fri,  5 Jun 2026 07:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780643473;
	bh=43V9Y7tABONpCCl0HOTBKNJvUKj07vHbbg3Juw9xODc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PK0AKcwJd4XhkCE88zfr57Swh6m4VaxjQLrm3UzDpd3DYiKab/ImNSULBqOyVZo3L
	 49lsIdWWKuGJqszNiYOMe4ZKmHAhsajcVb0ozpW5Pc8SZJeQu/6LuVyB7tK307oQjo
	 St7O2prxM2LOti6QmvXU9PjoySqXm08sigNExJM3qul6UxFfdLPxuKinre6zJaw03F
	 z3I2QLq7FLNvJLa5f/vaIDzH+w+RVLrjfQd1FytZusQaSb2CeSH3isG6f5jzgHDFv/
	 Shl02XsJ9APwzLhYZyBCwADVjqpaIuxyy67YJWzdQtGhwnbPauAqoIZSrPzCfSA9xE
	 /iKvWA/QOodhw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: media: i2c: add aptina,mt9m113
Reply-To: sashiko-reviews@lists.linux.dev
To: "Herman van Hazendonk via B4 Relay" <devnull+github.com.herrie.org@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-media@vger.kernel.org
In-Reply-To: <20260605-submit-media-mt9m113-v3-1-dc3e07d5d70b@herrie.org>
References: <20260605-submit-media-mt9m113-v3-1-dc3e07d5d70b@herrie.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 07:11:13 +0000
Message-Id: <20260605071113.6DAC71F00898@smtp.kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,herrie.org:email,sashiko.dev:url];
	TAGGED_FROM(0.00)[bounces-63870-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:devnull+github.com.herrie.org@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:linux-media@vger.kernel.org,m:devnull@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A675D645ED1

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `reset-gpios` and `powerdown-gpios` properties lack the `maxIte=
ms: 1` constraint.
--

commit 5ab8d70c4704ffb84f721fd8458f27f181d12b4a
Author: Herman van Hazendonk <github.com@herrie.org>

dt-bindings: media: i2c: add aptina,mt9m113

This commit introduces the device tree binding for the Aptina MT9M113 1.3
megapixel image sensor. It defines the required and optional properties,
including the I2C address, regulators, and GPIOs for reset and powerdown.

> diff --git a/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.y=
aml b/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.yaml
> new file mode 100644
> index 0000000000000..7fa7cb2fedf96
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/aptina,mt9m113.yaml
[ ... ]
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

[Severity: Low]
Does this property need a maxItems constraint? Since the MT9M113 hardware h=
as
exactly one RESET_BAR pin, adding maxItems: 1 would prevent the schema from
silently permitting invalid device trees that specify multiple GPIOs here.

> +
> +  powerdown-gpios:
> +    description: |-
> +      Reference to the GPIO connected to the STANDBY/PWDN pin, if any (a=
ctive
> +      high). When asserted, the sensor enters low-power standby mode.

[Severity: Low]
Should we also limit powerdown-gpios with a maxItems: 1 constraint to prope=
rly
match the single STANDBY/PWDN pin on the hardware?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-submit-med=
ia-mt9m113-v3-0-dc3e07d5d70b@herrie.org?part=3D1

