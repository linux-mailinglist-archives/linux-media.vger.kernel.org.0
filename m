Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9273527E324
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 09:58:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728517AbgI3H6D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 03:58:03 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:53832 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728346AbgI3H6C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 03:58:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1601452680; x=1604044680;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=kvl8BYqZgXTE9BD8VYIRmNhOFj5oxL/eJlT+ZItkZFY=;
        b=qM/m6ssZtS4JgSNNX0sJzyjIojqnU6R5IR0iHLtUpi3BvqI/BuW1giA1f/LHM/8r
        5xdLbizzGHCY5qkKXrRpk0gQ3OjzfRSpo4BrYSZxz8VHw1hEyqPbZuZ2uliYE3wp
        1VLdxaE3fFsArJENJuKPe3zVCnUyn3LQWNBjf9n6PA0=;
X-AuditID: c39127d2-253ff70000001c25-a4-5f743a884fb7
Received: from idefix.phytec.de (Unknown_Domain [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 8A.18.07205.88A347F5; Wed, 30 Sep 2020 09:58:00 +0200 (CEST)
Received: from [172.16.23.108] ([172.16.23.108])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2020093009580042-523886 ;
          Wed, 30 Sep 2020 09:58:00 +0200 
Subject: Re: [PATCH 4/5] media: mt9p031: Make pixel clock polarity
 configurable by DT
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christian Hemp <c.hemp@phytec.de>
References: <20200925075029.32181-1-s.riedmueller@phytec.de>
 <20200925075029.32181-4-s.riedmueller@phytec.de>
 <20200925200741.GW26842@paasikivi.fi.intel.com>
From:   =?UTF-8?Q?Stefan_Riedm=c3=bcller?= <s.riedmueller@phytec.de>
Message-ID: <9e4c70ec-a359-bbcd-5650-b68ea5f0b312@phytec.de>
Date:   Wed, 30 Sep 2020 09:58:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200925200741.GW26842@paasikivi.fi.intel.com>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 30.09.2020 09:58:00,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 30.09.2020 09:58:00,
        Serialize complete at 30.09.2020 09:58:00
X-TNEFEvaluated: 1
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPLMWRmVeSWpSXmKPExsWyRoCBS7fDqiTeoHWpikXnxCXsFpd3zWGz
        6NmwldVi2aY/TBaftnxjcmD1mN0xk9Vj06pONo95JwM9Pm+SC2CJ4rJJSc3JLEst0rdL4MpY
        27iTrWCHXEXjnB72BsbzEl2MnBwSAiYSTa/WMHUxcnEICWxjlPh3v5cVwjnDKDGx+QojSJWw
        QLjEipfT2LsYOThEBPQlJj0wA6lhFjjEKNHQOZsdomEho8TdfevZQRrYBJwkFp/vYANp4BWw
        kdiwpBYkzCKgKrFx9jRWkLCoQKTEzh2WIGFeAUGJkzOfsIDYnEDVv4+tYwMZKSHQyCRxo2k7
        I8SlQhKnF59lBrGZBeQltr+dA2WbSczb/BDKFpe49WQ+0wRGoVlI5s5C0jILScssJC0LGFlW
        MQrlZiZnpxZlZusVZFSWpCbrpaRuYgRGwuGJ6pd2MPbN8TjEyMTBCPQ0B7OSCK9vTkG8EG9K
        YmVValF+fFFpTmrxIUZpDhYlcd4NvCVhQgLpiSWp2ampBalFMFkmDk6pBkbePf6CtQJT+2fb
        91oI/+NL5JU61u8kbhbHEhzFxq9rWisXp1bx/0nU1hknH1lnTnJVvNX99eApSe2zjjZf55Ye
        rp4t8WgGx/SQldqFR1/ZGj4o62079X+bTHNLSb+P3IytNyyE00+mGFV7SM5Zy8kndPtocZ9G
        0HYBlmNGjEYVdkkaN4wZlFiKMxINtZiLihMBo+XwTHICAAA=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

thanks for your review.

On 25.09.20 22:07, Sakari Ailus wrote:
> Hi Stefan,
> 
> Thanks for the patchset.
> 
> On Fri, Sep 25, 2020 at 09:50:28AM +0200, Stefan Riedmueller wrote:
>> From: Christian Hemp <c.hemp@phytec.de>
>>
>> Evaluate the desired pixel clock polarity from the device tree.
>>
>> Signed-off-by: Christian Hemp <c.hemp@phytec.de>
>> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
>> ---
>>   drivers/media/i2c/Kconfig   |  1 +
>>   drivers/media/i2c/mt9p031.c | 19 ++++++++++++++++++-
>>   include/media/i2c/mt9p031.h |  1 +
>>   3 files changed, 20 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>> index c7ba76fee599..7c026daeacf0 100644
>> --- a/drivers/media/i2c/Kconfig
>> +++ b/drivers/media/i2c/Kconfig
>> @@ -1103,6 +1103,7 @@ config VIDEO_MT9P031
>>   	select MEDIA_CONTROLLER
>>   	select VIDEO_V4L2_SUBDEV_API
>>   	select VIDEO_APTINA_PLL
>> +	select V4L2_FWNODE
>>   	help
>>   	  This is a Video4Linux2 sensor driver for the Aptina
>>   	  (Micron) mt9p031 5 Mpixel camera.
>> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
>> index f5d6a7890c47..8f8ee37a2dd2 100644
>> --- a/drivers/media/i2c/mt9p031.c
>> +++ b/drivers/media/i2c/mt9p031.c
>> @@ -27,6 +27,7 @@
>>   #include <media/v4l2-async.h>
>>   #include <media/v4l2-ctrls.h>
>>   #include <media/v4l2-device.h>
>> +#include <media/v4l2-fwnode.h>
>>   #include <media/v4l2-subdev.h>
>>   
>>   #include "aptina-pll.h"
>> @@ -399,6 +400,14 @@ static int __mt9p031_set_power(struct mt9p031 *mt9p031, bool on)
>>   		return ret;
>>   	}
>>   
>> +	/* Configure the pixel clock polarity */
>> +	if (mt9p031->pdata && mt9p031->pdata->pixclk_pol) {
>> +		ret = mt9p031_write(client, MT9P031_PIXEL_CLOCK_CONTROL,
>> +				MT9P031_PIXEL_CLOCK_INVERT);
>> +		if (ret < 0)
>> +			return ret;
>> +	}
>> +
>>   	return v4l2_ctrl_handler_setup(&mt9p031->ctrls);
>>   }
>>   
>> @@ -1062,7 +1071,8 @@ static const struct v4l2_subdev_internal_ops mt9p031_subdev_internal_ops = {
>>   static struct mt9p031_platform_data *
>>   mt9p031_get_pdata(struct i2c_client *client)
>>   {
>> -	struct mt9p031_platform_data *pdata;
>> +	struct mt9p031_platform_data *pdata = NULL;
>> +	struct v4l2_fwnode_endpoint endpoint;
> 
> Could you initialise the bus_type field to a valid value? I suppose this
> sensor only supports one of them? That way you'll also initialise the rest
> of the struct fields to zero.

Yes, I'll do that and send a v2.

Thanks,
Stefan

> 
>>   	struct device_node *np;
>>   
>>   	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
>> @@ -1072,6 +1082,10 @@ mt9p031_get_pdata(struct i2c_client *client)
>>   	if (!np)
>>   		return NULL;
>>   
>> +	endpoint.bus_type = V4L2_MBUS_UNKNOWN;
>> +	if (v4l2_fwnode_endpoint_parse(of_fwnode_handle(np), &endpoint) < 0)
>> +		goto done;
>> +
>>   	pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
>>   	if (!pdata)
>>   		goto done;
>> @@ -1079,6 +1093,9 @@ mt9p031_get_pdata(struct i2c_client *client)
>>   	of_property_read_u32(np, "input-clock-frequency", &pdata->ext_freq);
>>   	of_property_read_u32(np, "pixel-clock-frequency", &pdata->target_freq);
>>   
>> +	pdata->pixclk_pol = !!(endpoint.bus.parallel.flags &
>> +			       V4L2_MBUS_PCLK_SAMPLE_RISING);
>> +
>>   done:
>>   	of_node_put(np);
>>   	return pdata;
>> diff --git a/include/media/i2c/mt9p031.h b/include/media/i2c/mt9p031.h
>> index 7c29c53aa988..f933cd0be8e5 100644
>> --- a/include/media/i2c/mt9p031.h
>> +++ b/include/media/i2c/mt9p031.h
>> @@ -10,6 +10,7 @@ struct v4l2_subdev;
>>    * @target_freq: Pixel clock frequency
>>    */
>>   struct mt9p031_platform_data {
>> +	unsigned int pixclk_pol:1;
>>   	int ext_freq;
>>   	int target_freq;
>>   };
> 
