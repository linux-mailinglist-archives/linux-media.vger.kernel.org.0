Return-Path: <linux-media+bounces-41563-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF6BB3FEBA
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 13:56:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 544002C67C2
	for <lists+linux-media@lfdr.de>; Tue,  2 Sep 2025 11:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1344288C16;
	Tue,  2 Sep 2025 11:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qkFKtnmS"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA1C27464F;
	Tue,  2 Sep 2025 11:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756813665; cv=none; b=fYNxrdBtZzR5suR8eNgmION3OudtRHuZLC/ksi6dOzmIBlZ5eXRCxZOBoBN/vx7ldcEmMtSKU7SHhPPtnFGC3MmtzaEwkjrFbe+expvbnEAlr/3PztzNwht7ByCteD/gmRXffwshrt7pGQEb8/KzDC31jJqCG+JEFPDx/9cEX9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756813665; c=relaxed/simple;
	bh=gFiIHuOlveMZeWJISPdt16K+dFM+7ksMq9Q1qIX0Uww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QjUaGBQb4Ou27caA0DQ1CcPKZzE4HSaCryIEM21cmsoDDOBQw63HPh7RvqmRCmcydbvROBRp3vGQTxcw5+AyfRHOqio03vtbfS0iyaYxG86UUKH1mB69RqjhND8Rfy2d6ZrquFfZk5qnB/eDE/Qlq2qwHslu11+dUOGxXGg9DbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qkFKtnmS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F73FC4CEED;
	Tue,  2 Sep 2025 11:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756813664;
	bh=gFiIHuOlveMZeWJISPdt16K+dFM+7ksMq9Q1qIX0Uww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qkFKtnmS9o+B7stDBBNb4CF9EH2CLzN7QH4reLdLMsKVAtNnXgsb5ft7K/rvT1FYH
	 2kZLIZnCn3rqA84Qaids1wyVTepkAr82vnJUFw/6z+YfDXWIaWNMwmwLTPF5mQYq/S
	 LQn1d0MVRgidXrDUY5lLliezVqAi3EHMdZ44jar8ezQOpIhYjdipwsidHm8oiW0IWl
	 XEjkLE/2qKfDY97gEWKPdVnabBXEhADqLOcxwhF6hyjNJwvAi+XqXHNm7iNOG50LWu
	 r5wWIDouyZA4AElnCjdHPRAtfoAFnO0NUUJpmLmQcnS2ieKW5W7FZuiGRBLPPCNQ5F
	 vMKy0cRXcuIaw==
Date: Tue, 2 Sep 2025 12:47:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lee Jones <lee@kernel.org>, linux@treblig.org, arnd@arndb.de,
	mchehab@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] Remove the wl1273 FM Radio
Message-ID: <88042d72-b428-442e-ba3c-b15e587e12a7@sirena.org.uk>
References: <20250625133258.78133-1-linux@treblig.org>
 <20250808154903.GB23187@pendragon.ideasonboard.com>
 <20250902103249.GG2163762@google.com>
 <20250902113527.GB1694@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1kymcy+inhIwERzs"
Content-Disposition: inline
In-Reply-To: <20250902113527.GB1694@pendragon.ideasonboard.com>
X-Cookie: Vote anarchist.


--1kymcy+inhIwERzs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 02, 2025 at 01:35:27PM +0200, Laurent Pinchart wrote:

> Patch 1/4 has been queued in the media tree and should be in linux-next
> as commit 103b0cfc9ab6. It is based straight on v6.17-rc1. Patch 2/4 is
> also in linux-next, but is based on other ALSA patches. The simplest
> course of action would be for you to merge 3/4 for v6.18, and 4/4 for
> v6.19.

Or given that it's a driver removal we could just get a rebase of the
series against the meda tree applied?  The conflicts with ASoC should be
trivial to resolve.

--1kymcy+inhIwERzs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmi22VsACgkQJNaLcl1U
h9CEwQf+PPBDQOqGVHx/AxUBR7lpd6txdkjXC7jkhYlJq7qfTeLGq25/8mABEr4Z
f7m1yRog6ej2VKTMq63+z78KUe3R8sLqgI0TYgcinpQzbovm1xGoCVQcMmOlzd1i
ahhkciYuDsfw0GykTwIKvpccONoOPr19A8OIQt9LMCOM8Rg1CXuhiQWibjXfshpc
QSe9snqRKgJd4fgunsgCQFj2GxuJdMRNAWis1PGPSnzbqeq3AuXUKL6ZWY4yKFK/
ByMNu44wT82ifN/nuzNsokCJi31YlSLBh4s53jcrMNHbwoF8+TNseB4gd8Nh/+Bi
tEaUg1Opw+gGS+hIq0AezgrB6vhKew==
=o/x2
-----END PGP SIGNATURE-----

--1kymcy+inhIwERzs--

