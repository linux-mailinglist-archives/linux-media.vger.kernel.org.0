Return-Path: <linux-media+bounces-23723-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A509F6D3C
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 19:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF04A1886FAA
	for <lists+linux-media@lfdr.de>; Wed, 18 Dec 2024 18:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F1D1FBCAF;
	Wed, 18 Dec 2024 18:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RIIiVOrJ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EA11FA82E;
	Wed, 18 Dec 2024 18:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734546317; cv=none; b=ESYdlXdWKYb/t+6BgqcSShdCajOydh9InLeajzIL02LuZecsCEmjyiLE3M4SZyRTlPd2eAQa1m+pNAssTPdvShlFjBAfDbyvCPRq8MVTp0RCQWIadqzIWRDmWPLSZKRHnhUvF59/SBgpY6Kk5+ZUNrVN3Y4SNizLGw6vYLmO4O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734546317; c=relaxed/simple;
	bh=D6u2L19JS6pbTNNuvH1fm6hioIhl6wEIC6EicTPp610=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V559ZZ44AvJeDZTtxKPATkIHVrYTp8CeerHIU9j9VMWlKv1gYcwrnniUZ/sF95jf3OsnOAtTZXko03SZnOY9L8no+21lmg21KetP3iq3r0xyaBuhyePs74gHlWVA3yxj8kZ/xVtxq0DQo82AcgcFRpXHF0qHdx9onQrrlaHqUOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RIIiVOrJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 626BCC4CECD;
	Wed, 18 Dec 2024 18:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734546316;
	bh=D6u2L19JS6pbTNNuvH1fm6hioIhl6wEIC6EicTPp610=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RIIiVOrJhpS4mof2OVCscKCGFjYkMtydgnNgGl+n07x+zrtd45qEeG3yepUU3d+00
	 JioGl9EWw9Wd8DM5GwWKl0UTaDCVEQ3Fg5oLaY5trT3zIAG43bzPzLBriiLG0epXw1
	 os5hshz4vbltC3BAn4TObhZViNPU9KcGhGd7PVtN53Y0F0aQVJESZyTn4tBTicUXqo
	 cMlViXOom2Tik2+JLWGzIzQEaajTOjKG+zTn99zt3/wXU+LqBdkx/oftVaKb0Lun6M
	 vrcwBsQPjYpsF/7dQk/hF8B+gGiC1aFZKAidMgwORmEgkocYtVSv6FK5iu2ev2GWG1
	 MrRTg4kZIt6fw==
Date: Wed, 18 Dec 2024 18:25:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Alain Volmat <alain.volmat@foss.st.com>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: media: clarify stm32 csi & simplify
 example
Message-ID: <20241218-yelling-palm-da676b67afb9@spud>
References: <20241217-csi_dcmipp_mp25_enhancements-v1-0-2b432805d17d@foss.st.com>
 <20241217-csi_dcmipp_mp25_enhancements-v1-2-2b432805d17d@foss.st.com>
 <20241217-crawfish-tiring-792c535301d0@spud>
 <Z2HpVyVEs7jn0VPd@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e6nk/t1HXQvWcK4R"
Content-Disposition: inline
In-Reply-To: <Z2HpVyVEs7jn0VPd@kekkonen.localdomain>


--e6nk/t1HXQvWcK4R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 09:12:55PM +0000, Sakari Ailus wrote:
> Hi Conor,
>=20
> On Tue, Dec 17, 2024 at 06:24:42PM +0000, Conor Dooley wrote:
> > On Tue, Dec 17, 2024 at 06:39:19PM +0100, Alain Volmat wrote:
> > > Clarify the description of the stm32 csi by mentioning CSI-2 and
> > > D-PHY.
> >=20
> > > Remove the bus-type property from the example.
> >=20
> > Why? What's there to gain from the example being (seemingly?) less
> > comprehensive?
>=20
> As the device has D-PHY, other options are excluded. I.e. that property is
> redundant for this device.

That should be mentioned in the commit message.

--e6nk/t1HXQvWcK4R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2MThwAKCRB4tDGHoIJi
0o0EAQDdidjMXnrkFQSJAvyE/XWYtA2L1k+FW4aOm16Xb96MYwD/eAxuFSIsmUDZ
+vFPpziEjTA32zkU1AjGcSfHJIsolAs=
=TaR/
-----END PGP SIGNATURE-----

--e6nk/t1HXQvWcK4R--

