Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73151679FC5
	for <lists+linux-media@lfdr.de>; Tue, 24 Jan 2023 18:08:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234805AbjAXRIJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Jan 2023 12:08:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234602AbjAXRH5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Jan 2023 12:07:57 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C556A4ED36;
        Tue, 24 Jan 2023 09:06:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BAC93B81103;
        Tue, 24 Jan 2023 17:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0D9C433EF;
        Tue, 24 Jan 2023 17:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674579993;
        bh=mucqgzB49xv1nH/6kuQLdapDPB+DOCEKCnoHfEIuhZg=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=pG6s+0uV2Kkri003TScoNLVlZp/lLBGGSvwjuAndYNkdC5cEUkOeAUBj15EaqsGj8
         Bxa6W1/cbt/tEAfVJVKFWr+qC5YgzOW8aKHBpGAFEphWPK2W3XmoL0p2n//eNtJLTS
         YupLUsENoY2z9ssI0mF2C6H/V6tAup6f100Ff8ufqZS6clKWsHg71f+e4FHtX7SmuW
         LSnJPPqXqU/mhzqByqrjU/Dz2hNt0z9PDO4U+ODFIatkshatqCV1Xgct/dc3tPUjmG
         ZwUGnU9hsvnAYiNg5097fkE9XxoiiFLniE0W6HnoHbAj9jUTh6fMpqGk4mc10+lX4k
         mIHUQh6UQKKNw==
Message-ID: <5b9425a9-d0be-d09e-3219-2612f407a0d5@kernel.org>
Date:   Tue, 24 Jan 2023 18:06:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v1 2/2] media/i2c: Add a driver for the Sony IMX708 image
 sensor
Content-Language: en-US
To:     Naushir Patuck <naush@raspberrypi.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>,
        David Plowman <david.plowman@raspberrypi.com>
References: <20230124150546.12876-1-naush@raspberrypi.com>
 <20230124150546.12876-3-naush@raspberrypi.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230124150546.12876-3-naush@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/01/2023 16:05, Naushir Patuck wrote:
> From: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
> 
> The imx708 is a 12MP MIPI sensor with a 16:9 aspect ratio, here using
> two CSI-2 lanes. It is a "quad Bayer" sensor with all 3 modes offering
> 10-bit output:
> 
> 12MP: 4608x2592 up to 14.35fps (full FoV)
> 1080p: 2304x1296 up to 56.02fps (full FoV)
> 720p: 1536x864 up to 120.12fps (cropped)
> 

Thank you for your patch. There is something to discuss/improve.

> +
> +static int imx708_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct imx708 *imx708;
> +	int ret;
> +
> +	imx708 = devm_kzalloc(&client->dev, sizeof(*imx708), GFP_KERNEL);
> +	if (!imx708)
> +		return -ENOMEM;
> +
> +	v4l2_i2c_subdev_init(&imx708->sd, client, &imx708_subdev_ops);
> +
> +	/* Check the hardware configuration in device tree */
> +	if (imx708_check_hwcfg(dev))
> +		return -EINVAL;
> +
> +	/* Get system clock (xclk) */
> +	imx708->xclk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(imx708->xclk)) {
> +		dev_err(dev, "failed to get xclk\n");

return dev_err_probe().

> +		return PTR_ERR(imx708->xclk);
> +	}
> +
> +	imx708->xclk_freq = clk_get_rate(imx708->xclk);
> +	if (imx708->xclk_freq != IMX708_XCLK_FREQ) {
> +		dev_err(dev, "xclk frequency not supported: %d Hz\n",
> +			imx708->xclk_freq);
> +		return -EINVAL;
> +	}
> +
> +	ret = imx708_get_regulators(imx708);
> +	if (ret) {
> +		dev_err(dev, "failed to get regulators\n");

return dev_err_probe().

> +		return ret;
> +	}
> +
> +	/* Request optional enable pin */
> +	imx708->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> +						     GPIOD_OUT_HIGH);
> +
> +	/*
> +	 * The sensor must be powered for imx708_identify_module()
> +	 * to be able to read the CHIP_ID register
> +	 */
> +	ret = imx708_power_on(dev);
> +	if (ret)
> +		return ret;
> +
> +	ret = imx708_identify_module(imx708);
> +	if (ret)
> +		goto error_power_off;
> +
> +	/* Initialize default format */
> +	imx708_set_default_format(imx708);
> +
> +	/*
> +	 * Enable runtime PM with autosuspend. As the device has been powered
> +	 * manually, mark it as active, and increase the usage count without
> +	 * resuming the device.
> +	 */
> +	pm_runtime_set_active(dev);
> +	pm_runtime_get_noresume(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_set_autosuspend_delay(dev, 1000);
> +	pm_runtime_use_autosuspend(dev);
> +
> +	/* This needs the pm runtime to be registered. */
> +	ret = imx708_init_controls(imx708);
> +	if (ret)
> +		goto error_power_off;
> +
> +	/* Initialize subdev */
> +	imx708->sd.internal_ops = &imx708_internal_ops;
> +	imx708->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
> +			    V4L2_SUBDEV_FL_HAS_EVENTS;
> +	imx708->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
> +
> +	/* Initialize source pad */
> +	imx708->pad.flags = MEDIA_PAD_FL_SOURCE;
> +
> +	ret = media_entity_pads_init(&imx708->sd.entity, 1, &imx708->pad);
> +	if (ret) {
> +		dev_err(dev, "failed to init entity pads: %d\n", ret);

return dev_err_probe().

> +		goto error_handler_free;
> +	}
> +
> +	ret = v4l2_async_register_subdev_sensor(&imx708->sd);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to register sensor sub-device: %d\n", ret);

return dev_err_probe().


Best regards,
Krzysztof

