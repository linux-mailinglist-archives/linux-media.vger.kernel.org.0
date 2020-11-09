Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A5C92AB1BB
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 08:28:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728951AbgKIH2X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 02:28:23 -0500
Received: from mga04.intel.com ([192.55.52.120]:5468 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728038AbgKIH2X (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Nov 2020 02:28:23 -0500
IronPort-SDR: 36J+FOVa/TQt/HjS3H9/W0JLTT1Khv6QvwU27tO+aVep/rUEzGQhQvOsbRwWAE48ZgCxdTQ9Si
 SM8eA8nTNDGg==
X-IronPort-AV: E=McAfee;i="6000,8403,9799"; a="167175194"
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; 
   d="scan'208";a="167175194"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2020 23:28:22 -0800
IronPort-SDR: pImBmYug4cQuVdVQdQUGJNJVnmbniSNUpERFKi02i2RALBHYzxZX99XFe6oUco08AoUtvjw61A
 NHxxwDPchXNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,463,1596524400"; 
   d="scan'208";a="530600239"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.196]) ([10.238.232.196])
  by fmsmga005.fm.intel.com with ESMTP; 08 Nov 2020 23:28:19 -0800
Subject: Re: [PATCH 1/2] media: ov2740: only do OTP data read on demand from
 user
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>
Cc:     linux-media@vger.kernel.org, tfiga@chromium.org,
        senozhatsky@chromium.org, qingwu.zhang@intel.com
References: <1604644844-1551-1-git-send-email-bingbu.cao@intel.com>
 <20201106115000.GN26150@paasikivi.fi.intel.com>
From:   "Cao, Bingbu" <bingbu.cao@linux.intel.com>
Message-ID: <e41b94e4-8d9b-b3a3-0597-81b5c1016ec7@linux.intel.com>
Date:   Mon, 9 Nov 2020 15:25:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201106115000.GN26150@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sakari, thanks for your review.

On 11/6/20 7:50 PM, Sakari Ailus wrote:
> Hi Bingbu,
> 
> Thanks for the patch.
> 
> On Fri, Nov 06, 2020 at 02:40:43PM +0800, Bingbu Cao wrote:
>> OTP data access of ov2740 in probe need power up, it may cause
>> the camera flash LED blink during probe if the LED use same power
>> rail with camera, this patch move the OTP data access out of
>> probe, it will only occur on demand from user by nvmem sysfs.
>>
>> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
>> Signed-off-by: Qingwu Zhang <qingwu.zhang@intel.com>
>> ---
>>  drivers/media/i2c/ov2740.c | 63 +++++++++++++++++++++++++++++++++++-----------
>>  1 file changed, 48 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
>> index 64ecb6917dd3..716c26c13c97 100644
>> --- a/drivers/media/i2c/ov2740.c
>> +++ b/drivers/media/i2c/ov2740.c
>> @@ -71,9 +71,11 @@
>>  #define OV2740_REG_OTP_CUSTOMER		0x7010
>>  
>>  struct nvm_data {
>> -	char *nvm_buffer;
>> +	struct i2c_client *client;
>>  	struct nvmem_device *nvmem;
>>  	struct regmap *regmap;
>> +	char *nvm_buffer;
>> +	bool ready;
>>  };
>>  
>>  enum {
>> @@ -335,6 +337,9 @@ struct ov2740 {
>>  
>>  	/* Streaming on/off */
>>  	bool streaming;
>> +
>> +	/* NVM data inforamtion */
>> +	struct nvm_data *nvm;
>>  };
>>  
>>  static inline struct ov2740 *to_ov2740(struct v4l2_subdev *subdev)
>> @@ -930,8 +935,9 @@ static int ov2740_remove(struct i2c_client *client)
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
>> @@ -967,7 +973,7 @@ static int ov2740_load_otp_data(struct i2c_client *client, struct nvm_data *nvm)
>>  	ret = ov2740_write_reg(ov2740, OV2740_REG_MODE_SELECT, 1,
>>  			       OV2740_MODE_STREAMING);
>>  	if (ret) {
>> -		dev_err(&client->dev, "failed to start streaming\n");
>> +		dev_err(&client->dev, "failed to set streaming mode\n");
>>  		goto exit;
>>  	}
>>  
>> @@ -997,20 +1003,48 @@ static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
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
>> +	if (!nvm->ready) {
>> +		if (ov2740->streaming) {
>> +			ret = -EBUSY;
>> +			goto exit;
>> +		}
>>  
>> -	return 0;
> 
> If you also moved memory allocation here, you could omit the ready field. I
> think it'd be cleaner that way as well.

The 'ready' field was also used to mark the OTP data loading during streaming, in patch 2/2.
Your comments inspired me, I think I could move the ready checking into OTP data read in v2.

> 
>> +		ret = pm_runtime_get_sync(dev);
>> +		if (ret < 0) {
>> +			pm_runtime_put_noidle(dev);
>> +			goto exit;
>> +		}
>> +		ret = ov2740_load_otp_data(nvm);
>> +		if (!ret)
>> +			nvm->ready = true;
>> +		pm_runtime_put(dev);
>> +	}
>> +
>> +exit:
>> +	mutex_unlock(&ov2740->mutex);
>> +
>> +	if (!ret)
>> +		memcpy(val, nvm->nvm_buffer + off, count);
>> +
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
>> @@ -1028,12 +1062,7 @@ static int ov2740_register_nvmem(struct i2c_client *client)
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
>> @@ -1051,7 +1080,11 @@ static int ov2740_register_nvmem(struct i2c_client *client)
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
>> @@ -1103,7 +1136,7 @@ static int ov2740_probe(struct i2c_client *client)
>>  		goto probe_error_media_entity_cleanup;
>>  	}
>>  
>> -	ret = ov2740_register_nvmem(client);
>> +	ret = ov2740_register_nvmem(client, ov2740);
>>  	if (ret)
>>  		dev_warn(&client->dev, "register nvmem failed, ret %d\n", ret);
>>  
> 

-- 
Best regards,
Bingbu Cao
