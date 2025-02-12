Return-Path: <linux-media+bounces-26094-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6EEA33087
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 21:12:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FF7C188B39E
	for <lists+linux-media@lfdr.de>; Wed, 12 Feb 2025 20:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51CD9201025;
	Wed, 12 Feb 2025 20:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DO0KSLQ6"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74A3201024
	for <linux-media@vger.kernel.org>; Wed, 12 Feb 2025 20:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739391126; cv=none; b=l8mk7RR3Hg92c2GPSU7SxZkhCyDOkHMfEJMk6SUBGQx3dZ4IXv2EbmeUQvriKBrewMQiQ8M4to04kGNVMRBngyNe2PiY8hPzTTjblgoFpRenGJocmzujoEv5YwYngrcybvvt5dJ+ZrcrBRW+VGkWOxBPvRlHXk5sCuH5JgQqFLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739391126; c=relaxed/simple;
	bh=efb/0y4ygJFKnTQ/RDAjQmojXap8ztAoDsZftmAaz4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j2FEUu6m8oiEhu7GGSiBZDY/abtP8BaYHtQagISzSxDr3OkLUkbky06McxNZNBzUTyYT2WxfaKFI3a3S9TmYvdHHYwzGw7QmdFFM/fRKvsxB669QBhjKDwhO+gZFj7A7XLWYXCbvDRHjpmEEZ5Yf8rBhx51fmIXTcwmlz6qos3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DO0KSLQ6; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38c62ef85daso11324f8f.3
        for <linux-media@vger.kernel.org>; Wed, 12 Feb 2025 12:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739391123; x=1739995923; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cGuh2UpFaa2uhSTti4wLTQGn5xlWBin8bdkOwKV8rOc=;
        b=DO0KSLQ60Vs9z5Vv4vaalWl95wQ0j9qgGEtKDyYUIyNFo1iVYDm6ABbTRnENb6Pwiy
         pAj7C6++cjBY4i6vKGeMVWNG8PCJzFOWi6omsEOEsbYvgCIwtXs/+SDr0NcKHB+clR/C
         SWEO3GDeXNsL6xSOP45aQQ3RZqagzGXebpxKaEG8fwFZdGqBj/tYJ5HcAAbgppm7PVd9
         aA2burxOjQfAsAZwlWd6lMEH2zRXcHt2BUvuHHdwipzQZKTYERf6QYmL2Xanfctcqz78
         9OHFy2dZb7Lc448oR5AroIUn0pQqjfneKHxC6ae8AIpc3pI9qGlKxwYEoQ/K2x94OM17
         7cQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739391123; x=1739995923;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cGuh2UpFaa2uhSTti4wLTQGn5xlWBin8bdkOwKV8rOc=;
        b=ZTfX1HfG4WcooRxzuM+wWUoGrvEL6IEmuPXvEGJTpUc3660Z8+2hjNCEHR1auOY+ow
         RVhjGF/Ff66DuN3R0C/yCG01CIL8nj6Q83rcf1rwVVR17EbeF/M5AjxW71RNF+GllEzY
         Xwdy1MnZ53KYcC0+gu67+QQIdL9LaAp6MAeum9q6CSUVe+loi+fHSqOfxCQse32tZ0jn
         qojvEqF5pdfxqwes43JTBNvDT3AOB+cqbHHqD/PoTgtL3OK/UpFF/2acERtu813r9mSn
         E9+WqSUx63FspJCpX7LjIrWiI6jOsrrnHo9GDGKal8oJPm+6WR+rnEtHgrWgPawg6Ojl
         SQ0w==
X-Forwarded-Encrypted: i=1; AJvYcCVYdke0ueX1PK2364FUCjZeeNOrjd2kTvaB6tzzN5LApEQYDgcW6iJ371rpmcghhnqJvo9KVDkFmihNYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwW07MFr1RXEvR5H8GCfzkAdF65pNjPaZWYRySzclWr3Mj+aJrO
	WT0RTzTs+UY/2QwK3SmaUOXGiAeK6ZmyFv3IXMHRsxMwuCpEnct/m/30cXYE08w=
