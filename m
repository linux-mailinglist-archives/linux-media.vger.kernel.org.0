Return-Path: <linux-media+bounces-62003-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOV2LmsfC2q8DgUAu9opvQ
	(envelope-from <linux-media+bounces-62003-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:17:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 369E156E8C6
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 16:17:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E747530432CB
	for <lists+linux-media@lfdr.de>; Mon, 18 May 2026 14:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F7A140757A;
	Mon, 18 May 2026 14:09:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C3048A2A0;
	Mon, 18 May 2026 14:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779113353; cv=none; b=r53VZvAswPuucLwTIHXIWxPdjFIJYKzRwTQ+5BA6CCj5pK42sQTE2XERQuO1WAJSq5szt22LxLrHg2nvlaIaUlz+wRez3rUXxEw1V3UBzjm2ExfVIcfhuVg6Zv6oIy139dDDZ+67BHG3NmYCNuDUSXUJ0DNhpJ9/LEGBBqgSmNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779113353; c=relaxed/simple;
	bh=C4EouULlVJ70fDU7X74GWe5KYyvJLTPove6jA6fU19c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJwJZuNtT/I+hMbJeCc+ZdQgQ1vVDc6wJ/kGPiKluzYXH1dTNzIE0DeU/9QJ5e5g4Q+YcdP85bd295x2MBPOcoOz5Sw1oZT1jNQcLP9hVrwu6NAVJ59GSoAyzg367cilWmKXYamhCFWI2/790J87s9EKDhuEL4AbucJ2qQU3FhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 3985B1F8005C;
	Mon, 18 May 2026 14:09:03 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 20B78B407F3; Mon, 18 May 2026 14:09:01 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 838E7B407F7;
	Mon, 18 May 2026 14:08:51 +0000 (UTC)
Date: Mon, 18 May 2026 16:08:50 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arash Golgol <arash.golgol@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH 00/16] media: sun6i-csi/isp MC-centric support and
 cleanups
Message-ID: <agsdcmRQtQYD1KaH@collins>
References: <20260518102451.417971-1-paulk@sys-base.io>
 <20260518121511.GD21216@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1hdy3NiqHIhYUnpy"
