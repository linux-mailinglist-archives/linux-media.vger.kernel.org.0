Return-Path: <linux-media+bounces-20684-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CD89B8E46
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 10:58:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B39EA1F2327F
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 09:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F13B170A3D;
	Fri,  1 Nov 2024 09:57:44 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691DD15C158;
	Fri,  1 Nov 2024 09:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730455063; cv=none; b=SF3GGUhTQmri2nd6oDr+bnjAtstDZxvZuqKvrF7faVmUGvUU3Gt9jGJU/lMNQ/9hAQ2m+MyzgljlY0sjs/ldf8BnlY3T5aWLHxkTNvCgRDBRs2xKuaTIZDGBnk7rzPZKnbdbJHD585VFjkdkNYVC4L5EDKMi/7pS24SP0Ig833Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730455063; c=relaxed/simple;
	bh=pK/WO2daHDcq6dA5/6aSgiM2yMEiHnUvcPj0ZRSJ19s=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=huTTOl1K5ZNlBypR+UKRNKHbEO+QAZfQARztC1UN44wIjr0/29mQ9rW/w92ltTYpVpRTwGReQX5RapVHFBVRsH5xNr0wnR3O3NvWzSRPFDN8APmnIdz0UquyO5znDL8NQElFX4M82WYOy/GQsn1vJzcmH4M/WIyHjwaJ1Evf294=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Xfx7J1tDTz10PFq;
	Fri,  1 Nov 2024 17:55:24 +0800 (CST)
Received: from kwepemf500004.china.huawei.com (unknown [7.202.181.242])
	by mail.maildlp.com (Postfix) with ESMTPS id E85861800A5;
	Fri,  1 Nov 2024 17:57:37 +0800 (CST)
Received: from [10.67.110.237] (10.67.110.237) by
 kwepemf500004.china.huawei.com (7.202.181.242) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 1 Nov 2024 17:57:37 +0800
Subject: Re: [PATCH] media: atomisp: Add check for rgby_data memory allocation
 failure
To: Andy Shevchenko <andy@kernel.org>
CC: <mchehab@kernel.org>, <hdegoede@redhat.com>,
	<sakari.ailus@linux.intel.com>, <gregkh@linuxfoundation.org>,
	<linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
References: <20241101154823.3067891-1-lihuafei1@huawei.com>
 <ZySRjyrxI9jrcY1q@smile.fi.intel.com>
From: Li Huafei <lihuafei1@huawei.com>
Message-ID: <d2590a9f-7786-ca08-a705-a5b287e74ba3@huawei.com>
Date: Fri, 1 Nov 2024 17:57:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZySRjyrxI9jrcY1q@smile.fi.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemf500004.china.huawei.com (7.202.181.242)


Hi Andy,

On 2024/11/1 16:30, Andy Shevchenko wrote:
> On Fri, Nov 01, 2024 at 11:48:23PM +0800, Li Huafei wrote:
>> In ia_css_3a_statistics_allocate(), there is no check on the allocation
>> result of the rgby_data memory. If rgby_data is not successfully
>> allocated, it may trigger the assert(host_stats->rgby_data) assertion in
>> ia_css_s3a_hmem_decode(). Adding a check to fix this potential issue.
> 
> Not sure if this code even run on currently supported hardware / firmware,
> but fix looks okay.
> 
>> Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
> 
> No, this is an intermediate commit, you should find the original, which is
> earlier in the history.
> 

Apologies, the correct fix tag should be:

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")

If this fix can be applied, do I need to send a v2, or can you help add the Fix tag?

Thanks,
Huafei

