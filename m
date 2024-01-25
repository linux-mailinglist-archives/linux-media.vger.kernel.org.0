Return-Path: <linux-media+bounces-4183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C72283C677
	for <lists+linux-media@lfdr.de>; Thu, 25 Jan 2024 16:23:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F59E1F2559A
	for <lists+linux-media@lfdr.de>; Thu, 25 Jan 2024 15:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3856EB79;
	Thu, 25 Jan 2024 15:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="GMN1U2t2"
X-Original-To: linux-media@vger.kernel.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A056EB59;
	Thu, 25 Jan 2024 15:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706196192; cv=none; b=J1OmccDxwwlXzh1aNceg6rEOaZ+Nk6GWY4Kl+lTMZPzPGUfhPKR4bIJG0MMZ05kQw31mXN40ZJmSVYss/R4DxgoR18eqbOfyufwBVegRMFBYcgEe374fTLU0aHsWG/D8AYhNeV9/L/igOAe95hjakasuGRa0qkt9mVlk79Qjt6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706196192; c=relaxed/simple;
	bh=nHHvVom1q2NfxuRV3Y+LvpL/ZmkiaOxOnUB91cTyLtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=cbRTMQPA8uH+ERMqGYcta/lCW0V/Ni4OysFFIRj/lSptnnr0+Ok80XPtfnZoaRftC8YKu3Eq/7Pt5fzdg2CqWgd6QxAQso7zE2Ztdpe5IEhCZRE8618KSaFxEf05UmU9pEtDalU0Qzqfmt2GyplVowPrPlAT1w0gGvKlrT+3h0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=GMN1U2t2; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40PFMxEB029810;
	Thu, 25 Jan 2024 09:22:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706196179;
	bh=3uCm+3uv8GvMxy4OgNybvMflNJ+eaPMs5XH+LYlHVzk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GMN1U2t2nH/8OoBPHHzd8rA7ZqBV9C5ul0BVQm6Wfau2GNcBiwiIEQztFf9trtH+a
	 2VKObYP8D2NJhkUO/SgX/GzUhkx9C2Bv6VEZtVIm2hcYclBoEkqBmY3KYzEAEl9Ykf
	 ngDTXrObEd5MQccdKVZyg/F5/AF+//T5lBd0QkBc=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40PFMxct048139
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 Jan 2024 09:22:59 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 25
 Jan 2024 09:22:59 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 25 Jan 2024 09:22:59 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40PFMwBh079463;
	Thu, 25 Jan 2024 09:22:58 -0600
Message-ID: <9bb17376-7793-4cb1-984c-adffb1c7ab1e@ti.com>
Date: Thu, 25 Jan 2024 09:22:58 -0600
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] udmabuf: Keep track current device mappings
Content-Language: en-US
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
        Gerd Hoffmann
	<kraxel@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Paul Cercueil
	<paul@crapouillou.net>
CC: "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
References: <20240123221227.868341-1-afd@ti.com>
 <IA0PR11MB7185C76FC248EDDC5FBC49EFF87B2@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <IA0PR11MB7185C76FC248EDDC5FBC49EFF87B2@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

On 1/24/24 4:36 PM, Kasireddy, Vivek wrote:
> Hi Andrew,
> 
>> When a device attaches to and maps our buffer we need to keep track
>> of this mapping/device. This is needed for synchronization with these
>> devices when beginning and ending CPU access for instance. Add a list
>> that tracks device mappings as part of {map,unmap}_udmabuf().
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   drivers/dma-buf/udmabuf.c | 43
>> +++++++++++++++++++++++++++++++++++++--
>>   1 file changed, 41 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index c406459996489..3a23f0a7d112a 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -28,6 +28,14 @@ struct udmabuf {
>>   	struct page **pages;
>>   	struct sg_table *sg;
>>   	struct miscdevice *device;
>> +	struct list_head attachments;
>> +	struct mutex lock;
>> +};
>> +
>> +struct udmabuf_attachment {
>> +	struct device *dev;
>> +	struct sg_table *table;
>> +	struct list_head list;
>>   };
>>
>>   static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
>> @@ -120,14 +128,42 @@ static void put_sg_table(struct device *dev, struct
>> sg_table *sg,
>>   static struct sg_table *map_udmabuf(struct dma_buf_attachment *at,
>>   				    enum dma_data_direction direction)
>>   {
>> -	return get_sg_table(at->dev, at->dmabuf, direction);
>> +	struct udmabuf *ubuf = at->dmabuf->priv;
>> +	struct udmabuf_attachment *a;
>> +
>> +	a = kzalloc(sizeof(*a), GFP_KERNEL);
>> +	if (!a)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	a->table = get_sg_table(at->dev, at->dmabuf, direction);
>> +	if (IS_ERR(a->table)) {
>> +		kfree(a);
>> +		return a->table;
> Isn't that a use-after-free bug?

Indeed it is, will fix.

Seems coccicheck also caught this but I missed it when
reviewing its output, my bad :(

Andrew

> Rest of the patch lgtm.
> 
> Thanks,
> Vivek
> 
>> +	}
>> +
>> +	a->dev = at->dev;
>> +
>> +	mutex_lock(&ubuf->lock);
>> +	list_add(&a->list, &ubuf->attachments);
>> +	mutex_unlock(&ubuf->lock);
>> +
>> +	return a->table;
>>   }
>>
>>   static void unmap_udmabuf(struct dma_buf_attachment *at,
>>   			  struct sg_table *sg,
>>   			  enum dma_data_direction direction)
>>   {
>> -	return put_sg_table(at->dev, sg, direction);
>> +	struct udmabuf_attachment *a = at->priv;
>> +	struct udmabuf *ubuf = at->dmabuf->priv;
>> +
>> +	mutex_lock(&ubuf->lock);
>> +	list_del(&a->list);
>> +	mutex_unlock(&ubuf->lock);
>> +
>> +	put_sg_table(at->dev, sg, direction);
>> +
>> +	kfree(a);
>>   }
>>
>>   static void release_udmabuf(struct dma_buf *buf)
>> @@ -263,6 +299,9 @@ static long udmabuf_create(struct miscdevice
>> *device,
>>   		memfd = NULL;
>>   	}
>>
>> +	INIT_LIST_HEAD(&ubuf->attachments);
>> +	mutex_init(&ubuf->lock);
>> +
>>   	exp_info.ops  = &udmabuf_ops;
>>   	exp_info.size = ubuf->pagecount << PAGE_SHIFT;
>>   	exp_info.priv = ubuf;
>> --
>> 2.39.2
> 

