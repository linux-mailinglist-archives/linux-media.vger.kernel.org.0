Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C313D1DB3EA
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 14:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbgETMno (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 08:43:44 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:53236 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbgETMnn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 08:43:43 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04KChcBe050883;
        Wed, 20 May 2020 07:43:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589978618;
        bh=zxx7ZiFM9eDWZAFgKqDStYi6M6MG5cO3PtSDRr0Kcmw=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=GN6NVp1AXN38VvX2fVgSmWEbeMH6PUTtGZ7x3siZv0PgAkr5OrZYVjZhTndSHCvGs
         9CfVURfSxaKaoqSyU7roPVmoud+AssIqjELelN/T1sdcLggZ17jamfJ8hLg6hIk5Jd
         fggNc1OClAXWKHpN3XTQPT4inDs0rleQFgDwh7Oc=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04KChcxK046229;
        Wed, 20 May 2020 07:43:38 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 20
 May 2020 07:43:38 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 20 May 2020 07:43:38 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04KChbt4024072;
        Wed, 20 May 2020 07:43:37 -0500
Subject: Re: Bad kfree of dma_parms in v5.7-rc5
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <CGME20200520090109eucas1p17270805f81f6958cd5084a7b910efc6c@eucas1p1.samsung.com>
 <a9df7155-dd7a-752b-6d1c-3426837756b1@ti.com>
 <e9674719-0c86-63be-04a3-ee98bd884901@samsung.com>
 <f3c58dcd-b806-95ef-2434-3084e65e1afb@ti.com>
 <e3fa0b35-7cca-1e37-c2fa-63cc07e6bfda@samsung.com>
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <227465a5-c6e6-5b4d-abbd-7789727843a6@ti.com>
Date:   Wed, 20 May 2020 15:43:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e3fa0b35-7cca-1e37-c2fa-63cc07e6bfda@samsung.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/05/2020 12:22, Marek Szyprowski wrote:
> Hi Tomi,
> 
> On 20.05.2020 11:18, Tomi Valkeinen wrote:
>> On 20/05/2020 12:13, Marek Szyprowski wrote:
>>> On 20.05.2020 11:00, Tomi Valkeinen wrote:
>>>> Commit 9495b7e92f716ab2bd6814fab5e97ab4a39adfdd ("driver core:
>>>> platform: Initialize dma_parms for platform devices") v5.7-rc5 causes
>>>> at least some v4l2 platform drivers to break when freeing resources.
>>>>
>>>> E.g. drivers/media/platform/ti-vpe/cal.c uses
>>>> vb2_dma_contig_set_max_seg_size() and
>>>> vb2_dma_contig_clear_max_seg_size() to manage the dma_params, and
>>>> similar pattern is seen in other drivers too.
>>>>
>>>> After 9495b7e92f716ab2, vb2_dma_contig_set_max_seg_size() will not
>>>> allocate anything, but vb2_dma_contig_clear_max_seg_size() will still
>>>> kfree the dma_params.
>>>>
>>>> I'm not sure what's the proper fix here. A flag somewhere to indicate
>>>> that vb2_dma_contig_set_max_seg_size() did allocate, and thus
>>>> vb2_dma_contig_clear_max_seg_size() must free?
>>>>
>>>> Or drop the kzalloc and kfree totally, if dma_params is now supposed
>>>> to always be there?
>>>
>>> Thanks for reporting this issue!
>>>
>>> Once the mentioned commit has been merged, the code should assume that
>>> the platform devices does have a struct dma_params allocated, so the
>>> proper fix is to alloc dma_params only if the bus is not a platform bus:
>>>
>>> if (!dev_is_platform(dev) && !dev->dma_parms) {
>>>        dev->dma_parms = kzalloc(sizeof(*dev->dma_parms), GFP_KERNEL);
>>>
>>> same check for the free path.
>>
>> There is also "amba: Initialize dma_parms for amba devices". And the
>> commit message says PCI devices do this too.
>>
>> Guessing this based on the device type doesn't sound like a good idea
>> to me.
> 
> Indeed. Then replace the allocation with a simple check for NULL
> dma_parms and return an error in such case. This should be enough for
> v5.8. Later we can simply get rid of those helpers and inline setting
> max segment size directly to the drivers.

Is that valid either? Then we assume that dma_parms is always set up by someone else. That's true 
for platform devices and apparently some other devices, but is it true for all devices now?

  Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
