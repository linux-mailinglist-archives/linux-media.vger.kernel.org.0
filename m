Return-Path: <linux-media+bounces-53871-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJgEMtyTo2khHQUAu9opvQ
	(envelope-from <linux-media+bounces-53871-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:18:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5140B1CA1F7
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:18:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AACEB30616FE
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82BFE23D2B1;
	Sun,  1 Mar 2026 01:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D8Pdm36c"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA053430B90;
	Sun,  1 Mar 2026 01:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772327742; cv=none; b=nbZFF6kj1M1HwLIrsbPtCEQ+aUgc4v3pjWIG5YS6u6AEEmx4KNwBX2IBwSyorXDmJMoMWrP9GVjtGb6Fwk+suoBU6FGsWPm56ugJhGx58mpO9WCB7YGphaWhBq+Wfti8lAprRmqB+3W3YSAebDOdn8caJBvUSIS6YKy3GudpaaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772327742; c=relaxed/simple;
	bh=OAaoWngE4iLEgGq6+OrogRicXN9Jfngd7Pwwn07cWrg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AKxo+SBWQjHjl0k22AmZOw2uJoXs3M8Fkj2rb5A8KnJY88CNm8aIvA6mmZQBVkyr401GaassU5ciEnxTGG9BpqxhsD1jNAanAcJ+5UX4ErVw2S8D5oktxjeLUl41CXzGI2ezPuGZksoJwWHsiyMmzJeEU27rtbIc9Kkq3Do2MZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D8Pdm36c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D18C19421;
	Sun,  1 Mar 2026 01:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772327741;
	bh=OAaoWngE4iLEgGq6+OrogRicXN9Jfngd7Pwwn07cWrg=;
	h=From:To:Cc:Subject:Date:From;
	b=D8Pdm36cezKFsz8qwd4Pz9NOeKr5IcVVwG1pnNt6VcusqeATfQvt9aO34hq2rQ2Eb
	 2KIYVzJ5yg+OShwWwtUArLLwOzOd9tgtubpauqW4VHB6RfqkaTmaSpQ1IUHFh9Ihxn
	 7eZlSWHfTFrhGBGaBykTr8sOne9zpajLMxxL1RjJCUI/OjEhxB+oBXqNhwKF4MW6ty
	 0/sLBruiybkyai3aPpP6v1CoIFGQrMQKR+n3iCLMW/n0TZrYdDAG3Zy2Hi1hVYkOYq
	 L6ekJZFVNdyHKAkfIENOLLFMx90gBAsulaMQLX/ZiiV01ALvEtFtbyCgIz310d/38Y
	 rygPovdzg5OOw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	dikshita.agarwal@oss.qualcomm.com
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: FAILED: Patch "media: iris: Add missing platform data entries for SM8750" failed to apply to 6.18-stable tree
Date: Sat, 28 Feb 2026 20:15:39 -0500
Message-ID: <20260301011539.1669217-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53871-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5140B1CA1F7
X-Rspamd-Action: no action

The patch below does not apply to the 6.18-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From bbef55f414100853d5bcea56a41f8b171bac8fcb Mon Sep 17 00:00:00 2001
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 12:24:09 +0530
Subject: [PATCH] media: iris: Add missing platform data entries for SM8750

Two platform-data fields for SM8750 were missed:

  - get_vpu_buffer_size = iris_vpu33_buf_size
    Without this, the driver fails to allocate the required internal
    buffers, leading to basic decode/encode failures during session
    bring-up.

  - max_core_mbps = ((7680 * 4320) / 256) * 60
    Without this capability exposed, capability checks are incomplete and
    v4l2-compliance for encoder fails.

Fixes: a5925a2ce077 ("media: iris: add VPU33 specific encoding buffer calculation")
Fixes: a6882431a138 ("media: iris: Add support for ENUM_FRAMESIZES/FRAMEINTERVALS for encoder")
Cc: stable@vger.kernel.org
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/qcom/iris/iris_platform_gen2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index b2d8559dd2b85..c932dc026616e 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -1056,6 +1056,7 @@ const struct iris_platform_data sm8750_data = {
 	.get_instance = iris_hfi_gen2_get_instance,
 	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
 	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.get_vpu_buffer_size = iris_vpu33_buf_size,
 	.vpu_ops = &iris_vpu35_ops,
 	.set_preset_registers = iris_set_sm8550_preset_registers,
 	.icc_tbl = sm8550_icc_table,
@@ -1088,6 +1089,7 @@ const struct iris_platform_data sm8750_data = {
 	.num_vpp_pipe = 4,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = ((7680 * 4320) / 256) * 60,
 	.dec_input_config_params_default =
 		sm8550_vdec_input_config_params_default,
 	.dec_input_config_params_default_size =
-- 
2.51.0





