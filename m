Return-Path: <linux-media+bounces-56565-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEGBDsaNvWnY+wIAu9opvQ
	(envelope-from <linux-media+bounces-56565-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 19:11:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE232DF361
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 19:11:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0A86300A8E0
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 18:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF9892FE56F;
	Fri, 20 Mar 2026 18:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="JHe0UD4g"
X-Original-To: linux-media@vger.kernel.org
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010020.outbound.protection.outlook.com [52.101.56.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502F93218B3;
	Fri, 20 Mar 2026 18:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774029948; cv=fail; b=GNycNblIE3HCFJ9Xtxabj7m0u0/yqzQHdcP4ELS+uKvj/rHXphNqKkwei9Fg1lsb6ak3Ar9oLsXNoB6Zbrs4SIyIAHa+faZgUSsk3i/oyXy79WkQ4UVGpWWGWk+xADAHq5Pnq3JQWVBhGyctDnD19FomewWg3ilMM4LEv9ThObM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774029948; c=relaxed/simple;
	bh=I2aEnT7S7Jd7XPFI0zK5qTStult1vE4OgPYywOwpoFM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RF8+sG+9I3AdAWfhuKpM+OhfmMWSgdpJbDkrynlGSGEMV/y45jh/lDl/MY4OvZsSh9JrJdKFIX80QHOFm+D6i2QtkGcRNpkmdb4Cp7XptUaN74hxoYUlpiSWlinJu+379MM7au6K9Qedy3MyWiq1I/IclSbYa7OvQcUdn4DqAmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=JHe0UD4g; arc=fail smtp.client-ip=52.101.56.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m536vqZWWQbJ/tBGYT5JtGNZYw6F67dMuAPeeTY8BncnRBi6o1FfS156a/92n6ssA8wgUXpEl4wsl0TukOeRRSKG5CjKPpO6hZziyEMbF89uhOnpj2+4SRjKbgWj1Kl8KMqavP6aF1YveGiPmaDQ1WocsAOR73BEe9/D6mADI6s6gNKll6iSVdRroRzFpuVncfV8S0a9VJDZ2bl2M9rZwKvYqo0hVV9qw9ifwtg6JUjVRsyID5QIEuAoLtndn4BaOOG/c4eeZ4ibC4nptmnyAXje/MgvUn7QxSvU6aTA7w3YlhqqZ4uQx9nAqoyxb4YcnkOAJv6oXQFLBXGKDSDVrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzy/hL9H2xfALr5wpuHoPldux/j6oAdyCGwt1I2YRyM=;
 b=ridLXxsJXoQP9Ot7NytkT8pNGztyzXJ+nvP+mgkXNH/mJfViljsDOTAN8j0c2uPO+ugIbjGMarn8/bKgDhr9Ek7xPh8FJfB6UiRbZLDAwTq33B+FV5XpQuafkGHThsNcHWex+zithm604j8n88xpymfvrKM5jsCCS088+KMtaGj2IpnBl/KJgkHaKtF0/npMiUyWDZqJyh2ECSvVKCLZFHhN5HXtJvA/DAFsarbMxtfWDGlZvI9OW/IuFsX/ELN5lBsQ4ck8GLOTAV/4J+dAcgZStXRQ0hEepsHQ8ePQSKLhmQz125TTLeoexY5yiZ/gqUm7QnBq+0VXObKti4hMFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=collabora.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzy/hL9H2xfALr5wpuHoPldux/j6oAdyCGwt1I2YRyM=;
 b=JHe0UD4gZjpxrZDn1N6Gc+cnp53xr/UOlmR6lbc0OWGnh6PRgFR5Wv3oEZR+VChphaTHXxJq5Zh1FFydUgP84AxW/TeWIztvx9cgxOCOk3fnGzP1Cy67ygd5dNRZ2j91O7cIW7b7gTa9mVIAluErokaKBgC7UbS4yyhB5aJQ4KA=
Received: from BY1P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::16)
 by LV3PR10MB7721.namprd10.prod.outlook.com (2603:10b6:408:1b7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 18:05:39 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:59d:cafe::21) by BY1P220CA0008.outlook.office365.com
 (2603:10b6:a03:59d::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.24 via Frontend Transport; Fri,
 20 Mar 2026 18:05:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Fri, 20 Mar 2026 18:05:36 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 13:05:28 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 20 Mar
 2026 13:05:28 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 20 Mar 2026 13:05:28 -0500
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.81.76])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62KI5SYd521115;
	Fri, 20 Mar 2026 13:05:28 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<jackson.lee@chipsnmedia.com>, <nas.chung@chipsnmedia.com>
