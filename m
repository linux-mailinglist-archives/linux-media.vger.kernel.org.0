Return-Path: <linux-media+bounces-20572-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0129B601F
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 11:30:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61FFC2830FA
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 10:30:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B068D1E32C7;
	Wed, 30 Oct 2024 10:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iPBom++I"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0784C4DA03;
	Wed, 30 Oct 2024 10:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730284212; cv=none; b=LUnjbOlc4ruK4pV06tL1FbUI70LJMuEC/wEt1Nr6NWqkdWYo4wYHqeXke+uPOupKOOvDb2lISay2IrOAYCR2LlQbSSd5QkAc/aZGqqj9JeqRMPiGDvYZSbfUnQvW3x80K/EWnDYp2uwsntfoO1fXWFcr510gDEge2+cXEupcN3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730284212; c=relaxed/simple;
	bh=fEyGQG5p+/Axzk94LPtg9MyYLs8WiA+7sDPOBdC8nuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mP1wFkJoo8C+Ogn3rNbzuzLxQIH8CWPYRnP2Zs7GBqChLpWMXC8Z31Kl1HbFrNXwIt3t6aITP3RjaskMYyzQVSIsjH00DmC/HryirGqlEhgzpEAuWXyJVMW+R7RpXdE5SguUQrgvI/0eTUgP7dMgloKlfVHg6JEiClW+lRXc0gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iPBom++I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27E7CC4CEE3;
	Wed, 30 Oct 2024 10:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730284211;
	bh=fEyGQG5p+/Axzk94LPtg9MyYLs8WiA+7sDPOBdC8nuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iPBom++Ip3zXbNr4S9qX5JpImsDxqHoTocohiCaoOx5wNTJbiARb4bC/qMG+xkcKl
	 4bo9Z5yrvUKpiXeTjblCmlZFumY+okw/Vt7mCFA55EdghPH5Za2gM3Pd4VOqUoihoM
	 RC1xYCQrttOvZlsb/YnO8yx8rwmJMkz4dkArPco2y1Naytv1uKPyxf+rLmFiNnWqL4
	 hLvcUJg2ZZj271QMiXn3eMmS3Gk3eUI74tYuVqsgFHmT1D26eR4bwwRZoXeSi29m2C
	 o24VUlOK0cedEcwP3X/B28lsMehPiZZsJvfrGYvPA5SwkdJ/67vIoYA0QMo/YjPKne
	 u3uClG+jbjG3A==
Date: Wed, 30 Oct 2024 11:30:09 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, quic_jesszhan@quicinc.com, mchehab@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	sakari.ailus@linux.intel.com, hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com, 
	quic_bjorande@quicinc.com, geert+renesas@glider.be, dmitry.baryshkov@linaro.org, 
	arnd@arndb.de, nfraprado@collabora.com, thierry.reding@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v4 03/13] drm/bridge: fsl-ldb: Use clk_round_rate() to
 validate "ldb" clock rate
Message-ID: <20241030-hypersonic-tremendous-tuatara-2bbeb0@houat>
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-4-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="jdfa4z4pqzuvoooj"
Content-Disposition: inline
In-Reply-To: <20241028023740.19732-4-victor.liu@nxp.com>


--jdfa4z4pqzuvoooj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 03/13] drm/bridge: fsl-ldb: Use clk_round_rate() to
 validate "ldb" clock rate
MIME-Version: 1.0

On Mon, Oct 28, 2024 at 10:37:30AM +0800, Liu Ying wrote:
> Multiple display modes could be read from a display device's EDID.
> Use clk_round_rate() to validate the "ldb" clock rate for each mode
> in drm_bridge_funcs::mode_valid() to filter unsupported modes out.
>=20
> Also, since this driver doesn't directly reference pixel clock, use
> clk_round_rate() to validate the pixel clock rate against the "ldb"
> clock if the "ldb" clock and the pixel clock are sibling in clock
> tree.  This is not done in display controller driver because
> drm_crtc_helper_funcs::mode_valid() may not decide to do the
> validation or not if multiple encoders are connected to the CRTC,
> e.g., i.MX93 LCDIF may connect with MIPI DSI controller, LDB and
> parallel display output simultaneously.
>=20
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> Note that this patch depends on a patch in shawnguo/imx/fixes:
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/2024101703114=
6.157996-1-marex@denx.de/

I still believe that the root cause of this issue is your clock tree and
driver setup, and since I've asked for explanations and didn't get any,
I don't really see how we can move forward here.

Maxime

--jdfa4z4pqzuvoooj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZyIKrAAKCRAnX84Zoj2+
dk5eAYDDyKjKmenLlLXrE7PF5+02MCRjxjyPZUPeFcxn9WqZwrqLx6hAeRNfTD1I
fBz39NEBgPedANzTVocrGaKTqjaLuKN1UWpfFGVqf9OjORjTtsRTq+Rg7VBMH8ER
7Vm4WtqjxQ==
=QcTM
-----END PGP SIGNATURE-----

--jdfa4z4pqzuvoooj--

