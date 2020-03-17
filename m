Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF32188269
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 12:44:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgCQLoo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 07:44:44 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:45776 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbgCQLon (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 07:44:43 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02HBiefq127475;
        Tue, 17 Mar 2020 06:44:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584445480;
        bh=M2jbGrX9MfvVVcPyy/+v0tcsR9jNwCdl9LcS52r17uw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Nm+dkTRu9/xCLJBnFzfLd96n6Nv0viLDV5TLyUDroCUmGgXOJO8UE6u5mKSzgbUlx
         S9rly7MHAmv+JUfUqsjjriDwR1hHHBV+seJUxKHFCg6dcs2Ctun4ulT+hmcXkCQLvX
         VYQWjOBqJ2b08nyOhOBq5XkCPt8f3AJhJz31Siic=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02HBievd031961;
        Tue, 17 Mar 2020 06:44:40 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Mar 2020 06:44:39 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Mar 2020 06:44:39 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02HBicch039380;
        Tue, 17 Mar 2020 06:44:38 -0500
Subject: Re: [PATCH 15/16] media: ti-vpe: cal: improve wait for stop-state
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20200313114121.32182-1-tomi.valkeinen@ti.com>
 <20200313114121.32182-15-tomi.valkeinen@ti.com>
 <20200316124507.GH4732@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <695d6407-5091-bbf5-a94f-a2e23877dc29@ti.com>
Date:   Tue, 17 Mar 2020 13:44:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200316124507.GH4732@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/03/2020 14:45, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Fri, Mar 13, 2020 at 01:41:20PM +0200, Tomi Valkeinen wrote:
>> Sometimes waiting for stop-state timeouts. Testing shows that sometimes
>> we need to wait more than what the current code does. It is not clear
>> how long this wait can be, but it is based on how quickly the sensor
>> provides a valid clock, and how quickly CAL syncs to it.
>>
>> Change the code to make it more obvious how long we'll wait, and set a
>> wider range for usleep_range. Increase the timeout to 750ms.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> ---
>>   drivers/media/platform/ti-vpe/cal.c | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
>> index 929f9b3ca4f9..df5a4281838b 100644
>> --- a/drivers/media/platform/ti-vpe/cal.c
>> +++ b/drivers/media/platform/ti-vpe/cal.c
>> @@ -849,19 +849,19 @@ static void csi2_wait_complexio_reset(struct cal_ctx *ctx)
>>   
>>   static void csi2_wait_stop_state(struct cal_ctx *ctx)
>>   {
>> -	int i;
>> +	unsigned long timeout;
>>   
>> -	for (i = 0; i < 10; i++) {
>> +	timeout = jiffies + msecs_to_jiffies(750);
>> +	while (time_before(jiffies, timeout)) {
>>   		if (reg_read_field(ctx->dev,
>>   				   CAL_CSI2_TIMING(ctx->csi2_port),
>>   				   CAL_CSI2_TIMING_FORCE_RX_MODE_IO1_MASK) == 0)
>>   			break;
>> -		usleep_range(1000, 1100);
>> +		usleep_range(500, 5000);
>>   	}
> 
> Same here, readx_poll_timeout() ?
> 
>> -	ctx_dbg(3, ctx, "CAL_CSI2_TIMING(%d) = 0x%08x Stop State Reached %s\n",
>> +	ctx_dbg(3, ctx, "CAL_CSI2_TIMING(%d) = 0x%08x Stop State Reached\n",
>>   		ctx->csi2_port,
>> -		reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port)),
>> -		(i >= 10) ? "(timeout)" : "");
>> +		reg_read(ctx->dev, CAL_CSI2_TIMING(ctx->csi2_port)));
> 
> That's not correct anymore, if the condition is false then the stop
> state hasn't been reached.

It wasn't exactly correct earlier either, as it always said "stop state reached", although it had 
"(timeout)" too.

> Is this debug statement really useful ?

I did not find any of these debug prints useful in my debugging, but as this is not "my" driver, I 
didn't want to drop them.

But I'll drop the debug print here and in the previous patch. Benoit can comment if he wants them back.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
