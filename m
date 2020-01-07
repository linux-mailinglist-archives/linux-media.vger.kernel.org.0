Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63F6A1323CB
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2020 11:38:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727699AbgAGKij (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jan 2020 05:38:39 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:56494 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbgAGKij (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jan 2020 05:38:39 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 007AcTBQ052064;
        Tue, 7 Jan 2020 04:38:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1578393509;
        bh=BSpms8vYzmAl/YFEGgI8wzX4uGpMNJOd+zSnFgxFaP0=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=MKjc8aAF40U5qjbdM4l/1SABZ0JniIFWxtHuneoS4v0G7TPEk0yLjiPYPP36egmvR
         ja1LaMDtkIm4jF81pIDJpn4/wHbw8TX78YJZ+w0Jr3G+t6LIusO81C2Iy7/mxq0ewj
         tCHIdn1VvkIz+qwHIec8EhRlRho2N/kIyP3sfgm4=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 007AcTZo112928
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 7 Jan 2020 04:38:29 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 7 Jan
 2020 04:38:28 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 7 Jan 2020 04:38:28 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 007AcPAU005113;
        Tue, 7 Jan 2020 04:38:27 -0600
Subject: Re: [PATCH] media: stm32-dcmi: Use dma_request_chan() instead
 dma_request_slave_channel()
To:     Hugues FRUCHET <hugues.fruchet@st.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
        Alexandre TORGUE <alexandre.torgue@st.com>
CC:     "vkoul@kernel.org" <vkoul@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-stm32@st-md-mailman.stormreply.com" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
References: <20191217104135.23554-1-peter.ujfalusi@ti.com>
 <84946ffd-8e90-7b6a-6667-a10e27d31655@st.com>
 <8229c7ed-b513-6bf8-5684-60d87a92d41f@st.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <a4682783-e966-6176-4ab5-cc9345e3508f@ti.com>
Date:   Tue, 7 Jan 2020 12:38:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8229c7ed-b513-6bf8-5684-60d87a92d41f@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hugues,

On 07/01/2020 11.46, Hugues FRUCHET wrote:
> Hi Peter,
> 
> If not too late, could you change trace to only trig error trace when
> error is not "probe defered" ? See below:
> 
> -	chan = dma_request_slave_channel(&pdev->dev, "tx");
> -	if (!chan) {
> -		dev_info(&pdev->dev, "Unable to request DMA channel, defer probing\n");
> -		return -EPROBE_DEFER;
> +	chan = dma_request_chan(&pdev->dev, "tx");
> +	if (IS_ERR(chan)) {
> +		if (PTR_ERR(chan) != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "Unable to request DMA channel\n");
> +		return PTR_ERR(chan);

Sure, I don't know how I missed it.

Regards,
- Péter

> 
> Best regards,
> Hugues.
> 
> On 12/18/19 11:52 AM, Hugues FRUCHET wrote:
>> Thanks for patching Peter,
>>
>> No regression observed on my side.
>>
>> Acked-by: Hugues Fruchet <hugues.fruchet@st.com>
>>
>> Best regards,
>> Hugues.
>>
>> On 12/17/19 11:41 AM, Peter Ujfalusi wrote:
>>> dma_request_slave_channel() is a wrapper on top of dma_request_chan()
>>> eating up the error code.
>>>
>>> By using dma_request_chan() directly the driver can support deferred
>>> probing against DMA.
>>>
>>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
>>> ---
>>>   drivers/media/platform/stm32/stm32-dcmi.c | 6 +++---
>>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/stm32/stm32-dcmi.c 
>>> b/drivers/media/platform/stm32/stm32-dcmi.c
>>> index 9392e3409fba..55351872b0c7 100644
>>> --- a/drivers/media/platform/stm32/stm32-dcmi.c
>>> +++ b/drivers/media/platform/stm32/stm32-dcmi.c
>>> @@ -1910,10 +1910,10 @@ static int dcmi_probe(struct platform_device 
>>> *pdev)
>>>           return PTR_ERR(mclk);
>>>       }
>>> -    chan = dma_request_slave_channel(&pdev->dev, "tx");
>>> -    if (!chan) {
>>> +    chan = dma_request_chan(&pdev->dev, "tx");
>>> +    if (IS_ERR(chan)) {
>>>           dev_info(&pdev->dev, "Unable to request DMA channel, defer 
>>> probing\n");
>>> -        return -EPROBE_DEFER;
>>> +        return PTR_ERR(chan);
>>>       }
>>>       spin_lock_init(&dcmi->irqlock);
>> >


Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
