Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01D242AFDEF
	for <lists+linux-media@lfdr.de>; Thu, 12 Nov 2020 06:32:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727535AbgKLFc1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 Nov 2020 00:32:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729211AbgKLFFM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 Nov 2020 00:05:12 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC2A4C0613D1
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2020 21:05:11 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id m13so3157053pgl.7
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2020 21:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=OvDC5ClvDREdrucI/PTMRSu0u9Y+8gDZD9AD9LCiJ28=;
        b=L8p3YmbJnbEjlaM8ZyDl8YynX/QKGKhIc3egOAZEyxJQKHSsppHzmwQ8gVlaM4ntpK
         xoB0h4HWVRpF6+ppRkuWgeEzrtkvxsYsPsa8PRcNTYG7VplwxN3r7mvnkLriQHVz2cnm
         jGGC6+EzOEtT2wtqLunbMGmUUdQ4Ux2q/dReE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=OvDC5ClvDREdrucI/PTMRSu0u9Y+8gDZD9AD9LCiJ28=;
        b=ppKtcOu1eG+/fs3wUB2KXU2uLGh4d7tEyHSOCto/uJ9XD24ENyxItSdohMedgavWoJ
         +J+yHbM6arP4iHaziFlYkbauNR8yCI06DoVdRrwuF679YYXIc/QMhCk0+YMm9sO7m83B
         HwWXpmhzIurtccelXXvfV+WJ0gb7xk7In3NCfhl7OZHseyB34HYtLf6a027tvhHneYke
         USBKpPuh1QNXj3BfcxS9qGMFDwL7mM6Q1EWhK28k892HO1mJ788XArtqm7ttGERGskEJ
         3KtdnZF8V41cHqJlxVTwDaN5kKVeJuCqwH29Lz1mI2KTCqNbaigWbA8NRS+3V3yRhM+6
         IvqQ==
X-Gm-Message-State: AOAM532bwIu+7OOF5edwmo3+zvMHwu9q6j4P0s94tCnh6W62Vvi+Y0Yo
        WdhN4luaNt8tiAHUAY0mf6nmOg==
X-Google-Smtp-Source: ABdhPJzYEjcMjjkfJUZy/N+AKfrDFogffDAd2YWlLqg4dsrddbsWAhnVkS+t3BjIEDvutQ0yaG8q7Q==
X-Received: by 2002:a63:5f86:: with SMTP id t128mr23937460pgb.385.1605157511195;
        Wed, 11 Nov 2020 21:05:11 -0800 (PST)
Received: from chromium.org ([2401:fa00:8f:2:a28c:fdff:fef0:43bf])
        by smtp.gmail.com with ESMTPSA id c28sm4985322pfj.108.2020.11.11.21.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 21:05:10 -0800 (PST)
Date:   Thu, 12 Nov 2020 14:05:07 +0900
From:   Tomasz Figa <tfiga@chromium.org>
To:     Bingbu Cao <bingbu.cao@intel.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        senozhatsky@chromium.org, bingbu.cao@linux.intel.com,
        qingwu.zhang@intel.com
Subject: Re: [PATCH v3 1/2] media: ov2740: only do OTP data read on demand
 from user
Message-ID: <20201112050507.GA2685362@chromium.org>
References: <1605076797-31058-1-git-send-email-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605076797-31058-1-git-send-email-bingbu.cao@intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Wed, Nov 11, 2020 at 02:39:56PM +0800, Bingbu Cao wrote:
> OTP data access of ov2740 in probe need power up, it may cause
> the camera flash LED blink during probe if the LED use same power
> rail with camera, this patch move the OTP data access out of
> probe, it will only occur on demand from user by nvmem sysfs.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> Signed-off-by: Qingwu Zhang <qingwu.zhang@intel.com>
> ---
>  drivers/media/i2c/ov2740.c | 111 ++++++++++++++++++++++++++++++++-------------
>  1 file changed, 79 insertions(+), 32 deletions(-)
> 

