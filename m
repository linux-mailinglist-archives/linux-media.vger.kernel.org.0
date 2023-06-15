Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E92C6731228
	for <lists+linux-media@lfdr.de>; Thu, 15 Jun 2023 10:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238456AbjFOIaB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Jun 2023 04:30:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244486AbjFOI3w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Jun 2023 04:29:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 911AF1FE2
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 01:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686817743;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=guth8KDbOiYo8RwCg1ZfKaXqLh/2fH2B7zVkLpg+/qk=;
        b=RQ3gDt+vJoyYbvgMPTKzb6cFUzhzBG5hBe9Va/o9BF2+lJAQK+y0RsqFKaqdUOgBzz5nIT
        eaaohx8qfLaN0ophno5dHj9ua+fOxgjANMoSpvz+7Np27SxiwlQkRieAqI9bJecvoacoYQ
        3OHBx8qB3NdZxq4aS9ywh+GZPxDGk/I=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-Jwyedbn7N-C02AUleau-kA-1; Thu, 15 Jun 2023 04:29:02 -0400
X-MC-Unique: Jwyedbn7N-C02AUleau-kA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-9715654ab36so133944966b.0
        for <linux-media@vger.kernel.org>; Thu, 15 Jun 2023 01:29:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686817739; x=1689409739;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=guth8KDbOiYo8RwCg1ZfKaXqLh/2fH2B7zVkLpg+/qk=;
        b=OKHvQRTzwbwwdOooDV1jrDLv9OnxdxP0Dv5kOXHC4oLE8xLiqSKF5ZyHLsuFbFVbnf
         auk1nI6NSeo98YHf7BJTvnE7H7WC3CFERueRZYCuthOxehWgVhuW+rURxxa9as2vP1wz
         MRcPcSmwgKthRwKX18QqOVJ8Cz/T1SE62WvLLSr9WNBqm8jMi8Au6CJUwqFCWXC+KGLE
         FV21zYu+E27EjtAPP67uZWMmkGRsLEeDYFsHRqVKWbJccir1QP5EHeQFeiat56xrded7
         HHipsR0idjwfudrZN8uYIV6Sn0aF5SyXiQrBEOQW5lX+HNDOmcZ+1QL3dJphObmRbcoO
         ayKw==
X-Gm-Message-State: AC+VfDwUB8jj2EqsHeixbgHci5D0HxLECOhFZeboExv3OODep6SoWsDh
        jYc3wANNGyARHEtJkBfPk7dcYXA+eszjqfSPyjCEfZNWKQXTWO0sjAyJNevnY44qN+3meClWXG9
        er6tRGJbN1RWRDhJ7A06KnN0=
X-Received: by 2002:a17:906:dc94:b0:92b:3c78:91fa with SMTP id cs20-20020a170906dc9400b0092b3c7891famr17397615ejc.28.1686817739631;
        Thu, 15 Jun 2023 01:28:59 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ65gDOHCSrVSwVM783FT6jXUL4lZwITiNM310Goc53URqaQkhFVt4dfKAjQA/BQh4R2Q6Cw2A==
X-Received: by 2002:a17:906:dc94:b0:92b:3c78:91fa with SMTP id cs20-20020a170906dc9400b0092b3c7891famr17397598ejc.28.1686817739251;
        Thu, 15 Jun 2023 01:28:59 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id y20-20020a1709063a9400b00965e9b435dfsm8956945ejd.65.2023.06.15.01.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 01:28:57 -0700 (PDT)
Message-ID: <a28b0bb9-0733-b32a-35cc-9d517317d4bd@redhat.com>
Date:   Thu, 15 Jun 2023 10:28:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3] media: ov13b10: add PM control support based on power
 resources
Content-Language: en-US, nl
To:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, dan.scally@ideasonboard.com,
        arec.kao@intel.com, hao.yao@intel.com
