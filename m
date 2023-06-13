Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF2CE72DD90
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 11:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239334AbjFMJVl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 05:21:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239051AbjFMJVj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 05:21:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98318127
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 02:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686648053;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YmK0GHgLCIWBNvBrh03R2l/9GiB0ixM5ROIAWRDRw3g=;
        b=b+xfHGr10NpdARxBtTGvlywGMrBlZE13t9oeevv/Xrs6rXFVg/yKVkbPu3xatZ16mIDHIa
        chdxMVZapphdA424fU25BxGPot53BZD1MsVqnRUEh+qh1ZM9rZeWFVWBvrnV71QXfDzKSV
        kUVnqM6/1bqV4zEe/NQMZ13cenXvqXg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-7nId5yvQOx2JC_0DfCJ5ZA-1; Tue, 13 Jun 2023 05:20:52 -0400
X-MC-Unique: 7nId5yvQOx2JC_0DfCJ5ZA-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5142da822cbso5253832a12.2
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 02:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686648051; x=1689240051;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YmK0GHgLCIWBNvBrh03R2l/9GiB0ixM5ROIAWRDRw3g=;
        b=Ee2GrS21zCoT3i7dD0D7/kWa4gkqQtZW/ucuFtkFsXF1bvKwp8iu/XDFXhBi3gRRIx
         Ks79wEx4L55ET2+CHWg/MpoM32QDW8HNkyiCN4qMMz2xOqTjE0FD1L65dSBoizF4BOPl
         mDlmgNNvwKFmUM4zeTqsJZoorGjbBiLL8oI2bd5vcxI6IYRkG9WDL/pHprbR79PKIMQ7
         w8xNIpP3oy9OtoOBFq1rdEwvrBObGRSdGFaGg3csOwY4gsomBIwvSOYPke2eRvjUEA53
         4sO+qQhfXZ3Var8gUyAiaL1DLsh5iXqHTrprh525GYtGqQni4TpnDcjRoaS0BcSKxAuY
         rLQA==
X-Gm-Message-State: AC+VfDyJgsIOu8IX2wUUFIweThLhpAQ/qUPan2K/556zMGAVFcB/tr7W
        paBvK3ATOQJCrL3cVb4f/BrNeBEUQ2nFaIEfvIj0WhAaL2igCWES4rvrnQx7wYgU+Rn2ufJDQBB
        d2rWk5bZMkLDFKKIXbmyU28JCRUW21is=
X-Received: by 2002:a17:907:a427:b0:94a:9f9a:b3c4 with SMTP id sg39-20020a170907a42700b0094a9f9ab3c4mr13684556ejc.49.1686648051283;
        Tue, 13 Jun 2023 02:20:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7ssrjfpavhYvGBhimgQS19otejleaOXJcbir60qpw9dDRj0F4mm2koWN9t2ojQjX8YqGKPaA==
X-Received: by 2002:a17:907:a427:b0:94a:9f9a:b3c4 with SMTP id sg39-20020a170907a42700b0094a9f9ab3c4mr13684544ejc.49.1686648050905;
        Tue, 13 Jun 2023 02:20:50 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g24-20020a1709063b1800b0096f6a131b9fsm6418422ejf.23.2023.06.13.02.20.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 02:20:49 -0700 (PDT)
Message-ID: <f0ec32a3-89fc-b61c-db99-b0c0440c9211@redhat.com>
Date:   Tue, 13 Jun 2023 11:20:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] media: ov13b10: add PM control support based on power
 resources
Content-Language: en-US, nl
To:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, dan.scally@ideasonboard.com,
        arec.kao@intel.com, hao.yao@intel.com
Cc:     bingbu.cao@linux.intel.com
References: <20230613050520.1580151-1-bingbu.cao@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230613050520.1580151-1-bingbu.cao@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Thank you for the patch.

On 6/13/23 07:05, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> On ACPI based platforms, the ov13b10 camera sensor need to be powered
> up by acquire the PM resource from INT3472. INT3472 will register one
> regulator 'avdd', one reset gpio and clock source for ov13b10.
> Add 2 power interfaces that are registered as runtime PM callbacks.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> Signed-off-by: Hao Yao <hao.yao@intel.com>
> ---
>  drivers/media/i2c/ov13b10.c | 100 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 98 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
> index 96d3bd6ab3bd..be2c7d8c83ac 100644
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
> @@ -1051,6 +1059,52 @@ static int ov13b10_identify_module(struct ov13b10 *ov13b)
>  	return 0;
>  }
>  
> +static int ov13b10_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ov13b10 *ov13b10 = to_ov13b10(sd);
> +
> +	if (ov13b10->reset)
> +		gpiod_set_value_cansleep(ov13b10->reset, 1);

Just like the clk APIs the gpiod APIs will happily take a NULL
pointer, so the "if (ov13b10->reset)" can be dropped
here and also in ov13b10_power_on().


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
> +	if (ov13b10->reset) {
> +		gpiod_set_value_cansleep(ov13b10->reset, 0);
> +		/* 5ms to wait ready after XSHUTDN assert */
> +		usleep_range(5000, 5500);
> +	}
> +
> +	return 0;
> +}
> +
>  static int ov13b10_start_streaming(struct ov13b10 *ov13b)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(&ov13b->sd);
> @@ -1317,6 +1371,34 @@ static void ov13b10_free_controls(struct ov13b10 *ov13b)
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
> @@ -1407,13 +1489,23 @@ static int ov13b10_probe(struct i2c_client *client)
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
> @@ -1422,7 +1514,7 @@ static int ov13b10_probe(struct i2c_client *client)
>  
>  	ret = ov13b10_init_controls(ov13b);
>  	if (ret)
> -		return ret;
> +		goto error_power_off;
>  
>  	/* Initialize subdev */
>  	ov13b->sd.internal_ops = &ov13b10_internal_ops;
> @@ -1462,6 +1554,9 @@ static int ov13b10_probe(struct i2c_client *client)
>  	ov13b10_free_controls(ov13b);
>  	dev_err(&client->dev, "%s failed:%d\n", __func__, ret);
>  
> +error_power_off:
> +	ov13b10_power_off(&client->dev);
> +
>  	return ret;
>  }
>  
> @@ -1479,6 +1574,7 @@ static void ov13b10_remove(struct i2c_client *client)
>  
>  static const struct dev_pm_ops ov13b10_pm_ops = {
>  	SET_SYSTEM_SLEEP_PM_OPS(ov13b10_suspend, ov13b10_resume)
> +	SET_RUNTIME_PM_OPS(ov13b10_power_off, ov13b10_power_on, NULL)

You also need to add ov13b10_power_off / ov13b10_power_on calls
to ov13b10_suspend and ov13b10_resume so that the sensor gets
properly powered-off if it was not already runtime-suspend during
system suspend.

Regards,

Hans




>  };
>  
>  #ifdef CONFIG_ACPI

