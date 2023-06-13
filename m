Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACEDF72DD98
	for <lists+linux-media@lfdr.de>; Tue, 13 Jun 2023 11:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239322AbjFMJZt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jun 2023 05:25:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242015AbjFMJZa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jun 2023 05:25:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A6231A7
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 02:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686648282;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MfXy0G+7JeXjUgf9ODp0ImkAau8+7NBIGMG/sT0ClJs=;
        b=HrIqfaQbkvYKQPVmzuF/gopVvyEvKQ6OxA+MmCvyCLf2ZjSFqr3wua6ZRDdk88RDJqPc+b
        I2xq88O0PO0rg5kjlmz0Oq5C/cZjCfhysjkPM5jc08EvEgJ70rGigNa4DMgV+4WjRUEgJ+
        UEE77UPv/hnE4tJ4/PbAH1F2b7zML2o=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-SoRZnAQPM1epzhbZ3zuLvg-1; Tue, 13 Jun 2023 05:24:38 -0400
X-MC-Unique: SoRZnAQPM1epzhbZ3zuLvg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-97888a89775so484244466b.0
        for <linux-media@vger.kernel.org>; Tue, 13 Jun 2023 02:24:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686648277; x=1689240277;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MfXy0G+7JeXjUgf9ODp0ImkAau8+7NBIGMG/sT0ClJs=;
        b=VEMGc/gKfceneMh/sw/0RDi0k5IFMjVhkcIKwydkUm80H/oO4p4kB1ZQow0YuaSBFC
         xHGo5KOlKZcfTDrWhelY6cI9OFzQgvHfb8d6xG52BoJJ7atdfP/6/Jh5IDEBv283wTfL
         jSYA5qa1WLZ9xwy6cw9dEi6DZCcrEtx4mYzhPDrOCJzHoR5SoX/dpCvWmjHuRwrZti72
         JiWQX7wnmOHg2r23Yk7GL9HkWgHie8Hc71pWqnz8buB2nRVjmTJy63KGGkhu+egt48aq
         fD1+IUhWwR919QKyJIgXyvS6FW4pXR9wAWNaFvMtmfWT/0qJzWrvMwMB2QNlNbbbFhoK
         A2bw==
X-Gm-Message-State: AC+VfDyNZzpwlj7uRpP+6EgdleXvDTGBAsZtNMUGbMxtQIFrq2cCyCvT
        sFzl6awJgaM3oc1PzmTW7uBMFqqLQmG61TauuUU/82gU/BMtMymr9E+dgGNWLtoRWco9mxvxwJf
        db4QBZV7H8Pk+t8D9zhMvbyE=
X-Received: by 2002:a17:907:9445:b0:982:227e:1a15 with SMTP id dl5-20020a170907944500b00982227e1a15mr3695535ejc.2.1686648277303;
        Tue, 13 Jun 2023 02:24:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5avGRSkluYVbJpn8JMmJ8hpTkxM3ELr1jFUYdSV72UT2KT9wwJZXsKuOikQ8wt4Ghw4ws+9A==
X-Received: by 2002:a17:907:9445:b0:982:227e:1a15 with SMTP id dl5-20020a170907944500b00982227e1a15mr3695517ejc.2.1686648276937;
        Tue, 13 Jun 2023 02:24:36 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g19-20020a170906395300b00977cd6d2127sm6329561eje.6.2023.06.13.02.24.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 02:24:36 -0700 (PDT)
Message-ID: <efd92734-b712-8aba-2f50-2c13f0b9cd46@redhat.com>
Date:   Tue, 13 Jun 2023 11:24:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] media: ov13b10: add PM control support based on power
 resources
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
To:     bingbu.cao@intel.com, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, dan.scally@ideasonboard.com,
        arec.kao@intel.com, hao.yao@intel.com
Cc:     bingbu.cao@linux.intel.com
References: <20230613050520.1580151-1-bingbu.cao@intel.com>
 <f0ec32a3-89fc-b61c-db99-b0c0440c9211@redhat.com>
In-Reply-To: <f0ec32a3-89fc-b61c-db99-b0c0440c9211@redhat.com>
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

Hi again,