With Sakari's comment addressed:

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index 64ecb6917dd3..41c17df46f47 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -71,9 +71,10 @@
>  #define OV2740_REG_OTP_CUSTOMER		0x7010
>  
>  struct nvm_data {
> -	char *nvm_buffer;
> +	struct i2c_client *client;
>  	struct nvmem_device *nvmem;
>  	struct regmap *regmap;
> +	char *nvm_buffer;
>  };
>  
>  enum {
> @@ -335,6 +336,9 @@ struct ov2740 {
>  
>  	/* Streaming on/off */
>  	bool streaming;
> +
> +	/* NVM data inforamtion */
> +	struct nvm_data *nvm;
>  };
>  
>  static inline struct ov2740 *to_ov2740(struct v4l2_subdev *subdev)
> @@ -930,45 +934,57 @@ static int ov2740_remove(struct i2c_client *client)
>  	return 0;
>  }
>  
> -static int ov2740_load_otp_data(struct i2c_client *client, struct nvm_data *nvm)
> +static int ov2740_load_otp_data(struct nvm_data *nvm)
>  {
> +	struct i2c_client *client = nvm->client;
>  	struct ov2740 *ov2740 = to_ov2740(i2c_get_clientdata(client));
>  	u32 isp_ctrl00 = 0;
>  	u32 isp_ctrl01 = 0;
>  	int ret;
>  
> +	if (!nvm)
> +		return -EINVAL;
> +
> +	if (nvm->nvm_buffer)
> +		return 0;
> +
> +	nvm->nvm_buffer = kzalloc(CUSTOMER_USE_OTP_SIZE, GFP_KERNEL);
> +	if (!nvm->nvm_buffer)
> +		return -ENOMEM;
> +
>  	ret = ov2740_read_reg(ov2740, OV2740_REG_ISP_CTRL00, 1, &isp_ctrl00);
>  	if (ret) {
>  		dev_err(&client->dev, "failed to read ISP CTRL00\n");
> -		goto exit;
> +		goto err;
>  	}
> +
>  	ret = ov2740_read_reg(ov2740, OV2740_REG_ISP_CTRL01, 1, &isp_ctrl01);
>  	if (ret) {
>  		dev_err(&client->dev, "failed to read ISP CTRL01\n");
> -		goto exit;
> +		goto err;
>  	}
>  
>  	/* Clear bit 5 of ISP CTRL00 */
>  	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL00, 1,
>  			       isp_ctrl00 & ~BIT(5));
>  	if (ret) {
> -		dev_err(&client->dev, "failed to write ISP CTRL00\n");
> -		goto exit;
> +		dev_err(&client->dev, "failed to set ISP CTRL00\n");
> +		goto err;
>  	}
>  
>  	/* Clear bit 7 of ISP CTRL01 */
>  	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL01, 1,
>  			       isp_ctrl01 & ~BIT(7));
>  	if (ret) {
> -		dev_err(&client->dev, "failed to write ISP CTRL01\n");
> -		goto exit;
> +		dev_err(&client->dev, "failed to set ISP CTRL01\n");
> +		goto err;
>  	}
>  
>  	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
>  			       OV2740_MODE_STREAMING);
>  	if (ret) {
> -		dev_err(&client->dev, "failed to start streaming\n");
> -		goto exit;
> +		dev_err(&client->dev, "failed to set streaming mode\n");
> +		goto err;
>  	}
>  
>  	/*
> @@ -981,15 +997,33 @@ static int ov2740_load_otp_data(struct i2c_client *client, struct nvm_data *nvm)
>  			       nvm->nvm_buffer, CUSTOMER_USE_OTP_SIZE);
>  	if (ret) {
>  		dev_err(&client->dev, "failed to read OTP data, ret %d\n", ret);
> -		goto exit;
> +		goto err;
>  	}
>  
> -	ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
> -			 OV2740_MODE_STANDBY);
> -	ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL01, 1, isp_ctrl01);
> -	ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL00, 1, isp_ctrl00);
> +	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
> +			       OV2740_MODE_STANDBY);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to set streaming mode\n");
> +		goto err;
> +	}
> +
> +	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL01, 1, isp_ctrl01);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to set ISP CTRL01\n");
> +		goto err;
> +	}
> +
> +	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL00, 1, isp_ctrl00);
> +	if (ret) {
> +		dev_err(&client->dev, "failed to set ISP CTRL00\n");
> +		goto err;
> +	}
> +
> +	return 0;
> +err:
> +	kfree(nvm->nvm_buffer);
> +	nvm->nvm_buffer = NULL;
>  
> -exit:
>  	return ret;
>  }
>  
> @@ -997,29 +1031,43 @@ static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
>  			     size_t count)
>  {
>  	struct nvm_data *nvm = priv;
> +	struct v4l2_subdev *sd = i2c_get_clientdata(nvm->client);
> +	struct device *dev = &nvm->client->dev;
> +	struct ov2740 *ov2740 = to_ov2740(sd);
> +	int ret = 0;
> +
> +	mutex_lock(&ov2740->mutex);
>  
> -	memcpy(val, nvm->nvm_buffer + off, count);
> +	ret = pm_runtime_get_sync(dev);
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(dev);
> +		goto exit;
> +	}
>  
> -	return 0;
> +	ret = ov2740_load_otp_data(nvm);
> +	if (!ret)
> +		memcpy(val, nvm->nvm_buffer + off, count);
> +
> +	pm_runtime_put(dev);
> +exit:
> +	mutex_unlock(&ov2740->mutex);
> +	return ret;
>  }
>  
> -static int ov2740_register_nvmem(struct i2c_client *client)
> +static int ov2740_register_nvmem(struct i2c_client *client,
> +				 struct ov2740 *ov2740)
>  {
>  	struct nvm_data *nvm;
>  	struct regmap_config regmap_config = { };
>  	struct nvmem_config nvmem_config = { };
>  	struct regmap *regmap;
>  	struct device *dev = &client->dev;
> -	int ret = 0;
> +	int ret;
>  
>  	nvm = devm_kzalloc(dev, sizeof(*nvm), GFP_KERNEL);
>  	if (!nvm)
>  		return -ENOMEM;
>  
> -	nvm->nvm_buffer = devm_kzalloc(dev, CUSTOMER_USE_OTP_SIZE, GFP_KERNEL);
> -	if (!nvm->nvm_buffer)
> -		return -ENOMEM;
> -
>  	regmap_config.val_bits = 8;
>  	regmap_config.reg_bits = 16;
>  	regmap_config.disable_locking = true;
> @@ -1028,12 +1076,7 @@ static int ov2740_register_nvmem(struct i2c_client *client)
>  		return PTR_ERR(regmap);
>  
>  	nvm->regmap = regmap;
> -
> -	ret = ov2740_load_otp_data(client, nvm);
> -	if (ret) {
> -		dev_err(dev, "failed to load OTP data, ret %d\n", ret);
> -		return ret;
> -	}
> +	nvm->client = client;
>  
>  	nvmem_config.name = dev_name(dev);
>  	nvmem_config.dev = dev;
> @@ -1051,7 +1094,11 @@ static int ov2740_register_nvmem(struct i2c_client *client)
>  
>  	nvm->nvmem = devm_nvmem_register(dev, &nvmem_config);
>  
> -	return PTR_ERR_OR_ZERO(nvm->nvmem);
> +	ret = PTR_ERR_OR_ZERO(nvm->nvmem);
> +	if (!ret)
> +		ov2740->nvm = nvm;
> +
> +	return ret;
>  }
>  
>  static int ov2740_probe(struct i2c_client *client)
> @@ -1103,7 +1150,7 @@ static int ov2740_probe(struct i2c_client *client)
>  		goto probe_error_media_entity_cleanup;
>  	}
>  
> -	ret = ov2740_register_nvmem(client);
> +	ret = ov2740_register_nvmem(client, ov2740);
>  	if (ret)
>  		dev_warn(&client->dev, "register nvmem failed, ret %d\n", ret);
>  
> -- 
> 2.7.4
> 
