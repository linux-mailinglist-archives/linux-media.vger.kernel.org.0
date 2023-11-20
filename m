Return-Path: <linux-media+bounces-581-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3407F0B38
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 05:11:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20A5A1C208CF
	for <lists+linux-media@lfdr.de>; Mon, 20 Nov 2023 04:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C05ED23A3;
	Mon, 20 Nov 2023 04:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjoCaj8I"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 643A5D8
	for <linux-media@vger.kernel.org>; Sun, 19 Nov 2023 20:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700453454; x=1731989454;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=zLusi+iNvjoqLGDLPF/iEg+j+pHLe2cqpwHrQw10Q+8=;
  b=hjoCaj8It8Jnl1bGsgmdQJpFFe/QhSlNTjulpLZ7mOYdAEocQFr9Kabj
   hdVzI8lo0Dt+XnUc0jGNfS/d9v8yT5WbV/yKo+Gb+1CG8O6UrOQDR2zoo
   fNZZ6rBTotGQvEjPLZDVshnMbc6V/2TFBWmhDqVQwM3G9qm4jSMGSmOFm
   +JOmRifAPzpscCcTzv9XzLuI1YoNhjjvSYli8ByK9/xeQu2HNKJECd7g/
   MUNWCkJv19jHk20zkUhTlxbnKt2gx2rV2YftIY8pQOSBfy7rsIyJLPpbV
   0OEs6Xibv3nUHjFGWLa4QutyAyy/hwBiI5tAYcUWyFMAcJRVotZVQbKwF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="381936155"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="381936155"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 20:10:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="716101449"
X-IronPort-AV: E=Sophos;i="6.04,212,1695711600"; 
   d="scan'208";a="716101449"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by orsmga003.jf.intel.com with ESMTP; 19 Nov 2023 20:10:51 -0800
Subject: Re: [PATCH 2/2] media: ov2740: Add support for external clock
To: Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, Bingbu Cao <bingbu.cao@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 linux-media@vger.kernel.org
References: <20231115123817.196252-1-hdegoede@redhat.com>
 <20231115123817.196252-3-hdegoede@redhat.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <229e4b91-8ce4-b82f-1a18-b23de36d5da7@linux.intel.com>
Date: Mon, 20 Nov 2023 12:06:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231115123817.196252-3-hdegoede@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit


Hans,

On 11/15/23 8:38 PM, Hans de Goede wrote:
> On some ACPI platforms, such as Chromebooks the ACPI methods to
> change the power-state (_PS0 and _PS3) fully take care of powering
> on/off the sensor.
> 
> On other ACPI platforms, such as e.g. various ThinkPad models with
> IPU6 + ov2740 sensor, the sensor driver must control the reset GPIO
> and the sensor's clock itself.
> 
> Add support for having the driver control an optional clock.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/i2c/ov2740.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index e5f9569a229d..0a87d0920eb8 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -3,6 +3,7 @@
>  
>  #include <asm/unaligned.h>
>  #include <linux/acpi.h>
> +#include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
> @@ -336,6 +337,7 @@ struct ov2740 {
>  
>  	/* GPIOs, clocks */
>  	struct gpio_desc *reset_gpio;
> +	struct clk *clk;
>  
>  	/* Current mode */
>  	const struct ov2740_mode *cur_mode;
> @@ -1068,6 +1070,7 @@ static int ov2740_suspend(struct device *dev)
>  	struct ov2740 *ov2740 = to_ov2740(sd);
>  
>  	gpiod_set_value_cansleep(ov2740->reset_gpio, 1);
> +	clk_disable_unprepare(ov2740->clk);
>  	return 0;
>  }
>  
> @@ -1075,6 +1078,11 @@ static int ov2740_resume(struct device *dev)
>  {
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct ov2740 *ov2740 = to_ov2740(sd);
> +	int ret;
> +
> +	ret = clk_prepare_enable(ov2740->clk);
> +	if (ret)
> +		return ret;
>  
>  	gpiod_set_value_cansleep(ov2740->reset_gpio, 0);
>  	msleep(20);
> @@ -1102,6 +1110,10 @@ static int ov2740_probe(struct i2c_client *client)
>  		return dev_err_probe(dev, PTR_ERR(ov2740->reset_gpio),
>  				     "failed to get reset GPIO\n");
>  
> +	ov2740->clk = devm_clk_get_optional(dev, "clk");
> +	if (IS_ERR(ov2740->clk))
> +		return dev_err_probe(dev, PTR_ERR(ov2740->clk), "failed to get clock\n");
> +

I am not very sure that the 80-char rule is still valid for checkpatch.pl.


>  	v4l2_i2c_subdev_init(&ov2740->sd, client, &ov2740_subdev_ops);
>  	full_power = acpi_dev_state_d0(&client->dev);
>  	if (full_power) {
>

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

-- 
Best regards,
Bingbu Cao

