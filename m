Return-Path: <linux-media+bounces-33278-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E061AC26AF
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 17:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB8321BC83AD
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 15:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A69D9297A6E;
	Fri, 23 May 2025 15:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDSlpI9o"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF01729713F;
	Fri, 23 May 2025 15:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748015121; cv=none; b=iYNZu4Ur8Psgkkf6RFPhDrISU/z4TKOlg/0X6e6L0ondDj0LxUYCKKIoLFqpC2zb/9Q3gJ1laSRlz3IGsN8oO2eeXaa0WdlV4DIKyjiNOfphfANFzy88n1uFNtnAWRXnQHOO5obcWHqmdaXJDeVjauUDq1qh1V09QmVWGxJlYig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748015121; c=relaxed/simple;
	bh=on4qF/RmGO4UrETN7c4K3vkwtgopLdvT3jZrzzBh/DY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y9Na8okd7xw0J7EFEb22sCaK5GVplYs5gr19xZ8RVsFDjXI+/+veewzIgMTkGvWgsfMQZmVSEZlbKLwo8C4dHSSGU7s/ZtGKESMb4LotFbNuFoRiwsQ/VjAZKiHAL1F0YWZTIUeo3Yuq+PdimJIvZsFBggTctoDIQ/sXLjaqjQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDSlpI9o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89B80C4CEED;
	Fri, 23 May 2025 15:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748015120;
	bh=on4qF/RmGO4UrETN7c4K3vkwtgopLdvT3jZrzzBh/DY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oDSlpI9oHfS/Igg/GAdBpKaRTQZwDPw1yQDPTxPlkJ2x/4bMrnDpCV6Cy4HAhQnmC
	 8CK7POmMbyzwRZBfCUscpBgH/9+OiAPRia/ASC9UExMvvzkRZc91CCk1bYsz0Eo6mv
	 D13rHYpNHw+pf3x64Q3wD/uAWv46L12UQXQ35UApulUg2X360eJQCOJkt9nkM0DQQq
	 xx5EmtbQ+h0PpKiyS7A67Yu+W+Qts5LBVu0wS9eUjhTT4x1A4Dsp12WPmseYYkb74L
	 bWl/fJJHdHSyhqO0ZMZ9QN/uemj3qxeAjsLtIm63YMkyDcfdBiZpsfNCTaUIr6BZAh
	 kTRXFd/1y7cVQ==
Date: Fri, 23 May 2025 16:45:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Cc: tomi.valkeinen@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, hverkuil@xs4all.nl,
	sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
	vaishnav.a@ti.com, u-kumar1@ti.com, jai.luthra@linux.dev,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: dt-bindings: ti,ds90ub960: Add bindings for
 DS90UB954-Q1
Message-ID: <20250523-utter-shack-fe4ef569eec4@spud>
References: <20250523083655.3876005-1-y-abhilashchandra@ti.com>
 <20250523083655.3876005-2-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oE98gODnRx15TDNv"
Content-Disposition: inline
In-Reply-To: <20250523083655.3876005-2-y-abhilashchandra@ti.com>


--oE98gODnRx15TDNv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Acked-by: Conor Dooley <conor.dooley@microchip.com>

--oE98gODnRx15TDNv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDCYCwAKCRB4tDGHoIJi
0kjqAQDjQ0g4EGL7yZvIpQWJUD/hLrPLlVwR3EgSAy8rFg3kdwD/ZzIsF+R4kVJY
jBGKhdLmEnK+uLTNS2UQEZ0/RLd1ego=
=8vJ5
-----END PGP SIGNATURE-----

--oE98gODnRx15TDNv--

