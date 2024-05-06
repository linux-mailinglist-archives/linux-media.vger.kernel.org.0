Return-Path: <linux-media+bounces-10832-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BB78BC901
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 10:03:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 935E61F223FE
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2024 08:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07791422D0;
	Mon,  6 May 2024 07:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cc2PEqMg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6A014532C;
	Mon,  6 May 2024 07:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714982390; cv=none; b=t64ncfZCDDWnaT/zRYQxn//1efFQfaHROpNgr1OBeQ1BEc5uoekIDBnulypZpdm6j6x/eUuS5aFXuxeb87Kk/Dyx4l4srBPydV9LJfq5veIWglW57ZLhnDeiptGWzkhh8XyzsPwia4n6h43DSOJphalYLSqoWyCL0nWM+y0C+qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714982390; c=relaxed/simple;
	bh=kXDv39J5t7+acyzhkvD/8KkU35rQ6ddgsltaOx/5nD0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jzxoWMoQJzaIBUC7R7Z7vzIT+3witxWtjVdMYM7lZ8ZtEt+ur9J/3K834C8sJFNzRf3wgXfXDdEr5r4ckZdyb+L014pJiVhSz5sRNFFrpTKVv4SYygTY5u0MZP2Qoaghq1lFlkvIWxMwMeB3mZpISp4S2kk9Ep8CLJOb/DBqhiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cc2PEqMg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 633A4C116B1;
	Mon,  6 May 2024 07:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714982389;
	bh=kXDv39J5t7+acyzhkvD/8KkU35rQ6ddgsltaOx/5nD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cc2PEqMgbdM9UjJMlXDzTrgq5i2alAxqGMK3tmB0AzkrkGRM1wGDkVcKTYqKgaDDu
	 AjUM3T0lEL+Pa2M8sCJnKJ9g61Sj7+BIaeMydEea1CVjZF4J4uBqC1AvaBGWUEG/8u
	 wsjXUs1UwexHcGMQuigbb5LfrnekMtA7pjvOCVqfID/ew3m98UD/Q4gyiNPQN+zC+l
	 rrA3D0A36BeKUlYpMj3DUJJ+iRhmRuDnHLpvnY09HflG0TW7f/uCsrAQ3vX45W28lB
	 jHLyx94A51D6IsFrKMwEiC5vvO0LFM5KpukPbkkP4e3UJjvgfor5eBGRZMSgce0oPy
	 rcgySN8F6YU5w==
Date: Mon, 6 May 2024 09:59:46 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Andy Yan <andy.yan@rock-chips.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sebastian Wick <sebastian.wick@redhat.com>, Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v12 27/28] drm/rockchip: inno_hdmi: Switch to HDMI
 connector
Message-ID: <20240506-eccentric-wren-of-peace-819aad@houat>
References: <20240423-kms-hdmi-connector-state-v12-0-3338e4c0b189@kernel.org>
 <20240423-kms-hdmi-connector-state-v12-27-3338e4c0b189@kernel.org>
 <68eba0ec-bf9c-4d76-a362-5304a4cb61d5@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="v4sajugv7aqwu3jz"
Content-Disposition: inline
In-Reply-To: <68eba0ec-bf9c-4d76-a362-5304a4cb61d5@rock-chips.com>


--v4sajugv7aqwu3jz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andy,

Thanks a lot for giving it a try

All the issues you raised in your review are fixed.

On Sat, Apr 27, 2024 at 06:44:54PM GMT, Andy Yan wrote:
> And after this whole series applied on linux 6.9-rc4, the display on rk3036 kylin is lost, I get
> the following error:
> [  178.999421] rockchip-drm display-subsystem: [drm:drm_atomic_check_only] checking 87b7fbde
> [  178.999471] rockchip-drm display-subsystem: [drm:drm_atomic_helper_check_modeset] [CRTC:35:crtc-0] mode changed
> [  178.999498] rockchip-drm display-subsystem: [drm:drm_atomic_helper_check_modeset] [CRTC:35:crtc-0] enable changed
> [  178.999521] rockchip-drm display-subsystem: [drm:drm_atomic_helper_check_modeset] [CRTC:35:crtc-0] active changed
> [  178.999547] rockchip-drm display-subsystem: [drm:drm_atomic_helper_check_modeset] Updating routing for [CONNECTOR:37:HDMI-A-1]
> [  178.999575] rockchip-drm display-subsystem: [drm:drm_atomic_helper_check_modeset] [CONNECTOR:37:HDMI-A-1] using [ENCODER:36:TMDS-36] on [CRTC:35:crtc-0]
> [  178.999604] rockchip-drm display-subsystem: [drm:drm_atomic_helper_connector_hdmi_check] Trying with a 8 bpc output
> [  178.999636] rockchip-drm display-subsystem: [drm:drm_atomic_helper_connector_hdmi_check] Trying RGB output format
> [  178.999730] rockchip-drm display-subsystem: [drm:drm_atomic_helper_connector_hdmi_check] RGB Format, checking the constraints.
> [  178.999757] rockchip-drm display-subsystem: [drm:drm_atomic_helper_connector_hdmi_check] RGB output format not supported with 8 bpc
> [  178.999783] rockchip-drm display-subsystem: [drm:drm_atomic_helper_connector_hdmi_check] Failed. No Format Supported for that bpc count.
> [  178.999810] rockchip-drm display-subsystem: [drm:drm_atomic_helper_check_modeset] [CONNECTOR:37:HDMI-A-1] driver check failed
> [  178.999836] rockchip-drm display-subsystem: [drm:drm_atomic_check_only] atomic driver check for 87b7fbde failed: -22
> [  178.999868] rockchip-drm display-subsystem: [drm:drm_atomic_state_default_clear] Clearing atomic state 87b7fbde
> [  178.999898] [drm:drm_mode_object_put] OBJ ID: 37 (4)
> [  178.999922] [drm:drm_mode_object_put] OBJ ID: 37 (3)
> [  178.999944] [drm:drm_mode_object_put] OBJ ID: 40 (1)
> [  178.999971] [drm:drm_mode_object_put] OBJ ID: 39 (2)

Which kind of display are you testing with? The only reason it could do
so is if the display claim it doesn't support RGB in its EDID which is
contradicting the HDMI spec. Are you using an Analog display by any
chance? or the built-in EDIDs through the drm.edid_firmware mechanism?

Maxime

--v4sajugv7aqwu3jz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZjiN8gAKCRAnX84Zoj2+
dj7PAXsF7+5aPmDPt0ja154YvieqqvYikRBh9/V5pDrDw3cYprK2R83EgS3cBHli
wJnpqsYBf0ew1rxNKgDWA+diKWge0oHO2I7Ul+ScFLDcuz23NHCYlB74/qNhIWaY
8yng08R+LA==
=WFGm
-----END PGP SIGNATURE-----

--v4sajugv7aqwu3jz--

