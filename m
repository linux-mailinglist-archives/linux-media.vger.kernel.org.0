Return-Path: <linux-media+bounces-57986-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8ATqObK6zmmTpgYAu9opvQ
	(envelope-from <linux-media+bounces-57986-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 20:51:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7A038D6D3
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 20:51:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4694F304B039
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 18:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A1C3C1409;
	Thu,  2 Apr 2026 18:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="sL/Rc8lP"
X-Original-To: linux-media@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010059.outbound.protection.outlook.com [52.101.85.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC38C35C1B0;
	Thu,  2 Apr 2026 18:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775155566; cv=fail; b=rOC1vRVQIkiOcfLHzqQEMWB5Ixh5GLst3gOxSJ0bISamKYbddJWO6YRYM5tqOoRKtz923WBLJU8cwqAAxdDCskTcjdwwMC1vTJmexcOifD53xSUY3xa3htrUEAGdma3bOM2ccHRlmZfD8FC34Ws+cMTe3ICQFbac5eo558TlmiQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775155566; c=relaxed/simple;
	bh=3xsruoU/mgrkxXa/JBoViNoN555qiUby2pQYR4a9R1g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Yu6BtCKsfx42cE+JHu890ou4WgvVpddej+wmtIbGl4X7WhvWITm25askQeBG+sMI1pBwcDfLTkkh+87AzS4x7HxDFeLhRs4w62XzVkCZaPZNJuaPasxZs+14g50RUzD+RPjniA5HQOli6EgRA6AMhGFzC+yVpiC7vsUqdehhq9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=sL/Rc8lP; arc=fail smtp.client-ip=52.101.85.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D9jNtShjiEA/aBeP8neQTdb6uCIj5597U6HZQib4vv8onm9/lG3lvGzVkCaH11Rl0c2HumlqzEssWMBUjwjwf9hBZJ+R98JEUZm1ncEWGlnwc6BmiEUxEkgsNVamncKUNrxfZDP2deqAlV4kmkujgPBf0rraQDggbqPLbujdvc2VSA9qfl1eOCf+n7RRKYoh7nQqap5lsIKMdnggYjhcMlcsisz6DkNaof4yEKOnYZhSj5UJdL0wmEYPc/rtEJw6PgOcS4IoHGrq//HylOOrpvGqxSwJJWPWOPbw1HPpIqSrjd7gZlmOEWDUWC3I0yvc2zhA+VT8AWshqBBkjHLzBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/vAOjugxdbNymE6OhRQ1T2wf68VzoW+1+d7psDlm4I=;
 b=bfn8IZIoKT0NsFdDcBij4kQepRv73w5YWFszjGaKhDKCzJ3GWcJWsQIxNbWATXpDAj0N/0f9WhQxYdY4m24KdUuvaR4WeMLA48xnZq5UsMGllwA2It8jZw+PbobQI//OexNh3e5NVQe3ycN0iwQzSLvw1FfQsqHcy6dUGrbZ9NBTtoHYQnGvaANNlBHYK9k1Qm9nwCzmdHYgI7fHdqYwMBCL7R1k4IY/74lphA6aCRwAax7QK0qELdWjJZjCh2JLEbGzhWdH5wlooKhcL3nYshsnPWDI0Z/MjSvokLHONiYACNwNIyFtRcx/RJvbWG9YrLVmQGYOyaZaq81sQ+IuTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=collabora.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/vAOjugxdbNymE6OhRQ1T2wf68VzoW+1+d7psDlm4I=;
 b=sL/Rc8lPRStUX9YxXBHRIS1gpjYjqykiqLPGWhnkFxu5OaeFXS6rPIxkgJ6mGW9dfa0MDNod5QjUpybPnrWNNCsS2N7pOl49sHwidsIMUYSFvG7B3xP1BsXkiQx1OLoGJ0H+A7AH8j9sqEzV/YiRIPOgN1r+QMei7UC/hy7nWf0=
Received: from MN0P221CA0020.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::32)
 by PH0PR10MB5872.namprd10.prod.outlook.com (2603:10b6:510:146::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Thu, 2 Apr
 2026 18:46:01 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:208:52a:cafe::da) by MN0P221CA0020.outlook.office365.com
 (2603:10b6:208:52a::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.18 via Frontend Transport; Thu,
 2 Apr 2026 18:46:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 2 Apr 2026 18:46:00 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Apr
 2026 13:46:00 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Apr
 2026 13:46:00 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 2 Apr 2026 13:46:00 -0500
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.81.76])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 632Ik0Xi2992490;
	Thu, 2 Apr 2026 13:46:00 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <detheridge@ti.com>, <mchehab@kernel.org>, <nas.chung@chipsnmedia.com>,
	<jackson.lee@chipsnmedia.com>, <nicolas.dufresne@collabora.com>, "Brandon
 Brnich" <b-brnich@ti.com>
