Return-Path: <linux-media+bounces-36947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F20AFACA6
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 09:05:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6078F3A6B42
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 07:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8799927A477;
	Mon,  7 Jul 2025 07:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="juhvhw3W"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F1CF510;
	Mon,  7 Jul 2025 07:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751871808; cv=none; b=dj6JGe8cgxdoC4OJsUfSrN9K/ugKaWKJc0RxoAbx+inLBgniziN3Or75sw6TojPGKSYlnMmhxqvzhwdgZBqs5Ak0bSa8RR8fObiArp4W2cyy77oBHpoyyEDpbbnIzVEBFWh9gB++sPtUx6965jgFNw/MnGYf2rLkIOvDGrbSBxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751871808; c=relaxed/simple;
	bh=C7uOTK0k8vI5Rytb4z6FYorlHJkqS3b6pXeuWrE6ydE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NBOMdiRNQ6tEFk1IpqGLU2fAkH496qNuIe/wh2cxX61wi1AeheklLuvkzhykkssIpHI+agH2fPfIo577mpeXIf0mXCck8JPIURojUQQOi2UnEBpKcUtNN6qZ5seVUOZfmmmuFud3gBgnwopD8MUO047iCO1ubT+Urx+PvuCtz7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=juhvhw3W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6986C4CEE3;
	Mon,  7 Jul 2025 07:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751871807;
	bh=C7uOTK0k8vI5Rytb4z6FYorlHJkqS3b6pXeuWrE6ydE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=juhvhw3WpehmoYS3yhMSeHhbSJHFjabaH4UVU914nbBJLsczWs9I2wPEtRq7olY08
	 GBWxYeU16OKlR1EM0xg8BB3VCqWUb9XFoKeQbr6akcK9u64d1pOZz6Q1rmHNp0UD1A
	 e4OhC/sgy/PkTEEDoUx/++7WBvepuiev5p8MQCQW6ARuHVB8GS2efXl+1B9Ca1lPBy
	 uDeqS9LQp3gV5dlacwuw5wjPp0dHhTws7+EoXVlbwgxCWzdjeFlInMwoK1HD/E1ijt
	 h/N9XfUMi9P4+zsKrjoq7EvZdfR/PLOs1d9UFJ6yx9DHTNE3ZaErPgmlyY6mCSOFQq
	 lXAKKtP1vrbqg==
Date: Mon, 7 Jul 2025 09:03:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-media@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: imx8: add parallel CSI node
Message-ID: <20250707-authentic-jellyfish-of-tact-ef6f0d@krzk-bin>
References: <20250703-imx8qxp_pcam-v2-0-188be85f06f1@nxp.com>
 <20250703-imx8qxp_pcam-v2-3-188be85f06f1@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250703-imx8qxp_pcam-v2-3-188be85f06f1@nxp.com>

On Thu, Jul 03, 2025 at 02:33:08PM -0400, Frank Li wrote:
> Add parallel CSI nodes.

CSI is serial. How this can be a parallel serial? Binding speaks nothing
about CSI, so this is just confusing. About which MIPI standard are we
talking here?

> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> changes in v2
> - update compatible string to match binding's change
> ---
>  arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi    | 13 +++++++++++
>  arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi | 27 +++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
> index 2cf0f7208350a416d77b11140279d2f66f41498f..1f7bf9efdbca266fbda82d2bc84acd9a27ed0bd1 100644
> --- a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
> @@ -224,6 +224,19 @@ irqsteer_parallel: irqsteer@58260000 {
>  		status = "disabled";
>  	};
>  
> +	parallel_csi: csi@58261000 {

And here it is called csi, not cpi, although binding calls pcif. Decide.

Best regards,
Krzysztof


