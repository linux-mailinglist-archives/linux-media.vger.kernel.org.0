Return-Path: <linux-media+bounces-19994-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D199A68A8
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 14:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FF672889D9
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 12:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54981F1314;
	Mon, 21 Oct 2024 12:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VonpcpMg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3381E884E;
	Mon, 21 Oct 2024 12:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729514301; cv=none; b=aFe/aPVpvVr1k20U1OahAFu6G/7Zi2fOiVT4Ou7FMboZYOVAeQP9KKKTXYsBfbips71wxzVmzGTE3F4zEeMEvdrUPCd4B5vk0gZl+hIJgTo8ab8pClhZw61r5NTVAYs/JuoW/8euvKhdduBb3ntpzyTCopkcC2hslkfIBPUD4gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729514301; c=relaxed/simple;
	bh=2J+07wvQjZOgFJnkevC6f3EOi3G04Q/DuL8EMvWJL1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LvGGruQEGNR3zW9f1YeUvy3HlzyMFRjKZU+JsFRoTjU0q9gUoI+X9jdZL6D/bT5T7+21RtzF/SfgswVhRJSrEndGWIVgTBD1Bmt19EDP1zCIxGtWbKh2raDvuKPVjfC4PqUUtqIEttQGtYteqTNP8TOOVmVQh5YWziqJNk5vxEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VonpcpMg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1895AC4CEE4;
	Mon, 21 Oct 2024 12:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729514299;
	bh=2J+07wvQjZOgFJnkevC6f3EOi3G04Q/DuL8EMvWJL1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VonpcpMgNhRcVhIrW/Yx7oUPWvjjtoRpomAzGY7xssSXrU1AMS/fG0d6xRgCoSk0s
	 pSMGZSDmw2fpLFYf3NUYwqgLahSP9iY4mMJ5B3RvBAxOiM11+mVEy6uLNrNlPndVsF
	 xXjDlZlTQuIATZdfdiPIdr/+cmsLOzmUPgdw94bhw1N0BGKXcpDXEGuaNeXV4GWYIp
	 g8SoDJut/USi3Zi+Qk0MGUV0UoK31Nz+wW06batq5cAIkzH0QnQg4sVHGy7rEtjvPd
	 WsEaqjGpSupDFJSQJtgWHNBYnzeHqGdpXZOGw76LSoEyZFN/JEoRLLprjKjZXn1D1h
	 hRPjF9uEwfAjg==
Date: Mon, 21 Oct 2024 14:38:16 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, quic_jesszhan@quicinc.com, mchehab@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	sakari.ailus@linux.intel.com, hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com, 
	quic_bjorande@quicinc.com, geert+renesas@glider.be, dmitry.baryshkov@linaro.org, 
	arnd@arndb.de, nfraprado@collabora.com, thierry.reding@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v3 12/15] drm/bridge: Add ITE IT6263 LVDS to HDMI
 converter
Message-ID: <20241021-thick-cockle-of-popularity-c5e28c@houat>
References: <20241021064446.263619-1-victor.liu@nxp.com>
 <20241021064446.263619-13-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="kmrz3bsduvk5ir7q"
Content-Disposition: inline
In-Reply-To: <20241021064446.263619-13-victor.liu@nxp.com>


--kmrz3bsduvk5ir7q
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 12/15] drm/bridge: Add ITE IT6263 LVDS to HDMI
 converter
MIME-Version: 1.0

On Mon, Oct 21, 2024 at 02:44:43PM +0800, Liu Ying wrote:
> +static int it6263_bridge_atomic_check(struct drm_bridge *bridge,
> +				      struct drm_bridge_state *bridge_state,
> +				      struct drm_crtc_state *crtc_state,
> +				      struct drm_connector_state *conn_state)
> +{
> +	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
> +	int ret;
> +
> +	ret = drm_atomic_helper_connector_hdmi_check(conn_state->connector,
> +						     conn_state->state);
> +	if (ret)
> +		return ret;
> +
> +	return mode->clock > MAX_PIXEL_CLOCK_KHZ ? -EINVAL : 0;

drm_atomic_helper_connector_hdmi_check will already make that check, so
it's redundant.

Once fixed
Acked-by: Maxime Ripard <mripard@kernel.org>

Maxime

--kmrz3bsduvk5ir7q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZxZLLwAKCRAnX84Zoj2+
dtH1AYDoumgWufeRw1BkoGW9C53DdxLpldr4/TQiGq7uSIf8bhYZzvs8c3r3m56h
+Kq5KswBfiUhEIWcIVbwOObPeX6/Pg7dtPWXJxzBOlLR3QjbpksXkTsjQ2FUPqoW
4HbKb64I9A==
=sEdL
-----END PGP SIGNATURE-----

--kmrz3bsduvk5ir7q--

