Return-Path: <linux-media+bounces-32350-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0556AB4986
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 04:29:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5092C17F3F2
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 02:29:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E814E1B87C9;
	Tue, 13 May 2025 02:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="eRQ7d0fz"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F3841C7F
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 02:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747103369; cv=none; b=etoZjX+ZZSrpsGnjv6NL5La3xpoSRmk4LtBDR/pC0HyjV6oYI/+3x1wqgycQvgq1scjNyQT7Jz/rOkBikjGZF7Ni14+DcHs7+g2vOLVr7rRmQ88Tq3/sRZu4sYkS0HWSOCuOK3LLGYK3NQK9z+dFIK9Vieuc0Nm1Ds3m+E48nf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747103369; c=relaxed/simple;
	bh=ob/MwPIUanAXW2/dT7IDcGu+dS+IXfMNOAdIJYXN5+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=GMeCXcE+rmF0LjOLgDyqlQFJ0EiBoPl7EqVmFj2uGdjOaNPXJeXaKyViNp1O26c4RnuhKl2Ln1MIeBogik07dl43WBqZV6T4pQ0raXWNhXevbZp4UTaQoWvBd0pAkriJ7Bisua3hoURlKWs+NMFblcWeUoyoi9jgb78GgfZZlPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=eRQ7d0fz; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250513022924epoutp01b4e493a15d97400bb6c3c0048848ccca~_9UDXuZWd2521325213epoutp013
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 02:29:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250513022924epoutp01b4e493a15d97400bb6c3c0048848ccca~_9UDXuZWd2521325213epoutp013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747103364;
	bh=IicaQDkKtbQe1ausUDFbCbe++r6MaGwzgTL/G2ugDaY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eRQ7d0fzDCevTfLeDJw6+Xst136Q1Q5u/V0j2oawZv3f2tzzcYEUVAs8CQkUbeIwW
	 g5r2zxEq0zo1GTEKelXna08bWzFmRLAmEzlu7VF3oJ1V1Iz0G3Y2KLoo6sDSIC8fGP
	 yVHNItECRzhNxtWhGVn2p3vof3qumpD4sA+6wtDE=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250513022923epcas2p407e14f6a2a99a63b8440b38c84ec571a~_9UCqMKAj0752207522epcas2p41;
	Tue, 13 May 2025 02:29:23 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.101]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZxL5Z4khdz3hhTD; Tue, 13 May
	2025 02:29:22 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250513022921epcas2p27d201ffddda2189f94fc20b336e0eb84~_9UBBmfQU2762527625epcas2p2X;
	Tue, 13 May 2025 02:29:21 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250513022921epsmtrp2970b99450b221d9b76d2444149eaf54b~_9UBA-PpI2654826548epsmtrp2H;
	Tue, 13 May 2025 02:29:21 +0000 (GMT)