On 6/13/23 11:20, Hans de Goede wrote:
> Hi,
> 
> Thank you for the patch.
> 
> On 6/13/23 07:05, bingbu.cao@intel.com wrote:
>> From: Bingbu Cao <bingbu.cao@intel.com>
>>
>> On ACPI based platforms, the ov13b10 camera sensor need to be powered
>> up by acquire the PM resource from INT3472. INT3472 will register one
>> regulator 'avdd', one reset gpio and clock source for ov13b10.
>> Add 2 power interfaces that are registered as runtime PM callbacks.
>>
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>> Signed-off-by: Hao Yao <hao.yao@intel.com>
>> ---
>>  drivers/media/i2c/ov13b10.c | 100 +++++++++++++++++++++++++++++++++++-
>>  1 file changed, 98 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
>> index 96d3bd6ab3bd..be2c7d8c83ac 100644
>> --- a/drivers/media/i2c/ov13b10.c
>> +++ b/drivers/media/i2c/ov13b10.c
>> @@ -2,6 +2,9 @@
>>  // Copyright (c) 2021 Intel Corporation.
>>  
>>  #include <linux/acpi.h>
>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/gpio/consumer.h>
>>  #include <linux/i2c.h>
>>  #include <linux/module.h>
>>  #include <linux/pm_runtime.h>
>> @@ -573,6 +576,11 @@ struct ov13b10 {
>>  	struct media_pad pad;
>>  
>>  	struct v4l2_ctrl_handler ctrl_handler;
>> +
>> +	struct clk *img_clk;
>> +	struct regulator *avdd;
>> +	struct gpio_desc *reset;
>> +
>>  	/* V4L2 Controls */
>>  	struct v4l2_ctrl *link_freq;
>>  	struct v4l2_ctrl *pixel_rate;
>> @@ -1051,6 +1059,52 @@ static int ov13b10_identify_module(struct ov13b10 *ov13b)
>>  	return 0;
>>  }
>>  
>> +static int ov13b10_power_off(struct device *dev)
>> +{
>> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>> +	struct ov13b10 *ov13b10 = to_ov13b10(sd);
>> +
>> +	if (ov13b10->reset)
>> +		gpiod_set_value_cansleep(ov13b10->reset, 1);
> 
> Just like the clk APIs the gpiod APIs will happily take a NULL
> pointer, so the "if (ov13b10->reset)" can be dropped
> here and also in ov13b10_power_on().
> 
> 
>> +	if (ov13b10->avdd)
>> +		regulator_disable(ov13b10->avdd);
>> +
>> +	clk_disable_unprepare(ov13b10->img_clk);
>> +
>> +	return 0;
>> +}
>> +
>> +static int ov13b10_power_on(struct device *dev)
>> +{
>> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>> +	struct ov13b10 *ov13b10 = to_ov13b10(sd);
>> +	int ret;
>> +
>> +	ret = clk_prepare_enable(ov13b10->img_clk);
>> +	if (ret < 0) {
>> +		dev_err(dev, "failed to enable imaging clock: %d", ret);
>> +		return ret;
>> +	}
>> +
>> +	if (ov13b10->avdd) {
>> +		ret = regulator_enable(ov13b10->avdd);
>> +		if (ret < 0) {
>> +			dev_err(dev, "failed to enable avdd: %d", ret);
>> +			clk_disable_unprepare(ov13b10->img_clk);
>> +			return ret;
>> +		}
>> +	}
>> +
>> +	if (ov13b10->reset) {
>> +		gpiod_set_value_cansleep(ov13b10->reset, 0);
>> +		/* 5ms to wait ready after XSHUTDN assert */
>> +		usleep_range(5000, 5500);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  static int ov13b10_start_streaming(struct ov13b10 *ov13b)
>>  {
>>  	struct i2c_client *client = v4l2_get_subdevdata(&ov13b->sd);
>> @@ -1317,6 +1371,34 @@ static void ov13b10_free_controls(struct ov13b10 *ov13b)
>>  	mutex_destroy(&ov13b->mutex);
>>  }
>>  
>> +static int ov13b10_get_pm_resources(struct device *dev)
>> +{
>> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>> +	struct ov13b10 *ov13b = to_ov13b10(sd);
>> +	int ret;
>> +
>> +	ov13b->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
>> +	if (IS_ERR(ov13b->reset))
>> +		return dev_err_probe(dev, PTR_ERR(ov13b->reset),
>> +				     "failed to get reset gpio\n");
>> +
>> +	ov13b->img_clk = devm_clk_get_optional(dev, NULL);
>> +	if (IS_ERR(ov13b->img_clk))
>> +		return dev_err_probe(dev, PTR_ERR(ov13b->img_clk),
>> +				     "failed to get imaging clock\n");
>> +
>> +	ov13b->avdd = devm_regulator_get_optional(dev, "avdd");
>> +	if (IS_ERR(ov13b->avdd)) {
>> +		ret = PTR_ERR(ov13b->avdd);
>> +		ov13b->avdd = NULL;
>> +		if (ret != -ENODEV)
>> +			return dev_err_probe(dev, ret,
>> +					     "failed to get avdd regulator\n");
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  static int ov13b10_check_hwcfg(struct device *dev)
>>  {
>>  	struct v4l2_fwnode_endpoint bus_cfg = {
>> @@ -1407,13 +1489,23 @@ static int ov13b10_probe(struct i2c_client *client)
>>  	/* Initialize subdev */
>>  	v4l2_i2c_subdev_init(&ov13b->sd, client, &ov13b10_subdev_ops);
>>  
>> +	ret = ov13b10_get_pm_resources(&client->dev);
>> +	if (ret)
>> +		return ret;
>> +
>>  	full_power = acpi_dev_state_d0(&client->dev);
>>  	if (full_power) {
>> +		ov13b10_power_on(&client->dev);
>> +		if (ret) {
>> +			dev_err(&client->dev, "failed to power on\n");
>> +			return ret;
>> +		}
>> +
>>  		/* Check module identity */
>>  		ret = ov13b10_identify_module(ov13b);
>>  		if (ret) {
>>  			dev_err(&client->dev, "failed to find sensor: %d\n", ret);
>> -			return ret;
>> +			goto error_power_off;
>>  		}
>>  	}
>>  
>> @@ -1422,7 +1514,7 @@ static int ov13b10_probe(struct i2c_client *client)
>>  
>>  	ret = ov13b10_init_controls(ov13b);
>>  	if (ret)
>> -		return ret;
>> +		goto error_power_off;
>>  
>>  	/* Initialize subdev */
>>  	ov13b->sd.internal_ops = &ov13b10_internal_ops;
>> @@ -1462,6 +1554,9 @@ static int ov13b10_probe(struct i2c_client *client)
>>  	ov13b10_free_controls(ov13b);
>>  	dev_err(&client->dev, "%s failed:%d\n", __func__, ret);
>>  
>> +error_power_off:
>> +	ov13b10_power_off(&client->dev);
>> +
>>  	return ret;
>>  }
>>  
>> @@ -1479,6 +1574,7 @@ static void ov13b10_remove(struct i2c_client *client)
>>  
>>  static const struct dev_pm_ops ov13b10_pm_ops = {
>>  	SET_SYSTEM_SLEEP_PM_OPS(ov13b10_suspend, ov13b10_resume)
>> +	SET_RUNTIME_PM_OPS(ov13b10_power_off, ov13b10_power_on, NULL)
> 
> You also need to add ov13b10_power_off / ov13b10_power_on calls
> to ov13b10_suspend and ov13b10_resume so that the sensor gets
> properly powered-off if it was not already runtime-suspend during
> system suspend.

Or you can simply use a single set of suspend/resume ops for both
system and runtime suspend, since is_streaming will always be
false during runtime suspend, e.g. :

static int ov2680_suspend(struct device *dev)
{
	struct v4l2_subdev *sd = dev_get_drvdata(dev);
	struct ov2680_dev *sensor = to_ov2680_dev(sd);

	if (sensor->is_streaming)
		ov2680_stream_disable(sensor);

	return ov2680_power_off(sensor);
}

static int ov2680_resume(struct device *dev)
{
	struct v4l2_subdev *sd = dev_get_drvdata(dev);
	struct ov2680_dev *sensor = to_ov2680_dev(sd);
	int ret;

	ret = ov2680_power_on(sensor);
	if (ret < 0)
		goto stream_disable;

	if (sensor->is_streaming) {
		ret = ov2680_stream_enable(sensor);
		if (ret < 0)
			goto stream_disable;
	}

	return 0;

stream_disable:
	ov2680_stream_disable(sensor);
	sensor->is_streaming = false;

	return ret;
}

static DEFINE_RUNTIME_DEV_PM_OPS(ov2680_pm_ops, ov2680_suspend, ov2680_resume, NULL);

static struct i2c_driver ov2680_i2c_driver = {
        .driver = {
                .pm = pm_sleep_ptr(&ov2680_pm_ops),
...

and by switching to the new DEFINE_RUNTIME_DEV_PM_OPS() helper you can also drop
the __maybe_unused from ov13b10_resume() and ov13b10_suspend().

Regards,
 
Hans

