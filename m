Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 088C27184EC
	for <lists+linux-media@lfdr.de>; Wed, 31 May 2023 16:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236468AbjEaO13 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 May 2023 10:27:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236413AbjEaO1Y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 May 2023 10:27:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60335E40
        for <linux-media@vger.kernel.org>; Wed, 31 May 2023 07:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685543178;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/PVdVafxWNkroa4UJnZyNytaIosDM3TtLFL6bbKLKuU=;
        b=bmucDJSyBBhBOmKOl1UgOIvHFVtSYZKepe6WQ+9HC8skjOHiH7gsL+Q6eY5HdPqxqHbf2D
        TK9gqAmDSBdGWjr9M1y0vfNoLKub6niJdk9NqGnhLv3AcG8uLGbv3UQE+PjXAmoMDDVzfg
        SOjflHwbfheC8z7lrVy9HH8BWBNoTpY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-C3xk1slvND-uKKE1soxXtQ-1; Wed, 31 May 2023 09:44:29 -0400
X-MC-Unique: C3xk1slvND-uKKE1soxXtQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-973c42bfc38so487358366b.0
        for <linux-media@vger.kernel.org>; Wed, 31 May 2023 06:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685540667; x=1688132667;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/PVdVafxWNkroa4UJnZyNytaIosDM3TtLFL6bbKLKuU=;
        b=Ivob3FOohyFSVoBtAMQEFb/243O3X6yn2oB4ba2jC6JkqbLFECELD4EmRZ5fJPKzmq
         iKwEW4lNuMGSMCWrFVmMn8C3rEhxEA9FGJs995vERX/0vNKrHkvc11CfBUrf0b34ksX+
         Yl7ceXGoFA9WGl943EugbqHQxJl9gT7New+jZ2Pu2Cyirs0fEnmIvilEagIG3DQ566mV
         BrZlPrefui9maBugVViaRuNZjb+oP7YDxYPCKgbxsuul4VZSdWD0jsB/RqSRdC3sC7Hz
         GzTqGFe1+SW5UKgLOkw4TW0Zi4G5ZaIYyZutbSmwT5LGGk2hb8+tWuE8PGTvmNFsVk5v
         G5Ow==
X-Gm-Message-State: AC+VfDxCksVTWr44kUU4NAGQIXAcFOEE/sJ3KQQO2Btqlv8l9ZOcA8Ti
        v+g/wTTeR7gBAgNGm7eo4CXLJu5gbCRfp7ZKe2fbLr71lSlU1C2YK4Z0h3ENVP+N4szDngOJsnm
        MS8GzXpsctVXGDfU7+XPgOQOeJ/gXC9U=
X-Received: by 2002:a17:907:6d86:b0:94e:dd30:54b5 with SMTP id sb6-20020a1709076d8600b0094edd3054b5mr6009526ejc.6.1685540667641;
        Wed, 31 May 2023 06:44:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7kboNi0pLtBCYVbR+O6QHnURrl3E0ALsxZphQm5B5a/DP8LjhzMsQEaIQQhHjRf74vK/mK3w==
X-Received: by 2002:a17:907:6d86:b0:94e:dd30:54b5 with SMTP id sb6-20020a1709076d8600b0094edd3054b5mr6009508ejc.6.1685540667258;
        Wed, 31 May 2023 06:44:27 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id v24-20020a170906b01800b0096f6e2f4d9esm8923067ejy.83.2023.05.31.06.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 06:44:26 -0700 (PDT)
Message-ID: <6baeafb2-29bf-ab70-2e4e-eea55d6af440@redhat.com>
Date:   Wed, 31 May 2023 15:44:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/3] platform/x86: int3472: Evaluate device's _DSM method
 to control imaging clock
To:     bingbu.cao@intel.com, djrscally@gmail.com,
        dan.scally@ideasonboard.com, hao.yao@intel.com
Cc:     markgross@kernel.org, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        bingbu.cao@linux.intel.com
References: <20230524035135.90315-1-bingbu.cao@intel.com>
 <20230524035135.90315-2-bingbu.cao@intel.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230524035135.90315-2-bingbu.cao@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 5/24/23 05:51, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> On some platforms, the imaging clock should be controlled by evaluating
