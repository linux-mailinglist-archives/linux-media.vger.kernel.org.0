Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD8F8680BC4
	for <lists+linux-media@lfdr.de>; Mon, 30 Jan 2023 12:19:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236394AbjA3LTY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Jan 2023 06:19:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235330AbjA3LTX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Jan 2023 06:19:23 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C376018AA4
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 03:19:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 715EDB80F9E
        for <linux-media@vger.kernel.org>; Mon, 30 Jan 2023 11:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0809C433D2;
        Mon, 30 Jan 2023 11:19:16 +0000 (UTC)
Message-ID: <aa915c48-14e6-4bdc-09da-644dfedd4f57@xs4all.nl>
Date:   Mon, 30 Jan 2023 12:19:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] media: tc358746: init m/p_best to 0
Content-Language: en-US
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <15030a07-3615-fca0-1891-a234dc054b00@xs4all.nl>
 <20230130105912.vufkpuhiejuyipt7@pengutronix.de>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20230130105912.vufkpuhiejuyipt7@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marco,

I rejected my own patch :-)

It turned out that I was testing with gcc-11 instead of 12. The latest gcc
version doesn't report this warning.

Regards,

	Hans

On 30/01/2023 11:59, Marco Felsch wrote:
> Hi Hans,
> 
> thanks for the patch.
> 
> On 23-01-30, Hans Verkuil wrote:
>> This fixes compiler warnings:
>>
>> In file included from include/linux/printk.h:566,
>>                  from include/linux/kernel.h:29,
>>                  from include/linux/clk.h:13,
>>                  from drivers/media/i2c/tc358746.c:12:
>> drivers/media/i2c/tc358746.c: In function 'tc358746_find_pll_settings':
>> include/linux/dynamic_debug.h:272:33: warning: 'p_best' may be used uninitialized in this function [-Wmaybe-uninitialized]
>>   272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
>>       |                                 ^~~~~~~~~~~~~~~~~
>> drivers/media/i2c/tc358746.c:817:13: note: 'p_best' was declared here
>>   817 |         u16 p_best, p;
>>       |             ^~~~~~
>> In file included from include/linux/printk.h:566,
>>                  from include/linux/kernel.h:29,
>>                  from include/linux/clk.h:13,
>>                  from drivers/media/i2c/tc358746.c:12:
>> include/linux/dynamic_debug.h:272:33: warning: 'm_best' may be used uninitialized in this function [-Wmaybe-uninitialized]
>>   272 |         _dynamic_func_call(fmt, __dynamic_dev_dbg,              \
>>       |                                 ^~~~~~~~~~~~~~~~~
>> drivers/media/i2c/tc358746.c:816:13: note: 'm_best' was declared here
>>   816 |         u16 m_best, mul;
>>       |             ^~~~~~
> 
> I'm not sure why this is printed. The m/p_best variables are only used
> if best_freq != 0 else it is not used. If best_freq != 0 m/p_best is set
> to the found mul/p. So IMHO this is a false positiv from the compiler.
> 
>> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> to make the compiler happy:
> 
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> 
> Regards,
>   Marco
> 
>> ---
>>  drivers/media/i2c/tc358746.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
>> index d1f552bd81d4..b86baa5c2d82 100644
>> --- a/drivers/media/i2c/tc358746.c
>> +++ b/drivers/media/i2c/tc358746.c
>> @@ -813,8 +813,8 @@ static unsigned long tc358746_find_pll_settings(struct tc358746 *tc358746,
>>  	u32 min_delta = 0xffffffff;
>>  	u16 prediv_max = 17;
>>  	u16 prediv_min = 1;
>> -	u16 m_best, mul;
>> -	u16 p_best, p;
>> +	u16 m_best = 0, mul;
>> +	u16 p_best = 0, p;
>>  	u8 postdiv;
>>
>>  	if (fout > 1000 * HZ_PER_MHZ) {
>> -- 
>> 2.39.0
>>
>>
>>

