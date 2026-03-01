Return-Path: <linux-media+bounces-53945-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMj7Jreao2l4IAUAu9opvQ
	(envelope-from <linux-media+bounces-53945-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:47:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9DE1CBBF5
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:47:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7917A321D39D
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCA762F39C2;
	Sun,  1 Mar 2026 01:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RvHR35HB"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3047625228C;
	Sun,  1 Mar 2026 01:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328814; cv=none; b=mx++dYpqg1Y99d2rIt9vXSuiymJs/ym1Uc1MBCIuJIOLfJQdh/puzfLrKhDGBkHB21i6IuSNPqv5kBJ+sxLgSWHjBPwKdo02RBm78lPGspg+T81QhArhQ4kaKUQ4dirb+8xzXXiY0MM95CqTC/AJsOXaZ7pbnCV1dGAvQK5mAvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328814; c=relaxed/simple;
	bh=watHLnp91SSZTkWajxPVEs8Eyj4GzetMKT6JL/c5KjU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jmb1TSVaHvq3b36jLs8HIo8q8O2guvccshA58K74lkRbRlR5F+LyzcKQys86M8Zv2dwd9XgZS/zZUNe9iG0o0XJ5cn+QdTlVk3BkDxDD4UUVVjKAObmWQhFJpoFFlt6jDAr4T6/Or5q/I4JU6zehqWpOoyw/FyXeSQu6EmHUlQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RvHR35HB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BB5EC19425;
	Sun,  1 Mar 2026 01:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328814;
	bh=watHLnp91SSZTkWajxPVEs8Eyj4GzetMKT6JL/c5KjU=;
	h=From:To:Cc:Subject:Date:From;
	b=RvHR35HBe5BB0HkuRlJhL0QCCH5fpLrv8fTYjzb8iFXc93ETpKUzgqgPAcgeLQxkg
	 qfepOD/JM+R1K1WnppHJMDCI+Z5jZ83qlZ9lKIKT2uina4ImM/V2LmumyYKFsMzgJq
	 b0JZvhOPOgnQm5WgTasLu3hBiz2mbjaIorJsFyY464hQSHis7eDwRglPMFp4SkKcQ7
	 tQY2czY06E8VkiAQbFWCwLU/YJmInLGTAOXJugfqzD1RgkIbr1Yqpw17NqqWsJoL5p
	 zfv2UI4c0aCjEFqHFVCa8OZwP7gb2WHAtcMGYQqKp7Ci90pAMGizhGWO8RQE5Pfm+u
	 ECRT/lW9rycJA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	dikshita.agarwal@oss.qualcomm.com
Cc: Mecid <mecid@mecomediagroup.de>,
	Renjiang Han <renjiang.han@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: FAILED: Patch "media: venus: vdec: restrict EOS addr quirk to IRIS2 only" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:33:31 -0500
Message-ID: <20260301013332.1692783-1-sashal@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-53945-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,mecomediagroup.de:email]
X-Rspamd-Queue-Id: 3C9DE1CBBF5
X-Rspamd-Action: no action

The patch below does not apply to the 6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 63c072e2937e6c9995df1b6a28523ed2ae68d364 Mon Sep 17 00:00:00 2001
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 11:04:19 +0530
Subject: [PATCH] media: venus: vdec: restrict EOS addr quirk to IRIS2 only

On SM8250 (IRIS2) with firmware older than 1.0.087, the firmware could
not handle a dummy device address for EOS buffers, so a NULL device
address is sent instead. The existing check used IS_V6() alongside a
firmware version gate:

    if (IS_V6(core) && is_fw_rev_or_older(core, 1, 0, 87))
        fdata.device_addr = 0;
    else
	fdata.device_addr = 0xdeadb000;

However, SC7280 which is also V6, uses a firmware string of the form
"1.0.<commit-hash>", which the version parser translates to 1.0.0. This
unintentionally satisfies the `is_fw_rev_or_older(..., 1, 0, 87)`
condition on SC7280. Combined with IS_V6() matching there as well, the
quirk is incorrectly applied to SC7280, causing VP9 decode failures.

Constrain the check to IRIS2 (SM8250) only, which is the only platform
that needed this quirk, by replacing IS_V6() with IS_IRIS2(). This
restores correct behavior on SC7280 (no forced NULL EOS buffer address).

Fixes: 47f867cb1b63 ("media: venus: fix EOS handling in decoder stop command")
Cc: stable@vger.kernel.org
Reported-by: Mecid <mecid@mecomediagroup.de>
Closes: https://github.com/qualcomm-linux/kernel-topics/issues/222
Co-developed-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Tested-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index d0bd2d86a31f9..4cd69440e8753 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -565,7 +565,13 @@ vdec_decoder_cmd(struct file *file, void *fh, struct v4l2_decoder_cmd *cmd)
 
 		fdata.buffer_type = HFI_BUFFER_INPUT;
 		fdata.flags |= HFI_BUFFERFLAG_EOS;
-		if (IS_V6(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87))
+
+		/* Send NULL EOS addr for only IRIS2 (SM8250),for firmware <= 1.0.87.
+		 * SC7280 also reports "1.0.<hash>" parsed as 1.0.0; restricting to IRIS2
+		 * avoids misapplying this quirk and breaking VP9 decode on SC7280.
+		 */
+
+		if (IS_IRIS2(inst->core) && is_fw_rev_or_older(inst->core, 1, 0, 87))
 			fdata.device_addr = 0;
 		else
 			fdata.device_addr = 0xdeadb000;
-- 
2.51.0





