Return-Path: <linux-media+bounces-11442-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC928C5894
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 17:20:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56CD31C21D24
	for <lists+linux-media@lfdr.de>; Tue, 14 May 2024 15:20:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B3A17EB92;
	Tue, 14 May 2024 15:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHpHHZJH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF5A6D1A7;
	Tue, 14 May 2024 15:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715700046; cv=none; b=iwnwIhQgIPTMmCavUMs7sDIfMnlsCCAeTT5i9vgKDcFWkhB5GN6b/AuLNJKHz45zgdPceC3bu0D0OLlU3v7oxZCpUNrCur+84ByxrmS2Z5kKBrCgJREJkk5Q8FxZd6X7fkSinJkI+6pMXSisf9L4WbH24tw35TlhJLSljhmvF1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715700046; c=relaxed/simple;
	bh=NeNVQHHReCk1fXQMowao8w+OSjaqPySyymV38Cw0MFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kMua5DRXOen++ZI/KAQwEwv5xnNLegK6vn0wFysKvinaV5iWdao+mp+ebfqbtnE83fzYrI303epq42ruzkmxJsSxlyZgt7R3FsTOfvrlziuW0N4ZW86u3GeF3jU9lwbj9XGjgtvbtPnusv8QPDuMExIPfd7odYVwv/9qf+w0GYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHpHHZJH; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6f4178aec15so4882282b3a.0;
        Tue, 14 May 2024 08:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715700044; x=1716304844; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u4/NsG2e9hQsT5x13zx2ugASnyOpg+AKatsdShkRKb4=;
        b=ZHpHHZJH34w2nRyM5MsoFXHFdYptV2yqZWmX9iEGdXFpm4ZclDfaba7D6j65tHWnmC
         bUKhcxQSSm/AYiHZDXwczCfsVl843u9MYSg7KBe1XtxDuGGdA0MPp6xxKhdn897XB4DZ
         EQDrffLF1uWx6rP6zBki+k6WdymB7A2TSStI3kC+40OwJQ9ilO2pnNIj4hjS1hXGnQ1G
         RmQnzbJ/f3ZzLg9UVMDCDWtckv/vIVklNPvKAQD8Uc24FxVZhAuxblkeUsuHoQDVlR5v
         5sxqEB/11qK6QiVBzSbgVhPjEg9DfCrb1Z4TPR0eDXN/JnDuHDC56MLp7zkUR11/ja0f
         84ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715700044; x=1716304844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u4/NsG2e9hQsT5x13zx2ugASnyOpg+AKatsdShkRKb4=;
        b=FZeAy6STLDaa0phmxiAA18QvxssKX11ZcXpXSgF/+gwcUEgsIOTPzR+nUcIaWvAVoy
         cqsjM/3DlnHfXCF/vjA9nRuraXig1FRmUvHpqgimBC6HvM1tUw+e7IpYDV8q/GQH5bX4
         /yjnh1YUzBUFG/ns88iwsujUhzUgJxWYddlodCxvkx6NQXgybKoqR3zAD3WKvn+OOx1a
         qY24YvYqe7kU+w1FRCLddBtDjkVqyEoqaviCGKIjk59LdNPqd7BLwMG82gu9K+00u5RC
         Od5xQ/Quyhiqppmna9LlXx2nqFAj1L5wdUFG9mP3upD891KHDqYp9ewqTEkHyxyu7hFN
         4NYw==
X-Forwarded-Encrypted: i=1; AJvYcCWP8elB5SUMekXx8/m2Czug5mGwPL8105tjd8SXnJoeS3K+EaFKtrQLhHhg/x979RLBRpXmoUiXsEvjcXw43qA7szQpGm4CtLNRt+Dy
X-Gm-Message-State: AOJu0Yw1uQcr/QtZBCMLZxBPYME8fOOZdeAdRDSv236bSb0Y1VIkRYHM
	0qdUZ+QuZb12TMGwjd3uht3ZMpSuTNiau1aqTUbak1p0wWjwJ2/2
X-Google-Smtp-Source: AGHT+IG77yWo2wfdiFl/I2nqVu2FaLBHKsUOwReTSe7Eby9x1bn5TBe9izjjEQTb8+eE+yNXs8UNTg==
X-Received: by 2002:a05:6a21:3d85:b0:1af:d017:c13e with SMTP id adf61e73a8af0-1afde1c5528mr12491084637.41.1715700043596;
        Tue, 14 May 2024 08:20:43 -0700 (PDT)
Received: from ?IPV6:2402:e280:214c:86:b4e3:f8b3:da6:5062? ([2402:e280:214c:86:b4e3:f8b3:da6:5062])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a86fb3sm9201468b3a.86.2024.05.14.08.20.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 May 2024 08:20:43 -0700 (PDT)
Message-ID: <af208bb4-f02c-4535-a39e-dcdf91522f38@gmail.com>
Date: Tue, 14 May 2024 20:50:39 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 linux-next] media: i2c: st-mipid02: replace
 of_node_put() with __free
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 sylvain.petinot@foss.st.com, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, javier.carrasco.cruz@gmail.com,
 Julia Lawall <julia.lawall@inria.fr>
References: <20240429163736.11544-1-prosunofficial@gmail.com>
 <a688b2f2-d972-450a-9bec-2b506b58a21f@foss.st.com>
Content-Language: en-US
From: R Sundar <prosunofficial@gmail.com>
In-Reply-To: <a688b2f2-d972-450a-9bec-2b506b58a21f@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Thanks for the comments.

On 13/05/24 17:13, Benjamin Mugnier wrote:
> Hi,
> 
> I took sometime to reflect on this. Currently I favor drivers consistency.


> Merging this patch as is would introduce some differences between the
> vgxy61 and other drivers that follow the 'of_node_put' flow, which I
> think is not an improvement.
> 

