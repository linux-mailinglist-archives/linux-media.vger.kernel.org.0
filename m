Return-Path: <linux-media+bounces-11652-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0534C8C9BAF
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 12:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C4D71F22639
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2024 10:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5218053811;
	Mon, 20 May 2024 10:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="VCej1KKe"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-14.smtpout.orange.fr [80.12.242.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC8A182DF;
	Mon, 20 May 2024 10:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716202509; cv=none; b=piSwoJk4C03uACKNA+TgRaHg0wP4DG3ocwukiJtCFaQElpWm+mKORv6X/Q5Y2TLWZ7Q5XSk/qlYb1HummdrAu3T+z0Eok68pf2CoMZfcz+6iciXex7fASh9VbIs5GLjumg+PHczodnIiZNeqebORWJ7sDUVHbNV8hLYHgxBResE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716202509; c=relaxed/simple;
	bh=q3bRoEZ79xHc4f0wx00Hbe+TL94wH3IqUYcu0JWlp4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DFKHtq8IGJEOisl0i+i5sNJvRDEEdGK3JviVzuxxf1A8yXIxqSrDH4XBGxPsRCklI0plpoN8P+1Ah/05Om5i95Cmrl7od4yFaoLJ4tfjgLq5dD34AuBMslfwjof8KV9NBDlQazM6ICveOrJxPKb1NjXiLTyl2Iu1lW5/mNSBZK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=VCej1KKe; arc=none smtp.client-ip=80.12.242.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([86.243.17.157])
	by smtp.orange.fr with ESMTPA
	id 90e5sSJgC8l3290e5srEL3; Mon, 20 May 2024 12:53:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1716202415;
	bh=ELn5yy0YtZNkzllyxlQxOp3Ewnx5JI4zkxA511+HSiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=VCej1KKervtWUMm/8Z4jxCbaPOxAqUi9V9la6FaH71gK757Mfoif7XYSvSHyDmwYW
	 zs8gy1CuvVXFBAgjobcxiqnCzeANLoEX/pvRKwsB2zMhRP4/NQ9YkqKnwyk0bvcNxo
	 30haz0K1faiRKeYjiHmIKvmJeNLjYLb4J+shQYCgF69neg6SiAiSXsZ9FCAKQysvKr
	 nRnqCOi+MD020RpgEstfi2aogIFus8qEBOfHUVYy9y9Rq+62AGTk0QTssBILvLUbJZ
	 CI3fiposyxKr0y4jAD4UBa7AkFSpEHC0yT8zGXF4qhKh6BA9Gh3zee0m6b3bH0qkpb
	 BCM+YuaqdOrnA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 20 May 2024 12:53:35 +0200
X-ME-IP: 86.243.17.157
Message-ID: <68377fae-d6be-4658-ad4a-c9df8c3548d7@wanadoo.fr>
Date: Mon, 20 May 2024 12:53:46 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: intel/ipu6: Fix an error handling path in
 isys_probe()
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org
References: <545315bcaac0a897c25cfa20a603be2af2a40aa9.1716201136.git.christophe.jaillet@wanadoo.fr>
 <ZksqOEXE0vCSPzYY@kekkonen.localdomain>
Content-Language: en-MW
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <ZksqOEXE0vCSPzYY@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 20/05/2024 à 12:47, Sakari Ailus a écrit :
> Hi Christophe,
> 
> Thanks for the patch.
> 
> On Mon, May 20, 2024 at 12:32:30PM +0200, Christophe JAILLET wrote:
>> If an error occurs after a successful alloc_fw_msg_bufs() call, some
>> resources should be released as already done in the remove function.
>>
>> Fixes: f50c4ca0a820 ("media: intel/ipu6: add the main input system driver")
>> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>> ---
>> Compile tested only
>> ---
>>   drivers/media/pci/intel/ipu6/ipu6-isys.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys.c b/drivers/media/pci/intel/ipu6/ipu6-isys.c
>> index 5992138c7290..d9e1e1a135b9 100644
>> --- a/drivers/media/pci/intel/ipu6/ipu6-isys.c
>> +++ b/drivers/media/pci/intel/ipu6/ipu6-isys.c
>> @@ -1062,6 +1062,7 @@ static int isys_probe(struct auxiliary_device *auxdev,
>>   	const struct ipu6_isys_internal_csi2_pdata *csi2_pdata;
>>   	struct ipu6_bus_device *adev = auxdev_to_adev(auxdev);
>>   	struct ipu6_device *isp = adev->isp;
>> +	struct isys_fw_msgs *fwmsg, *safe;
>>   	const struct firmware *fw;
>>   	struct ipu6_isys *isys;
>>   	unsigned int i;
>> @@ -1140,12 +1141,17 @@ static int isys_probe(struct auxiliary_device *auxdev,
>>   
>>   	ret = isys_register_devices(isys);
>>   	if (ret)
>> -		goto out_remove_pkg_dir_shared_buffer;
>> +		goto free_fw_msg_bufs;
>>   
>>   	ipu6_mmu_hw_cleanup(adev->mmu);
>>   
>>   	return 0;
>>   
>> +free_fw_msg_bufs:
>> +	list_for_each_entry_safe(fwmsg, safe, &isys->framebuflist, head)
>> +		dma_free_attrs(&auxdev->dev, sizeof(struct isys_fw_msgs),
>> +			       fwmsg, fwmsg->dma_addr, 0);
> 
> This is also done in isys_remove(). How about moving these into a new
> function that releases memory from both lists?

I agree. I thought about that too but decided to propose a simple 
solution first.

> 
> There's no harm in traversing framebuflist_fw as well, it's empty at this
> point.

Yes, that's my understanding.
That's why I only copied one list_for_each_entry_safe().


I'll send a v2 with the list_for_each_entry_safe() in a new function.
It will be much cleaner.

CJ

> 
>> +
>>   out_remove_pkg_dir_shared_buffer:
>>   	if (!isp->secure_mode)
>>   		ipu6_cpd_free_pkg_dir(adev);
> 


