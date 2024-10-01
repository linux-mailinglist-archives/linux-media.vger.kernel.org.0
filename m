Return-Path: <linux-media+bounces-18950-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC00A98C4C5
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 19:47:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 654BE1F24466
	for <lists+linux-media@lfdr.de>; Tue,  1 Oct 2024 17:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 531C81CC173;
	Tue,  1 Oct 2024 17:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bCXSolBW"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49451C9ED0;
	Tue,  1 Oct 2024 17:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727804815; cv=none; b=Z5DU3hbyccLlkS/jf4T/jZFg/2k0mwnuwuggP2xQKGPepHaL8//bgqpkhSc6WEvK21WS2ArDX6oT171Dnw+i7BOx2gecGw+UVGCpAAMUHeAqen3t8tXBmV2afXIMK2c9m9zepkKkpVihF3zXMzqw4Q/pP3bBy+++2NuoX8A5w8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727804815; c=relaxed/simple;
	bh=obLBRgivTjpJgl/s3rbPI7W+iEFQUdK1eaiKRL9Csn8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NlTbWtJRYsAyVKr3YUyMNs3VDILFXv/+Ox0k0K8yPgYvM94h/BoORSbCl5Aup0WUi2ZnduGIG07yC15UcNw+uOX/cKpPXfxp6CGLZ++rnQNSMIEX41FIEmgRuYaZExGngZ8CCHWTbuIJAJfk7PgoHo8IQRSXtaT5r+qgIXO0zJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bCXSolBW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491BHprD005662;
	Tue, 1 Oct 2024 17:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=kqwtTT2Xmi0dBarsC1gFmGcmL0gZDFbIMoJyvbEUTQQ=; b=bC
	XSolBW5DHSr0Khnj2egSU02fg1nCOz9Bei3YPUxZhldLK/bJcZjPH04n1KMf9OXp
	3kX9qegaFHhR/A8z+ub1nr29JgRCremroiMsn0ZTVRp1IOEJGSi+6GecwtYh2gRC
	vWMo5RpXFXZjzUvw4i/c+l7BBftjz0KBpdGI0MG0AzZKju7SuN7YyHVCs3qTs4zi
	rTtOiQlLpVZGVAlFC31mIl4qt0ECFH4g4uvNVPTGeV+fW1KjzhBdraVC5/Rha7rX
	DzgCVH7EBsqijfNCo6T6kSzNQO16JS8Av3u9btKl0yyI8pzapzsPqNHhT0pgcadq
	74GaVypJpmKYqxDygRUg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41x9vu98q1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 17:46:41 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 491Hkew9019635
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Oct 2024 17:46:40 GMT
Received: from hu-pintu-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 1 Oct 2024 10:46:35 -0700
From: Pintu Kumar <quic_pintu@quicinc.com>
To: <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>, <linux-kernel@vger.kernel.org>
CC: <joe@perches.com>, <skhan@linuxfoundation.org>, <pintu.ping@gmail.com>,
        Pintu Kumar <quic_pintu@quicinc.com>
Subject: [PATCH 1/3] dma-buf: replace symbolic permission S_IRUGO with octal 0444
Date: Tue, 1 Oct 2024 23:16:11 +0530
Message-ID: <20241001174611.12155-1-quic_pintu@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -iu2D-fBp2R3ZcgbTbDYCzb4T9PP3EKp
X-Proofpoint-ORIG-GUID: -iu2D-fBp2R3ZcgbTbDYCzb4T9PP3EKp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1011 spamscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2410010114

Symbolic permissions are not preferred, instead use the octal.
Also, fix other warnings/errors as well for cleanup.

WARNING: Block comments use * on subsequent lines
+       /* only support discovering the end of the buffer,
+          but also allow SEEK_SET to maintain the idiomatic

WARNING: Block comments use a trailing */ on a separate line
+          SEEK_END(0), SEEK_CUR(0) pattern */

WARNING: Block comments use a trailing */ on a separate line
+        * before passing the sgt back to the exporter. */

ERROR: "foo * bar" should be "foo *bar"
+static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,

WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider using octal permissions '0444'.
+       d = debugfs_create_file("bufinfo", S_IRUGO, dma_buf_debugfs_dir,

total: 1 errors, 4 warnings, 1746 lines checked

Signed-off-by: Pintu Kumar <quic_pintu@quicinc.com>
---
 drivers/dma-buf/dma-buf.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 8892bc701a66..2e63d50e46d3 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -176,8 +176,9 @@ static loff_t dma_buf_llseek(struct file *file, loff_t offset, int whence)
 	dmabuf = file->private_data;
 
 	/* only support discovering the end of the buffer,
-	   but also allow SEEK_SET to maintain the idiomatic
-	   SEEK_END(0), SEEK_CUR(0) pattern */
+	 * but also allow SEEK_SET to maintain the idiomatic
+	 * SEEK_END(0), SEEK_CUR(0) pattern.
+	 */
 	if (whence == SEEK_END)
 		base = dmabuf->size;
 	else if (whence == SEEK_SET)
@@ -782,13 +783,14 @@ static void mangle_sg_table(struct sg_table *sg_table)
 	/* To catch abuse of the underlying struct page by importers mix
 	 * up the bits, but take care to preserve the low SG_ bits to
 	 * not corrupt the sgt. The mixing is undone in __unmap_dma_buf
-	 * before passing the sgt back to the exporter. */
+	 * before passing the sgt back to the exporter.
+	 */
 	for_each_sgtable_sg(sg_table, sg, i)
 		sg->page_link ^= ~0xffUL;
 #endif
 
 }
-static struct sg_table * __map_dma_buf(struct dma_buf_attachment *attach,
+static struct sg_table *__map_dma_buf(struct dma_buf_attachment *attach,
 				       enum dma_data_direction direction)
 {
 	struct sg_table *sg_table;
@@ -1694,7 +1696,7 @@ static int dma_buf_init_debugfs(void)
 
 	dma_buf_debugfs_dir = d;
 
-	d = debugfs_create_file("bufinfo", S_IRUGO, dma_buf_debugfs_dir,
+	d = debugfs_create_file("bufinfo", 0444, dma_buf_debugfs_dir,
 				NULL, &dma_buf_debug_fops);
 	if (IS_ERR(d)) {
 		pr_debug("dma_buf: debugfs: failed to create node bufinfo\n");
-- 
2.17.1


