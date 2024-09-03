Return-Path: <linux-media+bounces-17422-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C29C9690DC
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 03:20:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C97731F2330E
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2024 01:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE991CCEC2;
	Tue,  3 Sep 2024 01:20:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E53535894
	for <linux-media@vger.kernel.org>; Tue,  3 Sep 2024 01:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725326403; cv=none; b=CWh970LXPzNEt+blwpVxgLSK70EMejEHnLW4nWMQpjb5ERsPyTuPibY/648Ent4vr9yJHoVbT3nubl3zy6ksBSw5ikHDJQVwLry0V7sYKoMSmSL/aXXc+G9Hdi6LBds/VSlJugPPiLKWiK8dSWml35oavKXtjKrbJ+4kn1/0LwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725326403; c=relaxed/simple;
	bh=gj+C7i0RSO5QcfWggRexxZjU9aem3UFeB12bUQ2gJSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rZbh8rpU5toBqOSiFZQADM5xI1Y4cAZIEbYEmgRvE7StXCcdswkdsY4oebUS3GGV5oF9lRNuM+HC9yUqVV6tAieuaWCX1y02SYJ88zMNDomHrGdloIwmUtqCLDm1/fGtTMGYWNqqeM1HZ6A+HAL7A7JtA/A472rgqoaHYcTCHhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4WySSk0Stdz1BFPr;
	Tue,  3 Sep 2024 09:19:02 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
	by mail.maildlp.com (Postfix) with ESMTPS id 9CF3C18010A;
	Tue,  3 Sep 2024 09:19:57 +0800 (CST)
Received: from [10.67.111.104] (10.67.111.104) by
 dggpeml500022.china.huawei.com (7.185.36.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Sep 2024 09:19:57 +0800
Message-ID: <a61da5f3-cdf2-4808-a2e8-993053c30bf1@huawei.com>
Date: Tue, 3 Sep 2024 09:19:56 +0800
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] media: intel/ipu6: make use of dev_err_cast_probe()
Content-Language: en-US
To: Bingbu Cao <bingbu.cao@linux.intel.com>, <sakari.ailus@linux.intel.com>,
	<bingbu.cao@intel.com>, <tian.shu.qiu@intel.com>, <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <lihongbo22@huawe.com>
References: <20240902131553.3088122-1-lihongbo22@huawei.com>
 <08217997-6454-e4d7-b2f2-a81cad70572e@linux.intel.com>
From: Hongbo Li <lihongbo22@huawei.com>
In-Reply-To: <08217997-6454-e4d7-b2f2-a81cad70572e@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500022.china.huawei.com (7.185.36.66)



On 2024/9/3 8:21, Bingbu Cao wrote:
> Hongbo,
> 
> Why do you send same patch repeatly? I have some comments before.
> BTW, a typo is in your cc list.

oh, sorry, I almost missed that email. May be it cannot be used in 6.10, 
but I have seen many modules have been changed like this way.

Thanks,
Hongbo

> 
> On 9/2/24 9:15 PM, Hongbo Li wrote:
>> Using dev_err_cast_probe() to simplify the code.
>> No functional changes.
>>
>> Signed-off-by: Hongbo Li <lihongbo22@huawei.com>
>> ---
>>   drivers/media/pci/intel/ipu6/ipu6.c | 20 ++++++++------------
>>   1 file changed, 8 insertions(+), 12 deletions(-)
>>
> 

