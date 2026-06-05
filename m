Return-Path: <linux-media+bounces-63946-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vrc9BMH2ImpSfwEAu9opvQ
	(envelope-from <linux-media+bounces-63946-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 18:18:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5303649AF9
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 18:18:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=lY2H0RZy;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63946-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63946-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B76693071028
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 16:00:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEA173E5A09;
	Fri,  5 Jun 2026 15:59:54 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C013DCDB1;
	Fri,  5 Jun 2026 15:59:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780675193; cv=none; b=dcVg76gqxaifP+tnk8QEFwlQxc7A1mTrIW1rV2wC8KsRnE2FxRZxo4ShZ+ahPERHIlNGs5n9nNhPOdaa8SKEYjcjmFLwao+LfuoSQrKXIxZ3UUEw4hDYFNYjRroOOUOGhtS5sE479qLPduMjTuXDOaMyO2QX1cw9xprJK87U+F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780675193; c=relaxed/simple;
	bh=Y08j+LDsjB9f4S1Z0ciIitcn8Jut7729W7PIZ42hO+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E8VvZc3I++63l4ESSTtarPNjzuhh1qIXdIN+zvnFvS2KE+o1amdEKhE/Cc37Jt6HKLgfLMSuyG/6dpCOXGfg16f9YCilkXtNPm5hIIMphbKWbQ1EWeQHE7teQSu67vzAcn9Ogs+NkLuux5bX2aBzaxBvvPo95RAg8l6go9MmONE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lY2H0RZy; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 586481F00893;
	Fri,  5 Jun 2026 15:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780675191;
	bh=Y08j+LDsjB9f4S1Z0ciIitcn8Jut7729W7PIZ42hO+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lY2H0RZygrXP/jbWkHigT8mONKGyLv7i55SIKLZoGg0DGFDRt5wBh7nwK8N5VOcKG
	 OHBce8xHxdVOwGGiXml4PSPOdOLD+LzzrWURi9dvpLOAlXe5PgqLyjZQbBRPVrq5v8
	 uOpbcuiKvOLWrIGmmM5CTdjb2sG2ngb+xcdrQV7cGruKCc/0svvi1e4BUmZymeD09W
	 EI5woEyBUpq0t4T4tSAYJ9W4Ksdi4qo1OQs5wPpR5uwfThvGfda8Z5ERDK7vQCN/6p
	 ewJRRGIDMi2dvjXvdF1TduYAnj0KqfG6p2VvaKMXWLLTyVDNGwYkiBEwKE/WCqTxDF
	 WWR0JmVU1nwUw==
Date: Fri, 5 Jun 2026 16:59:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH] dt-bindings: media: Add macros for video interface
 devices
Message-ID: <20260605-unturned-shady-6d3ac6f41e38@spud>
References: <20260605150309.2451456-1-kieran.bingham@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p0zanEI4reQ2OAnq"
Content-Disposition: inline
In-Reply-To: <20260605150309.2451456-1-kieran.bingham@ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63946-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS(0.00)[m:kieran.bingham@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,microchip.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E5303649AF9


--p0zanEI4reQ2OAnq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--p0zanEI4reQ2OAnq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiLycwAKCRB4tDGHoIJi
0hViAQD1EYtgtKviWpKopfkjNDPTX84bv8MP9gWdr1QxV6tZDgD+INgO5ASKd7nc
sTvSZIaTXpvcS9IrzI4wUTzW/wGfcA8=
=9E5c
-----END PGP SIGNATURE-----

--p0zanEI4reQ2OAnq--

