Return-Path: <linux-media+bounces-14225-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDC9919FB1
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 08:58:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F363E1F2675C
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 06:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7626143AC3;
	Thu, 27 Jun 2024 06:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fv02IeF/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E3A47A5C
	for <linux-media@vger.kernel.org>; Thu, 27 Jun 2024 06:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719471483; cv=none; b=nRs1XgqwEI4VgcLpIIGTev+08BNm3XGKk1mgkKbhyKa9aHZ+F4qaxsdJXCpGT3vKDdvybd9fAAyX+NL4mCesgdJvZzNA18i++qSewXBXjTEfAjrO5Eq7yUL6cflT5p4LIWu8atLRkezX9Rf/S1Lq9Qo38efCVcA1ZMhJ3DzJcmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719471483; c=relaxed/simple;
	bh=eormCvX9TPHPTGlS7JVXZ6S4JUF+Kt8F4kyQnbSADLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=n+H6CiN3INzUZ/zY0QrnjPJmMz07QgNNuEcXhP6kDvytlj+skr6XrLeAoY1o63OsRWv9cZ1S/FT97Iz8IzMMuiaiH7qRmOe7jB5vvLchYq9eI2Je4jiAhH5buNjR+fu66KvqHUznOE5CH/loujqVM1fWDXuwyW974j2XBv70gis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fv02IeF/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9691C2BBFC;
	Thu, 27 Jun 2024 06:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719471483;
	bh=eormCvX9TPHPTGlS7JVXZ6S4JUF+Kt8F4kyQnbSADLw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Fv02IeF/nguZCA6LiPgV1RfKoz45mmYMuWoqH0SZaufz4mDvjMUV6bCJsJDiSFIzn
	 OPf1KT7lqujV3x4l3oDOE+Hgf96s1u6IG1nGOvydz6qXsWIrRUJOI4XyxL5jB1vXoH
	 Cay/B2m4hj3BzmI6gThNanxu86Y7rPQNev7H4vCnfUxO4yseo+mT1X7o+CVmSZ+eMM
	 cU9R4eIiuRDTh2Aej28mRGjGJyZiYBKCw0MiydeLLa70/lG0RrS8Xx4zzxoQj1G2z3
	 1BrjgP8mEP8utLQHuftQ/uHe+N+OByy+OB2VwNk8tF6UyA3b14ue0GuhcbxBPPUhO7
	 /VWGYCWkbVL3A==
Message-ID: <502c3e98-79f7-47f7-a960-1a0e5b4bc379@kernel.org>
Date: Thu, 27 Jun 2024 08:57:59 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: i2c: Add driver for Sony IMX728
To: Spencer Hill <shill@d3engineering.com>, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240626211529.2068473-1-shill@d3engineering.com>
 <20240626211529.2068473-2-shill@d3engineering.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240626211529.2068473-2-shill@d3engineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/06/2024 23:15, Spencer Hill wrote:
> Add a driver for the Sony IMX728 image sensor.
> 
> Signed-off-by: Spencer Hill <shill@d3engineering.com>
> ---


...

> +static int imx728_probe(struct i2c_client *client)
> +{
> +       struct imx728 *imx728;
> +       struct v4l2_subdev *sd;
> +       struct v4l2_ctrl_handler *ctrl_hdr;
> +       int ret;
> +
> +       imx728 = devm_kzalloc(&client->dev, sizeof(*imx728), GFP_KERNEL);
> +       if (!imx728)
> +               return -ENOMEM;
> +
> +       imx728->dev = &client->dev;
> +
> +       imx728->regmap = devm_regmap_init_i2c(client, &imx728_regmap_config);
> +       if (IS_ERR(imx728->regmap))
> +               return PTR_ERR(imx728->regmap);
> +
> +       imx728->xclr_gpio = devm_gpiod_get_optional(imx728->dev,
> +                                            "xclr", GPIOD_OUT_LOW);
> +       if (IS_ERR(imx728->xclr_gpio))
> +               return PTR_ERR(imx728->xclr_gpio);
> +
> +       imx728->clk = devm_clk_get(imx728->dev, "inck");
> +       if (IS_ERR(imx728->clk))
> +               return PTR_ERR(imx728->clk);
> +
> +       imx728->clk_rate = clk_get_rate(imx728->clk);
> +       dev_info(imx728->dev, "inck rate: %lu Hz\n", imx728->clk_rate);

dev_dbg
clock rates are easy to check from sysfs

...

> +
> +       dev_info(imx728->dev, "imx728 probed\n");

No, drop. It's useless and there are existing interfaces telling you this.

> +       pm_runtime_mark_last_busy(imx728->dev);
> +       pm_runtime_put_autosuspend(imx728->dev);
> +       return 0;
> +
> +err_subdev_cleanup:
> +       v4l2_subdev_cleanup(&imx728->subdev);
> +
> +err_pm_disable:
> +       pm_runtime_dont_use_autosuspend(imx728->dev);
> +       pm_runtime_put_noidle(imx728->dev);
> +       pm_runtime_disable(imx728->dev);
> +
> +err_ctrl_free:
> +       v4l2_ctrl_handler_free(ctrl_hdr);
> +       mutex_destroy(&imx728->lock);
> +
> +err_media_cleanup:
> +       media_entity_cleanup(&imx728->subdev.entity);
> +
> +       return ret;
> +}


> +
> +MODULE_DEVICE_TABLE(of, imx728_dt_id);
> +
> +static struct i2c_driver imx728_i2c_driver = {
> +       .driver = {
> +               .name = "imx728",
> +               .of_match_table = of_match_ptr(imx728_dt_id),

Drop of_match_ptr(), you have warnigns here.

> +               .pm = &imx728_pm_ops,
> +       },
> +       .probe = imx728_probe,
> +       .remove = imx728_remove,
> +};
> +
> +module_i2c_driver(imx728_i2c_driver);


> +struct imx728 {
> +       struct device *dev;
> +
> +       struct clk *clk;
> +       struct i2c_client *client;
> +       struct regmap *regmap;
> +       struct gpio_desc *xclr_gpio;
> +
> +       struct v4l2_subdev subdev;
> +       struct v4l2_mbus_framefmt format;
> +       struct media_pad pad;
> +
> +       struct imx728_ctrl ctrl;
> +
> +       unsigned long clk_rate;
> +       u32 fps;
> +
> +       struct mutex lock;
> +       bool streaming;
> +};
> +
> +static const struct v4l2_area imx728_framesizes[] = {
> +       {
> +               .width = IMX728_OUT_WIDTH,
> +               .height = IMX728_OUT_HEIGHT,
> +       },
> +};
> +
> +static const u32 imx728_mbus_formats[] = {

No, NAK. You cannot have data allocations in header. This does not make
any sense and leeds to duplicated structures.



Best regards,
Krzysztof


