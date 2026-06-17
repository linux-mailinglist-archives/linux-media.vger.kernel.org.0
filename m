Return-Path: <linux-media+bounces-65134-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RdxvBK/jMmrY6gUAu9opvQ
	(envelope-from <linux-media+bounces-65134-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 20:13:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D6969BE3F
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 20:13:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=LtMONZa0;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65134-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65134-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9CB6030FDC6D
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 18:11:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 003C137C91A;
	Wed, 17 Jun 2026 18:11:21 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1976037B3EB;
	Wed, 17 Jun 2026 18:11:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781719880; cv=none; b=pC+NblfQkEY/zIr1iOrLjNoDrNVVGnX89o8Ag7HPPPLixMTzKAuK6mXyQ9VaJhR9wwlp2WqD8QZ1Ld1ruMj+2g3iX66o6XvG049FVTabN8px0sr0DO10gPZ/oD7Vn3W0Rl/o3w4P36GVi2GHdIXWwXcGvO0cWXK92Ky8lDL3fwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781719880; c=relaxed/simple;
	bh=n1SkJYuM2PtMsbvPGZKz/74m8eLWqsSSeKJl91cyFjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jzddgCQvgoesHtGTugIzMu5Enc9IaH2ls65x0NtMMZjNQKQYKjf3QJnCtTutaKDN/34iAw8VwCgCHK6T5g+ghidgMXMziy8E7WQK9ocdS9VL2P69uZnM9fQtlBiTD6F/v3r09IaZZ07st/n/GH0dAo0Bx1lCCal7eCY/y+j7Ez4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LtMONZa0; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781719877;
	bh=n1SkJYuM2PtMsbvPGZKz/74m8eLWqsSSeKJl91cyFjw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LtMONZa0UA+4avPvY8Lra9jqCbW6aGGl0wSJklSkL3TgCIGTtGljYu5F9ReJ9K6P5
	 zOsuRfeuHQBlcBXWgFxLeEPHsWuKPTlm9bHp8FcrFHs3VzzLkvABCvYoM+/kvIlGvR
	 Eg1Tkm1eQ8ncoV7k3M4Z1P93hAT7IPlFQtccUmU4cSeIAdwiN65oavbewxfd8ZEQgD
	 vRLgVMh88pN39jIzJ5kNWXZAo1zMzWwre/Nalum+VXChPkSoZ/UAHCIAAivmMBOyDX
	 H23WERbIVKqBglXkzPu86GvgS73i0L4NjHM2pkygjXKXSw5ZCf+8TauPTLskhCT7e8
	 1nRFfipDRyu4g==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E920917E0CA9;
	Wed, 17 Jun 2026 20:11:15 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 17 Jun 2026 14:10:59 -0400
Subject: [PATCH v2 4/5] media: hantro: add per-context fdinfo usage stats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-v4l2-add-fdinfo-v2-4-d298e98ce06a@collabora.com>
References: <20260617-v4l2-add-fdinfo-v2-0-d298e98ce06a@collabora.com>
In-Reply-To: <20260617-v4l2-add-fdinfo-v2-0-d298e98ce06a@collabora.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
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
	TAGGED_FROM(0.00)[bounces-65134-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,collabora.com:dkim,collabora.com:email,collabora.com:mid,collabora.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96D6969BE3F

From: Christopher Healy <healych@amazon.com>

Add per-file-descriptor hardware utilization tracking to the Hantro
VPU stateless codec driver, exposed via v4l2_stats.

Update the v4l2_stats instance each time a job completes with the
time it took in ns.

This enables userspace monitoring tools to compute per-process decoder
and encoder utilization. The current and max frequency keys report the
same value today since the driver lacks devfreq support, but will
diverge once DVFS is added, allowing userspace to approximate true
capacity utilization without any fdinfo code changes. A future series
can add hardware cycle counter support (via media-cycles) to v4l2_stats
for exact utilization under DVFS, with no changes to the existing uAPI.

Signed-off-by: Christopher Healy <healych@amazon.com>
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/platform/verisilicon/hantro.h     |  3 +++
 drivers/media/platform/verisilicon/hantro_drv.c | 19 +++++++++++++++++++
 2 files changed, 22 insertions(+)

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
index 2e81877f640f..3b837ef0f3bc 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -21,6 +21,7 @@
 #include <linux/videodev2.h>
 #include <linux/workqueue.h>
 #include <media/v4l2-event.h>
+#include <media/v4l2-stats.h>
 #include <media/v4l2-mem2mem.h>
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-vmalloc.h>
@@ -90,6 +91,9 @@ static void hantro_job_finish(struct hantro_dev *vpu,
 			      struct hantro_ctx *ctx,
 			      enum vb2_buffer_state result)
 {
+	v4l2_stats_update_hw_usage(&ctx->fh.stats,
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
+	v4l2_stats_set_media_dev_type(&ctx->fh.stats,
+				      ctx->is_encoder ? MEDIA_DEV_TYPE_V4L2_STATELESS_ENCODER
+						      : MEDIA_DEV_TYPE_V4L2_STATELESS_DECODER);
 
 	hantro_reset_fmts(ctx);
 
@@ -701,10 +710,20 @@ static int hantro_release(struct file *filp)
 	return 0;
 }
 
+static void hantro_show_fdinfo(struct seq_file *m, struct file *f)
+{
+	struct hantro_ctx *ctx = file_to_ctx(f);
+	struct hantro_dev *vpu = ctx->dev;
+
+	v4l2_stats_show(&ctx->fh.stats, m);
+	v4l2_stats_show_clock(m, vpu->clocks[0].clk);
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

-- 
2.54.0


