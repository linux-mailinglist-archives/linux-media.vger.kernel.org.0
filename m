Return-Path: <linux-media+bounces-20139-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AE99AD91E
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 03:15:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C24C282EBB
	for <lists+linux-media@lfdr.de>; Thu, 24 Oct 2024 01:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10DC31B7F4;
	Thu, 24 Oct 2024 01:15:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E308A29
	for <linux-media@vger.kernel.org>; Thu, 24 Oct 2024 01:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.255
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729732549; cv=none; b=V4hkCC3RDZF9C5YgSviIFIruRpbmT8L1gIR7CNEdhNnWoYfADAfMJU6cA5K09LR81WkuJpxl2fud+tQtyl6faNKUV/7EmLTpdUx+d9RG0zHRepByKJV8lwJTcsCmS4zXdI1u3/U2X3xJ0qFtR66ZpHUGAsLUGbkKW8c/MnsdSXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729732549; c=relaxed/simple;
	bh=fgWfT/XyTf0iluWkCSlHP9jPie835G+qBoL946XAphA=;
	h=Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=tlanp9AoinZiIWGO9fWgC+LqRPuQFAms538yfRAtiUR/ivMZGqDpKM4qgaZNl3LvVO19zCWodna5BczP0HAqZ5DAH67Q+j0zeDnsi75au639SvXcQcxqMRvnBulBR5LWGN58bpBt682dOz/rdZ8kLQyVsBUAnEt6UVZNJg73ODc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.255
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4XYnwv2m5Vz1T8Bt;
	Thu, 24 Oct 2024 09:13:35 +0800 (CST)
Received: from dggpemf100006.china.huawei.com (unknown [7.185.36.228])
	by mail.maildlp.com (Postfix) with ESMTPS id D33401402CB;
	Thu, 24 Oct 2024 09:15:37 +0800 (CST)
Received: from [10.174.178.55] (10.174.178.55) by
 dggpemf100006.china.huawei.com (7.185.36.228) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 24 Oct 2024 09:15:37 +0800
Subject: Re: [PATCH 1/1] media: pci: mgb4: Fix return value check in
 debugfs_init()
To: =?UTF-8?Q?Martin_T=c5=afma?= <tumic@gpxsee.org>, Martin Tuma
	<martin.tuma@digiteqautomotive.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, <linux-media@vger.kernel.org>
References: <20241023063638.241-1-thunder.leizhen@huawei.com>
 <52fe2c5c-dfb4-43d0-b091-47748d2a02b5@gpxsee.org>
 <2ae69cc3-3007-41f0-b04d-e5f20c9650d4@gpxsee.org>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <062318cd-ee66-3dad-29f9-b2d77345d81b@huawei.com>
Date: Thu, 24 Oct 2024 09:15:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2ae69cc3-3007-41f0-b04d-e5f20c9650d4@gpxsee.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemf100006.china.huawei.com (7.185.36.228)



On 2024/10/23 17:18, Martin Tůma wrote:
> On 23. 10. 24 11:04, Martin Tůma wrote:
>> On 23. 10. 24 8:36, Zhen Lei wrote:
>>> Fix the incorrect return value check for debugfs_create_dir(), which
>>> returns ERR_PTR(-ERROR) instead of NULL when it fails.
>>>
>>> Fixes: 0ab13674a9bd ("media: pci: mgb4: Added Digiteq Automotive MGB4 driver")
>>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>>> ---
>>>   drivers/media/pci/mgb4/mgb4_vin.c  | 2 +-
>>>   drivers/media/pci/mgb4/mgb4_vout.c | 2 +-
>>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/ mgb4/mgb4_vin.c
>>> index e9332abb31729ea..808eb51b270c755 100644
>>> --- a/drivers/media/pci/mgb4/mgb4_vin.c
>>> +++ b/drivers/media/pci/mgb4/mgb4_vin.c
>>> @@ -860,7 +860,7 @@ static void debugfs_init(struct mgb4_vin_dev *vindev)
>>>       vindev->debugfs = debugfs_create_dir(vindev->vdev.name,
>>>                            vindev->mgbdev->debugfs);
>>> -    if (!vindev->debugfs)
>>> +    if (IS_ERR(vindev->debugfs))
>>>           return;
>>>       vindev->regs[0].name = "CONFIG";
>>> diff --git a/drivers/media/pci/mgb4/mgb4_vout.c b/drivers/media/pci/ mgb4/mgb4_vout.c
>>> index 998edcbd972387d..348c8e01fcbed5a 100644
>>> --- a/drivers/media/pci/mgb4/mgb4_vout.c
>>> +++ b/drivers/media/pci/mgb4/mgb4_vout.c
>>> @@ -683,7 +683,7 @@ static void debugfs_init(struct mgb4_vout_dev *voutdev)
>>>       voutdev->debugfs = debugfs_create_dir(voutdev->vdev.name,
>>>                             voutdev->mgbdev->debugfs);
>>> -    if (!voutdev->debugfs)
>>> +    if (IS_ERR(voutdev->debugfs))
>>>           return;
>>>       voutdev->regs[0].name = "CONFIG";
>>
>> This issue has already been addressed and fixed, see the v4l2 media.git branch:
> 
> v4l2 media.git next branch

OK, I see it, thanks.

> 
>>
>> https://git.linuxtv.org/media.git/tree/drivers/media/pci/mgb4/mgb4_vin.c https://git.linuxtv.org/media.git/tree/drivers/media/pci/mgb4/mgb4_vout.c
>>
>> M.
>>
> 
> .
> 

-- 
Regards,
  Zhen Lei

