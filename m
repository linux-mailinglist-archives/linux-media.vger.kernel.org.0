Return-Path: <linux-media+bounces-20026-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C809C9A9B87
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 09:54:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41195B2349A
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 07:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670DE154C0D;
	Tue, 22 Oct 2024 07:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WP+vrCJG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49C1127E37;
	Tue, 22 Oct 2024 07:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729583627; cv=none; b=cEUDDPfcw+Dmc6CKAd+iO/JfRpdz3OzHtXRTdpaoSXUkS1lLYC02YxRAW0TV3qo+Wl9CoUKI7RFJ8mK8Q3thrPOH+h78KRB0zk7BSysbjTRI8BoCECtnEVdjCQ27W0DwP912KnGDePyD2rqUDrPJUhYy0fhxP5cdWcCaW/N9TTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729583627; c=relaxed/simple;
	bh=94yBtoN+NpXDkZbfuTm6IbHirn/x4DZTEvDfAeXAcpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O+CvHS6dSa1oR+AwwSm83XwCy+dpOofL4ui5Ig9A+hyXEnz35X8PQn/cXZn9gTS2LnopUKbZdejEbxmfu/5Fy0+8+3zk57vxtKafS5L3uTNn1lXmfXlV/P7IkRsaJlepJXhhygR+TmkZMSiyPVZPSnaEiwjQA6ObUuOTJ9pC/JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WP+vrCJG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 157F3C4CEC3;
	Tue, 22 Oct 2024 07:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729583627;
	bh=94yBtoN+NpXDkZbfuTm6IbHirn/x4DZTEvDfAeXAcpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WP+vrCJGa7gZyLVrVwi+VFRTM0ScCecdKxk+Li7zOUiaDW2pfTG6XrcpVzRGv9STR
	 T7OeATEZTlF+IPmvX0czoTTOOtsAP2de3OUrShTxlShJMVjoZ/9QRRQTLHnFIazkDM
	 oI+HVzjH2p4APM0aW14CGQfNl9lvZGyKjDbEKgip52Bss+DcL0a1nOliVeJ+3p5aZ9
	 Wkdmh1eo8Wr+dfhbRH+zTuDP0aTU0AW2nJ5mDLB+bo2geepiQNAus+kMdvvTPfizSO
	 pF9vugoJRndcp9osV0GvvkoAEOoeCWBPhf6CKZZg3cRUoEJ+jlKKKDFysKiyQb9vaG
	 fMUjSgsr37F2g==
Date: Tue, 22 Oct 2024 09:53:44 +0200
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
Message-ID: <20241022-wondrous-fractal-lion-aedcd9@houat>
References: <20241021064446.263619-1-victor.liu@nxp.com>
 <20241021064446.263619-13-victor.liu@nxp.com>
 <20241021-thick-cockle-of-popularity-c5e28c@houat>
 <889594b9-e6cb-4d90-b959-cd0258b2f166@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ndesq6xmp4pn532m"
Content-Disposition: inline
In-Reply-To: <889594b9-e6cb-4d90-b959-cd0258b2f166@nxp.com>


--ndesq6xmp4pn532m
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 12/15] drm/bridge: Add ITE IT6263 LVDS to HDMI
 converter
MIME-Version: 1.0

On Tue, Oct 22, 2024 at 03:36:47PM +0800, Liu Ying wrote:
> Hi Maxime,
>=20
> On 10/21/2024, Maxime Ripard wrote:
> > On Mon, Oct 21, 2024 at 02:44:43PM +0800, Liu Ying wrote:
> >> +static int it6263_bridge_atomic_check(struct drm_bridge *bridge,
> >> +				      struct drm_bridge_state *bridge_state,
> >> +				      struct drm_crtc_state *crtc_state,
> >> +				      struct drm_connector_state *conn_state)
> >> +{
> >> +	struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
> >> +	int ret;
> >> +
> >> +	ret =3D drm_atomic_helper_connector_hdmi_check(conn_state->connector,
> >> +						     conn_state->state);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	return mode->clock > MAX_PIXEL_CLOCK_KHZ ? -EINVAL : 0;
> >=20
> > drm_atomic_helper_connector_hdmi_check will already make that check, so
> > it's redundant.
>=20
> MAX_PIXEL_CLOCK_KHZ is 150MHz. With 150MHz pixel clock rate, we'll get
> 150MHz HDMI character rate for 8bpc and 187.5MHz HDMI character rate
> for 10bpc, both are lower than MAX_HDMI_TMDS_CHAR_RATE_HZ =3D 225MHz.

I guess? I have no idea how that's relevant though. Where are those
constraints coming from, and why aren't you checking for them in
tmds_char_rate_valid?

> So, it looks like pixel clock rate is the bottleneck.

The bottleneck to what?

> Remove drm_atomic_helper_connector_hdmi_check() or keep this as-is?

No, like I said, remove the final check for mode->clock.

Maxime

--ndesq6xmp4pn532m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZxdaCAAKCRAnX84Zoj2+
dkMtAX0bABUvvrQvsEVfC/FsHL24JniTnXVp5PfMg4bNoZgQKIMXrttSyJhmufST
5RbQcPUBfRss1fUSXSj1YNr6FqAGDfJUWa++ed7TSbFOKM1yWDyQJwOyznEzViOj
kYYL52W9yg==
=wUZL
-----END PGP SIGNATURE-----

--ndesq6xmp4pn532m--

