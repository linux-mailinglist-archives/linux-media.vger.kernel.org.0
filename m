Return-Path: <linux-media+bounces-57987-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGfnDfy6zmmTpgYAu9opvQ
	(envelope-from <linux-media+bounces-57987-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 20:52:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D3C38D70E
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 20:52:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6031A305A9D0
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 18:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1443F23BB;
	Thu,  2 Apr 2026 18:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="C1ISWBzZ"
X-Original-To: linux-media@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013038.outbound.protection.outlook.com [40.107.201.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A143EF647;
	Thu,  2 Apr 2026 18:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775155569; cv=fail; b=l7dQoCm5tjpnjWCMp6gjB+4jOHlswA94m9gWOYcFySBaswAROp89aCiBxTFDB6CPG7ndS8etH/zIIMIGifVQhmpvwoKojR9x5gi4lVh7dExolGE0Xg5YPDG8HpUaGZlPY7TK1qf7MZvDKOiHE/SebPMTXhxnN8j0ZUju8m7Kk1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775155569; c=relaxed/simple;
	bh=CHMBO25OPjFwVl1CBJoJtuk3jmWqfBFS+2gMY1f4cVk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iyK1rD1PC0NqMxp+A0VKrcogYCpCWajc+6SzoM3CA2skJOxYYCrN+cdewRarbItIcYs3/LS1gB/4C+PZSMMUAJjNoRljDXEWKsve7ZO7kJlo87RHRsKo9HKrMJBU066AypMhKy75dF7a4SNoJ6xjeNfqXmBcmAGTxshHlD75Jjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=C1ISWBzZ; arc=fail smtp.client-ip=40.107.201.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uRSJJoxPOD1YxVWG1dJ+IxAlVsXNpmMY43osqZaHfHMuBivtEIgtV3+2r0elieLJOE8CHlC2k/qAjuIz5zhTwcZt67UUJn6nTr46BbcSXQZu1XI4NIxF70ZEp2d49vZXDqdyHkbo9AioIAtzbm3Ja96KsP6sM+vb3ZFpT53NTnw3ezLhpkCjcn7JYmtPwtQ2KtBtpcNtZYOXJgOp6dOTMkHaJCLGm2x3gG8Kon80pa8CUf0EK61bSx2en4qVYUHKLBFv6QEcxNF2fc2iZn3b9XI+r2clcw7pVVlBHLumdp2CxeG9odSTOI6w19pDyhV4GmWYR0NbobYAvIkSeIT44Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29YIWPirfWgj1/z3/lml+BP2IvKQFPJUBqDsD1QcTp4=;
 b=lqiM29B0MO4dqjU5QbwOHqN75/RbyJCeHplmUn9v36SEf1TXgO05n1xoEtrMvGXT8dVA+PfUqVSf6/tVdg8i5EvY8P6teZXf9gludco5EtOx1ORHZYX13nV0mEDgDUbBAuOFlPtGfUUkPndt4eH5g5Q0UnY03f4kz6vfJ+TsgSUbS6a4Km2romOli6BKXiexV7qFTv2rbvNpUCOMcbUmRdpDIf/rZ0QFIxq8DQGqdV8N0WFJMI8lQqUFJ0YE3VBxUYzg3GAUYboYuueOqAgYbZU6qAEoySnCtfLMR3bLCFsdbCg1T5EDvQYkf0hO6uMLzSRMq+zK8ESGMrVvKQLtxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=collabora.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29YIWPirfWgj1/z3/lml+BP2IvKQFPJUBqDsD1QcTp4=;
 b=C1ISWBzZbk0bzqc3zJtOo7BvagE+Xm66C9sydLWBoqWUB/nIqKnGlOy+DFG5vaaq83fVRbilpcbTUteX2HjyVPjf/05Nhirm7DFRYYniQYuSYQ5Bc6ruDTMOHgS2kXS64MfuQTyHQ8+oY6qy63FHZzW+lln+PXxxfDkikZIPryI=
Received: from SJ0PR03CA0039.namprd03.prod.outlook.com (2603:10b6:a03:33e::14)
 by DM6PR10MB4122.namprd10.prod.outlook.com (2603:10b6:5:221::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 2 Apr
 2026 18:46:05 +0000
Received: from CO1PEPF000066EC.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::94) by SJ0PR03CA0039.outlook.office365.com
 (2603:10b6:a03:33e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.30 via Frontend Transport; Thu,
 2 Apr 2026 18:46:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000066EC.mail.protection.outlook.com (10.167.249.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 2 Apr 2026 18:46:03 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Apr
 2026 13:46:03 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Apr
 2026 13:46:03 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 2 Apr 2026 13:46:03 -0500
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.81.76])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 632Ik0Xj2992490;
	Thu, 2 Apr 2026 13:46:03 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <detheridge@ti.com>, <mchehab@kernel.org>, <nas.chung@chipsnmedia.com>,
	<jackson.lee@chipsnmedia.com>, <nicolas.dufresne@collabora.com>, "Brandon
 Brnich" <b-brnich@ti.com>
Subject: [PATCH 2/2] media: chips-media: wave5: Fix Reports from Kernel Lock Validator
Date: Thu, 2 Apr 2026 13:45:54 -0500
Message-ID: <20260402184554.1751445-2-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402184554.1751445-1-b-brnich@ti.com>
References: <20260402184554.1751445-1-b-brnich@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EC:EE_|DM6PR10MB4122:EE_
X-MS-Office365-Filtering-Correlation-Id: 22d392f7-6c00-4108-e8c4-08de90e817bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YoaAbsD46AWtAyFODoX/5VOxMioY9VVkW4FS7CdYSeUKq14xC4EMfklDs7TpVaACr51iGi/ow0tkql/sbwA493dKIV3rqnPQR1KidJhoagUzWm8YmcONfs2aeOjxmGA13jGpgqaP86Gw5Ic671fhkauy1/tsJK9fO7j7EPj+hsFfCrbcFitWCECAR5aNSKxgASc7cnKhWLlDUs9ewwHKiqSvVQtYHnu64Ubz1bOLRhhkK6ldhfhKr7xBIFaa7CciVSj9wigVV6nbcd/i71BVuTgOP+KTldtZRRaxVOIQZ2s1icZiVI7TVRjeucOEJqNml0s19pan6b4pEdZI0JyVuy2V8suzPekoQKF0KI6ottkpAqVR2mwudFJWKDdUT/YgC4Uz9AT8wqqMA1JiE9b9yVXvgEmRJp3R+4AGsqI3qY0dzncDIErCBwjeNQTQdOzvKIdnDDd8NLdkSsr1RpNoYB5Nx7XfZ8+Nb7fvAsN70cd6XI8QJYAX2LE3pNDHCg2lQMj9GqxyM55J8fSOxQeWDPo5/nGxFZCk1xgSkYQVgMImQJYWwL+Fj3PhMpwtOlzEk+8JCpPLaRQLmBIKXZ0RLVNJEiKWbVQqCQXt5dmf9W3XZuvX6oCYDUW0mvVaMssjQUgSDGwQHsDmMAmlpNjX49vCOXflwTkmAyI3DZCwdRlIsI2Tw2iIikxlopBuZR7infaWhCzLZaNO5lKNMtUO+zIcudM3u63Pbd3DaiSYp4igLu53PWhutX4T6Q3galRdR8AM6kZXekHt/B/ySsibqA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GNsq/IPFwZcAWyjxgK2clVsOCUiwBJ3XjuorO0TshvZ4LaaJ2AsR1kgRt0pD1I5gxXPLaX3nLXaItzA0NZDRt0SMwa68NBCK1hhSfoCiYkThzwY45i3nQR78D9gFSx1NouWYCTm8TwSebh8BXglwnkS4bI9Xxz9b0tE4wKFd+XAWmJWg8h/5A5KOS67I4Cy9clMtTKJ7adZuY7Y8c8CDtMw/MbG9DRe3J1w5IBHhv9JfdGrLpH/69IudC+KDYGCD3KyuR93fDbV8+AX4UgMDzIBQ6/38jFapcDgH+VCMNGphME+23VubvZdhIsGUi51GyLvVgVeGNDAprwoazja5Lt4yrFGDCmbj1dUvkPhAZ4mLa7AST0Ij+zcSK6TxZE1fGljSUxAKFSl4/sNUA1swCVcFM1DYVx1gmu064QL1AIJZVDkndY14d8Pm25Qko0wz
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 18:46:03.6957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22d392f7-6c00-4108-e8c4-08de90e817bd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4122
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-57987-lists,linux-media=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:dkim,ti.com:email,ti.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ti.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[b-brnich@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E9D3C38D70E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

handle_dynamic_resolution change requires that the state_lock be acquired
based on the lockdep_assert_held. However, the
handle_dynamic_resolution_change call in initialize_sequence does not
properly obtain the lock before calling.

Since the v4l2_ctrl_find and s_ctrl can sleep, they should not be called
while a lock is already held. Store off the fbc_buf_count then properly
update control once lock has been freed.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 .../chips-media/wave5/wave5-vpu-dec.c         | 50 ++++++++++++++-----
 1 file changed, 37 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 80e1831a42e0..62b21b2c5e29 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -283,10 +283,25 @@ static void send_eos_event(struct vpu_instance *inst)
 	inst->sent_eos = true;
 }
 
+static void wave5_update_min_bufs_ctrl(struct vpu_instance *inst, u32 fbc_buf_count)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
+	struct v4l2_ctrl *ctrl;
+
+	if (!fbc_buf_count ||
+			fbc_buf_count == v4l2_m2m_num_dst_bufs_ready(m2m_ctx))
+		return;
+
+	ctrl = v4l2_ctrl_find(&inst->v4l2_ctrl_hdl,
+			V4L2_CID_MIN_BUFFERS_FOR_CAPTURE);
+	if (ctrl)
+		v4l2_ctrl_s_ctrl(ctrl, fbc_buf_count);
+}
+
+
 static int handle_dynamic_resolution_change(struct vpu_instance *inst)
 {
 	struct v4l2_fh *fh = &inst->v4l2_fh;
-	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
 
 	static const struct v4l2_event vpu_event_src_ch = {
 		.type = V4L2_EVENT_SOURCE_CHANGE,
@@ -305,14 +320,6 @@ static int handle_dynamic_resolution_change(struct vpu_instance *inst)
 
 	inst->needs_reallocation = true;
 	inst->fbc_buf_count = initial_info->min_frame_buffer_count + 1;
-	if (inst->fbc_buf_count != v4l2_m2m_num_dst_bufs_ready(m2m_ctx)) {
-		struct v4l2_ctrl *ctrl;
-
-		ctrl = v4l2_ctrl_find(&inst->v4l2_ctrl_hdl,
-				      V4L2_CID_MIN_BUFFERS_FOR_CAPTURE);
-		if (ctrl)
-			v4l2_ctrl_s_ctrl(ctrl, inst->fbc_buf_count);
-	}
 
 	if (p_dec_info->initial_info_obtained) {
 		const struct vpu_format *vpu_fmt;
@@ -439,19 +446,24 @@ static void wave5_vpu_dec_finish_decode(struct vpu_instance *inst)
 	if ((dec_info.index_frame_display == DISPLAY_IDX_FLAG_SEQ_END ||
 	     dec_info.sequence_changed)) {
 		unsigned long flags;
+		u32 fbc_buf_count = 0;
 
 		spin_lock_irqsave(&inst->state_spinlock, flags);
 		if (!v4l2_m2m_has_stopped(m2m_ctx)) {
 			switch_state(inst, VPU_INST_STATE_STOP);
 
-			if (dec_info.sequence_changed)
+			if (dec_info.sequence_changed) {
 				handle_dynamic_resolution_change(inst);
-			else
+				fbc_buf_count = inst->fbc_buf_count;
+			} else {
 				send_eos_event(inst);
+			}
 
 			flag_last_buffer_done(inst);
 		}
 		spin_unlock_irqrestore(&inst->state_spinlock, flags);
+
+		wave5_update_min_bufs_ctrl(inst, fbc_buf_count);
 	}
 
 	if (inst->sent_eos &&
@@ -1583,6 +1595,8 @@ static const struct vpu_instance_ops wave5_vpu_dec_inst_ops = {
 static int initialize_sequence(struct vpu_instance *inst)
 {
 	struct dec_initial_info initial_info;
+	unsigned long flags;
+	u32 fbc_buf_count;
 	int ret = 0;
 
 	memset(&initial_info, 0, sizeof(struct dec_initial_info));
@@ -1605,7 +1619,12 @@ static int initialize_sequence(struct vpu_instance *inst)
 		return ret;
 	}
 
+	spin_lock_irqsave(&inst->state_spinlock, flags);
 	handle_dynamic_resolution_change(inst);
+	fbc_buf_count = inst->fbc_buf_count;
+	spin_unlock_irqrestore(&inst->state_spinlock, flags);
+
+	wave5_update_min_bufs_ctrl(inst, fbc_buf_count);
 
 	return 0;
 }
@@ -1647,6 +1666,7 @@ static void wave5_vpu_dec_device_run(void *priv)
 		ret = initialize_sequence(inst);
 		if (ret) {
 			unsigned long flags;
+			u32 fbc_buf_count = 0;
 
 			spin_lock_irqsave(&inst->state_spinlock, flags);
 			if (wave5_is_draining_or_eos(inst) &&
@@ -1655,14 +1675,18 @@ static void wave5_vpu_dec_device_run(void *priv)
 
 				switch_state(inst, VPU_INST_STATE_STOP);
 
-				if (vb2_is_streaming(dst_vq))
+				if (vb2_is_streaming(dst_vq)) {
 					send_eos_event(inst);
-				else
+				} else {
 					handle_dynamic_resolution_change(inst);
+					fbc_buf_count = inst->fbc_buf_count;
+				}
 
 				flag_last_buffer_done(inst);
 			}
 			spin_unlock_irqrestore(&inst->state_spinlock, flags);
+
+			wave5_update_min_bufs_ctrl(inst, fbc_buf_count);
 		} else {
 			set_instance_state(inst, VPU_INST_STATE_INIT_SEQ);
 		}
-- 
2.43.0


