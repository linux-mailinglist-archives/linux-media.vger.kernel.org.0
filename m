Return-Path: <linux-media+bounces-20760-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3251A9BAD1E
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 08:30:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB9F6281AD9
	for <lists+linux-media@lfdr.de>; Mon,  4 Nov 2024 07:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 733EB194C67;
	Mon,  4 Nov 2024 07:30:26 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFADD178CEC;
	Mon,  4 Nov 2024 07:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730705426; cv=none; b=SaAz+fx/ugc5cmPnVyWmt/aIA2altIvnpjz0IDNDT6odu2KRaMl/smPB3uhdLL+1wjH+ZFP5TOdjIru4ouu4HEmXjUARITOxbsbe19td3wqB5NN/Z6uxqGcWEfnnIrcc/9NWBI/x3CgV7hFqDFC2TRDdBvoaWu94DmXsNOj145Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730705426; c=relaxed/simple;
	bh=Lm6FoqocilW6YyaC8xa4epmZQuuVdYCw3powq9JwH6Q=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=kEXhWpVWqmikj7cqmqsnx2rHPkrTQMomeOXEm+hGDQKY/YdEmx4jeSEiwQafVHpHfOztfy/DLLD6Ezv/S3booVEnn1GMZ2nBIQaNf15peZjjZLfhl6aFA196KvQNxc790i0CRCzYrPSke6XeyUgIhbVhXXXu/jOGINszINwG738=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Xhjg92zJMz1HMDx;
	Mon,  4 Nov 2024 15:25:41 +0800 (CST)
Received: from kwepemf500004.china.huawei.com (unknown [7.202.181.242])
	by mail.maildlp.com (Postfix) with ESMTPS id 351FD140360;
	Mon,  4 Nov 2024 15:30:15 +0800 (CST)
Received: from [10.67.110.237] (10.67.110.237) by
 kwepemf500004.china.huawei.com (7.202.181.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 4 Nov 2024 15:30:14 +0800
Subject: Re: [PATCH] media: atomisp: Add check for rgby_data memory allocation
 failure
To: Andy Shevchenko <andy@kernel.org>
CC: <mchehab@kernel.org>, <hdegoede@redhat.com>,
	<sakari.ailus@linux.intel.com>, <gregkh@linuxfoundation.org>,
	<linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
References: <20241101154823.3067891-1-lihuafei1@huawei.com>
 <ZySRjyrxI9jrcY1q@smile.fi.intel.com>
 <d2590a9f-7786-ca08-a705-a5b287e74ba3@huawei.com>
 <ZySqY9YX0ke64Lf-@smile.fi.intel.com> <ZySzkw3wJa-1Z5jw@smile.fi.intel.com>
From: Li Huafei <lihuafei1@huawei.com>
Message-ID: <ae357384-284d-623f-b904-c0115cdda844@huawei.com>
Date: Mon, 4 Nov 2024 15:30:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZySzkw3wJa-1Z5jw@smile.fi.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf500004.china.huawei.com (7.202.181.242)



On 2024/11/1 18:55, Andy Shevchenko wrote:
> On Fri, Nov 01, 2024 at 12:16:03PM +0200, Andy Shevchenko wrote:
>> On Fri, Nov 01, 2024 at 05:57:36PM +0800, Li Huafei wrote:
>>> On 2024/11/1 16:30, Andy Shevchenko wrote:
>>>> On Fri, Nov 01, 2024 at 11:48:23PM +0800, Li Huafei wrote:
>>>>> In ia_css_3a_statistics_allocate(), there is no check on the allocation
>>>>> result of the rgby_data memory. If rgby_data is not successfully
>>>>> allocated, it may trigger the assert(host_stats->rgby_data) assertion in
>>>>> ia_css_s3a_hmem_decode(). Adding a check to fix this potential issue.
>>>>
>>>> Not sure if this code even run on currently supported hardware / firmware,
>>>> but fix looks okay.
>>>>
>>>>> Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
>>>>
>>>> No, this is an intermediate commit, you should find the original, which is
>>>> earlier in the history.
>>>
>>> Apologies, the correct fix tag should be:
>>>
>>> Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
>>>
>>> If this fix can be applied, do I need to send a v2, or can you help add the Fix tag?
>>
>> Up to Hans, but there is another question left unanswered about SoB chain.
>> Can you clarify that?
> 
> Ah, sorry, I misread the From and answered to the wrong thread.
> Fixes tag seems better now.
> 
Okay, I have sent v2:

v2: https://lore.kernel.org/lkml/20241104145051.3088231-1-lihuafei1@huawei.com/

Thanks,
Huafei

