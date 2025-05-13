Return-Path: <linux-media+bounces-32349-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 062AFAB4937
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 04:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAD31462A66
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 02:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDB5319F47E;
	Tue, 13 May 2025 02:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="JLLObg9L"
X-Original-To: linux-media@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33D919A2A3
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 02:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747102014; cv=none; b=C5UwCFbXWmuzRJCY41RLYtrSx6WL9ui/crnbNs9nYyh8V+sd6z9CxZnOMOWU3U5eYlqDU1+5TBk4wDrb97HfTJzsynMdJmmUVRgxToKg1F4sv8NX8KtrcW1Jt//56B0tXlxZjCINrkjesh9tzM+hfkXIeHtlNox82xrxrNxxVds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747102014; c=relaxed/simple;
	bh=COaGT2JW8DlPtmWpufP9IsQ1cvq3XywOwkvOt7FqD94=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 References; b=aDEG5aIs+5wGNTViCv4WWvE8OsI2aXB7wVEh2cf3kgb8VwvXospyUtRpW3eJdmgxPp+wh8K2xDnoQxznWWkecfWWBBzOJWc99z+NM+GksHlniV4QQ76YZqV+Z/LIKjoVGIkcFK8lHUq64qiP/cEjxvgI3r+Phx/LLbj70CYOzc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=JLLObg9L; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250513020647epoutp02d811a66569ce66aa7ffdafe0ca061e78~_9AT2WGQ71040110401epoutp02-
	for <linux-media@vger.kernel.org>; Tue, 13 May 2025 02:06:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250513020647epoutp02d811a66569ce66aa7ffdafe0ca061e78~_9AT2WGQ71040110401epoutp02-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747102007;
	bh=kvmgVEKPuoH4lsNXw8T8Zxc8qcsTU4lXcf5uvCsEiLE=;
	h=Date:From:To:Cc:Subject:References:From;
	b=JLLObg9LvDUWOb9h8cgIcaLo9i0/g4RaX55lF4eHdwhJsxyYB+xbw63mIeR57N1Yn
	 pFhMNg8Z2qqDgDLyI9XJisl0TdPcER01A8xARCzk+iS43cVwrnusqttY70zN851VgP
	 EmdzZHfKINroce7FjzcEkLnAe9FRZcAGDFKh8754=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250513020647epcas2p223ba67175952e88d475e7c9bfb77fe36~_9ATZhi8U0045700457epcas2p2S;
	Tue, 13 May 2025 02:06:47 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.88]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZxKbV2Rhvz3hhTZ; Tue, 13 May
	2025 02:06:46 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250513020645epcas2p12a62716c7e311d0a95a550b712ff517c~_9AR7RyP51150911509epcas2p1B;
	Tue, 13 May 2025 02:06:45 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250513020645epsmtrp1be71d5fb323beb72ad00df561448b47f~_9AR6nRKI0202202022epsmtrp1x;
	Tue, 13 May 2025 02:06:45 +0000 (GMT)
X-AuditID: b6c32a2a-d63ff70000002265-0e-6822a93550e8
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	76.10.08805.539A2286; Tue, 13 May 2025 11:06:45 +0900 (KST)
Received: from au1-maretx-p37.eng.sarc.samsung.com (unknown
	[105.148.41.227]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250513020643epsmtip237f1d392cb69a5e0ba8c42642fe09e2c~_9AQD5Awv2522725227epsmtip29;
	Tue, 13 May 2025 02:06:43 +0000 (GMT)
Date: Mon, 12 May 2025 21:06:38 -0500
From: Hyejeong Choi <hjeong.choi@samsung.com>
To: sumit.semwal@linaro.org, christian.koenig@amd.com
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
	hjeong.choi@samsung.com
Subject: [PATCH] dma-buf: insert memory barrier before updating num_fences
Message-ID: <20250513020638.GA2329653@au1-maretx-p37.eng.sarc.samsung.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBLMWRmVeSWpSXmKPExsWy7bCSvK7pSqUMg3NzpS3e3t/NanHl63s2
	i4s9X9ksvlx5yGRxedccNoueDVtZLU7d/czuwO7Reukvm8eda3vYPO53H2fyuP3vMbNH35ZV
	jB6fN8kFsEVx2aSk5mSWpRbp2yVwZfy9cp+14DR7xculJ1kbGDewdTFyckgImEjsOvSCsYuR
	i0NIYDejxM95b4ESHEAJaYmOY+kQNcIS91uOsELUNDBJ3Nx7ixkkwSKgKtG6oQFsEJuArsS2
	TzfAbBEBU4mj6/rZQBqYBWYzSvS/bWYFSQgLeEksXLKJHWQBL5C9rLEUJMwrIChxcuYTFhCb
	WUBL4sa/l0wgJcxANyz/xwFiigqoSHxeIDCBkX8WkoZZSBpmITQsYGRexSiZWlCcm55bbFhg
	lJdarlecmFtcmpeul5yfu4kRHNhaWjsY96z6oHeIkYmD8RCjBAezkghv43bFDCHelMTKqtSi
	/Pii0pzU4kOM0hwsSuK83173pggJpCeWpGanphakFsFkmTg4pRqYEgQ3r01MkfUSv8j/+XG5
	jmZTZPexDQ8+OOxcynImJ0thmuULtVLu04LfA35bx6c6/t7IOf3UZ5vn4Qycs1cH//Na2vR/
	i8yDi90mE49EZWprHdko6t+sO0P2xzqResWSm9HNDeyur0xEb0U2zlerXPPuXU3njvNHrmem
	evi8Lg78P10kpcj828dfNTEiBtJ/DNQz5R7cny77W1LbZf5lU+HVVroSfc2LVLfdmrghO++a
	wkMm5uo1Qe1y+yINX+7+/nJaUNM0hYaPmYW33B+17JOL47q/tPHc9rirvsrWjOy6utIRKvcO
	VtyQDnQ5fk/CWuSG7tLtC5ObM2eynth51uPRFLVXXB2SXTOdjBYosRRnJBpqMRcVJwIAAPwn
	39sCAAA=
X-CMS-MailID: 20250513020645epcas2p12a62716c7e311d0a95a550b712ff517c
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----vXMtb.xJEBdKRg-x-G_2.bLfm7.PUyBosmRElnm._zJRPIlO=_2cd20_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250513020645epcas2p12a62716c7e311d0a95a550b712ff517c
References: <CGME20250513020645epcas2p12a62716c7e311d0a95a550b712ff517c@epcas2p1.samsung.com>

------vXMtb.xJEBdKRg-x-G_2.bLfm7.PUyBosmRElnm._zJRPIlO=_2cd20_
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
index 5f8d010516f0..b1ef4546346d 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -320,8 +320,9 @@ void dma_resv_add_fence(struct dma_resv *obj, struct dma_fence *fence,
 	count++;
 
 	dma_resv_list_set(fobj, i, fence, usage);
-	/* pointer update must be visible before we extend the num_fences */
-	smp_store_mb(fobj->num_fences, count);
+	/* fence update must be visible before we extend the num_fences */
+	smp_wmb();
+	fobj->num_fences = count;
 }
 EXPORT_SYMBOL(dma_resv_add_fence);
 
-- 
2.31.1


------vXMtb.xJEBdKRg-x-G_2.bLfm7.PUyBosmRElnm._zJRPIlO=_2cd20_
Content-Type: text/plain; charset="utf-8"


------vXMtb.xJEBdKRg-x-G_2.bLfm7.PUyBosmRElnm._zJRPIlO=_2cd20_--

