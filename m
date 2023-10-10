Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55B637BF42B
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 09:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442419AbjJJH0c (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 03:26:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442528AbjJJHZC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 03:25:02 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C827718E
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 00:24:12 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78893C433C8;
        Tue, 10 Oct 2023 07:24:11 +0000 (UTC)
Message-ID: <d625a11a-11a4-41c5-a7f7-fa651649957e@xs4all.nl>
Date:   Tue, 10 Oct 2023 09:24:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] media: i2c: mt9m114: goto proper error path
Content-Language: en-US, nl
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org
References: <cover.1696586632.git.hverkuil-cisco@xs4all.nl>
 <6e2b3d5971905c1cf63184e7c3cd269c10151bb7.1696586632.git.hverkuil-cisco@xs4all.nl>
 <20231006151826.GB5121@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20231006151826.GB5121@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 06/10/2023 17:18, Laurent Pinchart wrote:
> Hi Hans,
> 
> Thank you for the patch.
> 
> On Fri, Oct 06, 2023 at 12:08:49PM +0200, Hans Verkuil wrote:
>> In two places the probe function returns instead of going
>> to the correct goto label.
>>
>> This fixes this smatch warning:
>>
>> drivers/media/i2c/mt9m114.c:2381 mt9m114_probe() warn: missing unwind goto?
>>
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> I've already submitted
> https://lore.kernel.org/linux-media/20231003192043.27690-1-laurent.pinchart@ideasonboard.com

Is it OK if I pick up your patch for this issue? I plan to pick up at least part
of this series tomorrow in order to cut down on the number of reported smatch
warnings.

Regards,

	Hans

> 
>> ---
>>  drivers/media/i2c/mt9m114.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
>> index dae675e52390..ac19078ceda3 100644
>> --- a/drivers/media/i2c/mt9m114.c
>> +++ b/drivers/media/i2c/mt9m114.c
>> @@ -2367,7 +2367,7 @@ static int mt9m114_probe(struct i2c_client *client)
>>  
>>  	ret = mt9m114_clk_init(sensor);
>>  	if (ret)
>> -		return ret;
>> +		goto error_ep_free;
>>  
>>  	/*
>>  	 * Identify the sensor. The driver supports runtime PM, but needs to
>> @@ -2378,7 +2378,7 @@ static int mt9m114_probe(struct i2c_client *client)
>>  	ret = mt9m114_power_on(sensor);
>>  	if (ret < 0) {
>>  		dev_err_probe(dev, ret, "Could not power on the device\n");
>> -		return ret;
>> +		goto error_ep_free;
>>  	}
>>  
>>  	ret = mt9m114_identify(sensor);
> 

