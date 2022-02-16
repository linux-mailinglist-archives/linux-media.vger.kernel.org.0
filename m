Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E61F04B8CC6
	for <lists+linux-media@lfdr.de>; Wed, 16 Feb 2022 16:45:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235646AbiBPPpi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Feb 2022 10:45:38 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234034AbiBPPph (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Feb 2022 10:45:37 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 163C72A0D6A
        for <linux-media@vger.kernel.org>; Wed, 16 Feb 2022 07:45:25 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id d27so4157181wrb.5
        for <linux-media@vger.kernel.org>; Wed, 16 Feb 2022 07:45:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=jQbUoLP0DeztGWNveVVhtbMWMqkA1zCTA33/ZznfWeg=;
        b=FRVLHT/UPnw10Si5rwJUvSu18RcIpLtZYDq6IhLY98qGmp5/UUSkfJGgILLpVgbZZ6
         g6fzrul2ehYFA3tZ+/s5el04CCbuhF92xILqHW138AgTEmWCSeJdkUYi0H/MOtQ7dcyS
         bL/W2pArN4TGqh/kcsdmBbFz5o3L9k4hpWI8opJyXoB56kzEYXaTwPywMdESJDI9IVVm
         q02RqccJpxQD9ky0uvZWHGoN3ZXVxfRWxgmM8YK3ffvaLbieKaynGXkCEmg/LB4IW1D+
         /KiCtsrCQZSPNjR2aYOmVWItZpIVnww7p48HlUANFgX95raOvJHbAQ/+9fxTVPXVj3mx
         Naqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jQbUoLP0DeztGWNveVVhtbMWMqkA1zCTA33/ZznfWeg=;
        b=mE4zeA4InRdlBTFd8D/FddRALcDihMq+cqXXxxwYZTRNGbssWB+Hw3MNnFFB2L88zt
         zTr3AP7jjVZ86op6slvBcObKcrwwv3Nh2r8F656prvS8NzL1QMIai8MOdVK0Y36ye0DN
         U94LOTfZna9oKRTUEW61nYrVi+tE6N3XXH6CEPSlhVugAPXMoQoXdPia8sPXLFu9rZSw
         BvmqK0CXEAdCVxJqKdTkxKum01mm0uZStI8VO415xgco7d354OhyhW+UQNHawW3P0Say
         FMSANjwZQu9JHhUJvc1CAqyrA6e9Haao/tZeeew02ojPZlgBrQo+lSYdfPDJVZ8tl1xX
         PBSA==
X-Gm-Message-State: AOAM532/LDxdIqyPpGGK972ZfbXb4SeC70OessDcmI2MPRBoCT0UTlam
        qZa7YE9SftkRmAgSJoeioOg=
X-Google-Smtp-Source: ABdhPJxdG578iy2mpM5fwRuPOR+njxnhXnNYVkX6UbU7yEkTtcgU7XuRn1DG+1Ouo3lCwn5FAVS87A==
X-Received: by 2002:a5d:54c5:0:b0:1e5:5ca1:2b7f with SMTP id x5-20020a5d54c5000000b001e55ca12b7fmr2733995wrv.193.1645026323635;
        Wed, 16 Feb 2022 07:45:23 -0800 (PST)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id l26sm18828113wms.24.2022.02.16.07.45.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Feb 2022 07:45:23 -0800 (PST)
Message-ID: <2382baec-9f57-f004-dccd-7219efe9dc01@gmail.com>
Date:   Wed, 16 Feb 2022 15:45:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 04/10] media: i2c: Provide ov7251_check_hwcfg()
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, yong.zhi@intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
References: <20220215230737.1870630-1-djrscally@gmail.com>
 <20220215230737.1870630-5-djrscally@gmail.com>
 <Yg0Xua9x2Ix+ctUs@paasikivi.fi.intel.com>
From:   Daniel Scally <djrscally@gmail.com>
In-Reply-To: <Yg0Xua9x2Ix+ctUs@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari - thanks for the comments

