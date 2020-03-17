Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A90FC18824D
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 12:35:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725995AbgCQLfG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 07:35:06 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:45024 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbgCQLfF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 07:35:05 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02HBZ1d2125529;
        Tue, 17 Mar 2020 06:35:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584444901;
        bh=ZoXn5mBy0StwLTlJF1bWkMWe5t6+JfpFXOnCik1dFBc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=XIRwAMQZN9yDflzXIDBUohAqikg4wv70H/3kn9SjOkd7S+X5f3/8qj9VFQ+6PCqZb
         pkJVmxNkOmugu0SiPu+b55NsKrW/5fHUsKM+P87pxdnxn4W7MBUiwzxN2/lKMlWdcK
         WEaHNBoRsRi4Gn26/Z7lD0riFfVxwn989u2knQng=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02HBZ1uk044394
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 17 Mar 2020 06:35:01 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Mar 2020 06:35:00 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Mar 2020 06:35:00 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02HBYxhs098414;
        Tue, 17 Mar 2020 06:34:59 -0500
Subject: Re: [PATCH 14/16] media: ti-vpe: cal: improve wait for CIO resetdone
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20200313114121.32182-1-tomi.valkeinen@ti.com>
 <20200313114121.32182-14-tomi.valkeinen@ti.com>
 <20200316124319.GG4732@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <0c3296cb-e0f8-e97e-74fa-be766aa08b77@ti.com>
Date:   Tue, 17 Mar 2020 13:34:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200316124319.GG4732@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/03/2020 14:43, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Fri, Mar 13, 2020 at 01:41:19PM +0200, Tomi Valkeinen wrote:
>> Sometimes waiting for ComplexIO resetdone timeouts. Testing shows that
>> sometimes we need to wait more than what the current code does. It is
>> not clear how long this wait can be, but it is based on how quickly the
>> sensor provides a valid clock, and how quickly CAL syncs to it.
>>
>> Change the code to make it more obvious how long we'll wait, and set a
>> wider range for usleep_range. Increase the timeout to 750ms.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> ---
>>   drivers/media/platform/ti-vpe/cal.c | 13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
>> index 319312770eea..929f9b3ca4f9 100644
>> --- a/drivers/media/platform/ti-vpe/cal.c
>> +++ b/drivers/media/platform/ti-vpe/cal.c
>> @@ -824,20 +824,21 @@ static void csi2_phy_init(struct cal_ctx *ctx)
>>   
>>   static void csi2_wait_complexio_reset(struct cal_ctx *ctx)
>>   {
>> -	int i;
>> +	unsigned long timeout;
>>   
>> -	for (i = 0; i < 250; i++) {
>> +	timeout = jiffies + msecs_to_jiffies(750);
>> +	while (time_before(jiffies, timeout)) {
>>   		if (reg_read_field(ctx->dev,
>>   				   CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
>>   				   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_MASK) ==
>>   		    CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETCOMPLETED)
>>   			break;
>> -		usleep_range(1000, 1100);
>> +		usleep_range(500, 5000);
>>   	}
> 
> How about using readx_poll_timeout() ?

There's no function that directly fits readx_poll_timeout's accessor function, so I think using 
readl_poll_timeout and calculating the address manually would be the way to use *_poll_timeout.

But it does skip the register access functions the driver uses (reg_read/write).

So... It would be nice to use *_poll_timeout, but I'm not sure if it worth breaking the register 
access model the driver uses.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
