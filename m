Return-Path: <linux-media+bounces-20089-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7D09AC37C
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 11:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A48931F24887
	for <lists+linux-media@lfdr.de>; Wed, 23 Oct 2024 09:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CECF61A0721;
	Wed, 23 Oct 2024 09:18:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FF819E826
	for <linux-media@vger.kernel.org>; Wed, 23 Oct 2024 09:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729675092; cv=none; b=tL/vyGbm586DJ3CUbjWp7x9RgUiaPIRkxpNB/EX9aaS77k4ox1tiIDvcRQ7Fg23fmx5eEZcHYb8rGVJE9zRv6dUS8/IwN2cvJru8jQWGCOKQWZhHdNg8VLPOqBNCJVdnTDyeSYXOJEh4rSl6kKmRX9qLpLRI8XgVXuCYh9W203U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729675092; c=relaxed/simple;
	bh=wVBLbSdCLggbzF8MMyxZdbdYsAvhkH3DpLxdQePFbl8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=tDlWtRf/kjBczxCnPAwsiCF0XxU69avzP0PoNh+hg+DerWFc/wXihR9vgzjYZbjn+mLyLbt1HRvAffCpJ30WnclmjIVekD0shNHYwUI/VEhzUaRd3rJEuPYR6n9Cwh54a/KG0mg9q/g6n5um7BReQAwPpX6JCzLcu2PyxIEgYpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from [192.168.42.135] (85-193-2-23.rib.o2.cz [85.193.2.23])
	by mx.gpxsee.org (Postfix) with ESMTPSA id ABB5198A0;
	Wed, 23 Oct 2024 11:18:06 +0200 (CEST)
Message-ID: <2ae69cc3-3007-41f0-b04d-e5f20c9650d4@gpxsee.org>
Date: Wed, 23 Oct 2024 11:18:06 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] media: pci: mgb4: Fix return value check in
 debugfs_init()
From: =?UTF-8?Q?Martin_T=C5=AFma?= <tumic@gpxsee.org>
To: Zhen Lei <thunder.leizhen@huawei.com>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
References: <20241023063638.241-1-thunder.leizhen@huawei.com>
 <52fe2c5c-dfb4-43d0-b091-47748d2a02b5@gpxsee.org>
Content-Language: en-US
In-Reply-To: <52fe2c5c-dfb4-43d0-b091-47748d2a02b5@gpxsee.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23. 10. 24 11:04, Martin Tůma wrote:
> On 23. 10. 24 8:36, Zhen Lei wrote:
>> Fix the incorrect return value check for debugfs_create_dir(), which
>> returns ERR_PTR(-ERROR) instead of NULL when it fails.
>>
>> Fixes: 0ab13674a9bd ("media: pci: mgb4: Added Digiteq Automotive MGB4 
>> driver")
>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>> ---
>>   drivers/media/pci/mgb4/mgb4_vin.c  | 2 +-
>>   drivers/media/pci/mgb4/mgb4_vout.c | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/ 
>> mgb4/mgb4_vin.c
>> index e9332abb31729ea..808eb51b270c755 100644
>> --- a/drivers/media/pci/mgb4/mgb4_vin.c
>> +++ b/drivers/media/pci/mgb4/mgb4_vin.c
>> @@ -860,7 +860,7 @@ static void debugfs_init(struct mgb4_vin_dev *vindev)
>>       vindev->debugfs = debugfs_create_dir(vindev->vdev.name,
>>                            vindev->mgbdev->debugfs);
>> -    if (!vindev->debugfs)
>> +    if (IS_ERR(vindev->debugfs))
>>           return;
>>       vindev->regs[0].name = "CONFIG";
>> diff --git a/drivers/media/pci/mgb4/mgb4_vout.c b/drivers/media/pci/ 
>> mgb4/mgb4_vout.c
>> index 998edcbd972387d..348c8e01fcbed5a 100644
>> --- a/drivers/media/pci/mgb4/mgb4_vout.c
>> +++ b/drivers/media/pci/mgb4/mgb4_vout.c
>> @@ -683,7 +683,7 @@ static void debugfs_init(struct mgb4_vout_dev 
>> *voutdev)
>>       voutdev->debugfs = debugfs_create_dir(voutdev->vdev.name,
>>                             voutdev->mgbdev->debugfs);
>> -    if (!voutdev->debugfs)
>> +    if (IS_ERR(voutdev->debugfs))
>>           return;
>>       voutdev->regs[0].name = "CONFIG";
> 
> This issue has already been addressed and fixed, see the v4l2 media.git 
> branch:

v4l2 media.git next branch

> 
> https://git.linuxtv.org/media.git/tree/drivers/media/pci/mgb4/mgb4_vin.c 
> https://git.linuxtv.org/media.git/tree/drivers/media/pci/mgb4/mgb4_vout.c
> 
> M.
> 


