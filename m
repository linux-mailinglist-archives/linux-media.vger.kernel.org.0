Return-Path: <linux-media+bounces-15681-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B136944680
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 10:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16EEB2826E5
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 08:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 062E216EB6E;
	Thu,  1 Aug 2024 08:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pLPPm9tY"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A35E16C856;
	Thu,  1 Aug 2024 08:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722500605; cv=none; b=SbSEKg6nsQZSL8ykh0FUsZLrlgKb1FfEn+AoBv32T0dvFm0efTxig98k6P+twbNce9OpPEQBZ9RjH8XudB+LOP5Ou7EtBcy4ULYYFOG5vb9vPUBEuIMRHRs/xoxYZ5DhSC4bwyLAhHDKmCEJZ0n+elHFuLxF6uyRNnJHzyrMSrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722500605; c=relaxed/simple;
	bh=Z51j2yPPzqzqUbfDzj+Co7O6I0fAkjzKGVvNCuTWfG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NfVPw3iMrhWkZSKF8PYkpkwUckK8yQGFuXCfbkn5Cs10ZMVqQlwT73A+3+ktzBpzSTnL0ZDV3wdX5PW6HdLp6bqew9LRqfgk+21lbgkaKcPINSd1gPyekyNn5Adeigj37WLFJNfkjrECq5vc3jI/Xny3ETgPOm3666zRENZLVUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pLPPm9tY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67EE0C4AF09;
	Thu,  1 Aug 2024 08:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722500604;
	bh=Z51j2yPPzqzqUbfDzj+Co7O6I0fAkjzKGVvNCuTWfG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pLPPm9tY25L0+aND/5OqSFFujF5t/EgH5zvh599BAyny/hYainjuQBiogHSNCgAGO
	 Y7kzwEXsRDNBjv54Y/EEqw4BYKXaEFCn7v8OjHApMbOQHaqfcokUckHAbLhZHpKJe5
	 hd3tMOKqmpZDVv1s9l/YmjAwOMeZjPTUNRJQ8L7MZhaA5CUl2Xi2pKuygsj4hNtTxg
	 4pvoVD8Y9Q30b4LU+wzujooBFZ1aBPO2sHxy2t1ySYeoom2lG7hyga67Rpkh3+fR+A
	 rNWCSOBwmn/R7rA9x0qk8d9C7fR34HD8VujJRj+ZEbiHZzhonhHNAlXzDLw+9fMPxZ
	 5tbr1xSKq7UDw==
Date: Thu, 1 Aug 2024 10:23:22 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Sebastian Wick <sebastian.wick@redhat.com>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Sui Jingfeng <sui.jingfeng@linux.dev>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Pekka Paalanen <pekka.paalanen@collabora.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH v15 00/29] drm/connector: Create HDMI Connector
 infrastructure
Message-ID: <20240801-fluffy-cuttlefish-of-abracadabra-389feb@houat>
References: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
 <e33dc3c4-9d7d-4c85-97db-b6fd94142131@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="2k5tde7ytku6vb3x"
Content-Disposition: inline
In-Reply-To: <e33dc3c4-9d7d-4c85-97db-b6fd94142131@xs4all.nl>


--2k5tde7ytku6vb3x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Wed, Jul 31, 2024 at 04:56:16PM GMT, Hans Verkuil wrote:
> Hi Maxime,
>=20
> On 27/05/2024 15:57, Maxime Ripard wrote:
> <snip>
>=20
> > Hans Verkuil also expressed interest in implementing a mechanism in v4l2
> > to retrieve infoframes from HDMI receiver and implementing a tool to
> > decode (and eventually check) infoframes. His current work on
> > edid-decode to enable that based on that series can be found here:
> > https://git.linuxtv.org/hverkuil/edid-decode.git/log/?h=3Dhverkuil
>=20
> Since this patch series is now merged in mainline I also pushed support
> for parsing InfoFrames to the edid-decode git repo.
>=20
> I believe the parsing part of the InfoFrames is complete, but the conform=
ity
> checks for the AVI and HDMI InfoFrames are still work-in-progress. But it
> should be easier to develop this now that is merged.
>=20
> The git repo for edid-decode is here: https://git.linuxtv.org/edid-decode=
=2Egit/
>=20
> I added test files to the test/if directory, and if you run:
>=20
> edid-decode -I audio.test -I avi.test -I vendor.test -I spd.test edid.tes=
t -c
>=20
> you'll get the output below.

That's awesome to hear, I'll send a patch for the KMS documentation to
mention it=20

Thanks!
Maxime

--2k5tde7ytku6vb3x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZqtF9QAKCRAnX84Zoj2+
dgiBAX4lptP5eciLgerJmky6HFfb4t9iXMA0gMwf454GyprB/6H1qL24e8eHqpXe
LgfVUI8BfRJ6NBLAdSH0nE87Xf5l/pBV5IacFmB10VRbZ+YSt/9xWQ37E0U2KJAl
R21moyCKpQ==
=3fHv
-----END PGP SIGNATURE-----

--2k5tde7ytku6vb3x--