X-Gm-Gg: ASbGncvE6zW2aZ/g0035LIuD6aCn1e3DEDTGzr4PxsPY1TSXb+j7NBS2ll3XBHvqm3G
	UdwwukmjRM0QOWBghNW87ZGF/xMq/y4TpfJ3Cc8YIoUpUwYaNCHZ4YclLEWoPyqojWKu4Ct5h6L
	2zISBqAzVieTZN2dLhtKTyFkSLwnFNszU2dCby/lDXEQauMlPjlZLqYZIEv7wOHUwCH9EcfLSY2
	Y687EzijkxLJw+ekNvxomOxigCnbqCb00i9gsHDmYQY2nmkSx957SfdFEWXzcIjQTzRyS1v5Oca
	G1LDXlbt820NGfHVCO6J+gUNaro6d5aX1eE=
X-Google-Smtp-Source: AGHT+IEfGn9LtFHGk0U8Y+QHBiuO20iTGGl0VWaOwFT9tOI69q9FhNUAIo2hVt9dHR5dTGoa1omXSw==
X-Received: by 2002:a5d:5f42:0:b0:38a:9118:c09c with SMTP id ffacd0b85a97d-38dea3314cfmr1510971f8f.11.1739391122959;
        Wed, 12 Feb 2025 12:12:02 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1aa6f7sm28927165e9.32.2025.02.12.12.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 12:12:02 -0800 (PST)
Message-ID: <416d75fd-40d0-45d7-9590-0322abb480ca@linaro.org>
Date: Wed, 12 Feb 2025 21:11:58 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: i2c: Add driver for Sony IMX728
To: Sebastian LaVine <slavine@d3embedded.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Abel Vesa <abel.vesa@linaro.org>, Achath Vaishnav <vaishnav.a@ti.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Javier Carrasco <javier.carrasco@wolfvision.net>, Jianzhong Xu <xuj@ti.com>,
 Julien Massot <julien.massot@collabora.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Kory Maincent <kory.maincent@bootlin.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mikhail Rudenko <mike.rudenko@gmail.com>, Nishanth Menon <nm@ti.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stuart Burtner <sburtner@d3embedded.com>, Tero Kristo <kristo@kernel.org>,
 Thakkar Devarsh <devarsht@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Will Deacon <will@kernel.org>,
 Zhi Mao <zhi.mao@mediatek.com>
References: <20250212195656.69528-1-slavine@d3embedded.com>
 <20250212195656.69528-3-slavine@d3embedded.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250212195656.69528-3-slavine@d3embedded.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/02/2025 20:56, Sebastian LaVine wrote:
> +static int imx728_detect(struct imx728 *imx728)
> +{
> +       int ret = 0;
> +       u64 minor, major;
> +
> +       cci_read(imx728->regmap, IMX728_REG_VMAJOR, &major, &ret);
> +       if (ret != 0) {
> +               dev_err(imx728->dev, "Could not read PARAM_MAJOR_VER!");
> +               return ret;
> +       }
> +       cci_read(imx728->regmap, IMX728_REG_VMINOR, &minor, &ret);
> +       if (ret != 0) {
> +               dev_err(imx728->dev, "Could not read PARAM_MINOR_VER!");
> +               return ret;
> +       }
> +       dev_dbg(imx728->dev, "Got version: %lld.%lld", major, minor);
> +
> +       return 0;
> +}
> +
> +static int imx728_reset(struct imx728 *imx728)
> +{
> +
> +       int ret = 0;
> +
> +       // Prefer hardware reset if available.
> +       if (!IS_ERR_OR_NULL(imx728->reset_gpio)) {

Here can be ERR (although why?) but...

> +               gpiod_set_value_cansleep(imx728->reset_gpio, 1);
> +               usleep_range(1000, 10000);
> +               gpiod_set_value_cansleep(imx728->reset_gpio, 0);
> +               msleep(100);
> +       } else {
> +               // Software reset.
> +               cci_write(imx728->regmap, IMX728_REG_RESET_0, 0xc3, &ret);
> +               cci_update_bits(imx728->regmap, IMX728_REG_RESET_1, 0x1, 0x1, &ret);
> +               msleep(100);
> +       }
> +
> +       return ret;
> +}
> +
> +static int imx728_power_on(struct imx728 *imx728)
> +{
> +       int ret;
> +
> +       ret = clk_prepare_enable(imx728->clk);
> +       if (ret < 0)
> +               return ret;
> +
> +       imx728_reset(imx728);
> +       return 0;
> +}
> +
> +static int imx728_power_off(struct imx728 *imx728)
> +{
> +
> +       if (imx728->reset_gpio) {

Here cannot.

> +               gpiod_set_value_cansleep(imx728->reset_gpio, 1);
> +
> +               usleep_range(1, 10);
> +       }
> +       clk_disable_unprepare(imx728->clk);
> +       return 0;
> +}
> +


