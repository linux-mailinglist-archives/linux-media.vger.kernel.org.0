Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA33A142A20
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2020 13:09:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727893AbgATMJg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jan 2020 07:09:36 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:60544 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726775AbgATMJg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jan 2020 07:09:36 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00KC9VZk063374;
        Mon, 20 Jan 2020 06:09:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579522171;
        bh=9/SDI0K0Pj+c3i7x4wk45t+LI01ZuMhyaKeap/VbCWo=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=QT4LLwOD3Z1W8fBcs1CWsdHPnF8xtpfpUpuITcUti+eIwNN+ZNC/n0qfFDihxiq5V
         xgKQXzhFR9apiDRM9ms1czgf1en6Sp8oSJk/dxx0bboMMAp0z2taO4dMFjofgxd5Vz
         2TGCCQlDMk29HFUrg6mQzarAkws7TDHcwYfkUTw8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00KC9Vfj071771
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 20 Jan 2020 06:09:31 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 20
 Jan 2020 06:09:30 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 20 Jan 2020 06:09:30 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00KC9Siu099356;
        Mon, 20 Jan 2020 06:09:29 -0600
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
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <c7eedf72-aa00-8ffe-8c8f-4946a4f54fa7@ti.com>
Date:   Mon, 20 Jan 2020 14:10:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUPhabZrXJ3UqSVTdy2aWf6VG27q287MizKJ5q5tyRnwA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Geert,

On 20/01/2020 14.05, Geert Uytterhoeven wrote:
> On Tue, Dec 17, 2019 at 11:41 AM Peter Ujfalusi <peter.ujfalusi@ti.com> wrote:
>> dma_request_slave_channel() is a wrapper on top of dma_request_chan()
>> eating up the error code.
>>
>> By using dma_request_chan() directly the driver can support deferred
>> probing against DMA.
>>
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> One comment below.
> 
>> --- a/drivers/media/platform/rcar_drif.c
>> +++ b/drivers/media/platform/rcar_drif.c
>> @@ -275,10 +275,10 @@ static int rcar_drif_alloc_dmachannels(struct rcar_drif_sdr *sdr)
>>         for_each_rcar_drif_channel(i, &sdr->cur_ch_mask) {
>>                 struct rcar_drif *ch = sdr->ch[i];
>>
>> -               ch->dmach = dma_request_slave_channel(&ch->pdev->dev, "rx");
>> -               if (!ch->dmach) {
>> +               ch->dmach = dma_request_chan(&ch->pdev->dev, "rx");
>> +               if (IS_ERR(ch->dmach)) {
>>                         rdrif_err(sdr, "ch%u: dma channel req failed\n", i);
> 
> Now there is an error code, you might (1) want to print it, and (2) only
> do so when it is not due to probe deferral:
> 
>         if (PTR_ERR(ch->dmach) != -EPROBE_DEFER)
>                 rdrif_err(sdr, "ch%u: dma channel req failed %pe\n",
> i, ch->dmach);

Yes, this is true.

> 
>> -                       ret = -ENODEV;
>> +                       ret = PTR_ERR(ch->dmach);

if (ret != -EPROBE_DEFER)
	rdrif_err(sdr, "ch%u: dma channel req failed (%d)\n", i, ret);

might be simpler.

>>                         goto dmach_error;
>>                 }
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

- Péter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
