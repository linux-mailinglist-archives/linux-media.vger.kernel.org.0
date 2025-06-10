Return-Path: <linux-media+bounces-34464-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3583FAD3F0C
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 18:34:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D943189FB14
	for <lists+linux-media@lfdr.de>; Tue, 10 Jun 2025 16:34:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FD5D2417D4;
	Tue, 10 Jun 2025 16:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="OE39vPKy"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5CE240604
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 16:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749573264; cv=none; b=Wnnecpi0gLwC/BlgHTeJzWDQvxiLiI9PuULEdSgfxkjqEdktt9ZYPJTFJHgFfVF0E/Lt8IH7o3qhMqTk+HkPyC3ROJ0JfSk2tnFUQs9SvtHIFqfD+5GvZSuXnCIiN/4BfB+Eha4wHhGdnuCMcmNZ3hOOpYz1mngsNbm1iYtaWv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749573264; c=relaxed/simple;
	bh=9UbyfmdD0N0dtcss4EwrOq1g2t3lQ+EWaP83S3mDTrY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:In-Reply-To:
	 Content-Type:References; b=YAdvBEoRj22ZKETFyITW1w++PcrALPKuv6MkKwDcweC/Z0aDRMZvbICQsngTaOyegUTguxpFOSjI8wKWyyTByR9XKMBLFaqOcbZyG0+3KTLrTClYawKzUP6xHvhx0b7bJqj+RRYNkOOBjjqxHGO0MTIHDhx61UF7VGL8LDmErP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=OE39vPKy; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250610163420euoutp02e625870e9c0aa30dc775832a47c92664~Hu5xWCcng1163111631euoutp02K
	for <linux-media@vger.kernel.org>; Tue, 10 Jun 2025 16:34:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250610163420euoutp02e625870e9c0aa30dc775832a47c92664~Hu5xWCcng1163111631euoutp02K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749573260;
	bh=NS7GzjVzxQWVeneNGnikOfI3wBaZea46fIVMRvzt3fA=;
	h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
	b=OE39vPKyqrq7U68twaogEU5JZBFGOcbJJ6ConSRJecWeHnrF1m7BY4w11r7p/M+zQ
	 ZI2dpgINR57Y8CPwpGaWh4dUqPoRYPUKqNNgJXcewuShwRwExE+8KM8wTJCusyjAPa
	 nEkfCGJDopqTNJxi9rs2hQLSoOvUyWwPUb6Huyl0=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250610163420eucas1p25f008a064b4511f1c3bee4b862eaa94a~Hu5xE6xJS2358223582eucas1p2B;
	Tue, 10 Jun 2025 16:34:20 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250610163418eusmtip2e9144f0c61d4a2cdcbabc925173949e3~Hu5vrCJWM0431404314eusmtip2f;
	Tue, 10 Jun 2025 16:34:18 +0000 (GMT)
Message-ID: <3d65e71e-5847-4c0f-98ff-318086f14ee2@samsung.com>
Date: Tue, 10 Jun 2025 18:34:18 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] [PATCH v3 2/3] udmabuf: use sgtable-based
 scatterlist wrappers
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
Cc: Gerd Hoffmann <kraxel@redhat.com>, Vivek Kasireddy
	<vivek.kasireddy@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>,
	Gurchetan Singh <gurchetansingh@chromium.org>, Robin Murphy
	<robin.murphy@arm.com>, stable@vger.kernel.org
Content-Language: en-US
In-Reply-To: <c90bf515-9050-4ed7-b733-28b14536b913@samsung.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250610163420eucas1p25f008a064b4511f1c3bee4b862eaa94a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250507160922eucas1p11bd044bb458626dc0004bd2fd83605c0
X-EPHeader: CA
X-CMS-RootMailID: 20250507160922eucas1p11bd044bb458626dc0004bd2fd83605c0
References: <20250507160913.2084079-1-m.szyprowski@samsung.com>
	<CGME20250507160922eucas1p11bd044bb458626dc0004bd2fd83605c0@eucas1p1.samsung.com>
	<20250507160913.2084079-3-m.szyprowski@samsung.com>
	<7a6475cb-4ebe-46a3-92a2-f29fbc8e5e41@amd.com>
	<c90bf515-9050-4ed7-b733-28b14536b913@samsung.com>

On 14.05.2025 15:44, Marek Szyprowski wrote:
> On 08.05.2025 11:57, Christian König wrote:
>> On 5/7/25 18:09, Marek Szyprowski wrote:
>>> Use common wrappers operating directly on the struct sg_table 
>>> objects to
>>> fix incorrect use of scatterlists sync calls. dma_sync_sg_for_*()
>>> functions have to be called with the number of elements originally 
>>> passed
>>> to dma_map_sg_*() function, not the one returned in sgtable's nents.
>>>
>>> Fixes: 1ffe09590121 ("udmabuf: fix dma-buf cpu access")
>>> CC: stable@vger.kernel.org
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
>> Should I push this one to drm-misc-fixes for upstreaming?
>
> Yes, please. The other 2 patches have been taken by the media maintainers.

Gentle ping

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


