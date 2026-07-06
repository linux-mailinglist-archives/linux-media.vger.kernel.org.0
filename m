Return-Path: <linux-media+bounces-66771-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i23kIhK0S2o5YwEAu9opvQ
	(envelope-from <linux-media+bounces-66771-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 15:56:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F4F71191C
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 15:56:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=jBY4NUl7;
	dmarc=pass (policy=none) header.from=collabora.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66771-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66771-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B5593155ECF
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 13:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA66C42F6FB;
	Mon,  6 Jul 2026 13:42:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E8841F7FF;
	Mon,  6 Jul 2026 13:42:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345358; cv=none; b=HHHdAGTJ0BanEUDewVW/21h6I0l9DUDWz+pn35GKFjqk+1e+Qq19OEfeKqjCaqnIw97FHoXXJo5FMcd8ihDO9+ekEadYIlcnGZSEwmvfqZNYW6UPeoOWMLk1hMgV+/nt/4BYHA/JdUiPnn1oYoyJ+SwW9PNj3K3nQpmVscyPgrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345358; c=relaxed/simple;
	bh=y27/Sa9spU0AGHzflhICQCjvpf2vh/087yEx5P3Wedo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y8F6f4ZRRueUMeH8yhMsww54j8OI/jQlSyptzmdQtrUALtKiIvh+WY7bQFhj9yXIl4635mSpS490Y/P53SnZ+iQQnyVK3mq67mEvLRAk/2vEiUwA76GU+sQte5RWHr4MkFwAVxK9x0Uasz6MRbAMgfg4/YRgiFEGh1iAslSX59w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jBY4NUl7; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783345355;
	bh=y27/Sa9spU0AGHzflhICQCjvpf2vh/087yEx5P3Wedo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jBY4NUl766a7rlSWyI1/LKc3CddRN8mvke3TxkolKtBpLC5ZpH+KHq6dnk9Vm2hvf
	 78iQ45utCm9rtnUUL4qbr8RxWojZzW+38a02zCPvwktWCkHyTOOGPLvAnSHvQG3zZL
	 p/zvZkR44zwzhNd7fNBQz9fmv9CDoRLaUc4pgyzQ+ixugGKLf07eBvAMkq6Y8a9sy+
	 +2nJnbuG5yFyV7vHq94QC/az2FBfX2I9D3yPTeOwXsTnRQEzhhArAzCQ9iKCBE1YvV
	 efvFfRrXmC40JYfXLJGYKY30cHUJAc3db4YPZsrksNg3aGH6t11Pd5tX7+X95oBCHl
	 iQTHjO3Q5mpWQ==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7F6DB17E0EA6;
	Mon, 06 Jul 2026 15:42:33 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Mon, 06 Jul 2026 09:42:21 -0400
Subject: [PATCH v3 4/5] media: hantro: Add per-context fdinfo usage metrics
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-v4l2-add-fdinfo-v3-4-d556568cf38e@collabora.com>
References: <20260706-v4l2-add-fdinfo-v3-0-d556568cf38e@collabora.com>
In-Reply-To: <20260706-v4l2-add-fdinfo-v3-0-d556568cf38e@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 linux-arm-kernel@lists.infradead.org, 
 Christopher Healy <healych@amazon.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:nicolas.dufresne@collabora.com,m:benjamin.gaignard@collabora.com,m:p.zabel@pengutronix.de,m:ezequiel@vanguardiasur.com.ar,m:heiko@sntech.de,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:kernel@collabora.com,m:detlev.casanova@collabora.com,m:linux-arm-kernel@lists.infradead.org,m:healych@amazon.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-66771-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:from_mime,collabora.com:email,collabora.com:mid,collabora.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F0F4F71191C

From: Christopher Healy <healych@amazon.com>

Add VPU981 hardware utilization metrics to the Hantro VPU stateless
codec driver, exposed via v4l2_metrics.

Update the v4l2_metrics instance each time a job completes with the
time it took in ns and the nuber of cycles reported by the hardware.

This enables userspace monitoring tools to compute per-process decoder
and encoder utilization. The current and max frequency keys report the
same value today since the driver lacks devfreq support, but will
diverge once DVFS is added, allowing userspace to approximate true
capacity utilization without any fdinfo code changes.

Signed-off-by: Christopher Healy <healych@amazon.com>
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/platform/verisilicon/hantro.h           |  3 +++
 drivers/media/platform/verisilicon/hantro_drv.c       | 19 +++++++++++++++++++
 drivers/media/platform/verisilicon/hantro_hw.h        |  1 +
 .../media/platform/verisilicon/rockchip_vpu981_regs.h |  1 +
 drivers/media/platform/verisilicon/rockchip_vpu_hw.c  |  6 ++++++
 5 files changed, 30 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 0353de154a1e..37fd13cc7afa 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -16,6 +16,7 @@
 #include <linux/videodev2.h>
 #include <linux/wait.h>
 #include <linux/clk.h>
+#include <linux/ktime.h>
 #include <linux/reset.h>
 
 #include <media/v4l2-ctrls.h>
@@ -268,6 +269,8 @@ struct hantro_ctx {
 	struct hantro_postproc_ctx postproc;
 	bool need_postproc;
 
+	ktime_t start_time;
+
 	/* Specific for particular codec modes. */
 	union {
 		struct hantro_h264_dec_hw_ctx h264_dec;
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 2e81877f640f..332928801ff9 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -21,6 +21,7 @@
 #include <linux/videodev2.h>
 #include <linux/workqueue.h>
 #include <media/v4l2-event.h>
+#include <media/v4l2-metrics.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-vmalloc.h>
@@ -90,6 +91,9 @@ static void hantro_job_finish(struct hantro_dev *vpu,
 			      struct hantro_ctx *ctx,
 			      enum vb2_buffer_state result)
 {
+	v4l2_metrics_update_hw_time(&ctx->fh.metrics,
+				   ktime_to_ns(ktime_sub(ktime_get(), ctx->start_time)));
+
 	pm_runtime_put_autosuspend(vpu->dev);
 
 	clk_bulk_disable(vpu->variant->num_clocks, vpu->clocks);
@@ -186,6 +190,8 @@ static void device_run(void *priv)
 
 	v4l2_m2m_buf_copy_metadata(src, dst);
 
+	ctx->start_time = ktime_get();
+
 	if (ctx->codec_ops->run(ctx))
 		goto err_cancel_job;
 
@@ -664,6 +670,9 @@ static int hantro_open(struct file *filp)
 
 	v4l2_fh_init(&ctx->fh, vdev);
 	v4l2_fh_add(&ctx->fh, filp);
+	v4l2_metrics_set_driver_type(&ctx->fh.metrics,
+				   ctx->is_encoder ? V4L2_DRIVER_TYPE_STATELESS_ENCODER
+						   : V4L2_DRIVER_TYPE_STATELESS_DECODER);
 
 	hantro_reset_fmts(ctx);
 
@@ -701,10 +710,20 @@ static int hantro_release(struct file *filp)
 	return 0;
 }
 
+static void hantro_show_fdinfo(struct seq_file *m, struct file *f)
+{
+	struct hantro_ctx *ctx = file_to_ctx(f);
+	struct hantro_dev *vpu = ctx->dev;
+
+	v4l2_metrics_show(&ctx->fh.metrics, m, 0);
+	v4l2_metrics_show_clock(m, vpu->clocks[0].clk, 0);
+}
+
 static const struct v4l2_file_operations hantro_fops = {
 	.owner = THIS_MODULE,
 	.open = hantro_open,
 	.release = hantro_release,
+	.show_fdinfo = hantro_show_fdinfo,
 	.poll = v4l2_m2m_fop_poll,
 	.unlocked_ioctl = video_ioctl2,
 	.mmap = v4l2_m2m_fop_mmap,
diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
index 13e573f1f19d..7259ea89adcc 100644
--- a/drivers/media/platform/verisilicon/hantro_hw.h
+++ b/drivers/media/platform/verisilicon/hantro_hw.h
@@ -28,6 +28,7 @@
 #define FMT_MIN_WIDTH		48
 #define FMT_MIN_HEIGHT		48
 #define FMT_HD_WIDTH		1280
+
 #define FMT_HD_HEIGHT		720
 #define FMT_FHD_WIDTH		1920
 #define FMT_FHD_HEIGHT		1088
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_regs.h b/drivers/media/platform/verisilicon/rockchip_vpu981_regs.h
index e4008da64f19..5a1d1e1e941e 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_regs.h
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_regs.h
@@ -451,6 +451,7 @@
 #define av1_pp0_dup_ver			AV1_DEC_REG(394, 16, 0xff)
 #define av1_pp0_dup_hor			AV1_DEC_REG(394, 24, 0xff)
 
+#define AV1_CYCLE_COUNT                 (AV1_SWREG(63))
 #define AV1_TILE_OUT_LU			(AV1_SWREG(65))
 #define AV1_REFERENCE_Y(i)		(AV1_SWREG(67) + ((i) * 0x8))
 #define AV1_SEGMENTATION		(AV1_SWREG(81))
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index 02673be9878e..fd3081242685 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -423,13 +423,19 @@ static irqreturn_t rockchip_vpu2_vepu_irq(int irq, void *dev_id)
 static irqreturn_t rk3588_vpu981_irq(int irq, void *dev_id)
 {
 	struct hantro_dev *vpu = dev_id;
+	struct hantro_ctx *ctx =
+		v4l2_m2m_get_curr_priv(vpu->m2m_dev);
 	enum vb2_buffer_state state;
 	u32 status;
+	u32 cycles;
 
 	status = vdpu_read(vpu, AV1_REG_INTERRUPT);
 	state = (status & AV1_REG_INTERRUPT_DEC_RDY_INT) ?
 		VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
 
+	cycles = vdpu_read(vpu, AV1_CYCLE_COUNT);
+	v4l2_metrics_update_hw_cycles(&ctx->fh.metrics, cycles);
+
 	vdpu_write(vpu, 0, AV1_REG_INTERRUPT);
 	vdpu_write(vpu, AV1_REG_CONFIG_DEC_CLK_GATE_E, AV1_REG_CONFIG);
 

-- 
2.54.0


