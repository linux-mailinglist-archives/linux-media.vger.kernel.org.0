Return-Path: <linux-media+bounces-36423-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 189EDAEF9DD
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 15:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FB534855EE
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 13:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB4325B301;
	Tue,  1 Jul 2025 13:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qo0zAEw1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0A02236E1;
	Tue,  1 Jul 2025 13:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751375330; cv=none; b=eMygw5bSEi8t5rlJ6ddOptQgmrh4K4jKyDbZvxLLgNJ118pAL6AsoIV2y0EuEFDfnLNdDWkjBMr6+vsLXx/cmR/3GE10LbstzEUHsc0T5ba3kxvcwrjsSx3j+Qsvm7HPhYGKKtiiJitdODTmDrCNlpwTI69AZG2Bp7CRp9bEMqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751375330; c=relaxed/simple;
	bh=Z2QwnDgHmONeoGR9tPxcnnsAHdlgZ+2lba+PnYp2OdQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cbO+aNuUZ78wbivVjIPxu2zqXgazgXdNFjuJengQFVq+S20EWBcChAeMIqAFtyKOqIeptFNbKiYNSHYRNAaLtibW3BbyL9i6F/f6MoA0FYugNj/eKup0bUDyZzx42PsFP/8WX3gjztwVjeI0jpheGsIEVw6WRGTqq0PlJ3KdASE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qo0zAEw1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C979C4CEEB;
	Tue,  1 Jul 2025 13:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751375329;
	bh=Z2QwnDgHmONeoGR9tPxcnnsAHdlgZ+2lba+PnYp2OdQ=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Qo0zAEw1yJCGd+1KFG9apzM9W0FbppqbK3DNx0PdQEzWi0L5oljkvwQJ4amysWs1j
	 fOAuA2ejJIl8RSd7QPCvLrNQoRXlezg2DLlC7pCiuZtnejurWwSKOFZ4rgQHuS+akp
	 UNcCG4oINQosAu1RWXcNjYFIpb/ZPjcyjq+6l2z8kjrjbQBCGpaXwieDziXEbAlKhq
	 0OuRfogwotgAV0roPGuzAAgXEnlsbvy8bdBXacC1BTd7FzxJg2eJtgsVKGcRK9iWGh
	 MVTWj2RylNpEoJOZt92uCbm2FdNesKKAbZgmmA/z1GpEhxGNTJiP6XZAmjSL3QlrAa
	 dY9YUoad6PNHw==
Message-ID: <39ee70ab-fc5b-462d-860b-aeeabea7417d@kernel.org>
Date: Tue, 1 Jul 2025 15:08:40 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] media: i2c: imx355: Support device tree probing and
 resource management
To: Richard Acayan <mailingradian@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250630225944.320755-7-mailingradian@gmail.com>
 <20250630225944.320755-9-mailingradian@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250630225944.320755-9-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/07/2025 00:59, Richard Acayan wrote:

>  static const struct imx355_reg imx355_global_regs[] = {
> @@ -1683,6 +1698,7 @@ static struct imx355_hwcfg *imx355_get_hwcfg(struct device *dev)
>  static int imx355_probe(struct i2c_client *client)
>  {
>  	struct imx355 *imx355;
> +	size_t i;
>  	int ret;
>  
>  	imx355 = devm_kzalloc(&client->dev, sizeof(*imx355), GFP_KERNEL);
> @@ -1694,6 +1710,42 @@ static int imx355_probe(struct i2c_client *client)
>  	/* Initialize subdev */
>  	v4l2_i2c_subdev_init(&imx355->sd, client, &imx355_subdev_ops);
>  
> +	for (i = 0; i < ARRAY_SIZE(imx355_supply_names); i++)
> +		imx355->supplies[i].supply = imx355_supply_names[i];
> +
> +	ret = devm_regulator_bulk_get(&client->dev,
> +				      ARRAY_SIZE(imx355->supplies),
> +				      imx355->supplies);
> +	if (ret) {
> +		dev_err_probe(&client->dev, ret, "could not get regulators");

Syntax is return dev_err_probe

> +		return ret;
> +	}
> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(imx355->supplies),
> +				    imx355->supplies);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	imx355->reset_gpio = devm_gpiod_get_optional(&client->dev, "reset",
> +						     GPIOD_OUT_HIGH);

So you keep the device disabled all the time... this makes no sense. How
can it work if it is always disabled?

> +	if (IS_ERR(imx355->reset_gpio)) {
> +		ret = PTR_ERR(imx355->reset_gpio);
> +		dev_err_probe(&client->dev, ret, "failed to get gpios");
> +		goto error_vreg_disable;
> +	}
> +
> +	imx355->mclk = devm_clk_get(&client->dev, "mclk");
> +	if (IS_ERR(imx355->mclk)) {
> +		ret = PTR_ERR(imx355->mclk);
> +		dev_err_probe(&client->dev, ret, "failed to get mclk");

No, syntax is ret = dev_err_probe.

> +		goto error_vreg_disable;
> +	}
> +
> +	clk_prepare_enable(imx355->mclk);
> +	usleep_range(12000, 13000);
> +
>  	/* Check module identity */
>  	ret = imx355_identify_module(imx355);
>  	if (ret) {
> @@ -1756,6 +1808,10 @@ static int imx355_probe(struct i2c_client *client)
>  
>  error_probe:
>  	mutex_destroy(&imx355->mutex);
> +	clk_disable_unprepare(imx355->mclk);



And where do you clean in remove()? No, just use devm_clk_get_enabled. I
think you are trying to upstream some old code. No, don't. You repeat
several poor patterns, like these err_probe handling or above clock bug
(actual bug). Just look how newest drivers are doing, not the
downstream. Downstream is the greatest antipattern. Absolute antipattern.


Best regards,
Krzysztof

