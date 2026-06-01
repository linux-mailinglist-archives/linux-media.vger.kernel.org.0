Return-Path: <linux-media+bounces-63329-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uC/hGLDxHWotgAkAu9opvQ
	(envelope-from <linux-media+bounces-63329-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 22:55:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9912062566F
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 22:55:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D04B330142A0
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 20:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D7153E171A;
	Mon,  1 Jun 2026 20:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BbaSCAm4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFEC367B9D;
	Mon,  1 Jun 2026 20:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780347147; cv=none; b=tDFomFmFhwPw3A3MMdCUkcEjgDBhr5mPBe5WZR1p5IFupm99MuCze3qMPhg1tuvxaSfOQanPdm5CF7K4JmpFC/wSYygKPNSrS1G2dCWtPAef3PBuXI405foM9m/vGOn/MLxvCkvdIeuutIFi7TvNgZHwqejBFfYd71d6sLwVhEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780347147; c=relaxed/simple;
	bh=I705dylY35MxKeizsajtXy4srBJWJrFurXUT/EwVMQY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hFTghz39RXy+uCSHLqFgfANFSDQWZC8pcDM3pzwTC34asetsZfScORE6r+1IxoOqzzqNAN8Uakz/QEDPpMsUxNo47eOfRXgKPX3pSG88yV3EHGA/mfH09ivqwOLPqcR2e2IZXho6cmnmY+MRsMvHXdnbYKWFQQWXOD6eWemS3n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BbaSCAm4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 049BA1F00893;
	Mon,  1 Jun 2026 20:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780347146;
	bh=ZuvCiP5PaeoUjYAC7X+rXL0KsNzopeMuNsrHG+vNZRo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BbaSCAm426vsMqQpf2dQERPMMWAgQntH9E0rV5raR7j1jT0TpQRZ0BULB4+p7gLfh
	 88Pa29k7Ra57u0go4UKq7HfKIAJ8CAfKz/MWvrTf45cUbTSZgXKZbQEclFuj58IJqh
	 CvH6CKHwpa4yEUnQn5DKKV8of7q/8K90XM/dOmiJrHiYeuplH+ru8OoaFXGOJ0aopG
	 V4t/OANfxaRuWdRrpnv6d2k1jIHY+TtXUd1xza2u9QyxgBjczzADI9cJFiBEBbh/4j
	 7BZgYBhpAOF2Q3+dWFaEAWDyQhyFXjb7wzj/BvCBkXlGYvGlrfrC3cHJp2+UwTwxGg
	 +rX9K0bSdivOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: Pinefeat cef168 lens control board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aliaksandr Smirnou" <asmirnou@pinefeat.co.uk>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260601204814.19148-2-asmirnou@pinefeat.co.uk>
References: <20260601204814.19148-2-asmirnou@pinefeat.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 20:52:25 +0000
Message-Id: <20260601205226.049BA1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pinefeat.co.uk:email,smtp.kernel.org:mid,sashiko.dev:url,lists.linux.dev:replyto,devicetree.org:url];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63329-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_NO_DN(0.00)[];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev]
X-Rspamd-Queue-Id: 9912062566F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The Device Tree schema describes software rather than the physical =
hardware, violating Device Tree design principles. The title explicitly cal=
ls the binding a 'driver' instead of the hardware device, and the commit me=
ssage intentionally omits power supply definitions because 'the driver does=
 not manage any regulator', which couples the hardware description to curre=
nt software limitations.
--

commit 5752dd4b724a501f53ddad43b87fa9c0328d6fb5
Author: Aliaksandr Smirnou <asmirnou@pinefeat.co.uk>

dt-bindings: Pinefeat cef168 lens control board

This commit adds the Device Tree schema and examples for the Pinefeat
cef168 lens control board. It supports controlling Canon EF and EF-S
lenses via V4L2.

> Power supply is derived from fixed supplies via connector or GPIO
> header. Therefore, the driver does not manage any regulator, so
> representing any supply in the binding is redundant.

[Severity: Low]
Device tree is intended to describe the physical hardware independent of
the operating system or current driver features. Shouldn't the physical
power rails be described in the binding, even if the current driver does
not actively manage them?

> diff --git a/Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.=
yaml b/Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml
> new file mode 100644
> index 0000000000000..1295b1f4edebc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/pinefeat,cef168.yaml
> @@ -0,0 +1,47 @@
[ ... ]
> +$id: http://devicetree.org/schemas/media/i2c/pinefeat,cef168.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Pinefeat cef168 lens driver

[Severity: Low]
Does this title reflect a conceptual mismatch by referring to a software
driver rather than the hardware device? Would it be better to title this
"Pinefeat cef168 lens control board" to match standard device tree naming
practices?

[ ... ]
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false

[Severity: Low]
Because physical power supplies are omitted from the schema, does setting
additionalProperties to false prevent creating a complete, hardware-accurate
device tree? If someone describes the board's actual power rails in their
device tree, it will fail schema validation. Should the physical supply
properties be added here to allow accurate hardware descriptions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601204814.1914=
8-1-asmirnou@pinefeat.co.uk?part=3D1

