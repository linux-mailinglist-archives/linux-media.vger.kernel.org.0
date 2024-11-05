Return-Path: <linux-media+bounces-20955-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E9F9BD399
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 18:39:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59494285F1C
	for <lists+linux-media@lfdr.de>; Tue,  5 Nov 2024 17:39:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663B61E3796;
	Tue,  5 Nov 2024 17:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g9lKUavl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B0B1E282C;
	Tue,  5 Nov 2024 17:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730828383; cv=none; b=rlK7FZ3xJt9Dwyj8pjGMZLOg0ozwA55ArDIbf8HrA1/koAowNLDRkdGqyzrd+aK8WEKNTwMHueGIbuf+5UiFT7EHPC0Aaij1qfYCRQCiUbauMpjhdgSosF9Lvaz/7X409EVtnhtXF5O0ye6pzIPmi71lCFA3O3XnxLDmPb5RVxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730828383; c=relaxed/simple;
	bh=QZbld1TF8KsohUr4pPq9BpKFDSwxyE2URVgltsDBIDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CY3KgCDZ1jSFafIzXD6iO5jJ17f/Op+THTiufh3Sc4Dj80yLHqCT1bN2Tdfm2mQRb1bhURKNMRBMbWaU6muuFIQfi46lR40yx0cKppZd/hCKq8y6VMIl3zbAhbpGrvcfkQjUES4mu8e9uzx7CnzabJ2kHQEakPBY8RaitIEitXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g9lKUavl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9800EC4CED1;
	Tue,  5 Nov 2024 17:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730828383;
	bh=QZbld1TF8KsohUr4pPq9BpKFDSwxyE2URVgltsDBIDk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g9lKUavltsMy/YgW1mRbOREkoLHT6SzFY/ltRciRGIXWeU02o3fUYrVXpC4THnNEU
	 j7CRaD86REpFzqxNAdJng+OPBJlIFv8GWy2JPT0v6DIfnAmoRsnFcBMbjtwBfxcjsA
	 8h3IycPpR6OxDQfSm4/f7HNDy8qdVZvDw7AAS+zb6IfbfVwpTN3qO0x6ms25HfbaOq
	 jUrNreINqb4mmREz3gmVLvFYPMp1qJIYKQnjwiqr6FWRYKHBpPY5ebPa3FEQiiQWPy
	 bdfRmnZWJYR2Cmu8Yg4Xm1t447d6k8aQYaGzrabZsPey/BMbtvePXCilClscDGKPU0
	 KYmhjE1Um9yZw==
Date: Tue, 5 Nov 2024 18:39:40 +0100
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
Message-ID: <20241105-succinct-pygmy-dingo-4db79c@houat>
References: <20241104032806.611890-1-victor.liu@nxp.com>
 <173080602214.231309.12977765173766280536.b4-ty@linaro.org>
 <20241105-secret-seriema-of-anger-7acfdf@houat>
 <CD810D31-F9C5-499D-86CF-B94BEF82449A@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="lpikbxgr4ajy2ceg"
Content-Disposition: inline
In-Reply-To: <CD810D31-F9C5-499D-86CF-B94BEF82449A@linaro.org>


--lpikbxgr4ajy2ceg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: (subset) [PATCH v5 00/13] Add ITE IT6263 LVDS to HDMI converter
 support
MIME-Version: 1.0

On Tue, Nov 05, 2024 at 05:33:21PM +0000, Dmitry Baryshkov wrote:
> On 5 November 2024 16:13:26 GMT, Maxime Ripard <mripard@kernel.org> wrote:
> >On Tue, Nov 05, 2024 at 01:28:48PM +0200, Dmitry Baryshkov wrote:
> >> On Mon, 04 Nov 2024 11:27:53 +0800, Liu Ying wrote:
> >> > This patch series aims to add ITE IT6263 LVDS to HDMI converter on
> >> > i.MX8MP EVK.  Combined with LVDS receiver and HDMI 1.4a transmitter,
> >> > the IT6263 supports LVDS input and HDMI 1.4 output by conversion
> >> > function.  IT6263 product link can be found at [1].
> >> >=20
> >> > Patch 1 is a preparation patch to allow display mode of an existing
> >> > panel to pass the added mode validation logic in patch 3.
> >> >=20
> >> > [...]
> >>=20
> >> Applied to drm-misc-next, thanks!
> >>=20
> >> [04/13] media: uapi: Add MEDIA_BUS_FMT_RGB101010_1X7X5_{SPWG, JEIDA}
> >>         commit: 5205b63099507a84458075c3ca7e648407e6c8cc
> >
> >Where's the immutable branch Laurent asked for?
>=20
> The patch set has been picked up after getting an Ack from Sakari,
> before Laurent's email. I am sorry if I rushed it in.

I mean, this was less than a day after you've asked that question
yourself. Waiting less than a day for a mail to be answered seems a bit
short, especially when there's no rush to merge these patches in the
first place.

Maxime

--lpikbxgr4ajy2ceg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZypYWAAKCRAnX84Zoj2+
dqB2AX9GZdjTPnmcByvgBSDmocLc9jx/UxPVwoxcockjnXv6ZTkFXoDJPi/fdgYU
ZVhEdvwBgMatI1KVXAWu/endQAK5PMRNxHeFsbekB5ouNQnFLuCJ1Hnf5FHt+whO
wHHi4EMLFA==
=rM90
-----END PGP SIGNATURE-----

--lpikbxgr4ajy2ceg--

