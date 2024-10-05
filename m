Return-Path: <linux-media+bounces-19129-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DACC991951
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2024 20:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0C521F22C5E
	for <lists+linux-media@lfdr.de>; Sat,  5 Oct 2024 18:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BD9E1591FC;
	Sat,  5 Oct 2024 18:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Zv/Z+UDM"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EF6157A59;
	Sat,  5 Oct 2024 18:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728151851; cv=none; b=ixMyiv07iL2PH5xcBJojn2vXdGnOem6ZIVOfaWF+jbup8cVf8+1WAFRnKgAzWfiCYjUBoAcRMHyFhk6yf1ugPtOXls0faDaTT+By0hJkzqHPvDberjX9ZDHzpabA94jwsM7+soavv5Qms6X3pjJL2Gys98EFyz0pIQJ6YDIqcX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728151851; c=relaxed/simple;
	bh=vYhHSu8a2wL6m1DT57/LS6UyaEW1S+3V57c0sxgaZBQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sHCYo5WLvDP8hjtU7zqs8OfY9zwY6H0xQsPKI2ggOXTk8cV3CN97iEKwj1srXPmYttD6n8P1v1ZXg268Dcb+dDdzfiUBTLsg920t8mpfY0cVQbxwD/B0+XOeDpUjKp1+VXDvNZXATHKZbivr0/bT7UaBwinbIeBjPT6QLoKFZq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Zv/Z+UDM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 495FP1HJ015331;
	Sat, 5 Oct 2024 18:10:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=y1AI6Ybprvocd2qzWabOJfmmPMvHCkyW5WFymyIkuK0=; b=Zv
	/Z+UDMuJs+fwXY3Cy7ZsPKz6B/QQWOh6ZWb9uXCKxop92djJz3oCZ43m07EmYl9v
	aST7w6RGU0Aw5/FS6j8p1i4orvEguRCDtwE1e4E+jKROem6tdtQcZuvpAwlpKiRJ
	2j45RQeYqeJZ5SdJBERBqEEdlT9WofL+19VUS9rAF09uY3En+UOJG6Wzbnc0E7wO
	va+NFf/4jzzMLrTcM4io5e8SxC69LW8s7CBUlAcGhfDYE8qys7cTojdJRKhawC19
	WdbSf0DYj8XpMHFhfuCkrI5b+Xpg1FC7hRFy5wUQc3DQ7OuSa0R8zzJ5TBeMTAET
	ecH9a/tE45PAuKgLgVAw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xv88w9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 05 Oct 2024 18:10:23 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 495IAMYe012621
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 5 Oct 2024 18:10:22 GMT
Received: from hu-pintu-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 5 Oct 2024 11:10:18 -0700
From: Pintu Kumar <quic_pintu@quicinc.com>
To: <sumit.semwal@linaro.org>, <benjamin.gaignard@collabora.com>,
        <Brian.Starkey@arm.com>, <jstultz@google.com>, <tjmercier@google.com>,
        <christian.koenig@amd.com>, <linux-media@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
        <linux-kernel@vger.kernel.org>
CC: <joe@perches.com>, <skhan@linuxfoundation.org>, <pintu.ping@gmail.com>,
        Pintu Kumar <quic_pintu@quicinc.com>
Subject: [PATCH v2] dma-buf: fix S_IRUGO to 0444, block comments, func declaration
Date: Sat, 5 Oct 2024 23:39:55 +0530
Message-ID: <20241005180955.6523-1-quic_pintu@quicinc.com>
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
X-Proofpoint-ORIG-GUID: YRla0X3yiQaJF3lejNKaRIlBtVmAQ3CI
X-Proofpoint-GUID: YRla0X3yiQaJF3lejNKaRIlBtVmAQ3CI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410050133

These warnings/errors are reported by checkpatch.
Fix them with minor changes to make it clean.
No other functional changes.

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
Changes in V1 suggested by Sumit Semwal:
Change commit title, and mention exact reason of fix in commit log.
V1: https://lore.kernel.org/all/CAOuPNLg1=YCUFXW-76A_gZm_PE1MFSugNvg3dEdkfujXV_5Zfw@mail.gmail.com/
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


