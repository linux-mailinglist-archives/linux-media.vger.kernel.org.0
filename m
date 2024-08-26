Return-Path: <linux-media+bounces-16818-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 644F595F322
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 15:38:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE05BB22972
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 13:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 854AE186E47;
	Mon, 26 Aug 2024 13:38:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EEF139D;
	Mon, 26 Aug 2024 13:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.14.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724679486; cv=none; b=NslnPrf7fwg4w4FemTF6nkMeH7ZPPvU5VsHbL4a2WDAl3yDVYov5pzqjJrCHV2+R1pAwMSUMzWKoauZbiKq/LOLUyypHO0Xd8vRwVS4hfjO9nKfkU8KP67smFAFwXbaCHKUegtkZ0ev1nxDJOSPosqQY1bCIATNiHS1T63w4NeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724679486; c=relaxed/simple;
	bh=hf/Kd7cutvj/ZCcJt7L77DhfF60YOryJrjPHF3r/77I=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=T6VD6gp6m+Zu4wdQyIHPJKrCgfpEV+gbaNp2FarQhw2SI95pLUnR/cXMEu2Vjm7Fc/4iynn4+V40x1oJtOVn59F0Nsce3gjiC001Qo7HSwDiOr0RKS9CuCgj8RlHhptNVdWPe0VB0I5DwoiiDw9q9n+hLWt7ERca5VbiGf0ZYQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org; spf=pass smtp.mailfrom=gpxsee.org; arc=none smtp.client-ip=37.205.14.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gpxsee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gpxsee.org
Received: from [192.168.4.14] (unknown [62.77.71.229])
	by mx.gpxsee.org (Postfix) with ESMTPSA id C581A2A91E;
	Mon, 26 Aug 2024 15:38:02 +0200 (CEST)
Message-ID: <3ce870c8-fb14-4010-b8e2-effbde2b09a7@gpxsee.org>
Date: Mon, 26 Aug 2024 15:38:02 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drivers:mgb4:Fix the NULL vs IS_ERR() bug for
 debugfs_create_dir()
From: =?UTF-8?Q?Martin_T=C5=AFma?= <tumic@gpxsee.org>
To: Yang Ruibin <11162571@vivo.com>,
 Martin Tuma <martin.tuma@digiteqautomotive.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20240821071100.7839-1-11162571@vivo.com>
 <ca03a058-c374-44e2-8f44-ccaec8898337@gpxsee.org>
Content-Language: en-US
In-Reply-To: <ca03a058-c374-44e2-8f44-ccaec8898337@gpxsee.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21. 08. 24 10:56 dop., Martin Tůma wrote:
> On 21. 08. 24 9:10 dop., Yang Ruibin wrote:
>> The debugfs_create_dir() function returns error pointers.
>> It never returns NULL. So use IS_ERR() to check it.
>>
>> Signed-off-by: Yang Ruibin <11162571@vivo.com>
>> ---
>>   drivers/media/pci/mgb4/mgb4_vout.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/pci/mgb4/mgb4_vout.c 
>> b/drivers/media/pci/mgb4/mgb4_vout.c
>> index 998edcbd9723..348c8e01fcbe 100644
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
> Reviewed-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
> 
> 

Superseded by
 
https://patchwork.linuxtv.org/project/linux-media/patch/20240826132604.3240-2-tumic@gpxsee.org/
that handles both the input/output device cases as well as an error when 
creating the parent mgb4(PCIe) device.

M.

