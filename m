Return-Path: <linux-media+bounces-449-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 766147EE301
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 15:37:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D1CCB20BFC
	for <lists+linux-media@lfdr.de>; Thu, 16 Nov 2023 14:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652902EAE4;
	Thu, 16 Nov 2023 14:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XaiyQAw5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A715D328CB;
	Thu, 16 Nov 2023 14:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C46DDC433CA;
	Thu, 16 Nov 2023 14:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700145461;
	bh=al1iPQtTj5S8+kmJIvOjqSlIMqeFQE4WgzTUxwqsS4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XaiyQAw5H9nI4k/r2urZShY7clc73iJIc/DXXYT8AhI/6SizqYyXjQK1/1j+udscd
	 VhjWXkjd/xYHXX1jFZUk3a4IQNxlhHuFQMZcUm6ArwRTzu6r+asT/CWBNOxUlqgaP1
	 hCf4YXOH4bBANzDVW1IqkvbQVBjmF6UXGNxyFGfu4FjTocbFCkmm7TreO9LQVo6DoX
	 uoMahCdT6WCxo3pjMQgmAYhcU29K4KVpvBpQM21n5BhnSJEZB6z2CUVKWZIto6u9s7
	 Xw+yLq3P2mIGbQmW/pbzcyjTGlz7SpN6oc+9cLcrZpWmXiUmD8iUbENVU4IBV+RL/I
	 deNS0dH2ecYMQ==
Date: Thu, 16 Nov 2023 14:37:38 +0000
From: Conor Dooley <conor@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mehdi Djait <mehdi.djait@bootlin.com>,
	krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
	conor+dt@kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com, alexandre.belloni@bootlin.com,
	paul.kocialkowski@bootlin.com, dafna@fastmail.com,
	helen.koike@collabora.com, heiko@sntech.de,
	paul.elder@ideasonboard.com
Subject: Re: [PATCH] media: dt-bindings: media: rkisp1: Fix the port
 description for the parallel interface
Message-ID: <20231116-rigor-rectified-2edcf9461c05@squawk>
References: <20231115164407.99876-1-mehdi.djait@bootlin.com>
 <20231116005140.GB21041@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a5aVI6MThUXgtnrw"
Content-Disposition: inline
In-Reply-To: <20231116005140.GB21041@pendragon.ideasonboard.com>


--a5aVI6MThUXgtnrw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 16, 2023 at 02:51:40AM +0200, Laurent Pinchart wrote:
> On Wed, Nov 15, 2023 at 05:44:07PM +0100, Mehdi Djait wrote:
> > The bus-type belongs to the endpoint's properties and should therefore
> > be moved.
> >=20
> > Fixes: 6a0eaa25bf36 ("media: dt-bindings: media: rkisp1: Add port for p=
arallel interface")
> > Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
>=20
> Good catch.
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--a5aVI6MThUXgtnrw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVYpLgAKCRB4tDGHoIJi
0vPhAQCT1dp7os5Z5idwlawY+a9tjPvQ5f/v4/48A/rLXyU0/QD/b2SEgPCdTPuQ
k0UQJ631n1qR1zcC5ZkEkQx+SVoxug8=
=8ET4
-----END PGP SIGNATURE-----

--a5aVI6MThUXgtnrw--

