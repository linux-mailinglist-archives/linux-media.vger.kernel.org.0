Return-Path: <linux-media+bounces-48695-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D65CB8549
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 09:55:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09C95308E490
	for <lists+linux-media@lfdr.de>; Fri, 12 Dec 2025 08:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122543101CE;
	Fri, 12 Dec 2025 08:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b="frIILijI"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92FF2741A0;
	Fri, 12 Dec 2025 08:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765529551; cv=pass; b=fJYqbtSinI2YbrLn81ykO83E1524k0OCNjBcbT/htrd9zuxllWpFfjuJ5QaX/uNQw7YBNiCZA1mEdd/+822YiT4Ax0iXntBvdlBh0q9E70YpLSK5Eg9MTvS/eIHoYiyZKXBNgajNQS8Llp75YlrMc8cgCduu4VoDDQdN755mOg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765529551; c=relaxed/simple;
	bh=BsQ5+N82BLq7h9EPzOmGWZGFXT4FPYACHwV1bAg+AHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TgpZc5qhC954Pj9mNBx9yiKF67jMObFpwnWwh65NDEvT85XGJP39dadTvy8xabaf1hoO1s7RPOqirv8lalhUZUgHd4KnW1ivR6cw0/T/vCBjfe2Epnw64Og39G3afLTDNgt8/6LyXGHVHYuWvHihbFgLZeH6c6hct2S9TqZYa4A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=benjamin.gaignard@collabora.com header.b=frIILijI; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1765529517; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=G2a/yMRoNYEYX32qsSh9klxJhkz42oM/Rs6xEqUkj0GCib3cTPtgakDODcACfn3fPOSdTjp5nCQ4HrmJngxT8hhyZf7P9E6vA3a5QwC4fSg7T189qetTRc0W3hnqp3yRgbsWkW2LxdAe1R679CZ3AROCYtTbM3vG2pMgTd1muF8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1765529517; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xnItVhoY0Lh4ZLV1sF8rYZtnMRWqPjsgUKn0khqX+aY=; 
	b=BI76Zs6kc6v3+Stj5VlhmI+2TOP8RS8JG2lFviNZwApLZgZGTiGjkPb3B23h98BKyjHhWOwR5elzisMyHTr9GLo9tG3k6uQhHC4Zpk8IjIMrPvqVV99Ra4CWOpcZwPRvjoLuY6va0bntFhXR45YVOngOmGaOFbGTDj19AAmBGEE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765529517;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=xnItVhoY0Lh4ZLV1sF8rYZtnMRWqPjsgUKn0khqX+aY=;
	b=frIILijI+V7VsU7x9gFc0FgCtswAJVCRHVYaKIzxLkHrpO68qTVpwrcmRFR3+WkL
	mt4ffUw6Br0SsK57xAw4CqvUYtbl0gczF3m/vK4EvR/LI05DhyHqQ76aHxc/37MVr5V
	VI/8jNg2/7GGPYhGECQCln5VIG2Jznk0GfV7S9cA=
Received: by mx.zohomail.com with SMTPS id 1765529515530660.6512833937438;
	Fri, 12 Dec 2025 00:51:55 -0800 (PST)
Message-ID: <ea3241f1-14a4-44a0-9d85-3fa2a2f6f1ae@collabora.com>
Date: Fri, 12 Dec 2025 09:51:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/7] iommu: Add verisilicon IOMMU driver
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de,
 iommu@lists.linux.dev, jgg@ziepe.ca, joro@8bytes.org, kernel@collabora.com,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, mchehab@kernel.org,
 nicolas.dufresne@collabora.com, p.zabel@pengutronix.de, robh@kernel.org,
 robin.murphy@arm.com
References: <20250911155720.180465-4-benjamin.gaignard@collabora.com>
 <20251212033157.3036182-1-liujianfeng1994@gmail.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20251212033157.3036182-1-liujianfeng1994@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Le 12/12/2025 à 04:31, Jianfeng Liu a écrit :
> Hi,
>
> On Thu, 11 Sep 2025 17:57:13 +0200, Benjamin Gaignard wrote:
>> +#ifdef CONFIG_VSI_IOMMU
>> +void vsi_iommu_restore_ctx(struct iommu_domain *domain);
>> +#else
>> +static inline void vsi_iommu_restore_ctx(struct iommu_domain *domain) {}
>> +#endif
> After applying this patch to v6.18, I get error when building this driver
> as module:
>
> drivers/iommu/vsi-iommu.c:541:6: error: redefinition of 'vsi_iommu_restore_ctx'
>    541 | void vsi_iommu_restore_ctx(struct iommu_domain *domain)
>     |      ^~~~~~~~~~~~~~~~~~~~~
> In file included from drivers/iommu/vsi-iommu.c:31:
> ./include/linux/vsi-iommu.h:18:20: note: previous definition of 'vsi_iommu_restore_ctx' with type 'void(struct iommu_domain *)'
> 18 | static inline void vsi_iommu_restore_ctx(struct iommu_domain *domain) {}
>     |                    ^~~~~~~~~~~~~~~~~~~~~
>
> I have to use:
> #if IS_ENABLED(CONFIG_VSI_IOMMU)
> instead.

I have fix in my internal v10 branch:
https://gitlab.collabora.com/linux/for-upstream/-/commits/verisilicon_mmu_v10
I don't plan to send this update because that will change nothing about code duplication remarks.

Thanks for the report.
Regards,
Benjamin

> Best regards,
> Jianfeng
>

