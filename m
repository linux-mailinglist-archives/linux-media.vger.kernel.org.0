Return-Path: <linux-media+bounces-39220-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FBAB1F67F
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 75A364E070D
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C41C279DA9;
	Sat,  9 Aug 2025 21:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="N2klx9A/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EECF2BF006;
	Sat,  9 Aug 2025 21:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774285; cv=none; b=h9MiS+S7HBZsmgVVscZ3Hf2SHmYNFwU0XA9jjkAg2o412UebDhyIHTMqAmcMezu3Jg/KOidM9QzUx2tXohNIUtpPNTxhH+w9+vyEmmZTEwh+sz5wadXrFAV10jSFU77r0HfLeYTlT77HZwwXgWBLxt87w5frES2xCmb7TJv1b3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774285; c=relaxed/simple;
	bh=owrvFgZzH8iWicqMisNUA+KQmW6FD9ac8k63HmlGe/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=euZaa6FLNTk2ZpQTQ4JG0wQniRzRd3noyzuZPXcdfiRydC1AjZUstbOuo0NB15yLyDo16yfZFPSsaYOKBJ+rTgvCao+7gQZgtZJpEbQO6NnMkfRph7i2PyhXcVkY30iNLlFh0nuP1b21xbxNNecerQo8gJrOZY+1L4d+7SgLaXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=N2klx9A/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id F19B04346;
	Sat,  9 Aug 2025 23:16:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774220;
	bh=owrvFgZzH8iWicqMisNUA+KQmW6FD9ac8k63HmlGe/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N2klx9A/kpjYPvqWpBkyVJWNRUVULeeWBFseBstKI+zNruVarKXB53JIfQj3Dfaal
	 FLuyjwzTSvO5AvMRhrRE6zt4XM2uYlUgKsJwGbDL/0YelwW263xoLImIbEoE29LCVt
	 zolRwzDd82n3A0EFf8dqU8f7PX1yaNiPBiL2j//Q=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 25/76] media: qcom: venus: Pass file pointer to venus_close_common()
Date: Sun, 10 Aug 2025 00:16:02 +0300
Message-ID: <20250809211654.28887-26-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

In preparation for a tree-wide rework automated with coccinelle that
will need to access a struct file pointer in the venus_close_common()
function, pass it from the callers. There is not functional change yet.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/platform/qcom/venus/core.c | 2 +-
 drivers/media/platform/qcom/venus/core.h | 2 +-
 drivers/media/platform/qcom/venus/vdec.c | 2 +-
 drivers/media/platform/qcom/venus/venc.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 4c049c694d9c..5e1ace16a490 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -596,7 +596,7 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
 	return ret;
 }
 
-void venus_close_common(struct venus_inst *inst)
+void venus_close_common(struct venus_inst *inst, struct file *filp)
 {
 	/*
 	 * Make sure we don't have IRQ/IRQ-thread currently running
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 3c0c5f9dbe7b..db7b69b91db5 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -573,5 +573,5 @@ is_fw_rev_or_older(struct venus_core *core, u32 vmajor, u32 vminor, u32 vrev)
 		(core)->venus_ver.rev <= vrev);
 }
 
-void venus_close_common(struct venus_inst *inst);
+void venus_close_common(struct venus_inst *inst, struct file *filp);
 #endif
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 29b0d6a5303d..d10ca6d89f6d 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1755,7 +1755,7 @@ static int vdec_close(struct file *file)
 
 	vdec_pm_get(inst);
 	cancel_work_sync(&inst->delayed_process_work);
-	venus_close_common(inst);
+	venus_close_common(inst, file);
 	ida_destroy(&inst->dpb_ids);
 	vdec_pm_put(inst, false);
 
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index c0a0ccdded80..0838d64ce8fe 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1537,7 +1537,7 @@ static int venc_close(struct file *file)
 	struct venus_inst *inst = to_inst(file);
 
 	venc_pm_get(inst);
-	venus_close_common(inst);
+	venus_close_common(inst, file);
 	inst->enc_state = VENUS_ENC_STATE_DEINIT;
 	venc_pm_put(inst, false);
 
-- 
Regards,

Laurent Pinchart


