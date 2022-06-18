Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 929B955079A
	for <lists+linux-media@lfdr.de>; Sun, 19 Jun 2022 01:59:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbiFRX7E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jun 2022 19:59:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiFRX7D (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jun 2022 19:59:03 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 032F1E0B2
        for <linux-media@vger.kernel.org>; Sat, 18 Jun 2022 16:59:02 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id E52A883F22;
        Sun, 19 Jun 2022 01:59:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1655596741;
        bh=YsS/YswDvO+DTZh7265vaCaRVqgA+2+VHnQ3SqipbgI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=nOe3w9a6u4XkhPOY0yrxCVJUghfKt+avpN/f/VDpzvQC9FUoPesVk5b0jzqGQv6jE
         WCXvyh5mH3yc/04QxurNCW+zbo4N/G0ufggccSgxy7LTHJhD0271dzwaiyZACxMOb9
         4aQrTGxFpgPnAXui4LBWvn3yEIc9woteQ4iTE8sAibblFTAIMw+SucmNwqAel53zTc
         9nddFLuheDW8V/7IRPnJ9i/mMd+u+WQ7LWEAvHFGXLNjCO13ggdzkmNbLQbB3PvcOj
         DV9BQ9wfvGKfIydCwTEbU5HuxF8KeYu6upbpDaClJxENURHjGRRgwkopjnViEhCknU
         VHgfqYWiPZjEg==
Message-ID: <42409710-0026-9051-bd31-6cdf7e2a7c51@denx.de>
Date:   Sun, 19 Jun 2022 01:35:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] media: mt9p031: Implement crop bounds get selection
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Stefan Riedmueller <s.riedmueller@phytec.de>
References: <20220618222108.478082-1-marex@denx.de>
 <Yq5chmhukcvv2rGd@pendragon.ideasonboard.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <Yq5chmhukcvv2rGd@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,PDS_OTHER_BAD_TLD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/19/22 01:15, Laurent Pinchart wrote:
> Hi Marek,
> 
> Thank you for the patch.
> 
> On Sun, Jun 19, 2022 at 12:21:08AM +0200, Marek Vasut wrote:
>> Implement V4L2_SEL_TGT_CROP_BOUNDS query in get_selection subdev op
>> for this sensor. This is required e.g. to bind it to STM32MP15x DCMI.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
>> Cc: Stefan Riedmueller <s.riedmueller@phytec.de>
>> ---
>>   drivers/media/i2c/mt9p031.c | 18 +++++++++++++-----
>>   1 file changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
>> index cbce8b88dbcf5..e73e814c60207 100644
>> --- a/drivers/media/i2c/mt9p031.c
>> +++ b/drivers/media/i2c/mt9p031.c
>> @@ -623,12 +623,20 @@ static int mt9p031_get_selection(struct v4l2_subdev *subdev,
>>   {
>>   	struct mt9p031 *mt9p031 = to_mt9p031(subdev);
>>   
>> -	if (sel->target != V4L2_SEL_TGT_CROP)
>> +	switch (sel->target) {
>> +	case V4L2_SEL_TGT_CROP_BOUNDS:
>> +		sel->r.left = MT9P031_COLUMN_START_DEF;
>> +		sel->r.top = MT9P031_ROW_START_DEF;
> 
> Shouldn't this be MT9P031_COLUMN_START_MIN and MT9P031_ROW_START_MIN ?
> 
>> +		sel->r.width = MT9P031_WINDOW_WIDTH_DEF;
>> +		sel->r.height = MT9P031_WINDOW_HEIGHT_DEF;
> 
> And here MT9P031_WINDOW_WIDTH_MAX and MT9P031_WINDOW_HEIGHT_MAX ?

What makes you think that ?
