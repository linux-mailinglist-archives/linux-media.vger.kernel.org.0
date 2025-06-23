Return-Path: <linux-media+bounces-35627-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F09AE3F01
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 14:04:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFB1D1881E01
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 12:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A862550CC;
	Mon, 23 Jun 2025 12:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iNq0imsN"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21172550CA
	for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 12:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680050; cv=none; b=YPAUt/x9mt4y7fMPcCWalDuQh3cZObY3ivfZNONPgY5P9CteWDJINN//qZNZ+57MjblOlkGCniYAWyzfO4h04TZFtFOFwFNXoV6LIU6oIm05ZzvstSkTPJK1SOWXS1LhDIbQpRo7zMZtJ2IldiUiRFm6ppOPVddEVVbR/Y30ows=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680050; c=relaxed/simple;
	bh=0PJf2eCLv8/42I2N4x6+4m1hll74iynZigvNzaQLEFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a2OmqVZbRa5khsFmeHLKJFjJGMZm6/u7UbF+nOYoK7U1wIvmIUDNZJKR9eFsTIA1AQHZh0vYWUcWPmH35ATAI81Y20pyQ0Qg582udhe7PYZa1iF8FnTGCGJv8HvtPBVtjEpN2QbZKekYYr08zmyZMiW/vN8dffX/mQW4c57dxJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iNq0imsN; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-553b9d85706so543065e87.3
        for <linux-media@vger.kernel.org>; Mon, 23 Jun 2025 05:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750680047; x=1751284847; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lP9R0DOq1lsif1WN+MzCn3iMNJnOUN1ymxq6FgDXFH4=;
        b=iNq0imsN4b9l5MANnIU0VK3hcdtujiUdprA/yk3EC6W0l2CoIQiIljADXBYBxSVP2z
         6iuhna36iBN1zkv5qP6DyM9NevGsK9ii7rpebar5bAynvpd3IV/kEUwAcz8xC4bo9kJ6
         rsKgMm7vG8mOCNj1/q0vxjrzQfkzcwaIf4p/f7zGFXhwkqSfojeG+rdG5ozcDPCS9O0S
         ZNBngH0zm75S1T3B3A62lh1yTdLZSoT5+SdwvBtH2PRU6Ka3V10HOl3B74Z4EEfPAgYq
         9PMAFRsYClyDrS/xfX6g92vsfEXQXj6H6VIFbSYNO1/awpVoS4T71JkkQcKcj0mfg0cD
         Fx1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750680047; x=1751284847;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lP9R0DOq1lsif1WN+MzCn3iMNJnOUN1ymxq6FgDXFH4=;
        b=bs0GBVSFjikpPx9H4nA7SfoRJWwK0pKdBD5Fbo5FlV+67tY9m1wkUR1hvA+Re4Cg3X
         bTqjHla6z+tS3huobBFc2kpd/RzOXeuO2QueDyIUPeAuZutw/uxuc/EMfVWfgqfyoyia
         FWWYuSY827bABgHfVq8JG9jx7ZttokTfwSpVyC3cyAl9L6mx3777Lsi/R4OdkM9weJym
         cp7e0bmaA8umevU9mH8b5AudcLuIJzqPt3IBqa+U8gAm6SmEyheP8wE8blchjhCxnU5H
         rVHlxzToBe/1HdlgI9ZAwVFbezGC8Af3qzkknkdJIBDNw5xruzJSE+WEeCb/lHrbWMoV
         3dCA==
X-Gm-Message-State: AOJu0Yyz98QM9UWEYGknrLu7sktnzZ3dt0wNrnYJAQHzD6Cg7JEpi338
	4VzACDuPMqrrZy9cxJomAak5JRkXTH4yig0RhCEhCbxZuu1CZRm97xmeeA272ATpbng=
