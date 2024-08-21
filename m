Return-Path: <linux-media+bounces-16547-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 459089591E7
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 02:35:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9821BB21E5C
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2024 00:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D4E11CAB8;
	Wed, 21 Aug 2024 00:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i/jcTUmA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7657F18035;
	Wed, 21 Aug 2024 00:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724200528; cv=none; b=bV8N2VOw/bDVcCnOQ3NlNmkXLUyfe3vz5IC15XDh9/yKL0u3bNgvoF61M6iOP2nNcAZ7F+RO2eo8hNPgsHyPCkmViQiCdr3WSilPRNo5cbaUuCAuQ8uRXHeDvtyhjMtTTx8lyzhzXH/Mbckgya68n+TCwv6JnFMpo8oyUxENk5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724200528; c=relaxed/simple;
	bh=72l7jIlEa0320LNF1TSC+FnXUPhcQrDJuCQkr3p6/1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MbMm6svHUiF6AJ0HEdFXz5UdHE/0uvUJIgve/JjsPhwS5h1TjgeGs2cLJpXDmYsskHjE65iOEDpICZo5MJFQdS/ltFF8W70ZPaN8SrV3/BjzjyjHAnkxuge5+WOGw/FkFlJUbHq3mczsZ+D+/Yv50xMY3AFG7X8hB7ssGuCaYtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i/jcTUmA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A70D1C4AF0E;
	Wed, 21 Aug 2024 00:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724200527;
	bh=72l7jIlEa0320LNF1TSC+FnXUPhcQrDJuCQkr3p6/1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i/jcTUmAgFm3sxsXOXZKpN7EhFM1gJ6bIkKyiXI4L6eY9DimnTKB+IBy0Xf6DOXjW
	 gtK/hLVsP+ZStPVNH9Cq8WJi280pelNE7QrG9BpHZsxTd90Iy2ZkzeV3jqyjxA2DQx
	 QNzA9xXGd9hAvYJILz3EkkXSz8F67/p4UuLWvdxtInMdhcjbujkkpYAwphVNJ0QKBU
	 cJKprBY1mnoM7ZjViIx7W7ScJO1238rI0nA7a/fBlHV29SwQvYDJb5mT9NHAkRC7Sx
	 Na3hG4QxzEZ2nepMQmXOoHn1kpG4MpRod9ASJncWGElEmmNKozPksxIktXvLZ8UQGe
	 BPfK8aeJehqzA==
Date: Tue, 20 Aug 2024 19:35:25 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>,
	Todor Tomov <todor.too@gmail.com>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>, devicetree@vger.kernel.org,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	linux-kernel@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Del Regno <angelogioacchino.delregno@somainline.org>,
	linux-amlogic@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Shijie Qin <shijie.qin@nxp.com>,
	Emil Velikov <emil.velikov@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>, linux-rockchip@lists.infradead.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-sunxi@lists.linux.dev, Zhou Peng <eagle.zhou@nxp.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Ming Qian <ming.qian@nxp.com>, Heiko Stuebner <heiko@sntech.de>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] media: dt-bindings: trivial white-space and example
 cleanup
Message-ID: <172420052496.2349176.18144624759283335223.robh@kernel.org>
References: <20240820073658.19045-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820073658.19045-1-krzysztof.kozlowski@linaro.org>


On Tue, 20 Aug 2024 09:36:58 +0200, Krzysztof Kozlowski wrote:
> Minor cleanups without funcitonal impact:
>  - There should not be an empty blank line after SPDX tag,
>  - Convention is to indent DTS examples in coding style with 2- or
>    4-space indentation (4 is preferred),
>  - Drop unused labels in DTS examples.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../media/allwinner,sun50i-h6-vpu-g2.yaml     |  1 -
>  .../bindings/media/amlogic,meson-ir-tx.yaml   |  1 -
>  .../bindings/media/amphion,vpu.yaml           |  1 -
>  .../bindings/media/fsl,imx6ull-pxp.yaml       |  1 -
>  .../media/mediatek,vcodec-decoder.yaml        |  1 -
>  .../media/mediatek,vcodec-encoder.yaml        |  1 -
>  .../media/mediatek,vcodec-subdev-decoder.yaml |  1 -
>  .../media/microchip,sama5d4-vdec.yaml         | 17 ++++----
>  .../bindings/media/nxp,imx8mq-vpu.yaml        | 41 +++++++++----------
>  .../bindings/media/qcom,msm8916-camss.yaml    |  1 -
>  .../bindings/media/qcom,msm8996-camss.yaml    |  1 -
>  .../bindings/media/qcom,sdm660-camss.yaml     |  1 -
>  .../bindings/media/qcom,sdm845-camss.yaml     |  1 -
>  .../bindings/media/qcom,sm8250-camss.yaml     |  1 -
>  .../bindings/media/rockchip,rk3568-vepu.yaml  |  1 -
>  .../bindings/media/rockchip-vpu.yaml          | 29 +++++++------
>  16 files changed, 42 insertions(+), 58 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


