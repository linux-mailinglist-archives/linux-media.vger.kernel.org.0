Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E22B187BB2
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 10:04:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbgCQJER (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 05:04:17 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:56758 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725872AbgCQJER (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 05:04:17 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02H94D2J088221;
        Tue, 17 Mar 2020 04:04:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584435853;
        bh=k4rmioWeFbTMw9hiNMlflMr6AKefkvjCId5PvEkXWco=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=tv7dzb57zheWPScqXRks3wmUs0AcIjFpXIa8opeeY0pdqzpprX0C0Vt0SnGt9WTnB
         o+XymH+Wpl42DiBc2JGp3TLKtVgMh4E0tn3Quh63iRB9OH1fOBm5c5wEOgS6yrLRfz
         oSqG5KIpe+jEzsh92aVJR6kdO7q2GOR2hAZ3N4ic=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02H94D6c038801
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 17 Mar 2020 04:04:13 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Mar 2020 04:04:12 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Mar 2020 04:04:12 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02H94AJP105804;
        Tue, 17 Mar 2020 04:04:11 -0500
Subject: Re: [PATCH 13/16] media: ti-vpe: cal: move code to separate functions
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20200313114121.32182-1-tomi.valkeinen@ti.com>
 <20200313114121.32182-13-tomi.valkeinen@ti.com>
 <20200316124141.GF4732@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <2ec39de6-f33c-48cb-5200-f5bd313bb05f@ti.com>
Date:   Tue, 17 Mar 2020 11:04:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200316124141.GF4732@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/03/2020 14:41, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Fri, Mar 13, 2020 at 01:41:18PM +0200, Tomi Valkeinen wrote:
>> To make csi2_wait_for_phy() more readable, move code to separate
>> functions.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> ---
>>   drivers/media/platform/ti-vpe/cal.c | 38 ++++++++++++++++++++---------
>>   1 file changed, 26 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
>> index 64ea92dbfac5..319312770eea 100644
>> --- a/drivers/media/platform/ti-vpe/cal.c
>> +++ b/drivers/media/platform/ti-vpe/cal.c
>> @@ -822,20 +822,10 @@ static void csi2_phy_init(struct cal_ctx *ctx)
>>   	csi2_cio_pwr(ctx, true);
>>   }
>>   
>> -static void csi2_wait_for_phy(struct cal_ctx *ctx)
>> +static void csi2_wait_complexio_reset(struct cal_ctx *ctx)
>>   {
>>   	int i;
> 
> unsigned int ?
> 
>>   
>> -	/* Steps
>> -	 *  2. Wait for completion of reset
>> -	 *          Note if the external sensor is not sending byte clock,
>> -	 *          the reset will timeout
>> -	 *  4.Force FORCERXMODE
>> -	 *      G. Wait for all enabled lane to reach stop state
>> -	 *      H. Disable pull down using pad control
>> -	 */
>> -
>> -	/* 2. Wait for reset completion */
>>   	for (i = 0; i < 250; i++) {
>>   		if (reg_read_field(ctx->dev,
>>   				   CAL_CSI2_COMPLEXIO_CFG(ctx->csi2_port),
>> @@ -854,7 +844,12 @@ static void csi2_wait_for_phy(struct cal_ctx *ctx)
>>   			   CAL_CSI2_COMPLEXIO_CFG_RESET_DONE_RESETCOMPLETED)
>>   		ctx_err(ctx, "Timeout waiting for Complex IO reset done\n");
>>   
>> -	/* 4. G. Wait for all enabled lane to reach stop state */
>> +}
>> +
>> +static void csi2_wait_stop_state(struct cal_ctx *ctx)
>> +{
>> +	int i;
> 
> Ditto.

I'll leave these, as they were "int" also in the original code, and I remove these in the next patches.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
