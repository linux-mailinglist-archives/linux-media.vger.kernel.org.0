Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FA4167DEAB
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 08:44:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232797AbjA0HoB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Jan 2023 02:44:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232784AbjA0Hn6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Jan 2023 02:43:58 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D361F39282
        for <linux-media@vger.kernel.org>; Thu, 26 Jan 2023 23:43:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7B293B81FB3
        for <linux-media@vger.kernel.org>; Fri, 27 Jan 2023 07:43:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86777C433D2;
        Fri, 27 Jan 2023 07:43:53 +0000 (UTC)
Message-ID: <7bd53f49-c7ae-db42-35a7-51d7b27d079c@xs4all.nl>
Date:   Fri, 27 Jan 2023 08:43:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Can smatch handle this better? (was: [PATCH 15/17] media: i2c:
 adp1653: introduce 'no_child' label)
To:     Dan Carpenter <error27@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20230126150657.367921-1-hverkuil-cisco@xs4all.nl>
 <20230126150657.367921-16-hverkuil-cisco@xs4all.nl>
 <Y9KaFkDXIWjiKPzc@kekkonen.localdomain>
Content-Language: en-US
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <Y9KaFkDXIWjiKPzc@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

While trying to clean up smatch warnings in the media subsystem I came
across a number of 'warn: missing unwind goto?' warnings that all had
the same root cause as illustrated by this patch: the 'unwind' path
just has a variation on printk(), it is not actually cleaning up anything.

As Sakari suggested, is this something that smatch can be improved for?
These false positives are a bit annoying.

You can see the whole series here if you are interested:

https://patchwork.linuxtv.org/project/linux-media/list/?series=9747

Regards,

	Hans

On 26/01/2023 16:19, Sakari Ailus wrote:
> Hi Hans,
> 
> On Thu, Jan 26, 2023 at 04:06:55PM +0100, Hans Verkuil wrote:
>> The code mixed gotos and returns, which confused smatch. Add a no_child
>> label before the 'return -EINVAL;' to help smatch understand this.
>> It's a bit more consistent as well.
>>
>> This fixes this smatch warning:
>>
>> adp1653.c:444 adp1653_of_init() warn: missing unwind goto?
> 
> This is clearly a false positive. There's also no reason to just have a
> label where you simply return a value.
> 
> Would it be possible to just fix smatch instead?
> 
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
>> ---
>>  drivers/media/i2c/adp1653.c | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/i2c/adp1653.c b/drivers/media/i2c/adp1653.c
>> index a61a77de6eee..136bca801db7 100644
>> --- a/drivers/media/i2c/adp1653.c
>> +++ b/drivers/media/i2c/adp1653.c
>> @@ -420,7 +420,7 @@ static int adp1653_of_init(struct i2c_client *client,
>>  
>>  	child = of_get_child_by_name(node, "flash");
>>  	if (!child)
>> -		return -EINVAL;
>> +		goto no_child;
>>  
>>  	if (of_property_read_u32(child, "flash-timeout-us",
>>  				 &pd->max_flash_timeout))
>> @@ -441,7 +441,7 @@ static int adp1653_of_init(struct i2c_client *client,
>>  
>>  	child = of_get_child_by_name(node, "indicator");
>>  	if (!child)
>> -		return -EINVAL;
>> +		goto no_child;
>>  
>>  	if (of_property_read_u32(child, "led-max-microamp",
>>  				 &pd->max_indicator_intensity))
>> @@ -459,6 +459,7 @@ static int adp1653_of_init(struct i2c_client *client,
>>  err:
>>  	dev_err(&client->dev, "Required property not found\n");
>>  	of_node_put(child);
>> +no_child:
>>  	return -EINVAL;
>>  }
>>  
> 