CC: <mchehab@kernel.org>, <nicolas.dufresne@collabora.com>, <b-brnich@ti.com>
Subject: [PATCH v2] media: chips-media: wave5: Move src_buf Removal to finish_encode
Date: Fri, 20 Mar 2026 13:05:26 -0500
Message-ID: <20260320180526.351956-1-b-brnich@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|LV3PR10MB7721:EE_
X-MS-Office365-Filtering-Correlation-Id: 2039b9a2-dee1-4f77-39b6-08de86ab496b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Zu8zIyqJApN9ARSvi8groilgnAYvldEeKEgVebWD4XeWJH2YYbhGRNZjk9AbfJorhdNTaalQd3XgVOkQTT+rXED7aAk9B8ZwqWU2+nVtjU/SxO1Na9hI/pJ2SaEJx1qF9HeAvjXYoISKcCcawLbz9AlaUZi4yuEv2W5mH/+zIpMRy3Nqznn5COYyvJx1HJevRYPESzN8qlVMkftGHpQL0fAj7d507UNeRc12BRf/47yZ86/VisFIwkVvkLn4mQgMsJ/gZbMj+O3G8whlVfrC+/X9bZ4Zb0g2DKwZ0voDWgSGyBu2orRpQxIMjBaoRg7zG5K4G1RszQsLFHspoyEBZByQajy0pbC3ybjIP6FMIKuNr3klAZGajPTzBbzVzsNcA63Y5GWP61Dwh4R5eCAcPTllGD6UjRYtL+6SoPtMuoUKnh9rslwybChp0HEsER2h5Ft08zBCfkq/B5YQ9N86GE1dIWqTlcK297aPJcLq1YuZvvGPxuD+ebidRk/b0l00leW+rN0XvkJJC6mny9Dbjo752d97F/c6Ta8/X4K9H++NDTJar1XAEY98pXmvI3C65xBqydZ/7UOLCvn6Voy2sLs/bGZqYNaIagdnAP5cRg0f9wi/KFYg8r2RDhC60BhMMQhaDJKM4csGSDc8oPQjEI11FsWUsOVTGvBMj0p22JhEHuIvZLmajmqlpReGoPPAGXzl6dAidqYbCwUtawd4KM8O01VUzl3vKB/GRCoUN0H3N/qoFdJlZrxBGm3xUN41USK7LyK9od+PItz9gucQIA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jE5EQesiZalonPIaVITfSrmepYVoI6nUaL6LSrfWmEPk6/x/Oo1BCpKSDtNrbhJ0rJKAcspE/MdZuWbkF0tRHksbIheeIX79gC+ZYCKxosZ8PqNoB03KBtPQnfg3h67eezTvG/uM4Aybd5VI+y/uq/gQis95nxcVPirwvvSA4hkcx1bseqIm++3gE/i3kcDXF6OnGTc6Ym8BgHk6Y25b9jCz7KYS4zDvQIDzuOGwgqoGchnR89mtyvwK9g2EbDjmcWC/kMp6iKuv3qQlHQ5b78HFVKD81nr13lVoAMT31qhjFg7LJj80ZHhg5vGXLnbA2qMhaNkpyxYLKBWCXezx4iQ645tikz+hjejCQU11YcCfhH3bJeF/G4DuvzRe8MqDNMMXm+jM5HWf2CU8tt6aU4w5oc/oSvs+SIXjkQN3TrP0wSpQofeP0/SfXLJ/4X0a
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 18:05:36.1250
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2039b9a2-dee1-4f77-39b6-08de86ab496b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7721
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TAGGED_FROM(0.00)[bounces-56565-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:dkim,ti.com:email,ti.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[b-brnich@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8FE232DF361
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

During encoder processing, there is a case where the IRQ response could
return the buffer back to userspace via v4l2_m2m_buf_done call. In this
time, userspace could queue up this same buffer before start_encode removes
the index from the ready queue. This would then lead to a case where the
buffer in the ready queue could be a self loop due to the
WRITE_ONCE(prev->next, new) call in __list_add.

When __list_del is finally called, the loop is already made so nothing
points back to ready queue list head and pointers are poisoned.

A buffer should not be marked as DONE before the buffer is removed from
m2m ready queue. Move removal entirely to finish_encode.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---

V2:
 - Update function to use reported index from encoder
 - Fix reported media CI bot style errors with brackets

 .../chips-media/wave5/wave5-vpu-enc.c         | 29 +++----------------
 1 file changed, 4 insertions(+), 25 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 7613fcdbafed..c605a91718d8 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -226,13 +226,6 @@ static int start_encode(struct vpu_instance *inst, u32 *fail_res)
 	} else {
 		dev_dbg(inst->dev->dev, "%s: wave5_vpu_enc_start_one_frame success\n",
 			__func__);
-		/*
-		 * Remove the source buffer from the ready-queue now and finish
-		 * it in the videobuf2 framework once the index is returned by the
-		 * firmware in finish_encode
-		 */
-		if (src_buf)
-			v4l2_m2m_src_buf_remove_by_idx(m2m_ctx, src_buf->vb2_buf.index);
 	}
 
 	return 0;
@@ -259,27 +252,13 @@ static void wave5_vpu_enc_finish_encode(struct vpu_instance *inst)
 		__func__,  enc_output_info.pic_type, enc_output_info.recon_frame_index,
 		enc_output_info.enc_src_idx, enc_output_info.enc_pic_byte, enc_output_info.pts);
 
-	/*
-	 * The source buffer will not be found in the ready-queue as it has been
-	 * dropped after sending of the encode firmware command, locate it in
-	 * the videobuf2 queue directly
-	 */
 	if (enc_output_info.enc_src_idx >= 0) {
-		struct vb2_buffer *vb = vb2_get_buffer(v4l2_m2m_get_src_vq(m2m_ctx),
-						       enc_output_info.enc_src_idx);
-		if (vb->state != VB2_BUF_STATE_ACTIVE)
-			dev_warn(inst->dev->dev,
-				 "%s: encoded buffer (%d) was not in ready queue %i.",
-				 __func__, enc_output_info.enc_src_idx, vb->state);
-		else
-			src_buf = to_vb2_v4l2_buffer(vb);
-
-		if (src_buf) {
+		src_buf = v4l2_m2m_src_buf_remove_by_idx(m2m_ctx, enc_output_info.enc_src_idx);
+		if (!src_buf) {
+			dev_warn(inst->dev->dev, "%s: no source buffer found\n", __func__);
+		} else {
 			inst->timestamp = src_buf->vb2_buf.timestamp;
 			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
-		} else {
-			dev_warn(inst->dev->dev, "%s: no source buffer with index: %d found\n",
-				 __func__, enc_output_info.enc_src_idx);
 		}
 	}
 
-- 
2.43.0


