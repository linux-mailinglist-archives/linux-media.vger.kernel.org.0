Return-Path: <linux-media+bounces-43651-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D72BB422E
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 16:06:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 53846173277
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 14:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE012310651;
	Thu,  2 Oct 2025 14:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CMBo4wuA"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540472F3614
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 14:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759413942; cv=none; b=WYMS/BEPqlPFYzeU6IRYtVebBjXLN28abL0G8nfurD8Hmig6Vi8YFqSZshwKYzXzy27eSrP5swl+FD1ponW6Q4RatRZIacMJhT+6fQ+e/Cp1vXkh3iUVebPevPuQCBJmaOb4xDOeSTI6AwSY6j+h1rf+7odUoMNoExhrZ9FgmGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759413942; c=relaxed/simple;
	bh=LYm9D5vlhSiUy616cHQLJ5BvEm6YIL752SKqypsFb5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fnwo0/w4F+fxIm7GY6QgEp7Pw2NnYJyj0Ecmko5fxwDKGXyqsKWE5oEIRnWFvzx955D9XyyGAxdwj0OSLzUCgo6KeHQ8QA8H0TNSntnl7F/3iCFFB397OP0mL95pW0YS1c5e+yZIiVgdtSKvu2EAPNfxuieKNFeUvyUpMHXyWhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CMBo4wuA; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=LYm9
	D5vlhSiUy616cHQLJ5BvEm6YIL752SKqypsFb5w=; b=CMBo4wuAPtjTjtjdpLmm
	qn8XDWdQSJRTAPrvIx1iDiclurdwEuFzB3C08f9exHfxyBopLh/0e1hp0TV+WTJy
	dqpycYiHLylx89u9xJQQ7Pr7tdMH3gSqWtgTlflVHxwkWh7MMWYLz8NdB+ejvSQN
	Ck0HXEuFewJGt09bxpI7+kFeMIryT65lq068YL6794IQQ0uQ4NFPjk89YiuDdA5F
	hzyHONjOVLzh9c2/rT8TbOVqHBja7VToYNh1mXwIqJnKBxJ0g5StwVmwZ4XS8Jsf
	ZpwNsSCW4b0tWQChSWq3MSzFjafkkH/E/VqqF5HuNFlPIfAntcCHneiXmIrErcZ6
	eg==
Received: (qmail 295296 invoked from network); 2 Oct 2025 16:05:36 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Oct 2025 16:05:36 +0200
X-UD-Smtp-Session: l3s3148p1@2PCrei1AIOIgAwDPXwQHAL/S9V79e5yL
Date: Thu, 2 Oct 2025 16:05:35 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Daniel Scally <djrscally@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Wolfram Sang <wsa@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: qcm6490-fairphone-fp5: Enable CCI
 pull-up
Message-ID: <aN6Gr5FcfYpKgAFM@shikoro>
References: <20251002-dw9800-driver-v1-0-c305328e44f0@fairphone.com>
 <20251002-dw9800-driver-v1-3-c305328e44f0@fairphone.com>
 <1be80052-3ba5-46de-804a-de995f8db5d4@oss.qualcomm.com>
 <DD7V3G4RLB2I.QYT4BWT1LA5U@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iN8q4H5XPZs0qq2D"
Content-Disposition: inline
In-Reply-To: <DD7V3G4RLB2I.QYT4BWT1LA5U@fairphone.com>


--iN8q4H5XPZs0qq2D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Unfortunately though this effort has stalled some years ago. There is
> "struct regulator *bus_regulator;" in "struct i2c_adapter" already and
> vbus-supply is documented in i2c-mt65xx but afaik this not functional
> because some code was ripped out ago because of some AMDGPU regressions.

Thanks for mentioning this. It all sounded familiar to me but I couldn't
put my finger exactly.


--iN8q4H5XPZs0qq2D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjehqsACgkQFA3kzBSg
KbbIAQ//QfAX8m49uUj1J5d915zmYl1ga2ibjh9XM98MLwfWVTrbBKLi8aoYwru5
3n32muazTU8syFw9hftxJjKs7beuNJ7vBytCP+mvs/d3y976Ff6xM+kFnKUWiIb5
v2wP3ECPOTeHO+OXG2pDIuLDpfjLlFVaO0nGbg1dnTmSvqnHbvOklmPAjqgehY78
C4pCYZkaIsMPrRrp/lutY+W39Ua8v9B4BRaqYjepzq5u86+zaU/S3hglhrNt+MzX
bONZqbB4HQKfYuZrcWtXIlATp1SAc7LnbAbJ6CU/gHheEUaQA8Fdw3Yn7CR3MGPn
eVmkSv/U+8UIbFs1DY5UAv8oOnq+jqIVKrlcI36V9ftmmbsWkN4AE7mL6gpWuZZv
C9olQqGYid0OJXe5qcU8gHOFvdj4Vspr7rbD4oQC20SF/6A0w/d1QEQPGt/fN1BY
ppCM/MDH2R8Hw2Heibr1NDM62n7n5090UmTSPjZau4ksQuxJyga8sKvM9OAKMyk+
8qAwilsIUxYcZYTT9DRrVJEyWGQxJp0LwO8N9FkN+eDiaY/BmPqFl33C79EU4WC9
4705Uq5xK7f+v/Yts9ZqtIDILbSA2q0QRHcSeH2EK3PpJEvClgu7xVCPTz73Hkvb
v9poLEjcB0lxNihio4NoTRHkWDtOS1Opds2CqwzTRDkcSvUk1tQ=
=dsTU
-----END PGP SIGNATURE-----

--iN8q4H5XPZs0qq2D--