I checked st-vgxy61.c file, I didn't find of_node_put().
Any file apart from this,  you want to see those changes? If yes let me 
know, please.
Meanwhile I am also looking into it.

This patch mainly reduce the goto error statements and increases 
readability of the code.

> Now, this patch is certainly good. Would it be possible to extend it to
> all other drivers using the 'of_node_put' ?
> 
yes, people are working on it to replace of_node_put() in many places. 
soon many patches can be expected to come in , for replacing of_node_put 
with auto cleanup module.
I am also adding these changes to few other files also.

Thanks,

> That would the consistency issue while improving code quality at the
> same time.
> 
> Thank you.
>  >
> On 4/29/24 18:37, R Sundar wrote:
>> Use the new cleanup magic to replace of_node_put() with
>> __free(device_node) marking to auto release and to simplify the error
>> paths.
>>
>> Suggested-by: Julia Lawall <julia.lawall@inria.fr>
>> Signed-off-by: R Sundar <prosunofficial@gmail.com>
>> ---
>>
>> Changes since v1 -
>>
>> - Added missed out __free() marking in mipid02_parse_tx_ep().
>> - In mipid02_parse_tx_ep(), In error case, return value is always -EINVAL.  so
>> sending the -EINVAL instead of ret variable value.
>>
>> Link to v1 - https://lore.kernel.org/all/20240427095643.11486-1-prosunofficial@gmail.com/#t
>>
>>   drivers/media/i2c/st-mipid02.c | 37 +++++++++-------------------------
>>   1 file changed, 9 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
>> index f250640729ca..bd3cf94f8534 100644
>> --- a/drivers/media/i2c/st-mipid02.c
>> +++ b/drivers/media/i2c/st-mipid02.c
>> @@ -715,31 +715,28 @@ static int mipid02_parse_rx_ep(struct mipid02_dev *bridge)
>>   	struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_CSI2_DPHY };
>>   	struct i2c_client *client = bridge->i2c_client;
>>   	struct v4l2_async_connection *asd;
>> -	struct device_node *ep_node;
>>   	int ret;
>>   
>>   	/* parse rx (endpoint 0) */
>> -	ep_node = of_graph_get_endpoint_by_regs(bridge->i2c_client->dev.of_node,
>> -						0, 0);
>> +	struct device_node *ep_node __free(device_node) =
>> +		of_graph_get_endpoint_by_regs(bridge->i2c_client->dev.of_node, 0, 0);
>>   	if (!ep_node) {
>>   		dev_err(&client->dev, "unable to find port0 ep");
>> -		ret = -EINVAL;
>> -		goto error;
>> +		return -EINVAL;
>>   	}
>>   
>>   	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep_node), &ep);
>>   	if (ret) {
>>   		dev_err(&client->dev, "Could not parse v4l2 endpoint %d\n",
>>   			ret);
>> -		goto error_of_node_put;
>> +		return ret;
>>   	}
>>   
>>   	/* do some sanity checks */
>>   	if (ep.bus.mipi_csi2.num_data_lanes > 2) {
>>   		dev_err(&client->dev, "max supported data lanes is 2 / got %d",
>>   			ep.bus.mipi_csi2.num_data_lanes);
>> -		ret = -EINVAL;
>> -		goto error_of_node_put;
>> +		return -EINVAL;
>>   	}
>>   
>>   	/* register it for later use */
>> @@ -750,7 +747,6 @@ static int mipid02_parse_rx_ep(struct mipid02_dev *bridge)
>>   	asd = v4l2_async_nf_add_fwnode_remote(&bridge->notifier,
>>   					      of_fwnode_handle(ep_node),
>>   					      struct v4l2_async_connection);
>> -	of_node_put(ep_node);
>>   
>>   	if (IS_ERR(asd)) {
>>   		dev_err(&client->dev, "fail to register asd to notifier %ld",
>> @@ -764,46 +760,31 @@ static int mipid02_parse_rx_ep(struct mipid02_dev *bridge)
>>   		v4l2_async_nf_cleanup(&bridge->notifier);
>>   
>>   	return ret;
>> -
>> -error_of_node_put:
>> -	of_node_put(ep_node);
>> -error:
>> -
>> -	return ret;
>>   }
>>   
>>   static int mipid02_parse_tx_ep(struct mipid02_dev *bridge)
>>   {
>>   	struct v4l2_fwnode_endpoint ep = { .bus_type = V4L2_MBUS_PARALLEL };
>>   	struct i2c_client *client = bridge->i2c_client;
>> -	struct device_node *ep_node;
>>   	int ret;
>>   
>>   	/* parse tx (endpoint 2) */
>> -	ep_node = of_graph_get_endpoint_by_regs(bridge->i2c_client->dev.of_node,
>> -						2, 0);
>> +	struct device_node *ep_node __free(device_node) =
>> +		of_graph_get_endpoint_by_regs(bridge->i2c_client->dev.of_node, 2, 0);
>>   	if (!ep_node) {
>>   		dev_err(&client->dev, "unable to find port1 ep");
>> -		ret = -EINVAL;
>> -		goto error;
>> +		return -EINVAL;
>>   	}
>>   
>>   	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep_node), &ep);
>>   	if (ret) {
>>   		dev_err(&client->dev, "Could not parse v4l2 endpoint\n");
>> -		goto error_of_node_put;
>> +		return -EINVAL;
>>   	}
>>   
>> -	of_node_put(ep_node);
>>   	bridge->tx = ep;
>>   
>>   	return 0;
>> -
>> -error_of_node_put:
>> -	of_node_put(ep_node);
>> -error:
>> -
>> -	return -EINVAL;
>>   }
>>   
>>   static int mipid02_probe(struct i2c_client *client)
> 


