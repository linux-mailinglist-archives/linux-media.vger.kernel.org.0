Return-Path: <linux-media+bounces-32492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EF390AB6D08
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 15:44:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0263171548
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 13:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E64027702D;
	Wed, 14 May 2025 13:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="nwSfB6JZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D3827A451
	for <linux-media@vger.kernel.org>; Wed, 14 May 2025 13:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747230249; cv=none; b=o5WEgR/UyJmTpWGC84fmoM/sQM3F2YXB4gSZMBMxmOb9REkRfxrtOGH38YjQJZmyD3MUGhQ/81yWCtIfJuQe79GYFoLBSnvvg+CHwP7p4s6cWM0iaiH8LO97FU4PXMqzjXh66Wxngjp/GUh4WJ95PdePVEsMyeVh7+v2Fzch+9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747230249; c=relaxed/simple;
	bh=GJ0WPgaz69TA+huSDeCizvifJUTzxLjucLtrozECOAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=UHCRqvxS4Q7agKKtjrUEEYSaF+LwbHKvdCkGQgeir1u7U2A1tKrqU2KoBGkUhxj2q99XKAHNLxavxm5OOtNTYzts34wNgZ0TI63/8nQuh3ZTrm0btfQ3ZwwEZi9Ia6HxSupv7rCuxS+bOvP4LjPCDppbimN7eIx0Tg+b2vpI6CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=nwSfB6JZ; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250514134405euoutp01953a0d4eef7057cea4dcdeadfed92dc1~-aKaUULxY1857718577euoutp01n
	for <linux-media@vger.kernel.org>; Wed, 14 May 2025 13:44:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250514134405euoutp01953a0d4eef7057cea4dcdeadfed92dc1~-aKaUULxY1857718577euoutp01n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747230245;
	bh=J+BWsOIAHUAdR95Qq/3XrIREWdn2xQyWomnghKsV3Hw=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=nwSfB6JZzEyJOsz+PFmh3/c/+zTavip1a4h335ssd5wORt0cVllye5D96+rzcQWP1
	 XGBYuomZOTm/0+5sZBjG1p9+sU5GltBYvRXe8a0e21xxlszhhXh/UPZ2clQNyi6mpX
	 r8CAM2WfwIMezGzH0gZvr519Epw5CiVkTv5ynt4o=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250514134404eucas1p1f96b6d77101e2564268326e8806d2abd~-aKaEMTiz0729107291eucas1p1n;
	Wed, 14 May 2025 13:44:04 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250514134403eusmtip2e8de4e0e3be32be5d7f675ad67919809~-aKZMIJwc0929609296eusmtip2G;
	Wed, 14 May 2025 13:44:03 +0000 (GMT)
Message-ID: <c90bf515-9050-4ed7-b733-28b14536b913@samsung.com>
Date: Wed, 14 May 2025 15:44:03 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] [PATCH v3 2/3] udmabuf: use sgtable-based
 scatterlist wrappers
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
Cc: Gerd Hoffmann <kraxel@redhat.com>, Vivek Kasireddy
	<vivek.kasireddy@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>,
	Gurchetan Singh <gurchetansingh@chromium.org>, Robin Murphy
	<robin.murphy@arm.com>, stable@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <7a6475cb-4ebe-46a3-92a2-f29fbc8e5e41@amd.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250514134404eucas1p1f96b6d77101e2564268326e8806d2abd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250507160922eucas1p11bd044bb458626dc0004bd2fd83605c0
X-EPHeader: CA
X-CMS-RootMailID: 20250507160922eucas1p11bd044bb458626dc0004bd2fd83605c0
References: <20250507160913.2084079-1-m.szyprowski@samsung.com>
	<CGME20250507160922eucas1p11bd044bb458626dc0004bd2fd83605c0@eucas1p1.samsung.com>
	<20250507160913.2084079-3-m.szyprowski@samsung.com>
	<7a6475cb-4ebe-46a3-92a2-f29fbc8e5e41@amd.com>

On 08.05.2025 11:57, Christian König wrote:
> On 5/7/25 18:09, Marek Szyprowski wrote:
>> Use common wrappers operating directly on the struct sg_table objects to
>> fix incorrect use of scatterlists sync calls. dma_sync_sg_for_*()
>> functions have to be called with the number of elements originally passed
>> to dma_map_sg_*() function, not the one returned in sgtable's nents.
>>
>> Fixes: 1ffe09590121 ("udmabuf: fix dma-buf cpu access")
>> CC: stable@vger.kernel.org
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
>
> Should I push this one to drm-misc-fixes for upstreaming?

Yes, please. The other 2 patches have been taken by the media maintainers.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


