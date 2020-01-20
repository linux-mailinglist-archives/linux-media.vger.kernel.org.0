Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9BC1142B11
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2020 13:43:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgATMnB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jan 2020 07:43:01 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:56758 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbgATMnA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jan 2020 07:43:00 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00KCgtS7064086;
        Mon, 20 Jan 2020 06:42:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579524175;
        bh=tC/peLSq3Bzc5cp8eak6KuGrswkAUS1ZeB9UTQGw9qc=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=K+MZCW31nyLyHm/xSmdpCfKqSObEAkO0imiCQVrto9wt82nkavGOqzB7oZ0sHspi7
         e8QNt0c7mVZXFT3axr4anRYBQ2/g6ztu355laZSmL/bGG0aa+ZmMk0YMmfLFlQyZIu
         gbNghl+wPkPhvlrI4EER75ltGfxCKQxeUGuMf0dY=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00KCgtl1057276
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 20 Jan 2020 06:42:55 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 20
 Jan 2020 06:42:54 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 20 Jan 2020 06:42:54 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00KCgqNv125311;
        Mon, 20 Jan 2020 06:42:53 -0600
Subject: Re: [PATCH] media: rcar_drif: Use dma_request_chan() instead
 dma_request_slave_channel()
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        Vinod <vkoul@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20191217104025.23318-1-peter.ujfalusi@ti.com>
 <CAMuHMdUPhabZrXJ3UqSVTdy2aWf6VG27q287MizKJ5q5tyRnwA@mail.gmail.com>
 <c7eedf72-aa00-8ffe-8c8f-4946a4f54fa7@ti.com>
 <CAMuHMdXU9_WY54iU5DY6UHZHmyaR06pW7X0nnyCWHA=R3GtcJA@mail.gmail.com>
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <f2bc1bea-c844-8627-4480-8174259be0a4@ti.com>
Date:   Mon, 20 Jan 2020 14:43:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXU9_WY54iU5DY6UHZHmyaR06pW7X0nnyCWHA=R3GtcJA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 20/01/2020 14.36, Geert Uytterhoeven wrote:
> Hi Peter,
> 
> On Mon, Jan 20, 2020 at 1:09 PM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
>> On 20/01/2020 14.05, Geert Uytterhoeven wrote:
>>> On Tue, Dec 17, 2019 at 11:41 AM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
>>>> dma_request_slave_channel() is a wrapper on top of dma_request_chan()
>>>> eating up the error code.
>>>>
>>>> By using dma_request_chan() directly the driver can support deferred
>>>> probing against DMA.
>>>>
>>>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
>>>
>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>
>>> One comment below.
>>>
>>>> --- a/drivers/media/platform/rcar_drif.c
>>>> +++ b/drivers/media/platform/rcar_drif.c
>>>> @@ -275,10 +275,10 @@ static int rcar_drif_alloc_dmachannels(struct rcar_drif_sdr *sdr)
>>>>         for_each_rcar_drif_channel(i, &sdr->cur_ch_mask) {
>>>>                 struct rcar_drif *ch = sdr->ch[i];
>>>>
>>>> -               ch->dmach = dma_request_slave_channel(&ch->pdev->dev, "rx");
>>>> -               if (!ch->dmach) {
>>>> +               ch->dmach = dma_request_chan(&ch->pdev->dev, "rx");
>>>> +               if (IS_ERR(ch->dmach)) {
>>>>                         rdrif_err(sdr, "ch%u: dma channel req failed\n", i);
>>>
>>> Now there is an error code, you might (1) want to print it, and (2) only
>>> do so when it is not due to probe deferral:
>>>
>>>         if (PTR_ERR(ch->dmach) != -EPROBE_DEFER)
>>>                 rdrif_err(sdr, "ch%u: dma channel req failed %pe\n",
>>> i, ch->dmach);
>>
>> Yes, this is true.
>>
>>>
>>>> -                       ret = -ENODEV;
>>>> +                       ret = PTR_ERR(ch->dmach);
>>
>> if (ret != -EPROBE_DEFER)
>>         rdrif_err(sdr, "ch%u: dma channel req failed (%d)\n", i, ret);
>>
>> might be simpler.
> 
> Sure, checking ret is simpler.
> But printing ch->dmach means you can use the new %pe format specifier
> to pretty-print the error code.

Ah, I was not aware of this, but there is another issue with the patch:
I need to set the ch->dmach to NULL before jumping to dmach_error..

I'll send v3 in a minute.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
