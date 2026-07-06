Return-Path: <linux-media+bounces-66772-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tdzhNhXNS2oCagEAu9opvQ
	(envelope-from <linux-media+bounces-66772-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 17:43:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBF1712BE5
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 17:43:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b="WYNpXFY/";
	dmarc=pass (policy=none) header.from=collabora.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66772-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66772-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BBCC345031D
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 13:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 788A9430CC6;
	Mon,  6 Jul 2026 13:42:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7EE42CAE2;
	Mon,  6 Jul 2026 13:42:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345359; cv=none; b=ICxbiE44HvjgWF1+ovX5y6P9uHqNOgfNtDt1SNAgLw7EL2nWggT15dZOHl8xW6p49jXaYgRWrXYoS2RIu/cpZraDGZgU+eFvT0oVCb461wmkxOS0g49lZYw+p1BQ/shmDA8FUzucXH+A4JDhjymih5WKvHB7grirq7zBhAIMq8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345359; c=relaxed/simple;
	bh=U44aJJ8b4BbdxcO2Vi5B2hjqvUSwUvpArxdIxZ0VMJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aY6ism8nUXI3/RlhhtdN3dtKcZm6NtfAbjbHIUQ8fdpPk6tkS6V6QIZNANyEyYqT88UdyK7AGUzkYEvYxcs9+k6EwXUNSaQuotlEokFU1z0t0VNR0jrAJD/LkTz427Qr+8AmbB/e8qm2iefLK++/R+89O/xsVEqXC+A9dC23G3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=WYNpXFY/; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783345356;
	bh=U44aJJ8b4BbdxcO2Vi5B2hjqvUSwUvpArxdIxZ0VMJA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WYNpXFY/02XAa1AqZ6hQYizozKt15Ei/m141irZHQvlO6IXa2PNc0G9AD/1qqzTwt
	 r0W6iv4WGiNPzqWOvkpXLDdKWfmJ34xzMCLfMzl3uabKvIwgN1M/HMc0IVAOxNuz4S
	 LmfwSqt8tJJkFklx2z65KEtaUECd0WVb+o2dwQkUqztRxaELeEhCjxrtcP+3n3Rgho
	 EPtaMVdfPeOLDv2MdwMmBogAvtMZvLn/PPmssYqarNFIAg9Twcmgdn2LZvan9NzBZB
	 E+4Q1aybHQNCv+HkTnN7gX/+C5kLaF8aa6Yu1BcfbWARCRvbyyOLtNG3Dc5XHK2AXs
	 DNE83NQS8Fc5g==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 62CF817E0D33;
	Mon, 06 Jul 2026 15:42:35 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Mon, 06 Jul 2026 09:42:22 -0400
Subject: [PATCH v3 5/5] media: rkvdec: Add per-context fdinfo usage metrics
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-v4l2-add-fdinfo-v3-5-d556568cf38e@collabora.com>
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
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
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
	TAGGED_FROM(0.00)[bounces-66772-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:from_mime,collabora.com:email,collabora.com:mid,collabora.com:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3FBF1712BE5

Add hardware utilization tracking to the rkvdec stateless codec driver,
exposed via v4l2_metrics.

Update the v4l2_metrics instance each time a job completes with the
time it took in ns.

This enables userspace monitoring tools to compute per-process decoder
and encoder utilization. The current and max frequency keys report the
same value today since the driver lacks devfreq support, but will
diverge once DVFS is added, allowing userspace to approximate true
capacity utilization without any fdinfo code changes.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 19 +++++++++++++++++++
 drivers/media/platform/rockchip/rkvdec/rkvdec.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 1d1e9bfef8e9..0451d9582273 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -25,6 +25,7 @@
 #include <linux/workqueue.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
+#include <media/v4l2-metrics.h>
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-vmalloc.h>
 
@@ -1094,6 +1095,9 @@ static void rkvdec_job_finish(struct rkvdec_ctx *ctx,
 {
 	struct rkvdec_dev *rkvdec = ctx->dev;
 
+	v4l2_metrics_update_hw_time(&ctx->fh.metrics,
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
 
+	v4l2_metrics_set_driver_type(&ctx->fh.metrics, V4L2_DRIVER_TYPE_STATELESS_DECODER);
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
+	v4l2_metrics_show(&ctx->fh.metrics, m, 0);
+
+	v4l2_metrics_show_clock(m, rkvdec->axi_clk, 0);
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