...

> +
> +static int imx728_set_stream(struct v4l2_subdev *sd, int enable)
> +{
> +       struct imx728 *imx728 = to_imx728(sd);
> +       int ret;
> +
> +       mutex_lock(&imx728->lock);

Just use guard. That's actually perfect candidate.


> +       if (imx728->streaming == enable) {
> +               mutex_unlock(&imx728->lock);
> +               return 0;
> +       }
> +
> +       if (enable) {
> +               ret = pm_runtime_get_sync(imx728->dev);
> +               if (ret < 0) {
> +                       pm_runtime_put_noidle(imx728->dev);
> +                       goto err_unlock;
> +               }
> +
> +               ret = imx728_start_stream(imx728);
> +               if (ret < 0)
> +                       goto err_runtime_put;
> +       } else {
> +               ret = imx728_stop_stream(imx728);
> +               if (ret < 0)
> +                       goto err_runtime_put;
> +               pm_runtime_mark_last_busy(imx728->dev);
> +               pm_runtime_put_autosuspend(imx728->dev);
> +       }
> +
> +       imx728->streaming = enable;
> +
> +       __v4l2_ctrl_grab(imx728->ctrl.h_flip, enable);
> +       __v4l2_ctrl_grab(imx728->ctrl.v_flip, enable);
> +
> +       mutex_unlock(&imx728->lock);
> +
> +       return 0;
> +
> +err_runtime_put:
> +       pm_runtime_put(imx728->dev);
> +
> +err_unlock:
> +       mutex_unlock(&imx728->lock);
> +       dev_err(imx728->dev,
> +               "%s: failed to setup streaming %d\n", __func__, ret);
> +       return ret;
> +}
> +
> +static const struct v4l2_subdev_core_ops imx728_core_ops = {
> +       .subscribe_event = v4l2_ctrl_subdev_subscribe_event,
> +       .unsubscribe_event = v4l2_event_subdev_unsubscribe,
> +};
> +
> +static const struct v4l2_subdev_video_ops imx728_subdev_video_ops = {
> +       .s_stream = imx728_set_stream,
> +};
> +
> +static const struct v4l2_subdev_pad_ops imx728_subdev_pad_ops = {
> +       .enum_frame_size = imx728_enum_frame_sizes,
> +       .enum_mbus_code = imx728_enum_mbus_code,
> +       .get_fmt = v4l2_subdev_get_fmt,
> +       .get_frame_desc = imx728_get_frame_desc,
> +       .get_frame_interval = imx728_get_frame_interval,
> +       .get_selection = imx728_get_selection,
> +       .set_fmt = imx728_set_fmt,
> +       .set_frame_interval = imx728_set_frame_interval,
> +       .set_routing = imx728_set_routing,
> +};
> +
> +static const struct v4l2_subdev_ops imx728_subdev_ops = {
> +       .core  = &imx728_core_ops,
> +       .video = &imx728_subdev_video_ops,
> +       .pad   = &imx728_subdev_pad_ops,
> +};
> +
> +static const struct v4l2_subdev_internal_ops imx728_internal_ops = {
> +       .init_state = imx728_init_state,
> +};
> +
> +
> +static const struct v4l2_ctrl_ops imx728_ctrl_ops = {
> +       .s_ctrl = imx728_set_ctrl,
> +};
> +
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
> +       imx728->regmap = devm_cci_regmap_init_i2c(client, 16);
> +       if (IS_ERR(imx728->regmap))
> +               return PTR_ERR(imx728->regmap);
> +
> +       imx728->reset_gpio = devm_gpiod_get_optional(imx728->dev,
> +                                            "reset", GPIOD_OUT_LOW);
> +       if (IS_ERR(imx728->reset_gpio))
> +               return PTR_ERR(imx728->reset_gpio);

So can it be ERR after that point? Looks like not.



Best regards,
Krzysztof

