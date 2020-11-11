Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E2A32AF023
	for <lists+linux-media@lfdr.de>; Wed, 11 Nov 2020 12:56:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbgKKL40 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Nov 2020 06:56:26 -0500
Received: from mga01.intel.com ([192.55.52.88]:20472 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726430AbgKKL4H (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Nov 2020 06:56:07 -0500
IronPort-SDR: DkKLpVRzruH9ScRvCF7FaL7UIuL7p0RSkIEFrTuTeulmLnnCjv0B6jePy3Pu7YJ4d8yhkLJJ+b
 1o6Gnj051rOA==
X-IronPort-AV: E=McAfee;i="6000,8403,9801"; a="188114240"
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="188114240"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2020 03:56:05 -0800
IronPort-SDR: 0dfhqvxpZkLbUNaZJCuoP6Yez9j/4M28N1PGH0ATJbZkU2/sWC2fKScSpskYHKmaEz6ey9um8p
 E+ct2D7NTyKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,469,1596524400"; 
   d="scan'208";a="323246227"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.196]) ([10.238.232.196])
  by orsmga003.jf.intel.com with ESMTP; 11 Nov 2020 03:56:02 -0800
Subject: Re: [PATCH v3 1/2] media: ov2740: only do OTP data read on demand
 from user
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>
Cc:     linux-media@vger.kernel.org, tfiga@chromium.org,
        senozhatsky@chromium.org, qingwu.zhang@intel.com
References: <1605076797-31058-1-git-send-email-bingbu.cao@intel.com>
 <20201111103623.GY26150@paasikivi.fi.intel.com>
