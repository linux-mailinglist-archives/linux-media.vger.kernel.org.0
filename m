Return-Path: <linux-media+bounces-11950-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 361468D01B5
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 15:36:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E572429164E
	for <lists+linux-media@lfdr.de>; Mon, 27 May 2024 13:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C00A160791;
	Mon, 27 May 2024 13:33:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00FF15FD17;
	Mon, 27 May 2024 13:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716816795; cv=none; b=qn8hbPTxf3WId6oMfk6SrrRc6+CQkdYpnso+evFo7ruib+b2pbvpbOjqdpmvFUvKUkLvW54s1byC/1k6NcU4o2YXaxatzJ9BII9JW4hYJYCcOLU9rqNB+lOV7j+Rkk9at91Tg59cmaj5epqLOZ5h+qhYhDJj0Qi39Q2c/+YEbQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716816795; c=relaxed/simple;
	bh=N9Z9g74Cf30Clzkg1dZLVo8PczdHtxPMh0Nb4/3A6fI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ivf9z8wsE/ijkNXAw17Ueu3Gr4k4CwzudBrNYopmVQjzTe50KLIdYgm6iOJyXvvc8k3g2qmMyJZodJVCHbDyKnJ3rzie/LsFWU5m9o41KwbcEuMOwIuCoOVdArlTzemAQvbevoFYFEllSPWZhHm4yZHsnBWwTd+3TINk1qI7PCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from [192.168.42.135] (unknown [85.193.2.91])
	by mx.gpxsee.org (Postfix) with ESMTPSA id 59D0330BBB;
	Mon, 27 May 2024 15:33:05 +0200 (CEST)
Message-ID: <2366ed1f-c6e0-40ce-90f3-e1a4b2d264bb@gpxsee.org>
Date: Mon, 27 May 2024 15:33:05 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: mgb4: Fix double debugfs remove
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Martin_T=C5=AFma?= <martin.tuma@digiteqautomotive.com>
References: <20240521162254.3025-1-tumic@gpxsee.org>
 <785a3e80-7cc8-40e6-8e4f-f741a8f343af@xs4all.nl>
Content-Language: en-US
From: =?UTF-8?Q?Martin_T=C5=AFma?= <tumic@gpxsee.org>
In-Reply-To: <785a3e80-7cc8-40e6-8e4f-f741a8f343af@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27. 05. 24 9:36 dop., Hans Verkuil wrote:
> Hi Martin,
> 
> On 21/05/2024 18:22, tumic@gpxsee.org wrote:
>> From: Martin Tůma <martin.tuma@digiteqautomotive.com>
>>
>> Fixes an error where debugfs_remove_recursive() is called first on a parent
>> directory and then again on a child which causes a kernel panic.
> 
> I accepted this patch for v6.10, but I would appreciate it if you can
> make an additional patch for v6.11 that removes the #ifdef CONFIG_DEBUG_FS
> lines where possible.
> 
> Most debugfs functions have a dummy implementation when that define is not
> set, so it would clean up the driver if these unnecessary #ifdefs are removed.
> 

Ok, I will do it and send the patch in the next days.

M.

> Regards,
> 
> 	Hans
> 
>>
>> Signed-off-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
>> ---
>>   drivers/media/pci/mgb4/mgb4_core.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/pci/mgb4/mgb4_core.c b/drivers/media/pci/mgb4/mgb4_core.c
>> index 60498a5abebf..ab4f07e2e560 100644
>> --- a/drivers/media/pci/mgb4/mgb4_core.c
>> +++ b/drivers/media/pci/mgb4/mgb4_core.c
>> @@ -642,9 +642,6 @@ static void mgb4_remove(struct pci_dev *pdev)
>>   	struct mgb4_dev *mgbdev = pci_get_drvdata(pdev);
>>   	int i;
>>   
>> -#ifdef CONFIG_DEBUG_FS
>> -	debugfs_remove_recursive(mgbdev->debugfs);
>> -#endif
>>   #if IS_REACHABLE(CONFIG_HWMON)
>>   	hwmon_device_unregister(mgbdev->hwmon_dev);
>>   #endif
>> @@ -659,6 +656,10 @@ static void mgb4_remove(struct pci_dev *pdev)
>>   		if (mgbdev->vin[i])
>>   			mgb4_vin_free(mgbdev->vin[i]);
>>   
>> +#ifdef CONFIG_DEBUG_FS
>> +	debugfs_remove_recursive(mgbdev->debugfs);
>> +#endif
>> +
>>   	device_remove_groups(&mgbdev->pdev->dev, mgb4_pci_groups);
>>   	free_spi(mgbdev);
>>   	free_i2c(mgbdev);
>>
>> base-commit: 8771b7f31b7fff91a998e6afdb60650d4bac59a5
> 
> 

