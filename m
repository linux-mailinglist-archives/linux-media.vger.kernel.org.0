Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A17B8B56D7
	for <lists+linux-media@lfdr.de>; Tue, 17 Sep 2019 22:23:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726194AbfIQUXX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Sep 2019 16:23:23 -0400
Received: from mail-eopbgr820041.outbound.protection.outlook.com ([40.107.82.41]:43265
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725862AbfIQUXX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Sep 2019 16:23:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kz7W2LvBrYItJpksyQXwQRbo/XnWmPiffIGE5FMTWFSkpUnGBHxsV9E3ekOYUdQ9ZrgWuPOyXz5JkvxCymvCfvYuMibfPbEClfL8RsKRwGuEghVZTeQG6lnIkf3X3Xy9JuESpOpsGJgxHGA8AoWuqYy9QCMNaWbHeh4IzsGXywWuv2VnUk1R04fZzUb69+wQ+B7vUM6MUKJXXO16Ms9UNLPQ8zs1LzeGB52ql88gk5Xui0cpkVkvECYkzK6Feze81V9RsWeRwAyndpUH3KvHFtm5uHxWmHOoyuMye5GX3RS2MsIoWXLDchWzsjhH+g8OLKbyTG2iAIlGdXyb/mMnrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pwXrvOmDVmVyq64hMbhAF0PuJaQpuzxzcUF+0Dlr9E8=;
 b=IoOXRa64X4RbYE4bDpzpj8hqrYSTo+3SCsaoUVSgkf9gpZUVqOCnocsz/fG5sqoyKjJtBt/6nmin7ZxvzPX1XBbZ7Ko4Z3O7VdpbasF/ED/mD1SBgqGaQVKRodbTDueOEwGvkNTvtzPErwFw6CdRxcsY923EH9POkrBOBz5hxjxGgyJAR+jR937F/WsEmh6yGGAiVdKtAFl65i8jVEYCD2GxyrRafzdJR8PlNzORI4hiKsLCbOzSx6b+pVVC0ojGCLsr4sXksfvkNNiyInnBw71T/dWAiKojTREeSExujdroZGIKzdwVrMzuWWWlbyi8eJkwqyyfmGuKnIFh4CsWfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pwXrvOmDVmVyq64hMbhAF0PuJaQpuzxzcUF+0Dlr9E8=;
 b=RYmQUGGDrv4KijVoi50T8dC1eFG/gTE74oyXiZKeu1Vl3njG9yD/CU+Z2Ct3Asma+r/KG2Dumkuat94foSJGGJeesDeTV4s7cV4Wm88Yb7qMk18GK/gnwRKvykr8+oPx5PDbwShweWxO9/S97HyOmpilgGissmwwKHiAFdyxTb0=
Received: from MWHPR0201CA0033.namprd02.prod.outlook.com
 (2603:10b6:301:74::46) by SN6PR02MB5263.namprd02.prod.outlook.com
 (2603:10b6:805:70::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2284.19; Tue, 17 Sep
 2019 20:21:40 +0000
Received: from CY1NAM02FT022.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e45::202) by MWHPR0201CA0033.outlook.office365.com
 (2603:10b6:301:74::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2263.15 via Frontend
 Transport; Tue, 17 Sep 2019 20:21:40 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
 CY1NAM02FT022.mail.protection.outlook.com (10.152.75.185) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2263.17
 via Frontend Transport; Tue, 17 Sep 2019 20:21:40 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:42288 helo=xsj-pvapsmtp01)
        by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
        (envelope-from <dylan.yip@xilinx.com>)
        id 1iAJyl-0004n5-FB
        for linux-media@vger.kernel.org; Tue, 17 Sep 2019 13:21:39 -0700
Received: from [127.0.0.1] (helo=localhost)
        by xsj-pvapsmtp01 with smtp (Exim 4.63)
        (envelope-from <dylan.yip@xilinx.com>)
        id 1iAJyg-0002l3-Bb
        for linux-media@vger.kernel.org; Tue, 17 Sep 2019 13:21:34 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
        by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id x8HKLRMm008553;
        Tue, 17 Sep 2019 13:21:27 -0700
Received: from [172.19.2.242] (helo=xsjmadhurki50.xilinx.com)
        by xsj-pvapsmtp01 with esmtp (Exim 4.63)
        (envelope-from <dylan.yip@xilinx.com>)
        id 1iAJyZ-0002kT-6i; Tue, 17 Sep 2019 13:21:27 -0700
From:   Dylan Yip <dylan.yip@xilinx.com>
To:     linux-media@vger.kernel.org, satishna@xilinx.com
Cc:     Dylan Yip <dylan.yip@xilinx.com>
Subject: [LINUX PATCH] dma-mapping: Control memset operation using gfp flags
Date:   Tue, 17 Sep 2019 13:21:24 -0700
Message-Id: <1568751684-8809-1-git-send-email-dylan.yip@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100;IPV:NLI;CTRY:US;EFV:NLI;SFV:NSPM;SFS:(10009020)(4636009)(346002)(136003)(396003)(39860400002)(376002)(199004)(189003)(9786002)(50466002)(6636002)(107886003)(4326008)(2906002)(50226002)(14444005)(36386004)(36756003)(305945005)(47776003)(70206006)(70586007)(7696005)(51416003)(16586007)(6666004)(316002)(186003)(26005)(356004)(48376002)(478600001)(486006)(44832011)(106002)(8936002)(5660300002)(81156014)(426003)(8676002)(336012)(476003)(126002)(2616005)(81166006)(5001870100001);DIR:OUT;SFP:1101;SCL:1;SRVR:SN6PR02MB5263;H:xsj-pvapsmtpgw02;FPR:;SPF:Pass;LANG:en;PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;A:1;MX:1;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4756a82e-a08e-4ed2-4e5c-08d73baca60c
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(4709080)(1401327)(4618075)(2017052603328);SRVR:SN6PR02MB5263;
X-MS-TrafficTypeDiagnostic: SN6PR02MB5263:
X-Microsoft-Antispam-PRVS: <SN6PR02MB5263AB4419D5906445B46363B08F0@SN6PR02MB5263.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 01630974C0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: l0U8FVPQJ8WxxYqwrvIPi1fLFZvtt2ymIEGTx1B31nJRQXB1mLDel/6kRctcIVRZR48zksF88v5LZ5SgIX/4LGXHXi66+mLbpyiBEuZ3tOf62p6HpFguHLrsNUegLv5dOyI+1g0HXQp61uW5f9AiXnPCyO6I1jGR+sxETuNTQfDbPujG+YtHOZRnMeBM+mgOTnJaq5cBC27QbIeFrbpPdVgH4TOSsh4gkenQVPlSODMm8OxvfP+sbFG68azKhvdMl0osJTbCi2vqrHApLvFz/+Q5aqFpvVqnnwxWhDdxhvBibkblH9ROJu2F23e29s8PrFhhf0iD9r+Wnl5LIWCzo8LNN3FXClkJ8VhvL7N3jaCSEUhMIW5kkjZnVDtFvAkaY3NBVrxtlN3ct5VtGs0uHVQO1x6lJ9KNBg4hgaqgcRk=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2019 20:21:40.0541
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4756a82e-a08e-4ed2-4e5c-08d73baca60c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.100];Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5263
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In case of 4k video buffer, the allocation from a reserved memory is
taking a long time, ~500ms. This is root caused to the memset()
operations on the allocated memory which is consuming more cpu cycles.
Due to this delay, we see that initial frames are being dropped.

