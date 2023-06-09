Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF21A72964A
	for <lists+linux-media@lfdr.de>; Fri,  9 Jun 2023 12:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbjFIKHx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jun 2023 06:07:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241299AbjFIKGw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Jun 2023 06:06:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D4DF7D8A
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 02:57:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8B9B661D7D
        for <linux-media@vger.kernel.org>; Fri,  9 Jun 2023 09:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CAF8C433EF;
        Fri,  9 Jun 2023 09:57:18 +0000 (UTC)
Message-ID: <13016489-84f8-e8c0-54dc-af53dfb41fde@xs4all.nl>
Date:   Fri, 9 Jun 2023 11:57:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] media: i2c: adp1653: don't reuse the same node pointer
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <da55b552-08ce-6bbe-c70b-eda6f53727f0@xs4all.nl>
 <ZIL1SCUUzd/xbJ+/@kekkonen.localdomain>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <ZIL1SCUUzd/xbJ+/@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/06/2023 11:47, Sakari Ailus wrote:
> Hi Hans,
> 
> Thanks for the patch.
> 
> On Fri, Jun 09, 2023 at 11:43:14AM +0200, Hans Verkuil wrote:
>> The child device_node pointer was used for two different childs.
>> This confused smatch, causing this warning:
>>
>> drivers/media/i2c/adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
>>
>> Use two different pointers, one for each child node, and add separate
>> goto labels for each node as well. This also improves error logging
>> since it will now state for which node the property was missing.
> 
> It would have been better to fix smatch. :-(

It was fixed for certain corner cases of this issue, but that didn't
cover this particular driver.

It's just not quite smart enough to follow the logic here since it
uses the same pointer for two different device nodes.

Regards,

	Hans

> 
> I guess changing the driver isn't wrong either still.
> 
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>> diff --git a/drivers/media/i2c/adp1653.c b/drivers/media/i2c/adp1653.c
>> index 98ca417b8004..04ec465aaa94 100644
>> --- a/drivers/media/i2c/adp1653.c
>> +++ b/drivers/media/i2c/adp1653.c
>> @@ -411,43 +411,43 @@ static int adp1653_of_init(struct i2c_client *client,
>>  			   struct device_node *node)
>>  {
>>  	struct adp1653_platform_data *pd;
>> -	struct device_node *child;
>> +	struct device_node *node_flash, *node_indicator;
>>
>>  	pd = devm_kzalloc(&client->dev, sizeof(*pd), GFP_KERNEL);
>>  	if (!pd)
>>  		return -ENOMEM;
>>  	flash->platform_data = pd;
>>
>> -	child = of_get_child_by_name(node, "flash");
>> -	if (!child)
>> +	node_flash = of_get_child_by_name(node, "flash");
>> +	if (!node_flash)
>>  		return -EINVAL;
>>
>> -	if (of_property_read_u32(child, "flash-timeout-us",
>> +	if (of_property_read_u32(node_flash, "flash-timeout-us",
>>  				 &pd->max_flash_timeout))
>> -		goto err;
>> +		goto err_flash;
>>
>> -	if (of_property_read_u32(child, "flash-max-microamp",
>> +	if (of_property_read_u32(node_flash, "flash-max-microamp",
>>  				 &pd->max_flash_intensity))
>> -		goto err;
>> +		goto err_flash;
>>
>>  	pd->max_flash_intensity /= 1000;
>>
>> -	if (of_property_read_u32(child, "led-max-microamp",
>> +	if (of_property_read_u32(node_flash, "led-max-microamp",
>>  				 &pd->max_torch_intensity))
>> -		goto err;
>> +		goto err_flash;
>>
>>  	pd->max_torch_intensity /= 1000;
>> -	of_node_put(child);
>> +	of_node_put(node_flash);
> 
> How about moving this to where the other node is put, and initialise the
> nodes to NULL and so continue having a single error label?
> 
>>
>> -	child = of_get_child_by_name(node, "indicator");
>> -	if (!child)
>> +	node_indicator = of_get_child_by_name(node, "indicator");
>> +	if (!node_indicator)
>>  		return -EINVAL;
>>
>> -	if (of_property_read_u32(child, "led-max-microamp",
>> +	if (of_property_read_u32(node_indicator, "led-max-microamp",
>>  				 &pd->max_indicator_intensity))
>> -		goto err;
>> +		goto err_indicator;
>>
>> -	of_node_put(child);
>> +	of_node_put(node_indicator);
>>
>>  	pd->enable_gpio = devm_gpiod_get(&client->dev, "enable", GPIOD_OUT_LOW);
>>  	if (IS_ERR(pd->enable_gpio)) {
>> @@ -456,9 +456,13 @@ static int adp1653_of_init(struct i2c_client *client,
>>  	}
>>
>>  	return 0;
>> -err:
>> -	dev_err(&client->dev, "Required property not found\n");
>> -	of_node_put(child);
>> +err_flash:
>> +	dev_err(&client->dev, "Required flash property not found\n");
>> +	of_node_put(node_flash);
>> +	return -EINVAL;
>> +err_indicator:
>> +	dev_err(&client->dev, "Required indicator property not found\n");
>> +	of_node_put(node_indicator);
>>  	return -EINVAL;
>>  }
>>
> 

