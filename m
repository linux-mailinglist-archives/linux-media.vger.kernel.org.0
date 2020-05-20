Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8714F1DAE86
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 11:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbgETJSe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 05:18:34 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53774 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbgETJSe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 05:18:34 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04K9ITRx019142;
        Wed, 20 May 2020 04:18:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589966309;
        bh=SBboUW4Q1RwNVwHrHpiX+mZpvBIQ6oNqpLWfQmZ8qcQ=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=pbqiPc736FZChkgti37Lwq7+1C4WE+ye9QNHEOsW4Q1jjYXv3tRATlKODXbxZUG4Y
         TfRF7CFfp4RXgnfBLy5oFiyg/tP5ESJ0EEoG5Kpw8HX2lKplYmkeiP2GbR5Pi7jfKj
         L0RsPGViYOAfF7e2lWtCODsFetXVzP9y0aocbopw=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04K9IThJ078989
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 20 May 2020 04:18:29 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 20
 May 2020 04:18:28 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 20 May 2020 04:18:28 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04K9IROx066431;
        Wed, 20 May 2020 04:18:27 -0500
Subject: Re: Bad kfree of dma_parms in v5.7-rc5
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <CGME20200520090109eucas1p17270805f81f6958cd5084a7b910efc6c@eucas1p1.samsung.com>
 <a9df7155-dd7a-752b-6d1c-3426837756b1@ti.com>
 <e9674719-0c86-63be-04a3-ee98bd884901@samsung.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <f3c58dcd-b806-95ef-2434-3084e65e1afb@ti.com>
Date:   Wed, 20 May 2020 12:18:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e9674719-0c86-63be-04a3-ee98bd884901@samsung.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Marek,

On 20/05/2020 12:13, Marek Szyprowski wrote:
> Hi Tomi,
> 
> On 20.05.2020 11:00, Tomi Valkeinen wrote:
>> Commit 9495b7e92f716ab2bd6814fab5e97ab4a39adfdd ("driver core:
>> platform: Initialize dma_parms for platform devices") v5.7-rc5 causes
>> at least some v4l2 platform drivers to break when freeing resources.
>>
>> E.g. drivers/media/platform/ti-vpe/cal.c uses
>> vb2_dma_contig_set_max_seg_size() and
>> vb2_dma_contig_clear_max_seg_size() to manage the dma_params, and
>> similar pattern is seen in other drivers too.
>>
>> After 9495b7e92f716ab2, vb2_dma_contig_set_max_seg_size() will not
>> allocate anything, but vb2_dma_contig_clear_max_seg_size() will still
>> kfree the dma_params.
>>
>> I'm not sure what's the proper fix here. A flag somewhere to indicate
>> that vb2_dma_contig_set_max_seg_size() did allocate, and thus
>> vb2_dma_contig_clear_max_seg_size() must free?
>>
>> Or drop the kzalloc and kfree totally, if dma_params is now supposed
>> to always be there?
> 
> Thanks for reporting this issue!
> 
> Once the mentioned commit has been merged, the code should assume that
> the platform devices does have a struct dma_params allocated, so the
> proper fix is to alloc dma_params only if the bus is not a platform bus:
> 
> if (!dev_is_platform(dev) && !dev->dma_parms) {
>       dev->dma_parms = kzalloc(sizeof(*dev->dma_parms), GFP_KERNEL);
> 
> same check for the free path.

There is also "amba: Initialize dma_parms for amba devices". And the commit message says PCI devices 
do this too.

Guessing this based on the device type doesn't sound like a good idea to me.

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
