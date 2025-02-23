Return-Path: <linux-media+bounces-26663-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EE7A40E76
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 12:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1AC21178459
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 11:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13FDD205E37;
	Sun, 23 Feb 2025 11:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d6hIdrU4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FF71FCF54;
	Sun, 23 Feb 2025 11:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740311252; cv=none; b=SZYIqf6lna8KRRbmvm9n8M40xu4phJsGVsJR+EXn3U/MlOJ3xISE+p3SOhzj9Z3Xaf5VlU84s0nikpshJareWNZvbKXWa5lz0DewJ09Ty+acgcZhiOkb4WbaBASu2PP1HuTOjaW1HWj+4yLw4iJQQsbT/oUHqFkkwQ2tGlsrmuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740311252; c=relaxed/simple;
	bh=c4aBh0SYBAutVvanVxoT09U90yHT1CI9HJ/ZAilY5pw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHj00b4bkzKyEv9PecVjoiaFm+LIygsRfdpyFNJVnE/4jNN2UZAvkeujYagxquNp6Hnd+Ipos6gzNwyt1dRYP8BWfkN8MvlrR4VwXCUNN1qte0SPZbzOHIlZTcySUbohbKBujIkpK/nnEO9LIJphXf8OrWeJe5iXcElOkFdBq3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d6hIdrU4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B5AC4CEDD;
	Sun, 23 Feb 2025 11:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740311252;
	bh=c4aBh0SYBAutVvanVxoT09U90yHT1CI9HJ/ZAilY5pw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d6hIdrU4aGsFHMMbxt1e9/3Y0ICd4bfWi47R5Uug8BSA/kXMSRCX/EC9EBIX5UAXG
	 wZMAjExlH1Nyj42BjFD4Ugzxw+Vj9xckTxsnHtxaw/WyZeETnHy//jyUeOv4E2SaxA
	 pmA/At6I4FTTbqRtU19T5ZKg5i2K7YvonGYCX4eQTQY6ecbWowqRNB/gnLcQQBLy/A
	 sDDXxfvevXqY7hGH26jvPfeECvlD/beQoi3rc3yn7s/1iIQqHRSZJTwW3OoRUGyMlV
	 oDFmIa4TReSq41pgSUls1VpcL4rPUKA7QK2gHOfU9aisL0iqhNs8O2iTxu0wuMKUOY
	 pol7tTiEHedLw==
Date: Sun, 23 Feb 2025 12:47:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mirela Rabulea <mirela.rabulea@nxp.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ming Qian <ming.qian@nxp.com>
Subject: Re: [PATCH 1/2] media: dt-bindings: nxp,imx8-jpeg: Add compatible
 strings for IMX95 JPEG
Message-ID: <20250223-military-garrulous-toucan-c9a410@krzk-bin>
References: <20250221-95_jpeg-v1-0-053decdb452c@nxp.com>
 <20250221-95_jpeg-v1-1-053decdb452c@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250221-95_jpeg-v1-1-053decdb452c@nxp.com>

On Fri, Feb 21, 2025 at 12:48:18PM -0500, Frank Li wrote:
> Add compatible strings "nxp,imx95-jpgdec" and "nxp,imx95-jpgenc", which
> are backward compatible with "nxp,imx8qxp-jpgdec" and
> "nxp,imx8qxp-jpegenc". i.MX95 just need one power domain which combine
> wrap and all slots together. Reduce minItems of power-domains to 1 for
> i.MX95 and keep the same restriction for others.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/media/nxp,imx8-jpeg.yaml   | 28 +++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