To fix this, we have wrapped the default memset, done when allocating
coherent memory, under the __GFP_ZERO flag. So, we only clear
allocated memory if __GFP_ZERO flag is enabled. We believe this
should be safe as the video decoder always writes before reading.
This optimizes decoder initialization as we do not set the __GFP_ZERO
flag when allocating memory for decoder. With this optimization, we
don't see initial frame drops and decoder initialization time is
~100ms.

This patch adds plumbing through dma_alloc functions to pass gfp flag
set by user to __dma_alloc_from_coherent(). Here gfp flag is checked
for __GFP_ZERO. If present, we memset the buffer to 0 otherwise we
skip memset.

Signed-off-by: Dylan Yip <dylan.yip@xilinx.com>
---
 arch/arm/mm/dma-mapping-nommu.c |  2 +-
 include/linux/dma-mapping.h     | 11 +++++++----
 kernel/dma/coherent.c           | 15 +++++++++------
 kernel/dma/mapping.c            |  2 +-
 4 files changed, 18 insertions(+), 12 deletions(-)

diff --git a/arch/arm/mm/dma-mapping-nommu.c b/arch/arm/mm/dma-mapping-nommu.c
index 52b8255..242b2c3 100644
--- a/arch/arm/mm/dma-mapping-nommu.c
+++ b/arch/arm/mm/dma-mapping-nommu.c
@@ -35,7 +35,7 @@ static void *arm_nommu_dma_alloc(struct device *dev, size_t size,
 				 unsigned long attrs)
 
 {
-	void *ret = dma_alloc_from_global_coherent(size, dma_handle);
+	void *ret = dma_alloc_from_global_coherent(size, dma_handle, gfp);
 
 	/*
 	 * dma_alloc_from_global_coherent() may fail because:
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index f7d1eea..b715c9f 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -160,24 +160,27 @@ static inline int is_device_dma_capable(struct device *dev)
  * Don't use them in device drivers.
  */
 int dma_alloc_from_dev_coherent(struct device *dev, ssize_t size,
-				       dma_addr_t *dma_handle, void **ret);
+				       dma_addr_t *dma_handle, void **ret,
+				       gfp_t flag);
 int dma_release_from_dev_coherent(struct device *dev, int order, void *vaddr);
 
 int dma_mmap_from_dev_coherent(struct device *dev, struct vm_area_struct *vma,
 			    void *cpu_addr, size_t size, int *ret);
 
