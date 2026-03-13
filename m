Return-Path: <linux-media+bounces-55753-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDO2IjhFtGk4kAAAu9opvQ
	(envelope-from <linux-media+bounces-55753-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 18:11:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B22D287E25
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 18:11:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C044F300DF65
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 904693CCFC7;
	Fri, 13 Mar 2026 16:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H1Pv4bwH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025A33C8716;
	Fri, 13 Mar 2026 16:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773421063; cv=none; b=kdcYu7ScuMgtMipBCYRyLj7JRNQpfz6OA4EJQgaonJQHGivFaYdm9lWPbFTjIHdiC3glu/rsXUNf6cz1+WnVDX9RQzyqlv6eI2yjY9mtAr+KlAJyqPFyDLLLnk1nh+f8tMgg1gjPybtYy/oLkAusPpIRxomprSP+6sNd2cxJMVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773421063; c=relaxed/simple;
	bh=khXFvWj9lIYktByP7ZJX+6n1NUtFwKtwOcL+GNs+f6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nTjx/7XtPFdEVNgEa0n5cDwmMaaIAxVSxcxULv5d1jS3Oilu58UrBLLXz1tULFOD8HNOWzjruQHIhJGPQ4vh8/DolT5bqlySxio0r1U6Tn/PXbAgAn3VQpuVZoIBW7eg+FoHAGSV2FyU52VKbGLRwthWtzEbtt4qrOVN2fW5zek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H1Pv4bwH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17D4DC19421;
	Fri, 13 Mar 2026 16:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773421062;
	bh=khXFvWj9lIYktByP7ZJX+6n1NUtFwKtwOcL+GNs+f6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H1Pv4bwH7GGTyhgN07TlIWhPaCc06Qelcl21hcmWFA2gCFRfNJKy2ZLuxzPK0AEp7
	 WdU/Fo/NZZgUemhcypakqg8A3v/bCy+D0tTldNYzzZAZROCpPuk7mxLrWfGHj+0LeN
	 MzHlqH6GiI1lXjzi+HAukG1zsCvSCk+2a8FUqMMr9cao/1Qjzk/rV97tyGEqUCrfbw
	 CUzlAMBrw7UbsQkmJoiAUBtK6xQWVsOr01lwr9jEzO0a2DdnSDCf1ixpseg4u0LY1g
	 aQpZQ/N6p3Ht6qlgqDyojPphS/iejYhtOb+GemlTRdroKEfP+k1YVNxuBIDjspZcDZ
	 NUD4m99qPvyBg==
Date: Fri, 13 Mar 2026 16:57:36 +0000
From: Conor Dooley <conor@kernel.org>
To: michael.riesch@collabora.com
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Kever Yang <kever.yang@rock-chips.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	=?utf-8?B?0JrRg9C30L3QtdGG0L7QsiDQnNC40YXQsNC40Ls=?= <mai.kuznetsov.misha@gmail.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Collabora Kernel Team <kernel@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/9] media: dt-bindings: add rockchip rk3588 vicap
Message-ID: <20260313-coyness-jab-ff0c85654555@spud>
References: <20250430-rk3588-vicap-v1-0-b3bddf749914@collabora.com>
 <20250430-rk3588-vicap-v1-2-b3bddf749914@collabora.com>
 <20260313-quickly-imperial-47638c9f0d4f@spud>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S7d/qyDaD5sp6+Yh"
Content-Disposition: inline
In-Reply-To: <20260313-quickly-imperial-47638c9f0d4f@spud>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55753-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[linux.intel.com,ideasonboard.com,kernel.org,sntech.de,rock-chips.com,amarulasolutions.com,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2B22D287E25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--S7d/qyDaD5sp6+Yh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 13, 2026 at 04:56:29PM +0000, Conor Dooley wrote:
> On Fri, Mar 13, 2026 at 04:20:44PM +0100, Michael Riesch via B4 Relay wro=
te:
> > From: Michael Riesch <michael.riesch@collabora.com>
> >=20
> > Add documentation for the Rockchip RK3588 Video Capture (VICAP) unit.
> >=20
> > Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> > ---
> >  .../bindings/media/rockchip,rk3588-vicap.yaml      | 256 +++++++++++++=
++++++++
> >  MAINTAINERS                                        |   1 +
> >  2 files changed, 257 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3588-vi=
cap.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3588-vicap.ya=
ml
> > new file mode 100644
> > index 000000000000..7fd4214921cb
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/rockchip,rk3588-vicap.yaml
> > @@ -0,0 +1,256 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/rockchip,rk3588-vicap.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Rockchip RK3588 Video Capture (VICAP)
> > +
> > +maintainers:
> > +  - Michael Riesch <michael.riesch@collabora.com>
> > +
> > +description:
> > +  The Rockchip RK3588 Video Capture (VICAP) block features a digital v=
ideo
> > +  port (DVP, a parallel video interface) and six MIPI CSI-2 ports. It =
receives
> > +  the data from camera sensors, video decoders, or other companion ICs=
 and
> > +  transfers it into system main memory by AXI bus and/or passes it to =
the image
> > +  signal processing (ISP) blocks.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - rockchip,rk3588-vicap
>=20
> Curious why this cannot share a binding with the existing 3568-vicap.
> Looks pretty similar binding wise at least.
> If it's an entirely different architecture or whatever, please mention
> that in your commit message.

Looking further, it's using the same driver too...

--S7d/qyDaD5sp6+Yh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabRCAAAKCRB4tDGHoIJi
0uVoAQC9aktstpY3Ps5YxtEBxqUOAWA83YHM85wd6hzwHPdf/AEAyxeasFwEek0/
pjKkmZ1ye2nqzV7ZMXoKzZ+qV26aoQ4=
=AHWC
-----END PGP SIGNATURE-----

--S7d/qyDaD5sp6+Yh--

