Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3126E75AAEB
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 11:33:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbjGTJdP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 05:33:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231211AbjGTJc7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 05:32:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 708312705
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 02:27:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F05546133D
        for <linux-media@vger.kernel.org>; Thu, 20 Jul 2023 09:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F4EC433C7;
        Thu, 20 Jul 2023 09:27:53 +0000 (UTC)
Message-ID: <62b03784-1f93-e370-3df6-f9ae4409ae5c@xs4all.nl>
Date:   Thu, 20 Jul 2023 11:27:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] media: i2c: ov01a10: Switch back to use struct
 i2c_driver::probe
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     kernel@pengutronix.de, linux-media@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>
References: <20230626090533.556406-1-u.kleine-koenig@pengutronix.de>
 <20230720090202.aljhzxiac6pvmtag@pengutronix.de>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230720090202.aljhzxiac6pvmtag@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/07/2023 11:02, Uwe Kleine-König wrote:
> Hello,
> 
> On Mon, Jun 26, 2023 at 11:05:33AM +0200, Uwe Kleine-König wrote:
>> struct i2c_driver::probe_new is about to go away. Switch the driver to
>> use the probe callback with the same prototype.
>>
>> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>> ---
>>  drivers/media/i2c/ov01a10.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
>> index de5bc19e715b..2b9e1b3a3bf4 100644
>> --- a/drivers/media/i2c/ov01a10.c
>> +++ b/drivers/media/i2c/ov01a10.c
>> @@ -992,7 +992,7 @@ static struct i2c_driver ov01a10_i2c_driver = {
>>  		.pm = &ov01a10_pm_ops,
>>  		.acpi_match_table = ACPI_PTR(ov01a10_acpi_ids),
>>  	},
>> -	.probe_new = ov01a10_probe,
>> +	.probe = ov01a10_probe,
>>  	.remove = ov01a10_remove,
>>  };
> 
> I plan to ask Wolfram to merge a patch into i2c-next dropping .probe_new
> for v6.7-rc1. I want to get this early into next after v6.6-rc1, so it
> would be great to get this patch in before v6.6-rc1.
> 
> If this won't happen, the backup plan is to send this patch together
> with the change of i2c_driver for Wolfram to merge via the i2c tree.
> 
> Is this patch still (or at all) on someone's radar for merging?

I merged this yesterday in our staging tree for 6.6. Did you get an email
from patchwork?

https://patchwork.linuxtv.org/project/linux-media/patch/20230626090533.556406-1-u.kleine-koenig@pengutronix.de/

I also merged yesterday your patch converting three more drivers:

https://patchwork.linuxtv.org/project/linux-media/patch/20230718204541.3955386-1-u.kleine-koenig@pengutronix.de/

Regards,

	Hans

> 
> Best regards
> Uwe
> 

