Return-Path: <linux-media+bounces-55750-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6A0zExlCtGk4kAAAu9opvQ
	(envelope-from <linux-media+bounces-55750-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:58:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D42A287AD8
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:58:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 64C9430E7A1B
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2A93CAE69;
	Fri, 13 Mar 2026 16:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MW5xut65"
X-Original-To: linux-media@vger.kernel.org
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011052.outbound.protection.outlook.com [52.101.57.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CADA3CA4A3;
	Fri, 13 Mar 2026 16:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773420908; cv=fail; b=X95SlBBhGPo8lXMO2o28D3GgxpINHi7l2+eMXuGX40O7nDJxLU+jQy2NqnvUnzIlxmH0G7zdkIF+QOJumAAK5uWKySKE2qypHBB8yuQJNCOKHDmtYZdmRXwvTiXK499v9XJU9DgtwO76wVA+Mr9W8g/UKEf4CbWeTlw/gnPcXRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773420908; c=relaxed/simple;
	bh=uXqBt5j7LCgE+JMz431+33guKn6tBh/Q7atNBdZFprg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WAu2Q0Ecfhhsg6bOnip4v0t5B+1GGIGVnyB+8SB0wGrM6XykrOma+0lcutlzY6msDPduNQbxi8QtgXsOlv8WMhPYtQdJT960+wfgEIqmFTj9ohcKjL5vNZwgqPPkh7GFkneyH6UlGlpkpW4bqu+3d/M40pEv2eiHDeWPRYY/dcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MW5xut65; arc=fail smtp.client-ip=52.101.57.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E3UtWbYGDIWE73b6d6T/3fVZn267Mz4FgW29kBw/GGnAUu1O5fYBMxTjc0QyDRAErTC6NEJHNrkY5yGjK8mcqFh0N5A2ipuCGMAY4HBXCpEPRd7pRjzEcEhKazVq5xW0eXfOYSKQh8sRGIpAQq17nGMPR9FFC+LCgjOxHdBk9y4VvP3GpHX2KE22gUDhhl+QQVE44UjYwtpC07k4TVJoNIgPXpwLPLAe0uTV43Ttr5tihR/ZmuIV2DcSsIeR4lqAez+gyo/e0ErgSEi9tkOYinSQlM26nPLjKUy912DKDHDJNvQDo48LSDdvfvNVNSLru4Sdk/wmTTLERY34AADOaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VbsgOG2V9AmTJtLvD8Ns9QoIN8eHkEPnd/QvVJxS06s=;
 b=JAiTu33ssSFtjqw8Ze1wV8VzgChJn2mZHsIy+RR0rWwamzTqceS+63Dk7jdoH9kJM5ZBo4C/jY5XWDCyqJorARuhmcVMvjQ0IM3kKtxBH9d0Cg3Ed9b8/S7QqdzG7FLOBugC1mBtaXs4l2OF3LmiX4Omv3CyCeDGA4JoaiM9fZvwQJU90WRMMcKJB3iA5HOiVjgmlKzf0D8zm0rze6wC3AgbHAtLB0GWxWUrif6qkagIFxMDfmQy+o4ywkT8uB84RU4h0iBZA8GY9ygR1PNAAYvgBOqIa2p3vcol+9P0bOlEsFzgXX6atGPHbjpzF7YkvTDGO0N0Y1AL56itruZB5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=collabora.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VbsgOG2V9AmTJtLvD8Ns9QoIN8eHkEPnd/QvVJxS06s=;
 b=MW5xut65mT93ghYeRN10JsydbyBpQy2rWSQP91NN9nSVMtawSsWuYUt1w28uMaVWcTBWYjJEnHu+xgNUzIHn3f5HytQTvfAGAxnnzgUqY7unLc0Fzh6UGpuxGgfKmBbJsqxVLJz1JtmAmP/xmJelBwv3/21mDgSNtWQWP0+pijc=
Received: from MN2PR17CA0035.namprd17.prod.outlook.com (2603:10b6:208:15e::48)
 by DS0PR10MB7454.namprd10.prod.outlook.com (2603:10b6:8:163::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 16:55:03 +0000
Received: from BL02EPF00029927.namprd02.prod.outlook.com
 (2603:10b6:208:15e:cafe::33) by MN2PR17CA0035.outlook.office365.com
 (2603:10b6:208:15e::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.16 via Frontend Transport; Fri,
 13 Mar 2026 16:55:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF00029927.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 16:55:01 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 11:54:55 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 11:54:55 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 11:54:55 -0500
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.81.69])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62DGstY1880477;
	Fri, 13 Mar 2026 11:54:55 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <detheridge@ti.com>, <mchehab@kernel.org>, <nas.chung@chipsnmedia.com>,
	<jackson.lee@chipsnmedia.com>, <nicolas.dufresne@collabora.com>, "Brandon
 Brnich" <b-brnich@ti.com>
Subject: [PATCH] media: chips-media: wave5: Move src_buf Removal to finish_encode
Date: Fri, 13 Mar 2026 11:54:46 -0500
Message-ID: <20260313165446.4139543-1-b-brnich@ti.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF00029927:EE_|DS0PR10MB7454:EE_
X-MS-Office365-Filtering-Correlation-Id: 778340b0-99ef-479f-e53e-08de812144b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	+BaGJlDIDRWnkfJFo0uM4C/IUlZeD9PVMKh8+34Ktq+Bw4z8kx8MK6OKetBT8h9z/IDSayOMzKLmjsW6tDqv/ryhe8D0BcbYs9IW1IZgNUyUPdCowsGex1csnRFsWgjvM9IwgtmPdaJz1rAgHmcNcu7nauoJnWeFeimx6/+PI00eT3y6NkpbIsCuqHIScDJteCg1DcFztnB9iyMdmlmZgM4bW63QKMBJcao5vu4OnFOuiS1elhQe45ObxfTB2K5TiCnLe/Usk5vMb0cMF8u07GhBCP4FZ3gObczlYxHherbKSlSBRQDzgF1Qj460yv9gYJbr5OM0QqHudZJIALEc9Keccx5UcpAIzzBNPssSW/jc1O/6FjpTr1QXM9E9lMck/j9aklY3C20OsO7XNicpQo5eXBkfNZr0GSJwglbpc0YVrlTI3peSmiw5c5nhpDfUQc65P5e5RLkn9iqAjmGE5vWYg7X6PyMmwme+Pf/yDo6bZPmd6yPN0WHM56FlAVaDtzwZQvw0ARK7m0WapW2DD4XnexUq31JbKeV05rKDtepBRDj1pwt/uVzB0CVJTgV5IImEUGF9evigVeZU/txuuFbjiTSglHvtySYeRLxopqYJ7JV1Y6sB6l4/dLcOEklHf/KVI+ong4WAoLk8/a6R0WvXKxffLFppfRVP4lOzV3OHTcABD0CxkyGXRfoQePpmH1BpNm/n3nfQR9B1enuX3cV7R3Ret23QDFLWHk3roAGq15kVW1UislaTavcAUFr6sDFxnu2qKHRk7ALe3Rjl1w==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0YKkcYMqQUKtzUwMXsvPSI5hLFdKVjuk7CRbDYXqUWOoXLjSlWw7ltRp3tAhMgFqdTqaE5DIGxqkzOSQwYgYly3cK9TkRhmMzcOFtMEGkqkj1zkFc22fhib9YuEEI2ok1o07LwUWyMbb4Oi836nKfFpciwDhnTDpYZ0quJE2vt0XkhfVBGaLmKT07ZMFaoy2lTUpXvLyykSVcl9W3OQK4VO+Aug3gmkAiNXZfqx1tDRUQ3PdKmtXu6PkPQ9rY4S99EUBdbSqB1rQfAy0zUxyagE3beRSqMQBsuEnfvJQl1ITPFvOQUWP23D+fV8YQp3ZtLka2UWQYxvs4VIwke5V80Q42im9OZ1dOcB9T9Hw/s1tf7lZou7M9wzsMPPWzaCkCmdwq5/McyqVtaejg16/FtCI43HRMgkTZJVh6eWchuG1IozyKTooSPFAf4m7KXA6
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 16:55:01.8837
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 778340b0-99ef-479f-e53e-08de812144b6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029927.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7454
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-55750-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[b-brnich@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ti.com:dkim,ti.com:email,ti.com:mid];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8D42A287AD8
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

This bug is very hard to reproduce in simple encode environments. It
primarily occurs during long run cases where CPU is strained doing other
forms of computation. Crash log shared below.

I see other drivers removing buffer in their device_run process, but
they do it before any chance of DONE state transition. I can move this
removal to there as well if that is the correct location, but I can't
find anywhere saying this is required.

Kernel tested on: 7.0.0-rc3-00167-g66dbdc5b5d2d
Gstreamer version: 1.26.9

[ 609.879961] pc : v4l2_m2m_buf_remove_by_idx+0x84/0xe8 [v4l2_mem2mem]
[ 609.886313] lr : v4l2_m2m_buf_remove_by_idx+0x28/0xe8 [v4l2_mem2mem]
[ 609.892663] sp : ffff800081a4bbd0
[ 609.895968] x29: ffff800081a4bbd0 x28: 0000000000000000 x27: 000000000007f800
[ 609.903096] x26: 00000000aefd2800 x25: 0000000000000780 x24: ffff0000014efdc8
[ 609.910224] x23: ffff0000014efc28 x22: ffff0000014efc00 x21: ffff0000014eff60
[ 609.917351] x20: ffff0000014efdc8 x19: ffff000001daf800 x18: 0000000000000000
[ 609.924478] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000002
[ 609.931605] x14: 0000000000000800 x13: 00000000000001e6 x12: 0000000000000000
[ 609.938732] x11: 0000000000000000 x10: 00000000000009d0 x9 : ffff800081a4bcc0
[ 609.945859] x8 : ffff800081a4bc88 x7 : 0000000000000000 x6 : ffff0000014eff50
[ 609.952986] x5 : dead000000000100 x4 : dead000000000100 x3 : dead000000000122
[ 609.960113] x2 : 0000000000000100 x1 : 0000000000000000 x0 : ffff000001dafc00
[ 609.967242] Call trace:
[ 609.969678] v4l2_m2m_buf_remove_by_idx+0x84/0xe8 [v4l2_mem2mem]
[ 609.975685] start_encode+0x28c/0x554 [wave5]
[ 609.980063] wave5_vpu_enc_device_run+0x10c/0x230 [wave5]
[ 609.985466] v4l2_m2m_try_run+0x84/0x140 [v4l2_mem2mem]
[ 609.990692] v4l2_m2m_device_run_work+0x14/0x20 [v4l2_mem2mem]
[ 609.996522] process_one_work+0x148/0x28c
[ 610.000532] worker_thread+0x2d0/0x3d8
[ 610.004277] kthread+0x110/0x114
[ 610.007500] ret_from_fork+0x10/0x20

 .../chips-media/wave5/wave5-vpu-enc.c         | 32 +++----------------
 1 file changed, 5 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 7613fcdbafed..3e198a7cefb1 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -223,17 +223,9 @@ static int start_encode(struct vpu_instance *inst, u32 *fail_res)
 		dst_buf->vb2_buf.timestamp = src_buf->vb2_buf.timestamp;
 		v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
 		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
-	} else {
+	} else
 		dev_dbg(inst->dev->dev, "%s: wave5_vpu_enc_start_one_frame success\n",
 			__func__);
-		/*
-		 * Remove the source buffer from the ready-queue now and finish
-		 * it in the videobuf2 framework once the index is returned by the
-		 * firmware in finish_encode
-		 */
-		if (src_buf)
-			v4l2_m2m_src_buf_remove_by_idx(m2m_ctx, src_buf->vb2_buf.index);
-	}
 
 	return 0;
 }
@@ -259,27 +251,13 @@ static void wave5_vpu_enc_finish_encode(struct vpu_instance *inst)
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
+		src_buf = v4l2_m2m_src_buf_remove(m2m_ctx);
+		if (!src_buf)
+			dev_warn(inst->dev->dev, "%s: no source buffer found\n", __func__);
+		else {
 			inst->timestamp = src_buf->vb2_buf.timestamp;
 			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
-		} else {
-			dev_warn(inst->dev->dev, "%s: no source buffer with index: %d found\n",
-				 __func__, enc_output_info.enc_src_idx);
 		}
 	}
 
-- 
2.43.0


