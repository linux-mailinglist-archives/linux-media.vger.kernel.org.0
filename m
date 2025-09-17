Return-Path: <linux-media+bounces-42699-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B934B81988
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 21:24:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD0BE16860C
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 19:23:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D75CE2FFDDA;
	Wed, 17 Sep 2025 19:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VfesLqj8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A1672614;
	Wed, 17 Sep 2025 19:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758136984; cv=none; b=gJ9JNnZ0iCUAZMA+oUw8HPz+X+1CWlTALQKbIzCsafybHwNz3XgRROGftTpozEYFmmaWvAK2kbZAv9DqHK+9hq4a8lVnLDPUIev5vVjSK3JwObeAM9+vUbSyfdE70hniFpwb9eyuL8SoNMLM+dSeMae+xz8k/XXsFidZ/6btYMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758136984; c=relaxed/simple;
	bh=B9bY8LkLWVpeRTueT+AQrRldMPFWGbnXdHepPnAE6bg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X02tmKWEEXGzFJ1JGnvqv8duaxYbgORT+lEG4JAy4xph0IvhgdpHrgtNTc4Pb9iHRA73igxyvgiu0+5rwyJnL1VS+lIu+MEzpQxZyKqNPnnuBuWLNgS+u2UF1TWRKgdDeYDSIiNv5uehLdhxqy1knm1++cSUDO3eDrnx44+rsVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VfesLqj8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECD10C4CEE7;
	Wed, 17 Sep 2025 19:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758136983;
	bh=B9bY8LkLWVpeRTueT+AQrRldMPFWGbnXdHepPnAE6bg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VfesLqj88ovMJM1rM6zwayKbjkXOqiv/dyQ4YMIE+lwgfVizxq4oEVYmz7vP2ZUBV
	 9bSnZF4yq7EluFAqnPRO7qiZZWaP3ucsKI4lnytjq5U5X9+z+RUaHG4C+IlF14smgl
	 yCXkBdYlWULwu2EM0gd5vLWE0TPlOiLqHlpFC+601dBKvq72e7IAVc3tkGVWH5N0BM
	 FkIAAkzfhrU0hGOWfzJt8tlgstGzkGdwA2TXqOBGfGSZCAS6uLLRHfIOdfKBxNKnkj
	 5RzkA0o1SBvf5lUcxrB0wHz1NfdWrVM9yzQf0Iqft3M3QzyY4iWVYJFe/6E5oYCNfA
	 Domg3ov07gi8A==
Date: Wed, 17 Sep 2025 20:22:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v6 1/5] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8ULP compatible string
Message-ID: <20250917-splendor-marxism-5b42f0cc670f@spud>
References: <20250917-csi2_imx8ulp-v6-0-23a355982eff@nxp.com>
 <20250917-csi2_imx8ulp-v6-1-23a355982eff@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3gOtejRn2XFUqrqT"
Content-Disposition: inline
In-Reply-To: <20250917-csi2_imx8ulp-v6-1-23a355982eff@nxp.com>


--3gOtejRn2XFUqrqT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--3gOtejRn2XFUqrqT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMsKkQAKCRB4tDGHoIJi
0vIXAP4qdNUMoU6s3FuP9N4PxLJBIPEjbbVI6iWrhBQus6CD4gEAmj5DYjCBn7Dy
M4eTOl2YLYgtqjEPWGGm9HGE2xFHLAQ=
=xNYR
-----END PGP SIGNATURE-----

--3gOtejRn2XFUqrqT--