X-Gm-Gg: ASbGncsPv6cFu6kc6Fq+kMGLg6Xivan578RHwLb2gyAXioyuqMkQ2iU0DHdfNwLl7CX
	sX05I/0VDqjQWwsQJwhoBaBVXzUOLjTUoL3GWEqaeRkPLYWoFUctVbU1Hw84bYy98BUUtbFr3u+
	xGg0fmyEdhubNwl/1p74RUYUZqkhPPmjAy0B7Go29f1NhX73/wR/jFE0/wUXRqoaHykRYFE8Dlq
	TjPBxo4rA2aHrhdAIZVGdyT85LN5ItJRhzpmJyDw3lEaUV7hYhO8ND+46IahKETYvUr16FX5g2P
	DQWLeg0MsA8rHxnr4ZudDWQ0+rmp4z9r9soImChCIj3u1yCNQjqrTbgC32CWsD9hy7kp8/TnYOi
	Q4bGvcfFsfqyoiWVhIzHjC0SzWCitmmHasadUeZfn
X-Google-Smtp-Source: AGHT+IEL4AiJTCRdGv36IlSqRDyzbEXMdSslHAtZOU2vAs0tOApYVXi0OBGTgAq1Wz64oX+HiIU1cg==
X-Received: by 2002:a05:6512:3c87:b0:553:a32a:6c4 with SMTP id 2adb3069b0e04-553e3d14dfemr1070799e87.12.1750680046360;
        Mon, 23 Jun 2025 05:00:46 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41cc029sm1391817e87.207.2025.06.23.05.00.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 05:00:46 -0700 (PDT)
Message-ID: <26ff89ba-4a24-4e71-af53-fa71c489963c@linaro.org>
Date: Mon, 23 Jun 2025 15:00:45 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] media: qcom: camss: change internals of endpoint
 parsing to fwnode handling
Content-Language: ru-RU
To: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss
 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250513142353.2572563-1-vladimir.zapolskiy@linaro.org>
 <20250513142353.2572563-8-vladimir.zapolskiy@linaro.org>
 <9ff883f4-e7cc-4b2c-8f12-f583ef5182d0@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <9ff883f4-e7cc-4b2c-8f12-f583ef5182d0@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/23/25 12:29, neil.armstrong@linaro.org wrote:
> On 13/05/2025 16:23, Vladimir Zapolskiy wrote:
>> Since a few called V4L2 functions operate with fwnode arguments the change
>> from OF device nodes to fwnodes brings a simplification to the code.
>>
>> Because camss_probe() as the single caller of camss_of_parse_endpoint_node()
>> has no need to know a number of async registered remote devices, it makes
>> sense to remove the related computation from it. In addition there is no
>> reason to check for a OF device availability on CAMSS side, the check is
>> useless as the always passed one.
> 
> I think you should explain why it's useless, TBH I'm not even sure why it's
> not necessary. What if we set the remote endpoint as disabled, this is
> a regression, no ?

Here the check of_device_is_available(node) verifies CAMSS endpoint "subdevice"
node availability, it's not about remote endpoints, and there is no such
usecases.

> Why not replace it with  fwnode_device_is_available() and remove it in another
> patch really explaining why it's useless ?
> 

Probably the commit message could be improved anyway, thank you.

Best wishes,
Vladimir

