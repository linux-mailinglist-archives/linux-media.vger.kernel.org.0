Return-Path: <linux-media+bounces-43219-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A63FBA13FD
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 21:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05B21380C15
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 19:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 223B331DDA4;
	Thu, 25 Sep 2025 19:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mq6jXjhe"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E0531D74F;
	Thu, 25 Sep 2025 19:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758829448; cv=none; b=GJgxwf9bAWeqVy5hrh43tx45w8cWXOLmheZFqHaCaua01Jm43rR6YeQWafYe4ukDbm7ZVTL56gU/07yM7vkkTQYcAMi3YsNjZy8MeKT+ubLdy5n7KaEiQb/5+hsAg/Xf86addNhTgPBdQmzs1A2Mm4c3sedCLumb4NVvNAJ5cqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758829448; c=relaxed/simple;
	bh=UrNoezNBFaJZztyAmAxpBLPcnlcQ5iJ5bSlvrmLLqEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OIqCKEwGZrl1DIHshvMyWtO9h0uO58n13TA7y4PzM7891aWVN1iYfh3chbG1EQO84kwrftukFhoD8zEdF7rqbYFhJcdKZhAzQApAkw9meIEC5Px7hS3gtEqLARlqXgdcNlPGpYRjl4Pt1rLLsyazQRuRDuSTkW0atJkGkaAjAx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mq6jXjhe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 499BDC4CEF7;
	Thu, 25 Sep 2025 19:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758829447;
	bh=UrNoezNBFaJZztyAmAxpBLPcnlcQ5iJ5bSlvrmLLqEE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mq6jXjhe9sHXnCl/y6aXDAqKIhy8d4IVJPkwB6URy+qmuH1qcy1FpRHGl4RtNCOBC
	 oqfffN9iyIdqUAAGapTRrpPStowk5uPZ688KT/4qCC05fl4/JUhjZvYQmqra881WkD
	 JfZR74v1djWJV1mWgIasFLNc0CZHPsHTsYhz5Bi6rB17RHMTWrSDK/DZKVOTDY5sTL
	 Cel8hTNbzk5+7yI9VPKEpz4YdWJYG3pYYKeC4UsG+Ukx8EzeZYS5fQP9QneT8pJpS3
	 EYWLGDUBcsr2u00XTzCzXxIv9fu0PqRXzKXb/Yw08aagnZ8lL7pzmfXweJfy/lzooq
	 C2kfBfkKs+vsw==
Date: Thu, 25 Sep 2025 20:44:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: media: fsl,imx6q-vdoa: remove redundant
 ""
Message-ID: <20250925-wing-accustom-250326a9698e@spud>
References: <20250925193546.305036-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nlhU1AayOf/rp+SO"
Content-Disposition: inline
In-Reply-To: <20250925193546.305036-1-Frank.Li@nxp.com>


--nlhU1AayOf/rp+SO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--nlhU1AayOf/rp+SO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaNWbggAKCRB4tDGHoIJi
0huUAQDSSuao0QlibS1EgDwm7Y79REVUJZg5kI27IzzjbhZx5gD/UIC2V6vcjOCV
S0nAL4sJHGS5dFFBWZa7UTQ1Fpgb5gc=
=d6TN
-----END PGP SIGNATURE-----

--nlhU1AayOf/rp+SO--

