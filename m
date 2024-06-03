Return-Path: <linux-media+bounces-12439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B338D7E60
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 11:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06CA91F263C5
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 09:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9ECC80056;
	Mon,  3 Jun 2024 09:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NKWfADtT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FC16BFA7;
	Mon,  3 Jun 2024 09:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717406353; cv=none; b=DfBK+y+o1CVQQO6CKErQ5IUMQxtvMaWSnNyg/0IxUirVWYnfReFmxQS1DyCwLQk1p3YgFcx0r8XSmf8bVmfTFilwG88kqM1rcQnZiWsQ8yct/208x4iCrtvVTUPmLWlF8UEwAxkJjZKiLr1Br+SpsnfsmTjWPKnwDvtFzl66+dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717406353; c=relaxed/simple;
	bh=8xgDdE1s0Sy7MSL/lvwJ5vd91bhOXjXzA/bKRupcguk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XytZNeyD/DO2DPqZVSARejMfMj2sOmxMCJeks9DKSy4TUIOMRmJK+NIjHd8kDSMG+WDYwNF1hLVwhcpg92JXOwjjGQKqT5zm3dogvr42x9VPGLCqEAgFktedWaMuDCZmBuh5ktayIf6MeFqDIFb/JSAt7NfplbdBAI5Hm5jGE1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NKWfADtT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53725C2BD10;
	Mon,  3 Jun 2024 09:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717406352;
	bh=8xgDdE1s0Sy7MSL/lvwJ5vd91bhOXjXzA/bKRupcguk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NKWfADtTehZuSolnbCX4vpsNlZ7jbsxupSZd4OJekHLJoq5v46n8U4bLUwjSuVGhP
	 yHhW+Fr3gs3RjmXj0ctGg/HqXwmXF8N8oQ8ic4hwW+q2XrTYwmoX1go5s7WJVULgbA
	 K1xOIoq2LrQAwb/zVdnUSnmRMLhyUDmH3z0IhwPxIRXr7HyVU3E6iFQh5cUmE+ep3h
	 nldVKWnC7OeSLj3E4quZram4nv3gkRqS+NDgRB+M6KvOvluAdoGIo7YrTc+yRbVzz4
	 5R6LfuFWKVYuhynKmG/Y2a/z5bwzwa3eeVc+DVhL0NfxxlF6gVa6LOwtF+P0SzYYHP
	 vPJKPDho5gMxA==
Date: Mon, 3 Jun 2024 11:19:10 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sebastian Wick <sebastian.wick@redhat.com>, 
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Sui Jingfeng <sui.jingfeng@linux.dev>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Pekka Paalanen <pekka.paalanen@collabora.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH v15 00/29] drm/connector: Create HDMI Connector
 infrastructure
Message-ID: <20240603-nippy-ludicrous-caracara-e02e3c@houat>
References: <20240527-kms-hdmi-connector-state-v15-0-c5af16c3aae2@kernel.org>
 <874jadesaj.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="vh7l4xzntgu42oo4"
Content-Disposition: inline
In-Reply-To: <874jadesaj.fsf@intel.com>


--vh7l4xzntgu42oo4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jani,

On Fri, May 31, 2024 at 09:43:16PM GMT, Jani Nikula wrote:
> On Mon, 27 May 2024, Maxime Ripard <mripard@kernel.org> wrote:
> > Let me know what you think,
>=20
> Sorry to report that this series generates a bunch of kernel-doc
> warnings in include/drm/drm_connector.h. Documenting nested struct
> members doesn't work as smoothly as you'd expect:
>
> ../include/drm/drm_connector.h:1138: warning: Excess struct member 'broad=
cast_rgb' description in 'drm_connector_state'
> ../include/drm/drm_connector.h:1138: warning: Excess struct member 'infof=
rames' description in 'drm_connector_state'
> ../include/drm/drm_connector.h:1138: warning: Excess struct member 'avi' =
description in 'drm_connector_state'
> ../include/drm/drm_connector.h:1138: warning: Excess struct member 'hdr_d=
rm' description in 'drm_connector_state'
> ../include/drm/drm_connector.h:1138: warning: Excess struct member 'spd' =
description in 'drm_connector_state'
> ../include/drm/drm_connector.h:1138: warning: Excess struct member 'vendo=
r' description in 'drm_connector_state'
> ../include/drm/drm_connector.h:1138: warning: Excess struct member 'is_li=
mited_range' description in 'drm_connector_state'
> ../include/drm/drm_connector.h:1138: warning: Excess struct member 'outpu=
t_bpc' description in 'drm_connector_state'
> ../include/drm/drm_connector.h:1138: warning: Excess struct member 'outpu=
t_format' description in 'drm_connector_state'
> ../include/drm/drm_connector.h:1138: warning: Excess struct member 'tmds_=
char_rate' description in 'drm_connector_state'
> ../include/drm/drm_connector.h:2112: warning: Excess struct member 'vendo=
r' description in 'drm_connector'
> ../include/drm/drm_connector.h:2112: warning: Excess struct member 'produ=
ct' description in 'drm_connector'
> ../include/drm/drm_connector.h:2112: warning: Excess struct member 'suppo=
rted_formats' description in 'drm_connector'
> ../include/drm/drm_connector.h:2112: warning: Excess struct member 'infof=
rames' description in 'drm_connector'
> ../include/drm/drm_connector.h:2112: warning: Excess struct member 'lock'=
 description in 'drm_connector'
> ../include/drm/drm_connector.h:2112: warning: Excess struct member 'audio=
' description in 'drm_connector'
>=20
> Noticed this when I was rebasing [1]. Having that merged would find
> issues in headers at build time instead of 'make htmldocs'.
>=20
> In the mean time, this is the quick reproducer:
>=20
> $ scripts/kernel-doc -none include/drm/drm_connector.h

Thanks for the report and the reproducer. I have to admit I have no idea
how to fix it, do you have a suggestion?

Maxime

--vh7l4xzntgu42oo4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZl2KjgAKCRAnX84Zoj2+
dnjdAYCh58HSx5UyDwrdyTzw/8fwdR9giynUz0iYzk+dNWJEo48JrCLQ4Oc8ASYX
u5pApZIBf0v8uDQCp2JLsoeGPjt70PJzOz8ltjERxngYWkCqY3lGDMjCu5zl4oIm
efWmURI3ow==
=SmU7
-----END PGP SIGNATURE-----

--vh7l4xzntgu42oo4--

