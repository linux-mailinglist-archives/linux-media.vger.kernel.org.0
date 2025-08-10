Return-Path: <linux-media+bounces-39298-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A421B1F7AE
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:33:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F8D3176B79
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202A41D6DB5;
	Sun, 10 Aug 2025 01:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qhFSskBO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E53A1D5CD7;
	Sun, 10 Aug 2025 01:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789524; cv=none; b=o7x7qRTm+/9UlW/X/FPHx9JM+/yxuggGgV7xr6b1OMmOm2FrefJvNULL+Zd92Dft1sJ1AMu8TUL3kFYL1+XQ+mJLhTxMz9IL5gxqbFEMotkfDqOc7+KjKWhgPy076dSQp/HueFZbZizGI8kxzOIFqQdzqnC9L23qLJaYp/Gi+ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789524; c=relaxed/simple;
	bh=EoZyy69/DdTgJBZhV6HCD+3Y29pNulOimfOKMyzEntc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gYxjVjXNz9TW9J21QN21VQ4ENdzrmR8VWW/Kw55MDJ0In2iSgKrDfkV5D8VwU6StutUpkxIQ+StnO3H3J7JzrOXdPW4d/ETEfH1yuNgVrTSymhbw7loJwiHz/+9ADtnbLdEp87cfQIqoS1dijajJXUljGaVLRE+tvtb0PJPF6Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qhFSskBO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C3D19104D;
	Sun, 10 Aug 2025 03:31:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789471;
	bh=EoZyy69/DdTgJBZhV6HCD+3Y29pNulOimfOKMyzEntc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qhFSskBOuaoF4V6kKdjp7MFf/6Qx1/gKkddQ1k/x+3545ovgLOcdSI2ql4Oaf0tFU
	 BxsK/42YiQ1rJLq2l91VBeT1ds0byj4qWGyEHtJMremutzVzaRTWa3/dDwY9m0NtH9
	 3k8yOqUh6SPBh1v7wWw1yHUQp01xiUE4UCEXJ/Wc=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 25/76] media: qcom: venus: Pass file pointer to venus_close_common()
Date: Sun, 10 Aug 2025 04:30:07 +0300
Message-ID: <20250810013100.29776-26-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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