From:   "Cao, Bingbu" <bingbu.cao@linux.intel.com>
Message-ID: <9e99d62c-d3cf-e3a7-aba9-460b239b1a4b@linux.intel.com>
Date:   Wed, 11 Nov 2020 19:53:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201111103623.GY26150@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 11/11/20 6:36 PM, Sakari Ailus wrote:
> Hi Bingbu,
> 
> On Wed, Nov 11, 2020 at 02:39:56PM +0800, Bingbu Cao wrote:
>> OTP data access of ov2740 in probe need power up, it may cause
>> the camera flash LED blink during probe if the LED use same power
>> rail with camera, this patch move the OTP data access out of
>> probe, it will only occur on demand from user by nvmem sysfs.
>>
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>> Signed-off-by: Qingwu Zhang <qingwu.zhang@intel.com>
>> ---
>>  drivers/media/i2c/ov2740.c | 111 ++++++++++++++++++++++++++++++++-------------
>>  1 file changed, 79 insertions(+), 32 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
>> index 64ecb6917dd3..41c17df46f47 100644
>> --- a/drivers/media/i2c/ov2740.c
>> +++ b/drivers/media/i2c/ov2740.c
>> @@ -71,9 +71,10 @@
>>  #define OV2740_REG_OTP_CUSTOMER		0x7010
>>  
>>  struct nvm_data {
>> -	char *nvm_buffer;
>> +	struct i2c_client *client;
>>  	struct nvmem_device *nvmem;
>>  	struct regmap *regmap;
>> +	char *nvm_buffer;
>>  };
>>  
>>  enum {
>> @@ -335,6 +336,9 @@ struct ov2740 {
>>  
>>  	/* Streaming on/off */
>>  	bool streaming;
>> +
>> +	/* NVM data inforamtion */
>> +	struct nvm_data *nvm;
>>  };
>>  
>>  static inline struct ov2740 *to_ov2740(struct v4l2_subdev *subdev)
>> @@ -930,45 +934,57 @@ static int ov2740_remove(struct i2c_client *client)
>>  	return 0;
>>  }
>>  
>> -static int ov2740_load_otp_data(struct i2c_client *client, struct nvm_data *nvm)
>> +static int ov2740_load_otp_data(struct nvm_data *nvm)
>>  {
>> +	struct i2c_client *client = nvm->client;
>>  	struct ov2740 *ov2740 = to_ov2740(i2c_get_clientdata(client));
>>  	u32 isp_ctrl00 = 0;
>>  	u32 isp_ctrl01 = 0;
>>  	int ret;
>>  
>> +	if (!nvm)
>> +		return -EINVAL;
>> +
>> +	if (nvm->nvm_buffer)
>> +		return 0;
>> +
>> +	nvm->nvm_buffer = kzalloc(CUSTOMER_USE_OTP_SIZE, GFP_KERNEL);
>> +	if (!nvm->nvm_buffer)
>> +		return -ENOMEM;
>> +
>>  	ret = ov2740_read_reg(ov2740, OV2740_REG_ISP_CTRL00, 1, &isp_ctrl00);
>>  	if (ret) {
>>  		dev_err(&client->dev, "failed to read ISP CTRL00\n");
>> -		goto exit;
>> +		goto err;
>>  	}
>> +
>>  	ret = ov2740_read_reg(ov2740, OV2740_REG_ISP_CTRL01, 1, &isp_ctrl01);
>>  	if (ret) {
>>  		dev_err(&client->dev, "failed to read ISP CTRL01\n");
>> -		goto exit;
>> +		goto err;
>>  	}
>>  
>>  	/* Clear bit 5 of ISP CTRL00 */
>>  	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL00, 1,
>>  			       isp_ctrl00 & ~BIT(5));
>>  	if (ret) {
>> -		dev_err(&client->dev, "failed to write ISP CTRL00\n");
>> -		goto exit;
>> +		dev_err(&client->dev, "failed to set ISP CTRL00\n");
>> +		goto err;
>>  	}
>>  
>>  	/* Clear bit 7 of ISP CTRL01 */
>>  	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL01, 1,
>>  			       isp_ctrl01 & ~BIT(7));
>>  	if (ret) {
>> -		dev_err(&client->dev, "failed to write ISP CTRL01\n");
>> -		goto exit;
>> +		dev_err(&client->dev, "failed to set ISP CTRL01\n");
>> +		goto err;
>>  	}
>>  
>>  	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
>>  			       OV2740_MODE_STREAMING);
>>  	if (ret) {
>> -		dev_err(&client->dev, "failed to start streaming\n");
>> -		goto exit;
>> +		dev_err(&client->dev, "failed to set streaming mode\n");
>> +		goto err;
>>  	}
>>  
>>  	/*
>> @@ -981,15 +997,33 @@ static int ov2740_load_otp_data(struct i2c_client *client, struct nvm_data *nvm)
>>  			       nvm->nvm_buffer, CUSTOMER_USE_OTP_SIZE);
>>  	if (ret) {
>>  		dev_err(&client->dev, "failed to read OTP data, ret %d\n", ret);
>> -		goto exit;
>> +		goto err;
>>  	}
>>  
>> -	ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
>> -			 OV2740_MODE_STANDBY);
>> -	ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL01, 1, isp_ctrl01);
>> -	ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL00, 1, isp_ctrl00);
>> +	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
>> +			       OV2740_MODE_STANDBY);
>> +	if (ret) {
>> +		dev_err(&client->dev, "failed to set streaming mode\n");
>> +		goto err;
>> +	}
>> +
>> +	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL01, 1, isp_ctrl01);
>> +	if (ret) {
>> +		dev_err(&client->dev, "failed to set ISP CTRL01\n");
>> +		goto err;
>> +	}
>> +
>> +	ret = ov2740_write_reg(ov2740, OV2740_REG_ISP_CTRL00, 1, isp_ctrl00);
>> +	if (ret) {
>> +		dev_err(&client->dev, "failed to set ISP CTRL00\n");
>> +		goto err;
>> +	}
>> +
>> +	return 0;
>> +err:
>> +	kfree(nvm->nvm_buffer);
>> +	nvm->nvm_buffer = NULL;
>>  
>> -exit:
>>  	return ret;
>>  }
>>  
>> @@ -997,29 +1031,43 @@ static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
>>  			     size_t count)
>>  {
>>  	struct nvm_data *nvm = priv;
>> +	struct v4l2_subdev *sd = i2c_get_clientdata(nvm->client);
>> +	struct device *dev = &nvm->client->dev;
>> +	struct ov2740 *ov2740 = to_ov2740(sd);
>> +	int ret = 0;
>> +
>> +	mutex_lock(&ov2740->mutex);
>>  
>> -	memcpy(val, nvm->nvm_buffer + off, count);
>> +	ret = pm_runtime_get_sync(dev);
>> +	if (ret < 0) {
>> +		pm_runtime_put_noidle(dev);
>> +		goto exit;
>> +	}
>>  
>> -	return 0;
>> +	ret = ov2740_load_otp_data(nvm);
> 
> ov2740_load_otp_data() only needs to access the device on the first time.
> Could you move resuming the device where it's really needed, please?
> 
> Can be a separate patch. Up to you.

Good point, will address in v4.
......
        mutex_lock(&ov2740->mutex);

+       if (nvm->nvm_buffer) {
+               memcpy(val, nvm->nvm_buffer + off, count);
+               goto exit;
+       }
+
        ret = pm_runtime_get_sync(dev);
        if (ret < 0) {
                pm_runtime_put_noidle(dev);
....

> 
>> +	if (!ret)
>> +		memcpy(val, nvm->nvm_buffer + off, count);
>> +
>> +	pm_runtime_put(dev);
>> +exit:
>> +	mutex_unlock(&ov2740->mutex);
>> +	return ret;
>>  }
>>  
>> -static int ov2740_register_nvmem(struct i2c_client *client)
>> +static int ov2740_register_nvmem(struct i2c_client *client,
>> +				 struct ov2740 *ov2740)
>>  {
>>  	struct nvm_data *nvm;
>>  	struct regmap_config regmap_config = { };
>>  	struct nvmem_config nvmem_config = { };
>>  	struct regmap *regmap;
>>  	struct device *dev = &client->dev;
>> -	int ret = 0;
>> +	int ret;
>>  
>>  	nvm = devm_kzalloc(dev, sizeof(*nvm), GFP_KERNEL);
>>  	if (!nvm)
>>  		return -ENOMEM;
>>  
>> -	nvm->nvm_buffer = devm_kzalloc(dev, CUSTOMER_USE_OTP_SIZE, GFP_KERNEL);
>> -	if (!nvm->nvm_buffer)
>> -		return -ENOMEM;
>> -
>>  	regmap_config.val_bits = 8;
>>  	regmap_config.reg_bits = 16;
>>  	regmap_config.disable_locking = true;
>> @@ -1028,12 +1076,7 @@ static int ov2740_register_nvmem(struct i2c_client *client)
>>  		return PTR_ERR(regmap);
>>  
>>  	nvm->regmap = regmap;
>> -
>> -	ret = ov2740_load_otp_data(client, nvm);
>> -	if (ret) {
>> -		dev_err(dev, "failed to load OTP data, ret %d\n", ret);
>> -		return ret;
>> -	}
>> +	nvm->client = client;
>>  
>>  	nvmem_config.name = dev_name(dev);
>>  	nvmem_config.dev = dev;
>> @@ -1051,7 +1094,11 @@ static int ov2740_register_nvmem(struct i2c_client *client)
>>  
>>  	nvm->nvmem = devm_nvmem_register(dev, &nvmem_config);
>>  
>> -	return PTR_ERR_OR_ZERO(nvm->nvmem);
>> +	ret = PTR_ERR_OR_ZERO(nvm->nvmem);
>> +	if (!ret)
>> +		ov2740->nvm = nvm;
>> +
>> +	return ret;
>>  }
>>  
>>  static int ov2740_probe(struct i2c_client *client)
>> @@ -1103,7 +1150,7 @@ static int ov2740_probe(struct i2c_client *client)
>>  		goto probe_error_media_entity_cleanup;
>>  	}
>>  
>> -	ret = ov2740_register_nvmem(client);
>> +	ret = ov2740_register_nvmem(client, ov2740);
>>  	if (ret)
>>  		dev_warn(&client->dev, "register nvmem failed, ret %d\n", ret);
>>  
>> -- 
>> 2.7.4
>>
> 

-- 
Best regards,
Bingbu Cao