Cc:     bingbu.cao@linux.intel.com
References: <20230615055416.2975328-1-bingbu.cao@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230615055416.2975328-1-bingbu.cao@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 6/15/23 07:54, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> On ACPI based platforms, the ov13b10 camera sensor need to be powered
> up by acquire the PM resource from INT3472. INT3472 will register one
> regulator 'avdd', one reset gpio and clock source for ov13b10.
> Add 2 power interfaces that are registered as runtime PM callbacks.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> Signed-off-by: Hao Yao <hao.yao@intel.com>
> Suggested-by: Hans de Goede <hdegoede@redhat.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
> 
> v2->v3:
>  - remove unnecessary 'reset' gpio NULL check
>  - use DEFINE_RUNTIME_DEV_PM_OPS() to simplify the PM ops
> v1->v2:
>  - use supply name 'avdd' instead of 'vcc'
>  - remove some unnecessary checks
>  - correct the power on error handling
> 
> ---
>  drivers/media/i2c/ov13b10.c | 120 +++++++++++++++++++++++++++++++++---
>  1 file changed, 110 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
> index 96d3bd6ab3bd..8ae335549413 100644
> --- a/drivers/media/i2c/ov13b10.c
> +++ b/drivers/media/i2c/ov13b10.c
> @@ -2,6 +2,9 @@
>  // Copyright (c) 2021 Intel Corporation.
>  
>  #include <linux/acpi.h>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
>  #include <linux/module.h>
>  #include <linux/pm_runtime.h>
> @@ -573,6 +576,11 @@ struct ov13b10 {
>  	struct media_pad pad;
>  
>  	struct v4l2_ctrl_handler ctrl_handler;
> +
> +	struct clk *img_clk;
> +	struct regulator *avdd;
> +	struct gpio_desc *reset;
> +
>  	/* V4L2 Controls */
>  	struct v4l2_ctrl *link_freq;
>  	struct v4l2_ctrl *pixel_rate;
> @@ -1051,6 +1059,49 @@ static int ov13b10_identify_module(struct ov13b10 *ov13b)
>  	return 0;
>  }
>  
> +static int ov13b10_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov13b10 *ov13b10 = to_ov13b10(sd);
> +
> +	gpiod_set_value_cansleep(ov13b10->reset, 1);
> +
> +	if (ov13b10->avdd)
> +		regulator_disable(ov13b10->avdd);
> +
> +	clk_disable_unprepare(ov13b10->img_clk);
> +
> +	return 0;
> +}
> +
> +static int ov13b10_power_on(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov13b10 *ov13b10 = to_ov13b10(sd);
> +	int ret;
> +
> +	ret = clk_prepare_enable(ov13b10->img_clk);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable imaging clock: %d", ret);
> +		return ret;
> +	}
> +
> +	if (ov13b10->avdd) {
> +		ret = regulator_enable(ov13b10->avdd);
> +		if (ret < 0) {
> +			dev_err(dev, "failed to enable avdd: %d", ret);
> +			clk_disable_unprepare(ov13b10->img_clk);
> +			return ret;
> +		}
> +	}
> +
> +	gpiod_set_value_cansleep(ov13b10->reset, 0);
> +	/* 5ms to wait ready after XSHUTDN assert */
> +	usleep_range(5000, 5500);
> +
> +	return 0;
> +}
> +
>  static int ov13b10_start_streaming(struct ov13b10 *ov13b)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(&ov13b->sd);
> @@ -1145,7 +1196,7 @@ static int ov13b10_set_stream(struct v4l2_subdev *sd, int enable)
>  	return ret;
>  }
>  
> -static int __maybe_unused ov13b10_suspend(struct device *dev)
> +static int ov13b10_suspend(struct device *dev)
>  {
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct ov13b10 *ov13b = to_ov13b10(sd);
> @@ -1153,26 +1204,35 @@ static int __maybe_unused ov13b10_suspend(struct device *dev)
>  	if (ov13b->streaming)
>  		ov13b10_stop_streaming(ov13b);
>  
> +	ov13b10_power_off(dev);
> +
>  	return 0;
>  }
>  
> -static int __maybe_unused ov13b10_resume(struct device *dev)
> +static int ov13b10_resume(struct device *dev)
>  {
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct ov13b10 *ov13b = to_ov13b10(sd);
>  	int ret;
>  
> +	ret = ov13b10_power_on(dev);
> +	if (ret)
> +		goto pm_fail;
> +
>  	if (ov13b->streaming) {
>  		ret = ov13b10_start_streaming(ov13b);
>  		if (ret)
> -			goto error;
> +			goto stop_streaming;
>  	}
>  
>  	return 0;
>  
> -error:
> +stop_streaming:
>  	ov13b10_stop_streaming(ov13b);
> +	ov13b10_power_off(dev);
> +pm_fail:
>  	ov13b->streaming = false;
> +
>  	return ret;
>  }
>  
> @@ -1317,6 +1377,34 @@ static void ov13b10_free_controls(struct ov13b10 *ov13b)
>  	mutex_destroy(&ov13b->mutex);
>  }
>  
> +static int ov13b10_get_pm_resources(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov13b10 *ov13b = to_ov13b10(sd);
> +	int ret;
> +
> +	ov13b->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(ov13b->reset))
> +		return dev_err_probe(dev, PTR_ERR(ov13b->reset),
> +				     "failed to get reset gpio\n");
> +
> +	ov13b->img_clk = devm_clk_get_optional(dev, NULL);
> +	if (IS_ERR(ov13b->img_clk))
> +		return dev_err_probe(dev, PTR_ERR(ov13b->img_clk),
> +				     "failed to get imaging clock\n");
> +
> +	ov13b->avdd = devm_regulator_get_optional(dev, "avdd");
> +	if (IS_ERR(ov13b->avdd)) {
> +		ret = PTR_ERR(ov13b->avdd);
> +		ov13b->avdd = NULL;
> +		if (ret != -ENODEV)
> +			return dev_err_probe(dev, ret,
> +					     "failed to get avdd regulator\n");
> +	}
> +
> +	return 0;
> +}
> +
>  static int ov13b10_check_hwcfg(struct device *dev)
>  {
>  	struct v4l2_fwnode_endpoint bus_cfg = {
> @@ -1407,13 +1495,23 @@ static int ov13b10_probe(struct i2c_client *client)
>  	/* Initialize subdev */
>  	v4l2_i2c_subdev_init(&ov13b->sd, client, &ov13b10_subdev_ops);
>  
> +	ret = ov13b10_get_pm_resources(&client->dev);
> +	if (ret)
> +		return ret;
> +
>  	full_power = acpi_dev_state_d0(&client->dev);
>  	if (full_power) {
> +		ov13b10_power_on(&client->dev);
> +		if (ret) {
> +			dev_err(&client->dev, "failed to power on\n");
> +			return ret;
> +		}
> +
>  		/* Check module identity */
>  		ret = ov13b10_identify_module(ov13b);
>  		if (ret) {
>  			dev_err(&client->dev, "failed to find sensor: %d\n", ret);
> -			return ret;
> +			goto error_power_off;
>  		}
>  	}
>  
> @@ -1422,7 +1520,7 @@ static int ov13b10_probe(struct i2c_client *client)
>  
>  	ret = ov13b10_init_controls(ov13b);
>  	if (ret)
> -		return ret;
> +		goto error_power_off;
>  
>  	/* Initialize subdev */
>  	ov13b->sd.internal_ops = &ov13b10_internal_ops;
> @@ -1462,6 +1560,9 @@ static int ov13b10_probe(struct i2c_client *client)
>  	ov13b10_free_controls(ov13b);
>  	dev_err(&client->dev, "%s failed:%d\n", __func__, ret);
>  
> +error_power_off:
> +	ov13b10_power_off(&client->dev);
> +
>  	return ret;
>  }
>  
> @@ -1477,9 +1578,8 @@ static void ov13b10_remove(struct i2c_client *client)
>  	pm_runtime_disable(&client->dev);
>  }
>  
> -static const struct dev_pm_ops ov13b10_pm_ops = {
> -	SET_SYSTEM_SLEEP_PM_OPS(ov13b10_suspend, ov13b10_resume)
> -};
> +static DEFINE_RUNTIME_DEV_PM_OPS(ov13b10_pm_ops, ov13b10_suspend,
> +				 ov13b10_resume, NULL);
>  
>  #ifdef CONFIG_ACPI
>  static const struct acpi_device_id ov13b10_acpi_ids[] = {
> @@ -1493,7 +1593,7 @@ MODULE_DEVICE_TABLE(acpi, ov13b10_acpi_ids);
>  static struct i2c_driver ov13b10_i2c_driver = {
>  	.driver = {
>  		.name = "ov13b10",
> -		.pm = &ov13b10_pm_ops,
> +		.pm = pm_ptr(&ov13b10_pm_ops),
>  		.acpi_match_table = ACPI_PTR(ov13b10_acpi_ids),
>  	},
>  	.probe_new = ov13b10_probe,

