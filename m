Return-Path: <linux-media+bounces-20948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BC09BD1EE
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 17:13:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1383285DCC
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 16:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 900871741D1;
	Tue,  5 Nov 2024 16:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cmUmzpkQ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD97225D7;
	Tue,  5 Nov 2024 16:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730823210; cv=none; b=GWEYFWevuO7YRNEAtoPKAC0VcMylOpwWxHUiJ6T2vr/2rEbzsSJKFVy22JW1uXhXcMmciSJwk4bTWu5G4CDGocxzO4YKrL6+CBoSlNeQfvmERRElTfPbFOFTzbJ0kJSL4os3/5fPvK13eUOW1qaMEiQmSSRP9yR0VOCv341kyWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730823210; c=relaxed/simple;
	bh=eSDIHL9Lx3jVJUWMPjnlix71KpWYWYL873yuyuGqT0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QUDKl9D2f3MKciOecpvWrNhrmrcPO3W+YiL+YU5bgORA8yu3B6A69r24k9lf764oNgE4oqAkfwHSIi4ObKZtE5zYQhki5xg+C3tJBL1wPoIBQsJ0qHPcSaIcfJ3diHfuixDDnVt9ALT65i3m1f2dYYFkfL9W/9vQEPeMXeOHH4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cmUmzpkQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E07BEC4CECF;
	Tue,  5 Nov 2024 16:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730823209;
	bh=eSDIHL9Lx3jVJUWMPjnlix71KpWYWYL873yuyuGqT0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cmUmzpkQx1/Q9DXUjX6qBSgVLuVoYrjwF7maZOnNTP8rntuCaih5cVAODKLgP9Xbx
	 Id6wrA4M1+sJJ2WctqX/t7/5OCTjNwoMHWGoIn1QxU6eeJYjMN4XVSEMLtiLq2o6nB
	 X6CKGQFei6HirQn0NHS0yRf2FTbNpy2rCxLVYnM3Pk+ukAYZnsaUruILjxVCMOxmHL
	 omX9drWCXTUEdVuzq8Zgft3AJdTsXqIguxqAilbQYBkfaIZxF0ZchCJdBGl2814h1Y
	 F+uZ6xxrw3ycJNUY5agKm0WxD883qreG94QfZBKxl7MDtdfTCRSRscfP/QrywxmrOm
	 zr78CgKSUV1Lw==
Date: Tue, 5 Nov 2024 17:13:26 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Liu Ying <victor.liu@nxp.com>, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, 
	jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_jesszhan@quicinc.com, 
	mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	sakari.ailus@linux.intel.com, hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com, 
	quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de, nfraprado@collabora.com, 
	thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, 
	marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: (subset) [PATCH v5 00/13] Add ITE IT6263 LVDS to HDMI converter
 support
Message-ID: <20241105-secret-seriema-of-anger-7acfdf@houat>
References: <20241104032806.611890-1-victor.liu@nxp.com>
 <173080602214.231309.12977765173766280536.b4-ty@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ttos2pb3wymv4mp7"
Content-Disposition: inline
In-Reply-To: <173080602214.231309.12977765173766280536.b4-ty@linaro.org>


--ttos2pb3wymv4mp7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: (subset) [PATCH v5 00/13] Add ITE IT6263 LVDS to HDMI converter
 support
MIME-Version: 1.0

On Tue, Nov 05, 2024 at 01:28:48PM +0200, Dmitry Baryshkov wrote:
> On Mon, 04 Nov 2024 11:27:53 +0800, Liu Ying wrote:
> > This patch series aims to add ITE IT6263 LVDS to HDMI converter on
> > i.MX8MP EVK.  Combined with LVDS receiver and HDMI 1.4a transmitter,
> > the IT6263 supports LVDS input and HDMI 1.4 output by conversion
> > function.  IT6263 product link can be found at [1].
> >=20
> > Patch 1 is a preparation patch to allow display mode of an existing
> > panel to pass the added mode validation logic in patch 3.
> >=20
> > [...]
>=20
> Applied to drm-misc-next, thanks!
>=20
> [04/13] media: uapi: Add MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG, JEIDA}
>         commit: 5205b63099507a84458075c3ca7e648407e6c8cc

Where's the immutable branch Laurent asked for?

Maxime

--ttos2pb3wymv4mp7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZypEJgAKCRAnX84Zoj2+
dpfjAYCXCR61pzRZkuGkWB3Yv+7EqMH0dEZY3hO4ujeNE9k4Yn3LG2W7QlAouHUq
cGDO9t4BgPfRY/sKNRxOUREUKrW7wHa0QyC5uc8aFlYphEWapGbIqlEboX1Y6kAW
ANhpVKTYMw==
=83wB
-----END PGP SIGNATURE-----

--ttos2pb3wymv4mp7--

