Return-Path: <linux-media+bounces-65135-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IACJDYrjMmq56gUAu9opvQ
	(envelope-from <linux-media+bounces-65135-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 20:12:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F7F69BE2D
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 20:12:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=a1FVVmme;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65135-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65135-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B9DDE304D8A4
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 18:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54CCA3793CA;
	Wed, 17 Jun 2026 18:11:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A4837BE96;
	Wed, 17 Jun 2026 18:11:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781719882; cv=none; b=N5the/iP5EK3Va/ADAZ8MXDhh3pczvFQw8nSD8nFGTptTdXJtQpFYCZY4WL47ODfu8TuFoPt/ybBwv8rxeS52+vhHQ8+RB17SKjkUe+MhNDzPqYR1QYqmPBUBeuqzbnxp3E99MAFcYEEPGR3sAVrkh35AXkDAH+daXN7vFcbi+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781719882; c=relaxed/simple;
	bh=6JxamazJIIQcKdEz8ugtMgV/iMRyMYd+AQPYLIAy3Ok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uEW6/YR8UvDtmbHynqx3n3yeK/bnjGSylOXxI8+RHxiCEl6NqtKUrLyEx8QZiyDd6GOOvp+KBaymcAAOgz5DjhOa3XKgyZzzHP9CTagoqntEKPGJHDKApjpuVHv56YL32/xAf/MtTMMRahVxOeeKbZI/mSlBNIsun3RNZ1y9oIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=a1FVVmme; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781719879;
	bh=6JxamazJIIQcKdEz8ugtMgV/iMRyMYd+AQPYLIAy3Ok=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=a1FVVmmeyq73T5DmcWjmafrvAtNEyZHUCzwSdYZYdlWwc5XAuyE1Y/yNfMI1vHIQp
	 DVIoOLtjrZA519+cU4fx1WAm58M8kcO2J9o5CCGUSBcGcgQPN0aV2Nm8PY7jGRea8a
	 aHPRjO4ELaVGD5znknuHHVUK1jVznavDeVVq0LTxDQmUtHPYRt9++TKfWJBOhzX2H/
	 rmPxvu9hlyJkflwZx6RfV7DsLLhPhILMT2Zm4aDOIfFLXU9sGo/uczCmKrFg1iYAUj
	 r8jr2BkWVrzvuuMlPmrYnve3vP4ZobyDoLR2KjC5hpMS+ooUutHXZ7J/j+HwileIvB
	 fZUwX5cghS9cw==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D611817E0566;
	Wed, 17 Jun 2026 20:11:17 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 17 Jun 2026 14:11:00 -0400
Subject: [PATCH v2 5/5] media: rkvdec: Add per-context fdinfo usage stats
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-v4l2-add-fdinfo-v2-5-d298e98ce06a@collabora.com>
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
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:nicolas.dufresne@collabora.com,m:benjamin.gaignard@collabora.com,m:p.zabel@pengutronix.de,m:ezequiel@vanguardiasur.com.ar,m:heiko@sntech.de,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:kernel@collabora.com,m:detlev.casanova@collabora.com,m:linux-arm-kernel@lists.infradead.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-65135-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,collabora.com:dkim,collabora.com:email,collabora.com:mid,collabora.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C3F7F69BE2D

Add per-file-descriptor hardware utilization tracking to the rkvdec
stateless codec driver, exposed via v4l2_stats.

Update the v4l2_stats instance each time a job completes with the
time it took in ns.

This enables userspace monitoring tools to compute per-process decoder
and encoder utilization. The current and max frequency keys report the
same value today since the driver lacks devfreq support, but will
diverge once DVFS is added, allowing userspace to approximate true
capacity utilization without any fdinfo code changes. A future series
can add hardware cycle counter support (via media-cycles) to v4l2_stats
for exact utilization under DVFS, with no changes to the existing uAPI.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 19 +++++++++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 1d1e9bfef8e9..929171232ccf 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -25,6 +25,7 @@
 #include <linux/workqueue.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-stats.h>
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-vmalloc.h>
 
@@ -1094,6 +1095,9 @@ static void rkvdec_job_finish(struct rkvdec_ctx *ctx,
 {
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
+	v4l2_stats_update_hw_usage(&ctx->fh.stats,
+				   ktime_to_ns(ktime_sub(ktime_get(), ctx->start_time)));
+
 	pm_runtime_put_autosuspend(rkvdec->dev);
 	rkvdec_job_finish_no_pm(ctx, result);
 }
@@ -1174,6 +1178,8 @@ static void rkvdec_device_run(void *priv)
 		return;
 	}
 
+	ctx->start_time = ktime_get();
+
 	ret = desc->ops->run(ctx);
 	if (ret)
 		rkvdec_job_finish(ctx, VB2_BUF_STATE_ERROR);
@@ -1304,6 +1310,8 @@ static int rkvdec_open(struct file *filp)
 
 	v4l2_fh_add(&ctx->fh, filp);
 
+	v4l2_stats_set_media_dev_type(&ctx->fh.stats, MEDIA_DEV_TYPE_V4L2_STATELESS_DECODER);
+
 	return 0;
 
 err_cleanup_m2m_ctx:
@@ -1327,10 +1335,21 @@ static int rkvdec_release(struct file *filp)
 	return 0;
 }
 
+static void rkvdec_show_fdinfo(struct seq_file *m, struct file *file)
+{
+	struct rkvdec_ctx *ctx = file_to_rkvdec_ctx(file);
+	struct rkvdec_dev *rkvdec = ctx->dev;
+
+	v4l2_stats_show(&ctx->fh.stats, m);
+
+	v4l2_stats_show_clock(m, rkvdec->axi_clk);
+}
+
 static const struct v4l2_file_operations rkvdec_fops = {
 	.owner = THIS_MODULE,
 	.open = rkvdec_open,
 	.release = rkvdec_release,
+	.show_fdinfo = rkvdec_show_fdinfo,
 	.poll = v4l2_m2m_fop_poll,
 	.unlocked_ioctl = video_ioctl2,
 	.mmap = v4l2_m2m_fop_mmap,
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index a24be6638b6b..590e213bd800 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -157,6 +157,7 @@ struct rkvdec_ctx {
 	void *priv;
 	u8 has_sps_st_rps: 1;
 	u8 has_sps_lt_rps: 1;
+	ktime_t start_time;
 };
 
 static inline struct rkvdec_ctx *file_to_rkvdec_ctx(struct file *filp)

-- 
2.54.0


