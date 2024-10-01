Return-Path: <linux-media+bounces-18951-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0231498C4CD
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 19:51:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A47821F237B4
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 17:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0041CC89E;
	Tue,  1 Oct 2024 17:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lKzmc3vD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23FD15E97;
	Tue,  1 Oct 2024 17:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727805098; cv=none; b=Jc+ikmHgd0OSjx36fsBeDx9zQb17iYsf3qbCEaZu0MOxW73vIUpExRoemKh+vRcsABOyLCLnuKbfZdsvFwRpkplrTxxRloV6j/lIeJF3tRlY++BO55HXOPcY+5sQ/XUhGYh/Nub/JROxRajgGwedNwqnKcMASk6/rICExW9TbKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727805098; c=relaxed/simple;
	bh=RzfakU3hHS401H8+U8rlsayzUp5GAe+MYE3WG0V809o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WyqlPLCmnU8alGMVGxyxttiwbaimoh4odgJ7/5aK6X4WlwxlcRTWmJ8jLiGaerq/dTRyk4tHTtXwzfwC6zDCR7DJMgfgEzsKI0N5uQfEGBLOn0B7WHs9fJhJeaFmY0uMMPjwOzXa7YF93DZS2FZQRcZ3MpqOFKDsNKZne8FhWSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lKzmc3vD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491ASPSL022446;
	Tue, 1 Oct 2024 17:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=d7E+Uzt0KOEWf8xQBkavhpXYt5BDcl9CW7dj6fKabZM=; b=lK
	zmc3vDRa0uwzvCundBbXTZu28HQatdSQoUiNJkRhysX7++kfePEct+sHz7du7IrR
	8RpBk3A/QtfsOmzoUJfhnSB/3qi/bShWbRV4M4qsI6ygzckRtiyHyPIhM7Rm+JMb
	/YbD6ARJAVA2lUTWpJKKBYcaDjjYaJnPBVzYK2IWiCZr4bgCFlqgfQl0RwzprYFx
	AQ6kYVWjTRlrJVhqcENyT7uDWIsFLhnhWQcEjJVjmCnSdLe90HKvfK/KQySw6Btg
	tBF6H0d6ZcT0s1bNVQPpv1xbaaRB0xeGHjqaHJjYSXBLAQrAk7CSNYGcdEDpUEGC
	ol52PgKAZjj9D1Nes1Dg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41xa6797ut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 17:51:23 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 491HpLnP026569
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Oct 2024 17:51:21 GMT
Received: from hu-pintu-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 1 Oct 2024 10:51:16 -0700
From: Pintu Kumar <quic_pintu@quicinc.com>
To: <sumit.semwal@linaro.org>, <benjamin.gaignard@collabora.com>,
        <Brian.Starkey@arm.com>, <jstultz@google.com>, <tjmercier@google.com>,
        <christian.koenig@amd.com>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
        <linux-kernel@vger.kernel.org>
CC: <joe@perches.com>, <skhan@linuxfoundation.org>, <pintu.ping@gmail.com>,
        Pintu Kumar <quic_pintu@quicinc.com>
Subject: [PATCH 2/3] dma-buf/heaps: replace kmap_atomic with kmap_local_page
Date: Tue, 1 Oct 2024 23:20:57 +0530
Message-ID: <20241001175057.27172-1-quic_pintu@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2Zqzfc03is92PVLNMTY_zqlxZYnE3d7t
X-Proofpoint-ORIG-GUID: 2Zqzfc03is92PVLNMTY_zqlxZYnE3d7t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=807 malwarescore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 adultscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010114

Use of kmap_atomic/kunmap_atomic is deprecated, use
kmap_local_page/kunmap_local instead.

This is reported by checkpatch.
Also fix repeated word issue.

WARNING: Deprecated use of 'kmap_atomic', prefer 'kmap_local_page' instead
+                       void *vaddr = kmap_atomic(page);

WARNING: Deprecated use of 'kunmap_atomic', prefer 'kunmap_local' instead
+                       kunmap_atomic(vaddr);

WARNING: Possible repeated word: 'by'
+                        * has been killed by by SIGKILL

total: 0 errors, 3 warnings, 405 lines checked

Signed-off-by: Pintu Kumar <quic_pintu@quicinc.com>
---
 drivers/dma-buf/heaps/cma_heap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
index 93be88b805fe..8c55431cc16c 100644
--- a/drivers/dma-buf/heaps/cma_heap.c
+++ b/drivers/dma-buf/heaps/cma_heap.c
@@ -309,13 +309,13 @@ static struct dma_buf *cma_heap_allocate(struct dma_heap *heap,
 		struct page *page = cma_pages;
 
 		while (nr_clear_pages > 0) {
-			void *vaddr = kmap_atomic(page);
+			void *vaddr = kmap_local_page(page);
 
 			memset(vaddr, 0, PAGE_SIZE);
-			kunmap_atomic(vaddr);
+			kunmap_local(vaddr);
 			/*
 			 * Avoid wasting time zeroing memory if the process
-			 * has been killed by by SIGKILL
+			 * has been killed by SIGKILL.
 			 */
 			if (fatal_signal_pending(current))
 				goto free_cma;
-- 
2.17.1


