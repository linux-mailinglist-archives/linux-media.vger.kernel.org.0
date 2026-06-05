Return-Path: <linux-media+bounces-63945-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yHzhCvT1ImovfwEAu9opvQ
	(envelope-from <linux-media+bounces-63945-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 18:14:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E9A649AA3
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 18:14:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cvy8igCG;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63945-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63945-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6837F304DF8A
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 15:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72F1A3CE083;
	Fri,  5 Jun 2026 15:57:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AB9282F19;
	Fri,  5 Jun 2026 15:57:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780675040; cv=none; b=FSzGexpjDPFanIleVS4E+J4LIIsqnMqLdfPBzJn8tSFMXaBIWbYkbc2/PPAury7f6VlbfihdxO8LCFx2rfU+P3z5VP3xmaSIzYb7DfyWSygfZlr7xNecfw1qPB3HsXO+4gcbsbPg/HFAhzJjLq9a6ioRAwj63JtwBDneiNIA8rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780675040; c=relaxed/simple;
	bh=IXIDlDkH2Nt6GRHpfdIyQBJBx6ELNclUnu+w2kuYhws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxwGdtcKQpMA54DJNqZ3F/di/QEzB6EnYxDKTUqE9tZc52U5rQaLYI6PGIzwVWQFfUbyexuMQqHUZfIoTNLaB0gh59FUuo0ppDiPvU9p6XOHnjoL/WWJyl2DF7Gju33xdp3EgOLpKlAiS+ZyZGaQGhPtO5dLUDD1LvGF06IrV/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cvy8igCG; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 387A21F00893;
	Fri,  5 Jun 2026 15:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780675039;
	bh=IXIDlDkH2Nt6GRHpfdIyQBJBx6ELNclUnu+w2kuYhws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cvy8igCGY7PDXHIdo0Cjq3euuz1JFzyWYk1eo4eSz3kLcMU7/M/yMpojTuwHCG3E/
	 PlXhDx1+fnTDGnfoWL7rjL2LT0U83XqSztYECPAbHlj3IVElx7laDEVgYht3Tu99Cx
	 5QhUGcxACu2FhOPj3/c2TzZkMS+h44zkxnSPN5IbFXHbIZdbaGjq+1reYSHvrYBvjC
	 eoOAYhD+xyyKLWvBA0IhdLk1gtNAIcQilZ8ofWi2wM9q640uLWZ5rMfSDC3g+uZ+C/
	 H3u5X26A4FOONlD0o9Arr8tTPOj3AacITH+tb8UUoVRxQ9wVQU6YAfsVSPoaxzT8B2
	 srqshCrhgG9+w==
Date: Fri, 5 Jun 2026 16:57:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Lachlan Michael <Lachlan.Michael@sony.com>,
	Ryuichi Tadano <Ryuichi.Tadano@sony.com>,
	Kengo Hayasaka <Kengo.Hayasaka@sony.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: media: i2c: Add Sony IMX678
Message-ID: <20260605-bullion-polka-bb32563c904b@spud>
References: <20260605-imx678-v4-0-58e57c67143d@ideasonboard.com>
 <20260605-imx678-v4-1-58e57c67143d@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZNPYUyk16cDvnTmt"
Content-Disposition: inline
In-Reply-To: <20260605-imx678-v4-1-58e57c67143d@ideasonboard.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jai.luthra@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:kieran.bingham@ideasonboard.com,m:Lachlan.Michael@sony.com,m:Ryuichi.Tadano@sony.com,m:Kengo.Hayasaka@sony.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-63945-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,spud:mid,microchip.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 20E9A649AA3


--ZNPYUyk16cDvnTmt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 05, 2026 at 08:56:28PM +0530, Jai Luthra wrote:
> Sony IMX678 is an 8.4 Megapixel (3856x2180) CMOS sensor, that can output
> pixels over MIPI CSI-2 bus. Add bindings for it.
>=20
> Runtime detection for mono vs color variant of this sensor is feasible
> by reading a register, but it's not always desirable given the sensor
> needs to be powered on for it, potentially flashing a privacy LED or
> wasting precious boot time.
>=20
> The manufacturer or vendor knows which sensor variant they are putting
> on their board, so we define the compatible property to expect the
> (color/mono) specific name of the sensor.


> This should still be followed by the generic fallback device name,
> "sony,imx678". If some vendor wants to share firmware (DT blobs) across
> "products" or SKUs that only differ in the mono vs color variant of the
> sensor used, they *can* do it by skipping the specific name at the cost
> of a build-time warning from dtbs_check.
>=20
> Drivers are expected to handle all three device names (two specific, and
> the generic fallback) gracefully.

I don't agree with this having this statement in the commit message, but
you're free to do it in the linux driver if the subsystem maintainers
tolerate it. This isn't how the compatible property is expected to be
used, and writing a note in a commit message doesn't define the ABI.
If, in the probably unlikely case, someone in bsd or $other-os wants to
support this device, they're not bound to make the same decision you
have.

With it gone,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

pw-bot: changes-requested

Cheers,
Conor.

--ZNPYUyk16cDvnTmt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiLx2wAKCRB4tDGHoIJi
0pWxAP9c/ou5rm6z6E8WuAd+/i+IyP5VS1CTr4+sGGxJ9KlM1wD/VriJx1OMyjj9
M9e+kEr58WtY4gS7j4dH+yoCaP8kgww=
=R8/t
-----END PGP SIGNATURE-----

--ZNPYUyk16cDvnTmt--

