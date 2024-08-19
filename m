Return-Path: <linux-media+bounces-16483-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFEC9571CE
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 19:15:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8901928344A
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 17:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6828C18952B;
	Mon, 19 Aug 2024 17:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CiIYkugj"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AE417C204;
	Mon, 19 Aug 2024 17:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724087656; cv=none; b=mAVBuHx2sX7IcS8JNFAjlaDkJ+69hkmmXw7RZSYO+vTRzRC91yYhQGJmNb4S5L6PEbsbX29tTMkzEdTCyILMQqbjcJxqCI4P2jAK6vqz+dpaJphysrPoKxHHHfX44Gp1h8hHWTffBS0eQf9MheSAGr9sj1PbWCX6XjImJUkBM7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724087656; c=relaxed/simple;
	bh=D4rXMvB3Bdz/8cA/vVPTyWvaegD5vskfGiHQktHttFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OrF5YlokXZmPmIbPKGpUVUdTVD2quZu/vv5atf48n8Etin6jbh/rRZwT73tJFnBWTbX6NRIJPRHS6vQ/KI6kQ0eNsovVfSIj+cLLWqANJ+kk6Iw703QAX58NjB23gvLeekO6JD0dfIdQc+8HxEiDuVG1yT7z2+MQ1obj2OVpkLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CiIYkugj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF85C32782;
	Mon, 19 Aug 2024 17:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724087656;
	bh=D4rXMvB3Bdz/8cA/vVPTyWvaegD5vskfGiHQktHttFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CiIYkugjSpa3rSEuXJgybyqEbI54q/bk2U/54j7MN5jx57XTFULi2KeUL3C3Q3kGp
	 LdlbAUnZ2yrAt/1Jv0bhB07OLTkQO4WYtgS8Uo+Jy56aJaieGX/TSJ9yygUI/vh0C0
	 nP2i5F4Ay3wIZSZeRQ02M1z2jKtmfDFtaOmQOYoEeJAwW1L502Ip/lgBKWWolGk1Ia
	 OukWUnxwIm3U5NQ8m5thQxih3G77ddyL43mTjSf0BE/fgxJIUshAyf4M8wgHwHp0Rb
	 IercqwaRn20eMBeREXag2uoOv0wNjZidQVG89OE/Cp4ijnBqTMswdFAqiceZHlBM90
	 mMNj3bTbWkozQ==
Date: Mon, 19 Aug 2024 18:14:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: dt-bindings: renesas,fcp: add top-level
 constraints
Message-ID: <20240819-chooser-reflected-709513819341@spud>
References: <20240818172937.121928-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TaFKhsVeX3Lea0iD"
Content-Disposition: inline
In-Reply-To: <20240818172937.121928-1-krzysztof.kozlowski@linaro.org>


--TaFKhsVeX3Lea0iD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 18, 2024 at 07:29:36PM +0200, Krzysztof Kozlowski wrote:
> Properties with variable number of items per each device are expected to
> have widest constraints in top-level "properties:" block and further
> customized (narrowed) in "if:then:".  Add missing top-level constraints
> for clocks and clock-names.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--TaFKhsVeX3Lea0iD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZsN9YwAKCRB4tDGHoIJi
0pp5AQD5mtJ354J9iS4BwXG/+0c/BmVRRQOJCsxc6EXbTSKeNAEAvsWjksdenaQ2
sBRPtU9+ClE/YUN8w1IdxJIiVlcy3AM=
=zShp
-----END PGP SIGNATURE-----

--TaFKhsVeX3Lea0iD--

