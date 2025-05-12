Return-Path: <linux-media+bounces-32302-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C40FAAB35B4
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 13:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 157877A8D23
	for <lists+linux-media@lfdr.de>; Mon, 12 May 2025 11:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2808F28751D;
	Mon, 12 May 2025 11:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="HLhOhsPF"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5C128750D
	for <linux-media@vger.kernel.org>; Mon, 12 May 2025 11:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747048367; cv=none; b=jXxC/Lj8Xrg3jJGttJmL1vxyNaZ2hLYuR5Qjnsc+U6ih9XBwRkfZN/+aMOZWrj8dXK+jRyw0Gowpsjp8DuAKOhtbFshGdJE0Ir17RhFtuNQ167x/Zc7vBLtRx4YWNRsg+RsLowZx6g6rINkoK7tKdRVsjA3TUHjnpTRAyU/+OZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747048367; c=relaxed/simple;
	bh=UXsGPjbIjT2Q+Vx36fvDfQmztUaeHoTuX/wiNjNrBDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 References; b=u8eeFW3CQ7W/eGsmtkvFK7pIJB+UqzkthwhS2RXa0/bEs7ta6ghCK/FfoHmvBs1i/on/gaJxp3nsxLRiieBfSNH5fyQ3aZBwZpFsspVoEfyj2ktDRQ1U0qwDvOOzxJMqt8eM43JdFbjfCvdvMWSw+4RNkw3JebF9rgsAumw9jFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=HLhOhsPF; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250512111242epoutp028c26bacf24ab8498d9904c50a9e3a361~_wzqzc7b_0985109851epoutp028
	for <linux-media@vger.kernel.org>; Mon, 12 May 2025 11:12:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250512111242epoutp028c26bacf24ab8498d9904c50a9e3a361~_wzqzc7b_0985109851epoutp028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747048362;
	bh=aU9i3dBQgzAlWJBwoW6G3R01WqDZbFqbjugEi5QzTsE=;
	h=Date:From:To:Cc:Subject:References:From;
	b=HLhOhsPFrQ2sm0YCh4j/TofPkLZVFJwBym8VrGMI7Q7n7l3TCGW/5Fzk96qdRF4ez
	 p/g2R5whDG/KcWJhFgFmUajgG4LOqO1+v5tiv6zdBmz8d3vsbR5FRumHGiR2YeNuXZ
	 hX25gtJc+5NgPfFWSZJC7YhKiUw3M+Y66iLpD1sY=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250512111242epcas2p135cb6bfca174823f8e4271e3d5bc3cca~_wzqfBpMJ1017410174epcas2p1I;
	Mon, 12 May 2025 11:12:42 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.88]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4Zwxls1Q1wz3hhT4; Mon, 12 May
	2025 11:12:41 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250512111240epcas2p321f5121e34f63383e1724de05e55420d~_wzpQZbUQ2154921549epcas2p3L;
	Mon, 12 May 2025 11:12:40 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250512111240epsmtrp2f4f4b891f6db2f34c5dc39b38e090c95~_wzpPrwNx0925709257epsmtrp2f;
	Mon, 12 May 2025 11:12:40 +0000 (GMT)
