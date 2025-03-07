Return-Path: <linux-media+bounces-27825-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFF5A56472
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 10:59:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 527F13B09BF
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 09:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 839E420CCC2;
	Fri,  7 Mar 2025 09:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="YHysda3A"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEF5204C2A;
	Fri,  7 Mar 2025 09:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741341540; cv=pass; b=ajbW1dw6TMFPCeQJ/atwmy5MgT6Dv+lasq7LHeBrtKXstquoww0J58FXp8NWICChyHy9m1d0+8vfd/Fh4TgYZgi7Rbqe1StgQ/CCOenjuSBexgY+eNYe2SAYA52BkY6mTOVGjrliiHUuiXbsfSqPT0YC+6FIKK5X5ttVD4XI4QE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741341540; c=relaxed/simple;
	bh=sh0lyBC+9zQydcsp6rYm1YiuA10rQP0OryKOargKp64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qjaPYVhHz7mkZKH0JFX6Ciy+fvyRCVDYU8+bipalySWeihTMRCepiZfZ7IvHFx5thwkVgbguTbRIesj6NuNPV+dllBXUJWPcJWh1irC4tGPQQtPioiQSfUH6IpdHLT2e2OjjR5xbBzVD+Gdy7euX/cJLHsmhx/+6kxanCq8TT5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=YHysda3A; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1741341500; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Z/PR+U4MA9bcDqOgjLzb9aFLSqOfjQCNLN9CWXAeqCSaQ2wexkyxP1Bg/xD0fmk8RquwWyFiArD1B3UiqE6iMXVnW0hOKgSKOfNSoAQ7i813gQ0JRMIYg6WGxknxMtOD7rLnAWQBM9LWalrtEwE1AUWt1bi4+pu17mNed8EyYb4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741341500; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Sd6Z99EJ8ZfYhr95vBuuNjDtXLH/fo9bgS3ZF5FRe+A=; 
	b=Qpm3aURsAO+MlocU75G0A8cgylgrCbRoof3nsZVioW00rCGtdvFtOkxb0Zo7WVk0HduFlADq+lK3HqVMdKEetK1JNFes7+ErPFf+Sqf6gI+FLG1s/IqdhmyB7APaBA43BVR8JxIBG/nza1zVBNPQUJS9G8STIDAD2GZ0s5+5UL0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741341500;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Sd6Z99EJ8ZfYhr95vBuuNjDtXLH/fo9bgS3ZF5FRe+A=;
	b=YHysda3AUKg7FgH3xrjjMNnd/QXtAkN7B6bo8cAoMMwJY15V3jJuq1aiK+6+6CiF
	s8++XPd6/7Q7/zbieDWC6pTp8jK8u/U1Mj3yAnCBOQDOD8lpjR58007bAdKrqLz9k3t
	j/M2fjCiBh4+PgCjsVqhunTNhuwUajm8YR3Fyry4=
Received: by mx.zohomail.com with SMTPS id 174134149797959.40961357397384;
	Fri, 7 Mar 2025 01:58:17 -0800 (PST)
Message-ID: <64f8d179-9d0a-47ca-872c-aa92e44e7772@collabora.com>
Date: Fri, 7 Mar 2025 12:58:13 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] media: platform: synopsys: hdmirx: Fix compilation on
 32bit arches
To: Hans Verkuil <hverkuil@xs4all.nl>,
 Shreeya Patel <shreeya.patel@collabora.com>, Heiko Stuebner
 <heiko@sntech.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 jose.abreu@synopsys.com, nelson.costa@synopsys.com,
 shawn.wen@rock-chips.com, nicolas.dufresne@collabora.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Tim Surber <me@timsurber.de>
References: <20250307092113.646831-1-dmitry.osipenko@collabora.com>
 <8cb4af0d-935a-4305-a204-9c2f187e0593@xs4all.nl>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <8cb4af0d-935a-4305-a204-9c2f187e0593@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 3/7/25 12:54, Hans Verkuil wrote:
> Hi Dmitry,
> 
> On 07/03/2025 10:21, Dmitry Osipenko wrote:
>> The pixelclock is specified as 64bit integer and for this driver it
>> won't be above 600MHz. Fix the 64bit division of the pixclock for 32bit
>> kernel builds.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202503070743.WnRxStlk-lkp@intel.com/
>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> ---
>>  drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>> index 4d42da7255f3..7e342bbde967 100644
>> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
>> @@ -291,7 +291,7 @@ static void hdmirx_get_timings(struct snps_hdmirx_dev *hdmirx_dev,
>>  	hfp = htotal - hact - hs - hbp;
>>  	vfp = vtotal - vact - vs - vbp;
>>  
>> -	fps = (bt->pixelclock + (htotal * vtotal) / 2) / (htotal * vtotal);
>> +	fps = ((u32)bt->pixelclock + (htotal * vtotal) / 2) / (htotal * vtotal);
> 
> I just merged:
> 
> https://patchwork.linuxtv.org/project/linux-media/patch/20250306-synopsys-hdmirx-fix-64-div-v1-1-dd5ff38bba5e@kernel.org/
> 
> So you can either leave that patch in, or provide a patch on top.

Missed that patch you merged. No need to do anything then, thanks!

-- 
Best regards,
Dmitry