On 16/02/2022 15:26, Sakari Ailus wrote:
> Hi Daniel,
>
> Thanks for the set.
>
> On Tue, Feb 15, 2022 at 11:07:31PM +0000, Daniel Scally wrote:
>> Move the endpoint checking from .probe() to a dedicated function,
>> and additionally check that the firmware provided link frequencies
>> are a match for those supported by the driver. Finally, return
>> -EPROBE_DEFER if the endpoint is not available, as it could be built
>> by the ipu3-cio2 driver if that probes later.
>>
>> Signed-off-by: Daniel Scally <djrscally@gmail.com>
>> ---
>>  drivers/media/i2c/ov7251.c | 84 ++++++++++++++++++++++++++++++--------
>>  1 file changed, 66 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
>> index d6fe574cb9e0..5c5f7a15a640 100644
>> --- a/drivers/media/i2c/ov7251.c
>> +++ b/drivers/media/i2c/ov7251.c
>> @@ -1255,10 +1255,73 @@ static const struct v4l2_subdev_ops ov7251_subdev_ops = {
>>  	.pad = &ov7251_subdev_pad_ops,
>>  };
>>  
>> +static int ov7251_check_hwcfg(struct ov7251 *ov7251)
>> +{
>> +	struct fwnode_handle *fwnode = dev_fwnode(ov7251->dev);
>> +	struct v4l2_fwnode_endpoint bus_cfg = {
>> +		.bus_type = V4L2_MBUS_CSI2_DPHY,
>> +	};
>> +	struct fwnode_handle *endpoint;
>> +	bool freq_found;
>> +	int i, j;
> unsigned int ?


Ack

>
>> +	int ret;
>> +
>> +	endpoint = fwnode_graph_get_next_endpoint(fwnode, NULL);
>> +	if (!endpoint)
>> +		return -EPROBE_DEFER; /* could be provided by cio2-bridge */
>> +
>> +	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &bus_cfg);
>> +	fwnode_handle_put(endpoint);
>> +	if (ret)
>> +		return dev_err_probe(ov7251->dev, ret,
>> +				     "parsing endpoint node failed\n");
>> +
>> +	if (bus_cfg.bus_type != V4L2_MBUS_CSI2_DPHY) {
> You can drop this check as v4l2_fwnode_endpoint_alloc_parse() only parses
> D-PHY bus type and returns error otherwise, as you've (correctly) specified
> D-PHY in bus_cfg.


Ah-ha, ok useful to know thanks.

>
>> +		ret = -EINVAL;
>> +		dev_err(ov7251->dev, "invalid bus type (%u), must be (%u)\n",
>> +			bus_cfg.bus_type, V4L2_MBUS_CSI2_DPHY);
>> +		goto out_free_bus_cfg;
>> +	}
>> +
>> +	if (bus_cfg.bus.mipi_csi2.num_data_lanes != 1) {
> Is this a driver or hardware limitation?
>
> If it's hardware, you could also ignore it --- there's nothing to
> configure.


Good point, it is a hardware limitation yes.

>
>> +		dev_err(ov7251->dev, "only a 1-lane CSI2 config is supported");
>> +		ret = -EINVAL;
>> +		goto out_free_bus_cfg;
>> +	}
>> +
>> +	if (!bus_cfg.nr_of_link_frequencies) {
>> +		dev_err(ov7251->dev, "no link frequencies defined\n");
>> +		ret = -EINVAL;
>> +		goto out_free_bus_cfg;
>> +	}
>> +
>> +	freq_found = false;
> You could do this in initialisation.
>
>> +	for (i = 0; i < bus_cfg.nr_of_link_frequencies; i++) {

Ack
>> +		if (freq_found)
>> +			break;
>> +
>> +		for (j = 0; j < ARRAY_SIZE(link_freq); j++)
>> +			if (bus_cfg.link_frequencies[i] == link_freq[j]) {
>> +				freq_found = true;
>> +				break;
>> +			}
>> +	}
>> +
>> +	if (i == bus_cfg.nr_of_link_frequencies) {
>> +		dev_err(ov7251->dev, "no supported link freq found\n");
>> +		ret = -EINVAL;
>> +		goto out_free_bus_cfg;
>> +	}
>> +
>> +out_free_bus_cfg:
>> +	v4l2_fwnode_endpoint_free(&bus_cfg);
>> +
>> +	return ret;
>> +}
>> +
>>  static int ov7251_probe(struct i2c_client *client)
>>  {
>>  	struct device *dev = &client->dev;
>> -	struct fwnode_handle *endpoint;
>>  	struct ov7251 *ov7251;
>>  	u8 chip_id_high, chip_id_low, chip_rev;
>>  	int ret;
>> @@ -1270,24 +1333,9 @@ static int ov7251_probe(struct i2c_client *client)
>>  	ov7251->i2c_client = client;
>>  	ov7251->dev = dev;
>>  
>> -	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
>> -	if (!endpoint) {
>> -		dev_err(dev, "endpoint node not found\n");
>> -		return -EINVAL;
>> -	}
>> -
>> -	ret = v4l2_fwnode_endpoint_parse(endpoint, &ov7251->ep);
>> -	fwnode_handle_put(endpoint);
>> -	if (ret < 0) {
>> -		dev_err(dev, "parsing endpoint node failed\n");
>> +	ret = ov7251_check_hwcfg(ov7251);
>> +	if (ret)
>>  		return ret;
>> -	}
>> -
>> -	if (ov7251->ep.bus_type != V4L2_MBUS_CSI2_DPHY) {
>> -		dev_err(dev, "invalid bus type (%u), must be CSI2 (%u)\n",
>> -			ov7251->ep.bus_type, V4L2_MBUS_CSI2_DPHY);
>> -		return -EINVAL;
>> -	}
>>  
>>  	/* get system clock (xclk) */
>>  	ov7251->xclk = devm_clk_get(dev, "xclk");