>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>    drivers/media/platform/qcom/camss/camss.c | 52 ++++++++++-------------
>>    1 file changed, 23 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
>> index 39c5472f4552..d4745fb21152 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -2973,16 +2973,16 @@ static const struct parent_dev_ops vfe_parent_dev_ops = {
>>    };
>>    
>>    /*
>> - * camss_of_parse_endpoint_node - Parse port endpoint node
>> - * @dev: Device
>> - * @node: Device node to be parsed
>> + * camss_parse_endpoint_node - Parse port endpoint node
>> + * @dev: CAMSS device
>> + * @ep: Device endpoint to be parsed
>>     * @csd: Parsed data from port endpoint node
>>     *
>>     * Return 0 on success or a negative error code on failure
>>     */
>> -static int camss_of_parse_endpoint_node(struct device *dev,
>> -					struct device_node *node,
>> -					struct camss_async_subdev *csd)
>> +static int camss_parse_endpoint_node(struct device *dev,
>> +				     struct fwnode_handle *ep,
>> +				     struct camss_async_subdev *csd)
>>    {
>>    	struct csiphy_lanes_cfg *lncfg = &csd->interface.csi2.lane_cfg;
>>    	struct v4l2_mbus_config_mipi_csi2 *mipi_csi2;
>> @@ -2990,7 +2990,7 @@ static int camss_of_parse_endpoint_node(struct device *dev,
>>    	unsigned int i;
>>    	int ret;
>>    
>> -	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(node), &vep);
>> +	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
>>    	if (ret)
>>    		return ret;
>>    
>> @@ -3025,52 +3025,46 @@ static int camss_of_parse_endpoint_node(struct device *dev,
>>    }
>>    
>>    /*
>> - * camss_of_parse_ports - Parse ports node
>> - * @dev: Device
>> - * @notifier: v4l2_device notifier data
>> + * camss_parse_ports - Parse ports node
>> + * @dev: CAMSS device
>>     *
>> - * Return number of "port" nodes found in "ports" node
>> + * Return 0 on success or a negative error code on failure
>>     */
>> -static int camss_of_parse_ports(struct camss *camss)
>> +static int camss_parse_ports(struct camss *camss)
>>    {
>>    	struct device *dev = camss->dev;
>> -	struct device_node *node = NULL;
>> -	struct device_node *remote = NULL;
>> -	int ret, num_subdevs = 0;
>> +	struct fwnode_handle *fwnode = dev_fwnode(dev), *ep;
>> +	int ret;
>>    
>> -	for_each_endpoint_of_node(dev->of_node, node) {
>> +	fwnode_graph_for_each_endpoint(fwnode, ep) {
>>    		struct camss_async_subdev *csd;
>> +		struct fwnode_handle *remote;
>>    
>> -		if (!of_device_is_available(node))
>> -			continue;
>> -
>> -		remote = of_graph_get_remote_port_parent(node);
>> +		remote = fwnode_graph_get_remote_port_parent(ep);
>>    		if (!remote) {
>>    			dev_err(dev, "Cannot get remote parent\n");
>>    			ret = -EINVAL;
>>    			goto err_cleanup;
>>    		}
>>    
>> -		csd = v4l2_async_nf_add_fwnode(&camss->notifier,
>> -					       of_fwnode_handle(remote),
>> +		csd = v4l2_async_nf_add_fwnode(&camss->notifier, remote,
>>    					       struct camss_async_subdev);
>> -		of_node_put(remote);
>> +		fwnode_handle_put(remote);
>>    		if (IS_ERR(csd)) {
>>    			ret = PTR_ERR(csd);
>>    			goto err_cleanup;
>>    		}
>>    
>> -		ret = camss_of_parse_endpoint_node(dev, node, csd);
>> +		ret = camss_parse_endpoint_node(dev, ep, csd);
>>    		if (ret < 0)
>>    			goto err_cleanup;
>> -
>> -		num_subdevs++;
>>    	}
>>    
>> -	return num_subdevs;
>> +	return 0;
>>    
>>    err_cleanup:
>> -	of_node_put(node);
>> +	fwnode_handle_put(ep);
>> +
>>    	return ret;
>>    }
>>    
>> @@ -3626,7 +3620,7 @@ static int camss_probe(struct platform_device *pdev)
>>    
>>    	pm_runtime_enable(dev);
>>    
>> -	ret = camss_of_parse_ports(camss);
>> +	ret = camss_parse_ports(camss);
>>    	if (ret < 0)
>>    		goto err_v4l2_device_unregister;
>>    
> 


