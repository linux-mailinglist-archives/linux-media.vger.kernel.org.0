Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 188D0187B97
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2020 09:54:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726248AbgCQIyL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Mar 2020 04:54:11 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:54766 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbgCQIyK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Mar 2020 04:54:10 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02H8s7W8129116;
        Tue, 17 Mar 2020 03:54:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1584435247;
        bh=bLHnRVTdAPD0SgdCYoEiFiHF6tUOx6BPoHoSn1lo24w=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=aKtVKaI/iBRuDMjujiafCdkS9xCiXYZ8bfs95Ub2EOhG19mHXeEKOqf5rQW6iipKS
         jIHs85CIQSozl6QA9O/m8S6PEsjGw9p8ARAJvUkBFfqbhGc6c7ibYtnMx7/N5D4zEr
         IZZUMSe1Pp4xE9xU2bxpgXB4DBTFlKsfHz7yxGJs=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 02H8s7eQ024986
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 17 Mar 2020 03:54:07 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Mar 2020 03:54:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Mar 2020 03:54:06 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02H8s4s7015553;
        Tue, 17 Mar 2020 03:54:05 -0500
Subject: Re: [PATCH 02/16] media: ti-vpe: cal: use runtime_resume for errata
 handling
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     <linux-media@vger.kernel.org>, Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20200313114121.32182-1-tomi.valkeinen@ti.com>
 <20200313114121.32182-2-tomi.valkeinen@ti.com>
 <20200316122803.GX4732@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <f5e05e31-5e59-f658-c507-3273ae6a5655@ti.com>
Date:   Tue, 17 Mar 2020 10:54:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200316122803.GX4732@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/03/2020 14:28, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Fri, Mar 13, 2020 at 01:41:07PM +0200, Tomi Valkeinen wrote:
>> We need to do errata handling every time CAL is being enabled. The code
>> is currently in cal_runtime_get(), which is not the correct place for
>> it.
>>
>> Move the code to cal_runtime_resume, which is called every time CAL is
>> enabled.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> ---
>>   drivers/media/platform/ti-vpe/cal.c | 36 ++++++++++++++++++-----------
>>   1 file changed, 22 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
>> index 4b584c419e98..b4a9f4d16ce4 100644
>> --- a/drivers/media/platform/ti-vpe/cal.c
>> +++ b/drivers/media/platform/ti-vpe/cal.c
>> @@ -653,20 +653,7 @@ static void i913_errata(struct cal_dev *dev, unsigned int port)
>>   
>>   static int cal_runtime_get(struct cal_dev *dev)
>>   {
>> -	int r;
>> -
>> -	r = pm_runtime_get_sync(&dev->pdev->dev);
>> -
>> -	if (dev->flags & DRA72_CAL_PRE_ES2_LDO_DISABLE) {
>> -		/*
>> -		 * Apply errata on both port eveytime we (re-)enable
>> -		 * the clock
>> -		 */
>> -		i913_errata(dev, 0);
>> -		i913_errata(dev, 1);
>> -	}
>> -
>> -	return r;
>> +	return pm_runtime_get_sync(&dev->pdev->dev);
>>   }
>>   
>>   static inline void cal_runtime_put(struct cal_dev *dev)
>> @@ -2397,11 +2384,32 @@ static const struct of_device_id cal_of_match[] = {
>>   MODULE_DEVICE_TABLE(of, cal_of_match);
>>   #endif
>>   
>> +static int cal_runtime_resume(struct device *dev)
>> +{
>> +	struct cal_dev *caldev = dev_get_drvdata(dev);
>> +
>> +	if (caldev->flags & DRA72_CAL_PRE_ES2_LDO_DISABLE) {
>> +		/*
>> +		 * Apply errata on both port eveytime we (re-)enable
> 
> s/eveytime/everytime/
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Now that cal_runtime_get() and cal_runtime_put() are just wrappers
> around pm_runtime_get_sync() and pm_runtime_put_sync(), how about
> dropping the wrappers ?

Yep, I'll add a patch for that.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