X-AuditID: b6c32a2a-d57fe70000002265-a3-6822ae818e3f
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	28.B2.08805.18EA2286; Tue, 13 May 2025 11:29:21 +0900 (KST)
Received: from au1-maretx-p37.eng.sarc.samsung.com (unknown
	[105.148.41.227]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250513022919epsmtip19c171ac69889c3c280e9a91142b3b089~_9T-K-IyC2306323063epsmtip1C;
	Tue, 13 May 2025 02:29:19 +0000 (GMT)
Date: Mon, 12 May 2025 21:29:14 -0500
From: Hyejeong Choi <hjeong.choi@samsung.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	sumit.semwal@linaro.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	hjeong.choi@samsung.com
Subject: Re: [PATCH] dma-buf: insert memory barrier before updating
 num_fences
Message-ID: <20250513022914.GA2330982@au1-maretx-p37.eng.sarc.samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <86ddb4dd-6327-4a4b-8584-df366737d636@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBLMWRmVeSWpSXmKPExsWy7bCSnG7jOqUMg5lNmhZv7+9mtbjy9T2b
	xcWer2wWX648ZLK4vGsOm0XPhq2sFqfufmZ3YPdovfSXzePOtT1sHve7jzN53P73mNmjb8sq
	Ro/Pm+QC2KK4bFJSczLLUov07RK4Mu5sucVS0MBTsffSNOYGxpOcXYwcHBICJhKn+qq6GLk4
	hAR2M0qca3rFBBGXlug4lt7FyAlkCkvcbznCClHTwCTxYMppJpAEi4CqxMqOmYwgNpuArsS2
	TzfYQGwRgRiJWRdOMIE0MAvMZpTof9vMCjJUWMBP4v0RsF5eAS+Jxp+72SGGnmeUuNO+Hyoh
	KHFy5hMWEJtZQEdi59Y7bCC9zEAHLf/HARGWl2jeOpsZxOYUsJZ4OX0XM0iJqICKxOcFAhMY
	hWYhGTQLyaBZCINmIRm0gJFlFaNkakFxbnpusWGBUV5quV5xYm5xaV66XnJ+7iZGcORoae1g
	3LPqg94hRiYOxkOMEhzMSiK8jdsVM4R4UxIrq1KL8uOLSnNSiw8xSnOwKInzfnvdmyIkkJ5Y
	kpqdmlqQWgSTZeLglGpgmtS91HU9z9Uu1Q8PHzvKdih1rjR3XMJlIffHeeXEcxOysw9N1Lyf
	qKqsvkuAdcf1wlJNjkMmIqbzUnbYBi8XX9ej9KU20ut+bMDB+2b/jyhnx0UecnhwhU+v7cbb
	W6yMew1vd7T7z0tbHbj4ofL2BcdFV0bxJ39J3G34XqrmYPP/pG2nbKS9a5adZG9o78jl23Ex
	wUf91CKJgBlyl35Eyatd/qH4uP0Az6F6t2ta+a2atSv6fLXtvpVOvCNYVry7pq13+lmFD3H3
	HO9VNSfwzwtvnZx773Swssf5lVLrnk7xU3yY+KneYIehglHt95NSp97/z+jQ63Z8dKbwYF2M
	2jqFZov8n8Jswpvk/L4rsRRnJBpqMRcVJwIALbISDAsDAAA=
X-CMS-MailID: 20250513022921epcas2p27d201ffddda2189f94fc20b336e0eb84
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----bwpRUJ-w.o_6tYjOOTP081ktEXBjAdpLJQBDwy6xW4Fo1YbP=_2d1f0_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250512111240epcas2p321f5121e34f63383e1724de05e55420d
References: <CGME20250512111240epcas2p321f5121e34f63383e1724de05e55420d@epcas2p3.samsung.com>
	<20250512111231.GA1265534@au1-maretx-p37.eng.sarc.samsung.com>
	<86ddb4dd-6327-4a4b-8584-df366737d636@amd.com>

------bwpRUJ-w.o_6tYjOOTP081ktEXBjAdpLJQBDwy6xW4Fo1YbP=_2d1f0_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline

Thank you for the review.
I re-sent updated patch, please take a look.

Best regards,
Hyejeong


On Mon, May 12, 2025 at 03:16:33PM +0200, Christian König wrote:
> On 5/12/25 13:12, Hyejeong Choi wrote:
> > smp_store_mb() inserts memory barrier after storing operation.
> > It is different with what the comment is originally aiming so Null
> > pointer dereference can be happened if memory update is reordered.
> > 
> > Signed-off-by: Hyejeong Choi <hjeong.choi@samsung.com>
> > ---
> >  drivers/dma-buf/dma-resv.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> > index 5f8d010516f0..52af5c7430da 100644
> > --- a/drivers/dma-buf/dma-resv.c
> > +++ b/drivers/dma-buf/dma-resv.c
> > @@ -320,8 +320,9 @@ void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
> >  	count++;
> >  
> >  	dma_resv_list_set(fobj, i, fence, usage);
> > -	/* pointer update must be visible before we extend the num_fences */
> > -	smp_store_mb(fobj->num_fences, count);
> > +	/* fence update must be visible before we extend the num_fences */
> > +	smp_wmb();
> > +	WRITE_ONCE(fobj->num_fences, count);
> 
> The WRITE_ONCE isn't necessary since smp_wmb() implies a compiler barrier, but apart from that really good catch.
> 
> Can you modify the patch and re-send? I will be pushing it to -fixes ASAP.
> 
> Regards,
> Christian.
> 
> >  }
> >  EXPORT_SYMBOL(dma_resv_add_fence);
> >  
> > 
> > 
> 
> 

------bwpRUJ-w.o_6tYjOOTP081ktEXBjAdpLJQBDwy6xW4Fo1YbP=_2d1f0_
Content-Type: text/plain; charset="utf-8"


------bwpRUJ-w.o_6tYjOOTP081ktEXBjAdpLJQBDwy6xW4Fo1YbP=_2d1f0_--

