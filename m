Return-Path: <linux-media+bounces-11983-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEDF28D02CB
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 16:09:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0BF141C21270
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 14:09:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D21D15F413;
	Mon, 27 May 2024 14:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ehx7Rqti"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE21415EFAA;
	Mon, 27 May 2024 14:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716818820; cv=none; b=cpwwdKGnH9OlD43k4eE321gKQwc5lcVUY2ej3NAinP5I+ZbO1w6ZcnyvU4aHQ2klVGAjnp12nhiX+0ZQqfHcLGdF6J8shUl5bIsm1CoiQ05XTxpmzKRHzWMO3eCNPWDbfAGwGC8+oQaPmlStlt2ZlDa1jfyGqKqJg2O/hz6tY78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716818820; c=relaxed/simple;
	bh=n1BDsmlQwhdu8pSjqXWApM0rUAlRIrsJQgYV+C9j7cA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fVxorPLoAtB0F14deOVpeQ7ZgbeMjeqpbFYywkeQ/OlsJcHwOr9odaR18d0ID6ElShIAByyI75mCGQpnljBNk/ONxpASAdUg5hbumR3EV2T5ZOeZiPHyTdZ/zby7jg81Su+m5rG48Vskm4w1yLK+sPnSDI/QwNpO7VGlAJ5QqGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ehx7Rqti; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EFFEC2BBFC;
	Mon, 27 May 2024 14:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716818820;
	bh=n1BDsmlQwhdu8pSjqXWApM0rUAlRIrsJQgYV+C9j7cA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ehx7RqtiTvj5UM2EojGrpqHk52rXrmmpEwVgxNg4ez3WeVXuEJpLRg8XVEvdmrbIi
	 XZAuJRh1npz3bYbtsjUh/YnyDryXBLknjyAH+2fnXiAC3o/uXlZj+MxC6TJhl7+uQu
	 PNp3arxQctgWDfxJzJmYskrpp10Ann7gjf6LGKvmumNN0sRXDK8mX7Ay4UhZKU4P+E
	 bXZQEzvWmyGDXC6wpSvzHeGalmiojKSz0HI41qiC1/HaX6fLB4hQWA6jDLPwwXUNFN
	 0r/wqkaGHE9Bn/1GP+O0/xpnM6KIWVr16Fp7YGyNxdmY4Zc79BAHjTImWXTmD2Xa2x
	 tIqnw7GJC01tQ==
Date: Mon, 27 May 2024 16:06:58 +0200
From: Maxime Ripard <mripard@kernel.org>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	Jason-ch Chen <jason-ch.chen@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, 
	Nancy Lin <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, Jeffrey Kardatzke <jkardatzke@google.com>, 
	Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
Subject: Re: [PATCH v6 0/7] Add mediate-drm secure flow for SVP
Message-ID: <20240527-determined-sage-piculet-bfec4a@houat>
References: <20240525232928.5524-1-jason-jh.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="lkrd7n7cfhfphpnl"
Content-Disposition: inline
In-Reply-To: <20240525232928.5524-1-jason-jh.lin@mediatek.com>


--lkrd7n7cfhfphpnl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, May 26, 2024 at 07:29:21AM GMT, Jason-JH.Lin wrote:
> From: Jason-jh Lin <jason-jh.lin@mediatek.corp-partner.google.com>
>=20
> Memory Definitions:
> secure memory - Memory allocated in the TEE (Trusted Execution
> Environment) which is inaccessible in the REE (Rich Execution
> Environment, i.e. linux kernel/userspace).
> secure handle - Integer value which acts as reference to 'secure
> memory'. Used in communication between TEE and REE to reference
> 'secure memory'.
> secure buffer - 'secure memory' that is used to store decrypted,
> compressed video or for other general purposes in the TEE.
> secure surface - 'secure memory' that is used to store graphic buffers.
>=20
> Memory Usage in SVP:
> The overall flow of SVP starts with encrypted video coming in from an
> outside source into the REE. The REE will then allocate a 'secure
> buffer' and send the corresponding 'secure handle' along with the
> encrypted, compressed video data to the TEE. The TEE will then decrypt
> the video and store the result in the 'secure buffer'. The REE will
> then allocate a 'secure surface'. The REE will pass the 'secure
> handles' for both the 'secure buffer' and 'secure surface' into the
> TEE for video decoding. The video decoder HW will then decode the
> contents of the 'secure buffer' and place the result in the 'secure
> surface'. The REE will then attach the 'secure surface' to the overlay
> plane for rendering of the video.
>=20
> Everything relating to ensuring security of the actual contents of the
> 'secure buffer' and 'secure surface' is out of scope for the REE and
> is the responsibility of the TEE.
>=20
> DRM driver handles allocation of gem objects that are backed by a 'secure
> surface' and for displaying a 'secure surface' on the overlay plane.
> This introduces a new flag for object creation called
> DRM_MTK_GEM_CREATE_RESTRICTED which indicates it should be a 'secure
> surface'. All changes here are in MediaTek specific code.
> ---
> TODO:
> 1) Drop MTK_DRM_IOCTL_GEM_CREATE and use DMA_HEAP_IOCTL_ALLOC in userspace
> 2) DRM driver use secure mailbox channel to handle normal and secure flow
> 3) Implement setting mmsys routing table in the secure world series

I'm not sure what you mean here. Why are you trying to upstream
something that still needs to be removed from your patch series?

Also, I made some comments on the previous version that have been
entirely ignored and still apply on this version:
https://lore.kernel.org/dri-devel/20240415-guppy-of-perpetual-current-3a797=
4@houat/

Maxime

--lkrd7n7cfhfphpnl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZlSTgQAKCRAnX84Zoj2+
dhjrAYDF6bR4iF7gYsP2hmqjPJbIPGkYuq7u09k5+hu3sX7JKhq1g9n5v5hX7VH6
mU5WwlwBgN4eDfGwGhtYaDZJA62JTLpJVnIl2BS0XO5+OiU6EzKrzRJluNKcWPpS
+8EyU4dfAQ==
=0kUw
-----END PGP SIGNATURE-----

--lkrd7n7cfhfphpnl--

