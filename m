Return-Path: <linux-media+bounces-37465-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E232B01758
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 11:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF65D58638A
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 09:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D8A2620F5;
	Fri, 11 Jul 2025 09:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="L8C2z9EX"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA80C2609EE
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 09:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752225113; cv=none; b=ES0n3tQ94rl4tuptI4AO8apcmiVDNWUDzUUhS1o144YNnuZPS5dQdnrUNvGuR95EqNYrar3L1E3nv7j9LTfZFZ1rHDugve6LY3PNiUPzqVwBqSIfXS1FwBVwjlfvSLAyW9KLuo1Xlk2XDkDEJgaJ+gfdClCIpY4+2FG031H4Nzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752225113; c=relaxed/simple;
	bh=D8pIQC6YL2i1zMIbIHPliFR2Wb9Vh2pS6jgIn1D3xvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=ofajMvKc+RQ32P/j4fvYdPHmyPhKrglFYUxuXUN+zvNBQQfaf+Cb8zR3XBb2mZ9aZkEhkKJBqDAB8aoYxAaYSH+Uk06BjkE0JQSHpTkiqm9aE4aucYNHiuWhmo5qwExsifChpxZ7+poE+EIty8nXk0+Daavycon+u/GvmhHwYB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=L8C2z9EX; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250711091148euoutp02dbcb42e05ce91702136f33035ea191cd~RJ3PnE3EK3236932369euoutp02T
	for <linux-media@vger.kernel.org>; Fri, 11 Jul 2025 09:11:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250711091148euoutp02dbcb42e05ce91702136f33035ea191cd~RJ3PnE3EK3236932369euoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752225108;
	bh=pmHy8qRa9mxq0lG/3kCccY4y79o9b+Fwzvv1PEnD1Dc=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=L8C2z9EXcWkoL87gmTY5pzE+soqyb1fa2rHCwj28252Z8W0uzg69BxyZHH4gqXyg6
	 GOr1uJfFzSeuzB9xWUmv2aTBo4f/DDVcDVIT+F3/bGEZ+FhFKklEUcaJfcwdBLwMgd
	 FrHnAr6lKyJcz6QYHnTBBqeORc4YuZSI1Sonfob8=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250711091148eucas1p2610f6d9b1bf871ca9f1d4e3e793fafec~RJ3PBQdfL0207602076eucas1p2K;
	Fri, 11 Jul 2025 09:11:48 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250711091147eusmtip1618e2e64b1e04f0b8ebc90e07cd13385~RJ3Oe1ciM1255912559eusmtip1k;
	Fri, 11 Jul 2025 09:11:47 +0000 (GMT)
Message-ID: <c5f51055-5771-4eb0-9bc7-d86d3bb1c196@samsung.com>
Date: Fri, 11 Jul 2025 11:11:47 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: v4l2: Add support for NV12M tiled variants to
 v4l2_format_info()
To: Nicolas Dufresne <nicolas@ndufresne.ca>, linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	<hverkuil@kernel.org>, linux-fsd@tesla.com, Smitha T Murthy
	<smithatmurthy@gmail.com>, Aakarsh Jain <aakarsh.jain@samsung.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <2547684f36a71cef644e2a13ad5a05bffab89c50.camel@ndufresne.ca>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250711091148eucas1p2610f6d9b1bf871ca9f1d4e3e793fafec
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250710075144eucas1p2eebcb5acd8d06bd6fbe75378c6d6374f
X-EPHeader: CA
X-CMS-RootMailID: 20250710075144eucas1p2eebcb5acd8d06bd6fbe75378c6d6374f
References: <CGME20250710075144eucas1p2eebcb5acd8d06bd6fbe75378c6d6374f@eucas1p2.samsung.com>
	<20250710075130.3940569-1-m.szyprowski@samsung.com>
	<2547684f36a71cef644e2a13ad5a05bffab89c50.camel@ndufresne.ca>

On 10.07.2025 17:37, Nicolas Dufresne wrote:
> Le jeudi 10 juillet 2025 à 09:51 +0200, Marek Szyprowski a écrit :
>> Commit 6f1466123d73 ("media: s5p-mfc: Add YV12 and I420 multiplanar
>> format support") added support for the new formats to s5p-mfc driver,
>> what in turn required some internal calls to the v4l2_format_info()
>> function while setting up formats. This in turn broke support for the
>> "old" tiled NV12MT* formats, which are not recognized by this function.
>> Fix this by adding those variants of NV12M pixel format to
>> v4l2_format_info() function database.
> Since you mention something broke, should this come with a Fixes: tag ?

I wasn't sure that such change in generic v4l2 code deserves a tag 
pointing to the commit in the niche driver.

>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-common.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
>> index df40756ac8f6..0829d7028ef7 100644
>> --- a/drivers/media/v4l2-core/v4l2-common.c
>> +++ b/drivers/media/v4l2-core/v4l2-common.c
>> @@ -323,6 +323,10 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
>>   		{ .format = V4L2_PIX_FMT_NV61M,   .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
>>   		{ .format = V4L2_PIX_FMT_P012M,   .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 2, 4, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
>>   
>> +		/* Tiled YUV formats, non contiguous variant */
> Since these are tiled, it should not leave the block_w/block_h to 0. NV12_4L4/P010_4L4
> are the broken example, we missed, and the drivers using them actually uses bigger
> alignment. And that makes me notice MT2110T/R are not in the tiled group :-(

I assume that these formats would require separate cleanup.

>> +		{ .format = V4L2_PIX_FMT_NV12MT,        .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
> So this one is special, 32x32 tiles, but they come in pair row wise, so the data
> must be aligned 64x32.
>
> 		  .block_w = { 64, 32, 0, 0 }, .block_h = { 32, 16, 0, 0 }},
>
>> +		{ .format = V4L2_PIX_FMT_NV12MT_16X16,  .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 2, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
> 		  .block_w = { 16, 8, 0, 0 }, .block_h = { 16, 8, 0, 0 }},
>
> Please double check, the block is in pixels, so on interleave plane, 1 pixels
> contains 2 bytes. The stride (bytesperline) should endup the same for both
> planes.

Right, I missed those block_w/h restrictions, thanks for pointing them. 
I assumed that most parameters will be the same as for the generic 
V4L2_PIX_FMT_NV12 case as those formats only differs by macroblock pixel 
layout.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