X-AuditID: b6c32a28-460ee70000001e8a-8f-6821d7a8d820
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	EB.E0.07818.8A7D1286; Mon, 12 May 2025 20:12:40 +0900 (KST)
Received: from au1-maretx-p37.eng.sarc.samsung.com (unknown
	[105.148.41.227]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250512111238epsmtip245157d6170dc74a8e23b596dbbd6a0fc~_wzna81Re0917709177epsmtip25;
	Mon, 12 May 2025 11:12:38 +0000 (GMT)
Date: Mon, 12 May 2025 06:12:31 -0500
From: Hyejeong Choi <hjeong.choi@samsung.com>
To: sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	hjeong.choi@samsung.com
Subject: [PATCH] dma-buf: insert memory barrier before updating num_fences
Message-ID: <20250512111231.GA1265534@au1-maretx-p37.eng.sarc.samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBLMWRmVeSWpSXmKPExsWy7bCSvO6K64oZBi8eKVu8vb+b1eLK1/ds
	Fhd7vrJZfLnykMni8q45bBY9G7ayWpy6+5ndgd2j9dJfNo871/awedzvPs7kcfvfY2aPvi2r
	GD0+b5ILYIvisklJzcksSy3St0vgyjj3aAd7wTX2iv+H/7M1MO5h62Lk5JAQMJE4t7KRtYuR
	i0NIYDejxPwdi9m7GDmAEtISHcfSIWqEJe63HGEFsYUEGpgkPsyvArFZBFQlfrW8B4uzCehK
	bPt0A2ymiICpxNF1/WwgM5kFZjNK9L9tBisSFvCSWLhkEzuIzQtk7758nBnCFpQ4OfMJC4jN
	LKAlcePfSyaQG5iBblj+jwPEFBVQkfi8QGACI/8sJA2zkDTMQmhYwMi8ilEytaA4Nz032bDA
	MC+1XK84Mbe4NC9dLzk/dxMjOLC1NHYwvvvWpH+IkYmD8RCjBAezkghv43bFDCHelMTKqtSi
	/Pii0pzU4kOM0hwsSuK8Kw0j0oUE0hNLUrNTUwtSi2CyTBycUg1MZp02d25qtn8//+ndr/dq
	HwxNFBJMDasKH3fVT2uJ7RcNaYnwZtEvqnn03+4Sr6bkrmmR7+srC/nTWZcmGmWfW/62/mb5
	h2PR2RpsPLtqFyTUb33RvP9zc/y/ogSeL4bTf7JxVaw6vWRJUb63Uv+5RBmnFyUmJ98GV+so
	5ayZYzuxb2783hfPWIufT96ts8ok9uKM1L5zW9vaPDddL5VLeGS2fXJ9lPXxja37Jyfvfy2c
	G7vCMCplm9GnYqkvSx1+OeUbWSv9lviyftVn1TXLp+9jcHN/zay/7NjhZy0zpliJxzVctKyM
	ZE415//6xuS5sR7zog87Z9gtbcvZX6TyUqjJ0y07ccbaSxtDDnxRYinOSDTUYi4qTgQALqrd
	ftsCAAA=
X-CMS-MailID: 20250512111240epcas2p321f5121e34f63383e1724de05e55420d
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----vXMtb.xJEBdKRg-x-G_2.bLfm7.PUyBosmRElnm._zJRPIlO=_25ec9_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250512111240epcas2p321f5121e34f63383e1724de05e55420d
References: <CGME20250512111240epcas2p321f5121e34f63383e1724de05e55420d@epcas2p3.samsung.com>

------vXMtb.xJEBdKRg-x-G_2.bLfm7.PUyBosmRElnm._zJRPIlO=_25ec9_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

smp_store_mb() inserts memory barrier after storing operation.
It is different with what the comment is originally aiming so Null
pointer dereference can be happened if memory update is reordered.

Signed-off-by: Hyejeong Choi <hjeong.choi@samsung.com>
---
 drivers/dma-buf/dma-resv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 5f8d010516f0..52af5c7430da 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -320,8 +320,9 @@ void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
 	count++;
 
 	dma_resv_list_set(fobj, i, fence, usage);
-	/* pointer update must be visible before we extend the num_fences */
-	smp_store_mb(fobj->num_fences, count);
+	/* fence update must be visible before we extend the num_fences */
+	smp_wmb();
+	WRITE_ONCE(fobj->num_fences, count);
 }
 EXPORT_SYMBOL(dma_resv_add_fence);
 
-- 
2.31.1


------vXMtb.xJEBdKRg-x-G_2.bLfm7.PUyBosmRElnm._zJRPIlO=_25ec9_
Content-Type: text/plain; charset="utf-8"


------vXMtb.xJEBdKRg-x-G_2.bLfm7.PUyBosmRElnm._zJRPIlO=_25ec9_--