> specific clock device's _DSM method instead of setting gpio, so this
> change register clock if no gpio based clock and then use the _DSM method
> to enable and disable clock.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> Signed-off-by: Hao Yao <hao.yao@intel.com>

Thank you for this interesting patch.

Besides Andy's comments I believe that this also needs an acpi_check_dsm() call
to see if the DSM functionality is available and the call of the new clk
register function should be error checked.

Since I was curious about this and wanted to test it myself (on a Thinkpad
X1 Yoga Gen 7) I have prepared a v2 addressing all of the above, quoting
from the changelog:

Changes in v2 (Hans de Goede):
- Minor comment / code changes (address Andy's review remarks)
- Add a acpi_check_dsm() call
- Return 0 instead of error if we already have a GPIO clk or if
  acpi_check_dsm() fails
- Rename skl_int3472_register_clock() -> skl_int3472_register_gpio_clock()
  and name the new function: skl_int3472_register_dsm_clock()
- Move the skl_int3472_register_dsm_clock() call to after
  acpi_dev_free_resource_list() and add error checking for it

I'll send out the v2 right after this email. Please give v2 a try
and let me know if it works for you.

Regards,

Hans




> ---
>  .../x86/intel/int3472/clk_and_regulator.c     | 81 ++++++++++++++++++-
>  drivers/platform/x86/intel/int3472/common.h   |  6 +-
>  drivers/platform/x86/intel/int3472/discrete.c |  4 +
>  3 files changed, 88 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> index d1088be5af78..f0a1d2ef137b 100644
> --- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> +++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
> @@ -11,6 +11,32 @@
>  
>  #include "common.h"
>  
> +static const guid_t img_clk_guid =
> +	GUID_INIT(0x82c0d13a, 0x78c5, 0x4244,
> +		  0x9b, 0xb1, 0xeb, 0x8b, 0x53, 0x9a, 0x8d, 0x11);
> +
> +static void skl_int3472_enable_clk_acpi_method(struct int3472_gpio_clock *clk,
> +					       bool enable)
> +{
> +	struct int3472_discrete_device *int3472 = to_int3472_device(clk);
> +	union acpi_object args[3];
> +	union acpi_object argv4;
> +
> +	args[0].integer.type = ACPI_TYPE_INTEGER;
> +	args[0].integer.value = clk->imgclk_index;
> +	args[1].integer.type = ACPI_TYPE_INTEGER;
> +	args[1].integer.value = enable ? 1 : 0;
> +	args[2].integer.type = ACPI_TYPE_INTEGER;
> +	args[2].integer.value = 1;
> +
> +	argv4.type = ACPI_TYPE_PACKAGE;
> +	argv4.package.count = 3;
> +	argv4.package.elements = args;
> +
> +	acpi_evaluate_dsm(acpi_device_handle(int3472->adev), &img_clk_guid,
> +			  0, 1, &argv4);
> +}
> +
>  /*
>   * The regulators have to have .ops to be valid, but the only ops we actually
>   * support are .enable and .disable which are handled via .ena_gpiod. Pass an
> @@ -22,7 +48,11 @@ static int skl_int3472_clk_prepare(struct clk_hw *hw)
>  {
>  	struct int3472_gpio_clock *clk = to_int3472_clk(hw);
>  
> -	gpiod_set_value_cansleep(clk->ena_gpio, 1);
> +	if (clk->ena_gpio)
> +		gpiod_set_value_cansleep(clk->ena_gpio, 1);
> +	else
> +		skl_int3472_enable_clk_acpi_method(clk, 1);
> +
>  	return 0;
>  }
>  
> @@ -30,7 +60,10 @@ static void skl_int3472_clk_unprepare(struct clk_hw *hw)
>  {
>  	struct int3472_gpio_clock *clk = to_int3472_clk(hw);
>  
> -	gpiod_set_value_cansleep(clk->ena_gpio, 0);
> +	if (clk->ena_gpio)
> +		gpiod_set_value_cansleep(clk->ena_gpio, 0);
> +	else
> +		skl_int3472_enable_clk_acpi_method(clk, 0);
>  }
>  
>  static int skl_int3472_clk_enable(struct clk_hw *hw)
> @@ -86,6 +119,50 @@ static const struct clk_ops skl_int3472_clock_ops = {
>  	.recalc_rate = skl_int3472_clk_recalc_rate,
>  };
>  
> +int skl_int3472_register_clock_src(struct int3472_discrete_device *int3472)
> +{
> +	struct clk_init_data init = {
> +		.ops = &skl_int3472_clock_ops,
> +		.flags = CLK_GET_RATE_NOCACHE,
> +	};
> +	int ret;
> +
> +	if (int3472->clock.cl)
> +		return -EBUSY;
> +
> +	init.name = kasprintf(GFP_KERNEL, "%s-clk",
> +			      acpi_dev_name(int3472->adev));
> +	if (!init.name)
> +		return -ENOMEM;
> +
> +	int3472->clock.frequency = skl_int3472_get_clk_frequency(int3472);
> +	int3472->clock.clk_hw.init = &init;
> +	int3472->clock.clk = clk_register(&int3472->adev->dev,
> +					  &int3472->clock.clk_hw);
> +	if (IS_ERR(int3472->clock.clk)) {
> +		ret = PTR_ERR(int3472->clock.clk);
> +		goto out_free_init_name;
> +	}
> +
> +	int3472->clock.cl = clkdev_create(int3472->clock.clk, NULL,
> +					  int3472->sensor_name);
> +	if (!int3472->clock.cl) {
> +		ret = -ENOMEM;
> +		goto err_unregister_clk;
> +	}
> +
> +	kfree(init.name);
> +
> +	return 0;
> +
> +err_unregister_clk:
> +	clk_unregister(int3472->clock.clk);
> +out_free_init_name:
> +	kfree(init.name);
> +
> +	return ret;
> +}
> +
>  int skl_int3472_register_clock(struct int3472_discrete_device *int3472,
>  			       struct acpi_resource_gpio *agpio, u32 polarity)
>  {
> diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
> index 61688e450ce5..036b804e8ea5 100644
> --- a/drivers/platform/x86/intel/int3472/common.h
> +++ b/drivers/platform/x86/intel/int3472/common.h
> @@ -64,7 +64,9 @@ struct int3472_cldb {
>  	u8 control_logic_type;
>  	u8 control_logic_id;
>  	u8 sensor_card_sku;
> -	u8 reserved[28];
> +	u8 reserved[10];
> +	u8 clock_source;
> +	u8 reserved2[17];
>  };
>  
>  struct int3472_gpio_function_remap {
> @@ -100,6 +102,7 @@ struct int3472_discrete_device {
>  		struct clk_lookup *cl;
>  		struct gpio_desc *ena_gpio;
>  		u32 frequency;
> +		u8 imgclk_index;
>  	} clock;
>  
>  	struct int3472_pled {
> @@ -123,6 +126,7 @@ int skl_int3472_get_sensor_adev_and_name(struct device *dev,
>  
>  int skl_int3472_register_clock(struct int3472_discrete_device *int3472,
>  			       struct acpi_resource_gpio *agpio, u32 polarity);
> +int skl_int3472_register_clock_src(struct int3472_discrete_device *int3472);
>  void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472);
>  
>  int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index ef020e23e596..d5d5c650d6d2 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -309,6 +309,9 @@ static int skl_int3472_parse_crs(struct int3472_discrete_device *int3472)
>  	if (ret < 0)
>  		return ret;
>  
> +	/* If no gpio based clk registered, try register with clock source */
> +	skl_int3472_register_clock_src(int3472);
> +
>  	acpi_dev_free_resource_list(&resource_list);
>  
>  	int3472->gpios.dev_id = int3472->sensor_name;
> @@ -356,6 +359,7 @@ static int skl_int3472_discrete_probe(struct platform_device *pdev)
>  	int3472->adev = adev;
>  	int3472->dev = &pdev->dev;
>  	platform_set_drvdata(pdev, int3472);
> +	int3472->clock.imgclk_index = cldb.clock_source;
>  
>  	ret = skl_int3472_get_sensor_adev_and_name(&pdev->dev, &int3472->sensor,
>  						   &int3472->sensor_name);