Content-Disposition: inline
In-Reply-To: <20260518121511.GD21216@killaraus.ideasonboard.com>
X-Spamd-Result: default: False [-1.56 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62003-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[sys-base.io];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,lists.linux.dev,kernel.org,gmail.com,sholland.org,linuxfoundation.org,collabora.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[paulk.fr:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 369E156E8C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--1hdy3NiqHIhYUnpy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

Le Mon 18 May 26, 14:15, Laurent Pinchart a =C3=A9crit :
> On Mon, May 18, 2026 at 12:24:35PM +0200, Paul Kocialkowski wrote:
> > This series first introduces some fixes and new formats to v4l2 format
> > info, one of which we need for the sun6i-csi driver. Support for
> > MC-centric format enumeration is then added, along with cleanups and
> > improvements for both the sun6i-csi and sun6i-isp drivers.
> >=20
> > The first 4 patches are already reviewed and ready to go and are
> > included here as a reminder that this series depends on them.
>=20
> Patch 04/16 has no R-b tag.

Oops you're right, I added the tag in my reply to the patch yesterday
but did not add it when resending it with this series.

All the best,

Paul

> > Arash Golgol (4):
> >   media: sun6i-csi: bridge: Use V4L2 subdev active state
> >   media: sun6i-csi: capture: Implement vidioc_enum_framesizes
> >   media: sun6i-mipi-csi2: Use V4L2 subdev active state
> >   media: sun8i-a83t-mipi-csi2: Use V4L2 subdev active state
> >=20
> > Paul Kocialkowski (12):
> >   media: v4l2-common: Fix NV15_4L4 format info block height
> >   media: v4l2-common: Add missing tiled format info block sizes
> >   media: v4l2-common: Add NV12_16L16 pixel format to v4l2 format info
> >   media: v4l2-common: Add NV12_32L32 pixel format to v4l2 format info
> >   media: sun6i-csi: Split format validation to a dedicated helper
> >   media: sun6i-csi: Add support for MC-centric format enumeration
> >   media: sun6i-csi: Tidy up and unify coding style
> >   media: sun6i-mipi-csi2: Fix parenthesis alignment
> >   media: sun6i-isp: Add dummy params link_validate implementation
> >   media: sun6i-isp: Use V4L2 subdev active state
> >   media: sun6i-isp: Add support for MC-centric format enumeration
> >   media: sun6i-isp: Add support for frame size enumeration
> >=20
> >  .../sunxi/sun6i-csi/sun6i_csi_bridge.c        | 153 +++++++---------
> >  .../sunxi/sun6i-csi/sun6i_csi_bridge.h        |   9 -
> >  .../sunxi/sun6i-csi/sun6i_csi_capture.c       | 168 +++++++++++++-----
> >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.c   | 107 ++++++-----
> >  .../sunxi/sun6i-mipi-csi2/sun6i_mipi_csi2.h   |   2 -
> >  .../sun8i_a83t_mipi_csi2.c                    | 113 ++++++------
> >  .../sun8i_a83t_mipi_csi2.h                    |   2 -
> >  drivers/media/v4l2-core/v4l2-common.c         |  12 +-
> >  .../media/sunxi/sun6i-isp/sun6i_isp_capture.c |  47 ++++-
> >  .../media/sunxi/sun6i-isp/sun6i_isp_params.c  |  37 +++-
> >  .../media/sunxi/sun6i-isp/sun6i_isp_params.h  |   4 +-
> >  .../media/sunxi/sun6i-isp/sun6i_isp_proc.c    | 117 ++++++------
> >  .../media/sunxi/sun6i-isp/sun6i_isp_proc.h    |   7 -
> >  13 files changed, 437 insertions(+), 341 deletions(-)
>=20
> --=20
> Regards,
>=20
> Laurent Pinchart

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--1hdy3NiqHIhYUnpy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoLHXIACgkQhP3B6o/u
lQzgWBAAjRaAAzEGF8iRPZsjcNNCPSKtGqSNpi4BoTAS50vH3SNcWlp/uLnjcSYh
zZpsK8ScF9XYEN4ooeEHDakoMC33qkRIA3ISlKhIFZGpxhD1/neVOBLb96BmZopt
c3n7Llgv0G7bbaJKPKjc3laxnuRCYA5+z7LnTLj/w/l8DKQNXs7ci19GYKx4Zs27
NQn/rqfONj1o2yrObi/xQmr/QRBTXhJ203NL/oqS+HT7pqiBpPRlv/BZmG9cVjHg
Xv9YqDQqk0NHEStWcaiFtXeDFOVIo3xq6CnPJx/IhNOaHAd/yGbGHp52UiyBACGx
vpppLRS3XFWyByk8SL0FOIS6qauBUxnP5vKsGlyIpD++sgKxpzoR0UkQhoSDpJFI
4IqVIqJT17YrPfAoaXqsDFlpmC38deCDwl2SDWPN2KNvuVMlMp87TfpmQUxFtDsz
m5fFyRQxs6OGkRKoxTAIdxlLOasHJmPJzvwOcpEdJK3TfmYqnvipYWhDs2nN4C6I
aIUg1r/9id1JLtPjpQp6H/UEOhLyFU5vkXX0JkAHuHjvlRYV9vbUCQBth+x4+QNc
msInkVfmff3Gooli+kwKNHRqKOfhTnidL970O1PSEifBV7PxjQyc2TMRv/oKsNii
Ef/WTmDCRchEsjfpd+yK8eeUjKx3She13MeMkBphB3pYOVwXN6Y=
=UHeJ
-----END PGP SIGNATURE-----

--1hdy3NiqHIhYUnpy--

