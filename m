Return-Path: <linux-media+bounces-19534-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D8499C156
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 09:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92A791F238F7
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 07:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB5C14B942;
	Mon, 14 Oct 2024 07:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZ7VqkIB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BFE4142624;
	Mon, 14 Oct 2024 07:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728891058; cv=none; b=J8Wm8hADrKCbjvN/QLnvbVVnqp5A7ASvFTz3F+fkDTYGZFpo+EcwYV8X7YkHyylO/chG+yeyQrQgIttEnIobZWgT4EaK1c5Ji2umxi7cay/HXGsXHYUcbZa8aKw0dLV4Eh/TvnL4PBpRTqbQ64xlNv0Mv6aBahgq7z66bXo4txU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728891058; c=relaxed/simple;
	bh=cGTSo/82w4jo67YKxOIEEUcdV9CSdLz/Cyr7c7JFK5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RSdKv705H9UOy81B+DoAOXB3kSEjVlzMz7GczgW0iSaPBUUL9tqXEwcMmsJrEalNX+7L7DxWgLXRfpXUwVzfzp+Bz4rNB2Oq3hhosUtFHyHg7Uu9fztzR1YAHmohHH1jArHCJ/2Ee+TLmdZUf6DCrhepCXxUcjH5uM57stHuQyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZZ7VqkIB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D94C4CEC3;
	Mon, 14 Oct 2024 07:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728891057;
	bh=cGTSo/82w4jo67YKxOIEEUcdV9CSdLz/Cyr7c7JFK5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZZ7VqkIBTlBdWKLIsnu+hFBXzrWl/v7M/Xqmdx4f/omZdInbkD4bBkc/ZVJxjAo2q
	 wWIN/IP9YY95E+iI1YjaFPGn5DUhLlt7eSBU99BGmBxnJLNCgIHWxXHc3eO17Sy5oX
	 nSTTG2pYTdH8aysW3Xe02Xa/ifu+w+NS6X7ibJBrT4vZum9DeaWP5w8QUb3jcMw6jA
	 cw8chKYynzSCZMI49X44GiwjaAWJnKT+apiJvWTRRUzdLw3aIMMCvRLEr+zE0myIou
	 q/1DgiKb1Oje6f6WEoCYhClUPgtfNZin/gCommktglbe9EQw3XDrZE2MgW9eukBhIk
	 2c0uQR1+DBRSQ==
Date: Mon, 14 Oct 2024 09:30:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: guoniu.zhou@oss.nxp.com
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	jacopo@jmondi.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.d, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: nxp: imx8-isi: Add i.MX8ULP support
Message-ID: <qb2mi6snw2jfzc7opvsn4uomz6og42kpyvfvc5fc7ndu3jg3dr@2upbfdhiw3sk>
References: <20241012084732.1036652-1-guoniu.zhou@oss.nxp.com>
 <20241012084732.1036652-2-guoniu.zhou@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241012084732.1036652-2-guoniu.zhou@oss.nxp.com>

On Sat, Oct 12, 2024 at 04:47:33PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> 
> Add ISI support for i.MX8ULP.
> 
> Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>

Same question.

> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 14 ++++++++++++++
>  .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 +
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index c2013995049c..528e723114d5 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -307,6 +307,19 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
>  	.has_36bit_dma		= true,
>  };
>  
> +static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
> +	.model			= MXC_ISI_IMX8ULP,
> +	.num_ports		= 1,
> +	.num_channels		= 1,
> +	.reg_offset		= 0x0,
> +	.ier_reg		= &mxc_imx8_isi_ier_v2,
> +	.set_thd		= &mxc_imx8_isi_thd_v1,
> +	.clks			= mxc_imx8mn_clks,
> +	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
> +	.buf_active_reverse	= true,
> +	.has_36bit_dma		= false,
> +};
> +
>  static const struct mxc_isi_plat_data mxc_imx93_data = {
>  	.model			= MXC_ISI_IMX93,
>  	.num_ports		= 1,
> @@ -528,6 +541,7 @@ static void mxc_isi_remove(struct platform_device *pdev)
>  static const struct of_device_id mxc_isi_of_match[] = {
>  	{ .compatible = "fsl,imx8mn-isi", .data = &mxc_imx8mn_data },
>  	{ .compatible = "fsl,imx8mp-isi", .data = &mxc_imx8mp_data },
> +	{ .compatible = "fsl,imx8ulp-isi", .data = &mxc_imx8ulp_data },

Bindings go before users.

Best regards,
Krzysztof


