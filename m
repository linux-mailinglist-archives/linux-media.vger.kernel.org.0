Return-Path: <linux-media+bounces-26022-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99959A3141E
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 19:31:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1486A1887D2A
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 18:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD468253B73;
	Tue, 11 Feb 2025 18:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fEvRIfA0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1430E1E3793;
	Tue, 11 Feb 2025 18:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739298656; cv=none; b=ND3+AWSNkSJaCtgqu2Mj0IAtzSK4cF1a0QTG1bi+e8fAOYpIunV0YjXAt1p2Vf+1GlhV9jOPaOuQPffLloR0IoMMgvnYwR0/4qlDvjM2ML1FQsyOHCo5CJScEYcNFhO6OZZZIfkXADTzRUTYvFtnG/tisR8jEJZKWvpXm5NBpCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739298656; c=relaxed/simple;
	bh=UouR7Hq/5305cDEy8L5ZCWm8n4ZbVGn8bQH302oqU7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ivhEddX8bes7Jx+TJV1H6XHiOLdqxWcwBc8yk5DbClXv2ZpCh2w5LPo636g2qoO94kkiwbIUzBbX+918t8xEm7SFCn94gabmtrs6tPsTkC0uZJt9kcJsQUinFhIGggMFE9+odb0csleXdYNBA8dU8vP4n4b9SnjvhGCSxksrlr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fEvRIfA0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA05EC4CEE6;
	Tue, 11 Feb 2025 18:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739298655;
	bh=UouR7Hq/5305cDEy8L5ZCWm8n4ZbVGn8bQH302oqU7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fEvRIfA0JONRcdjj07fnVPfYCkdCLLQFcRVwpHiEo80mZzpCuzKBsO43SC4vjBjzX
	 zkbRLpbadEqwBln8gEso3PRTztIX2NrwdRTTbwg1eV2R4ihAVeM4N+XsIew0gmo4me
	 gtF/Sin8p3/HJkQyXKlszaqpE93YG8LHtIQa62OsjyQMDi1fwY1T71DJAPcdOHIEhd
	 bVn63gn/KobUhHL5ell+CUgb5QcYhqfmWwG6sBQ9ukmaNKCnIHOf+58NVmmOpjYaFE
	 gaXna3bvheQXdNEFXJj1CN4KjMtH2Kk5mIBlCv9b5qvWxW2mISUthSXfRf05gSXygX
	 Q7Dsp/c+BKiBg==
Date: Tue, 11 Feb 2025 18:30:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@iki.fi>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: media: imx219: Rename binding file with
 vendor prefix
Message-ID: <20250211-tricking-blooming-3ba5fcc32d72@spud>
References: <20250208195202.23164-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CBR0+rR48SecnfFG"
Content-Disposition: inline
In-Reply-To: <20250208195202.23164-1-laurent.pinchart@ideasonboard.com>


--CBR0+rR48SecnfFG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 08, 2025 at 09:52:02PM +0200, Laurent Pinchart wrote:
> The imx219.yaml file is the only DT binding for Sony sensors that
> doesn't start with the vendor "sony," prefix. Rename it to
> sony,imx219.yaml.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--CBR0+rR48SecnfFG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6uXWwAKCRB4tDGHoIJi
0sXVAQDe1PeLWjx+NoLZSMmLMx6gkCQuvjtglVfda/Mlb0jn3AD/Ro/iX60eqSrN
n1cOPtjrZbMAjIbnvMvUvvrh/ccV3wI=
=jlV5
-----END PGP SIGNATURE-----

--CBR0+rR48SecnfFG--