-void *dma_alloc_from_global_coherent(ssize_t size, dma_addr_t *dma_handle);
+void *dma_alloc_from_global_coherent(ssize_t size, dma_addr_t *dma_handle,
+				     gfp_t flag);
 int dma_release_from_global_coherent(int order, void *vaddr);
 int dma_mmap_from_global_coherent(struct vm_area_struct *vma, void *cpu_addr,
 				  size_t size, int *ret);
 
 #else
-#define dma_alloc_from_dev_coherent(dev, size, handle, ret) (0)
+#define dma_alloc_from_dev_coherent(dev, size, handle, ret, flag) (0)
 #define dma_release_from_dev_coherent(dev, order, vaddr) (0)
 #define dma_mmap_from_dev_coherent(dev, vma, vaddr, order, ret) (0)
 
 static inline void *dma_alloc_from_global_coherent(ssize_t size,
-						   dma_addr_t *dma_handle)
+						   dma_addr_t *dma_handle,
+						   gfp_t flag)
 {
 	return NULL;
 }
diff --git a/kernel/dma/coherent.c b/kernel/dma/coherent.c
index 29fd659..d85fab5 100644
--- a/kernel/dma/coherent.c
+++ b/kernel/dma/coherent.c
@@ -136,7 +136,7 @@ void dma_release_declared_memory(struct device *dev)
 EXPORT_SYMBOL(dma_release_declared_memory);
 
 static void *__dma_alloc_from_coherent(struct dma_coherent_mem *mem,
-		ssize_t size, dma_addr_t *dma_handle)
+		ssize_t size, dma_addr_t *dma_handle, gfp_t gfp_flag)
 {
 	int order = get_order(size);
 	unsigned long flags;
@@ -158,7 +158,8 @@ static void *__dma_alloc_from_coherent(struct dma_coherent_mem *mem,
 	*dma_handle = mem->device_base + (pageno << PAGE_SHIFT);
 	ret = mem->virt_base + (pageno << PAGE_SHIFT);
 	spin_unlock_irqrestore(&mem->spinlock, flags);
-	memset(ret, 0, size);
+	if (gfp_flag & __GFP_ZERO)
+		memset(ret, 0, size);
 	return ret;
 err:
 	spin_unlock_irqrestore(&mem->spinlock, flags);
@@ -172,6 +173,7 @@ static void *__dma_alloc_from_coherent(struct dma_coherent_mem *mem,
  * @dma_handle:	This will be filled with the correct dma handle
  * @ret:	This pointer will be filled with the virtual address
  *		to allocated area.
+ * @flag:      gfp flag set by user
  *
  * This function should be only called from per-arch dma_alloc_coherent()
  * to support allocation from per-device coherent memory pools.
@@ -180,24 +182,25 @@ static void *__dma_alloc_from_coherent(struct dma_coherent_mem *mem,
  * generic memory areas, or !0 if dma_alloc_coherent should return @ret.
  */
 int dma_alloc_from_dev_coherent(struct device *dev, ssize_t size,
-		dma_addr_t *dma_handle, void **ret)
+		dma_addr_t *dma_handle, void **ret, gfp_t flag)
 {
 	struct dma_coherent_mem *mem = dev_get_coherent_memory(dev);
 
 	if (!mem)
 		return 0;
 
-	*ret = __dma_alloc_from_coherent(mem, size, dma_handle);
+	*ret = __dma_alloc_from_coherent(mem, size, dma_handle, flag);
 	return 1;
 }
 
-void *dma_alloc_from_global_coherent(ssize_t size, dma_addr_t *dma_handle)
+void *dma_alloc_from_global_coherent(ssize_t size, dma_addr_t *dma_handle,
+				     gfp_t flag)
 {
 	if (!dma_coherent_default_memory)
 		return NULL;
 
 	return __dma_alloc_from_coherent(dma_coherent_default_memory, size,
-			dma_handle);
+			dma_handle, flag);
 }
 
 static int __dma_release_from_coherent(struct dma_coherent_mem *mem,
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index b0038ca..bfea1d2 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -272,7 +272,7 @@ void *dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
 
 	WARN_ON_ONCE(!dev->coherent_dma_mask);
 
-	if (dma_alloc_from_dev_coherent(dev, size, dma_handle, &cpu_addr))
+	if (dma_alloc_from_dev_coherent(dev, size, dma_handle, &cpu_addr, flag))
 		return cpu_addr;
 
 	/* let the implementation decide on the zone to allocate from: */
-- 
2.7.4