Subject: [PATCH 1/2] media: chips-media: wave5: Release m2m_ctx after Instance Removed from List
Date: Thu, 2 Apr 2026 13:45:53 -0500
Message-ID: <20260402184554.1751445-1-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|PH0PR10MB5872:EE_
X-MS-Office365-Filtering-Correlation-Id: 97770883-c4c4-4f55-ef1b-08de90e81611
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	P3tovfodCDfXU/BGNWHi7zRQ9VtCBy5FNnvaR21G8fB+1CpHBSAFU7XrCawHWtZlsr5BBEcYXkSmltqWBZr5v3kArR3XAK8IyQ19kfmrEc+TIJbBufgGsMscCtGQj/rmqSE20xVs5ml8df16ewR7SvFa8sRBR3TRQZOkCp1nkvWHw2eNt8reY2Dr4slEhmSZs4oI5BjEsMFVCRB/XFXirWauGJK5jXmvRz9BrOq+++pcVKMTvuCl/TU+t0ARdVbGuOvi4gWAq944N4j++rJnjMqlEw1bAcjnWvgJlmBK0x/VU0PRwq0Quk3X3GUIk/p69xV4JsZeo8PTqjdC/NUfHa+rwwU/+9/Yjba+vTFga34fAaI2YubXCnrpYdLC2yIkaBwJMcPsHEQyxh2yeBxxEHGEnsSIbS5bveAR9lWYJw4pk3eh9CR2ln7SbFmTTlhW3cab26pUQRlechuP0Ltt5kXPvm9WYgMHjWa3qG7ii46o3Cif+Rh1Nf0YRyTCMTiWpvS57CfGjUeI+Q2vGzhhEKH8I290EXOsd7MuiIt9NHT4LgjAyNw2UZ/qLJetOVPeO24ZUkXp5nVfS/YkDaC9nMqskKMv9QxTG32NIKLxBP2SvU2LgRLE4cJ4K+R6NMedML9Sv3e1FZKLxNLUZSWpK1yGjeunCHUjF1C7YLo1Hw/cBjsbJsQp2GSaI5m2LdFSSluGxNAbeM9B8TTW5nL/0Jcf2tDBspgpM+PeF0OOgMZk0DgoE3pZhy4Ss/RvMEBdUwxH/2wkpEHqja1z7ybi/Q==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	uq5x33iRsyiJxTV7pzk9YLEaNQOM3OO87d2OW8h+B84X0rbhK4UsT7WQj00c1LmKL0QIeGVIAo9EAxFy2/bCNIKbbRK1lc7szpS81WHUa4cRCKqHTCQ/zDKQaUVM8956PTQChuZ7nS0fdW4+rWAQJ6yNtpQGLEumDWk4+V47u3aJPTNpsLQZIR7x2qIR8Ik+0lzXfjrHTuxrg+ykCxJ/pxKLPDS7zbczL+c3hCFFslQKCUjUTZcjWxjS97mP1THTDkPBDo0pn08QhYBErEPZH4Q8/0Y/jpCb2p2+oaNCmhKHdhZUqH0JA54B6W+t5K4fQAt08nO5PtgJD6YMIm3NjOZ4LbYT+GALrCsr3gAf485VgjAQlCusL6opynxygR0fl+WMWkLc4xcPzmK1ZWRXGhKQsLBEa6Ul70oI7V0CYS8U2oD/5cZW1bemHMGvqTV7
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 18:46:00.9031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97770883-c4c4-4f55-ef1b-08de90e81611
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5872
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-57986-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[b-brnich@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ti.com:dkim,ti.com:email,ti.com:mid];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EF7A038D6D3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Possible use after free if IRQ thread manages to obtain spinlock between
m2m_ctx release and wave5_release function removing stream instance from
list of active instances. The IRQ thread looks for the m2m_ctx which is
freed so null pointer dereference occurs.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 drivers/media/platform/chips-media/wave5/wave5-helper.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/drivers/media/platform/chips-media/wave5/wave5-helper.c
index 53a0ac068c2e..c3d34be833ff 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
@@ -68,7 +68,6 @@ int wave5_vpu_release_device(struct file *filp,
 	int ret = 0;
 	unsigned long flags;
 
-	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
 	/*
 	 * To prevent Null reference exception, the existing irq handler were
 	 * separated to two modules.
@@ -89,6 +88,9 @@ int wave5_vpu_release_device(struct file *filp,
 	list_del_init(&inst->list);
 	spin_unlock_irqrestore(&inst->dev->irq_spinlock, flags);
 	mutex_unlock(&inst->dev->irq_lock);
+
+	v4l2_m2m_ctx_release(inst->v4l2_fh.m2m_ctx);
+
 	if (inst->state != VPU_INST_STATE_NONE) {
 		u32 fail_res;
 
-- 
2.43.0


