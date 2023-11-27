Return-Path: <linux-media+bounces-1065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B24D27F9831
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 05:20:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09547B20AA8
	for <lists+linux-media@lfdr.de>; Mon, 27 Nov 2023 04:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E465382;
	Mon, 27 Nov 2023 04:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RtY9jo71"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEC1BF0
	for <linux-media@vger.kernel.org>; Sun, 26 Nov 2023 20:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701058797; x=1732594797;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=sZHh++W9MKcahXq5iwf7eRvzKprihcWAfY8NBo+lgcA=;
  b=RtY9jo71tc27WYFcujkFKVThaa3IQNMX12R2yA9tHek2P0SIwv18zEZx
   1Nyle+OnKtKAhvWiYPbfFxgyjTwzFhhp4JOuxRfRjyPRyzS6blDX1u8Mq
   zKXHKATl/WFVbTzxFQsm+c190tQNpJrKjAqq8x/y8Rp+aHbQnIitkanPL
   YDSwR1qx3IujCgqujrwJM/EjWsjfmK7cOtD+xy6xucDOQuKMKvZSohTif
   R4BAql+IWbOTJ72bIrbKdcmpOY2l9WP7aymcIauJe02QXkzHXkBz3XbQx
   IRMDARLwhTFwu/fIm4iKql5shGzN9xIk6gND1JUll5GDzhZPjkXD9NEM8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="478823000"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="478823000"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 20:19:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="16482770"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by fmviesa001.fm.intel.com with ESMTP; 26 Nov 2023 20:19:55 -0800
Subject: Re: [PATCH v2 8/9] media: ov2740: Add a sleep after resetting the
 sensor
To: Hans de Goede <hdegoede@redhat.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>, Bingbu Cao <bingbu.cao@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 linux-media@vger.kernel.org, "Yao, Hao" <hao.yao@intel.com>
References: <20231126141517.7534-1-hdegoede@redhat.com>
 <20231126141517.7534-9-hdegoede@redhat.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <493daf1a-373d-ed48-8136-0aab3ab925f4@linux.intel.com>
Date: Mon, 27 Nov 2023 12:15:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231126141517.7534-9-hdegoede@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit


Hans,

On 11/26/23 10:15 PM, Hans de Goede wrote:
> Split the resetting of the sensor out of the link_freq_config reg_list
> and add a delay after this.
> 
> This hopefully fixes the stream sometimes not starting, this was
> taken from the ov2740 sensor driver in the out of tree IPU6 driver:

Thanks for your patch.

I don't know the details for ov2740 here, we met some similar issues
with another OminiVision camera sensor, it is somehow related to the
OTP read. Unfortunately, we didn't find the root-cause.

Maybe you can remove the OTP read to check, I think the OTP is useless
if I don't forget anything.

Hao, do you have any details for this issue?

> 
> https://github.com/intel/ipu6-drivers/
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/media/i2c/ov2740.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 8f5c33f68d42..a49c065c6cf4 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -128,7 +128,6 @@ struct ov2740_mode {
>  };
>  
>  static const struct ov2740_reg mipi_data_rate_720mbps[] = {
> -	{0x0103, 0x01},
>  	{0x0302, 0x4b},
>  	{0x030d, 0x4b},
>  	{0x030e, 0x02},
> @@ -137,7 +136,6 @@ static const struct ov2740_reg mipi_data_rate_720mbps[] = {
>  };
>  
>  static const struct ov2740_reg mipi_data_rate_360mbps[] = {
> -	{0x0103, 0x01},
>  	{0x0302, 0x4b},
>  	{0x0303, 0x01},
>  	{0x030d, 0x4b},
> @@ -935,6 +933,15 @@ static int ov2740_start_streaming(struct ov2740 *ov2740)
>  	if (ov2740->nvm)
>  		ov2740_load_otp_data(ov2740->nvm);
>  
> +	/* Reset the sensor */
> +	ret = ov2740_write_reg(ov2740, 0x0103, 1, 0x01);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to reset\n");
> +		return ret;
> +	}
> +
> +	usleep_range(10000, 15000);
> +
>  	link_freq_index = ov2740->cur_mode->link_freq_index;
>  	reg_list = &link_freq_configs[link_freq_index].reg_list;
>  	ret = ov2740_write_reg_list(ov2740, reg_list);
> 

-- 
Best regards,
Bingbu Cao

