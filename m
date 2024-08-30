Return-Path: <linux-media+bounces-17185-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2609654E5
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 03:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AE91284355
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2024 01:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F75535DC;
	Fri, 30 Aug 2024 01:55:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E014690
	for <linux-media@vger.kernel.org>; Fri, 30 Aug 2024 01:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724982952; cv=none; b=ll1LGpqG5HBGfiONxAcyv5YuF5AcqVek0UZ3eMWjy//CaUoXw7Vz+vEeQPimSCtKOih2Fbj0OVxBcGX4p2YCkGYB8ASIYaUSXK+i2qR5jUp6A3hN4Wjnmp69gVUtytTJ5tH1wdrJSLrkKgwKZSY91MX68Z+3lCMnjVaaA+TNlMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724982952; c=relaxed/simple;
	bh=btURHJHgcbamrJMkXS6o5YNqsFZw4OfY2G1S2IP6JuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=i6C7lNHiZ030RPVy0EwJQsVwuhT09Qfr0DyXoR192U/LDeq+nDTHoH63vezGMaYt58mc5RcIdIGb73Z0weA5RmHrSbKx9D60L1iZEMA8IfbGw1rbpgMl+q/UZm1q53dAMnB+YwpBqTAS3Agb8FL5VZjdq277DRnFaSd3dAfd67k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Ww1SM1zjQzyQy8;
	Fri, 30 Aug 2024 09:55:15 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 66F9C140202;
	Fri, 30 Aug 2024 09:55:47 +0800 (CST)
Received: from [10.174.176.82] (10.174.176.82) by
 kwepemf500003.china.huawei.com (7.202.181.241) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 30 Aug 2024 09:55:46 +0800
Message-ID: <4bc13d33-90a6-4780-9c63-a72dca3d4f15@huawei.com>
Date: Fri, 30 Aug 2024 09:55:45 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: atomisp: Remove unused declartions
To: Changhuang Liang <changhuang.liang@starfivetech.com>
CC: <hdegoede@redhat.com>, <linux-media@vger.kernel.org>,
	<mchehab@kernel.org>, <sakari.ailus@linux.intel.com>
References: <20240827071122.26706-1-zhangzekun11@huawei.com>
 <20240829125845.708915-1-changhuang.liang@starfivetech.com>
From: "zhangzekun (A)" <zhangzekun11@huawei.com>
In-Reply-To: <20240829125845.708915-1-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemf500003.china.huawei.com (7.202.181.241)

Hi, Changhuang,

Thanks for your review, I will send v2 to fix this.

Best Regards,
Zekun

在 2024/8/29 20:58, Changhuang Liang 写道:
> Hi, Zekun
> 
>> v4l2_get_acpi_sensor_info() has been removed since commit d80be6a10cd3
>> ("media: atomisp: Drop v4l2_get_acpi_sensor_info() function"), remain
>> the declarations untouched in the header files. So, let's remove these
>> unused declartions.
>>
> 
> You just remove one declartion.
> Or:
> declartions => declartion.
> these => this.
> 
> Best Regards,
> Changhuang
> 

