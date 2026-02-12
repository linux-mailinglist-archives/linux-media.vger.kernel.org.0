Return-Path: <linux-media+bounces-52673-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LN2HwgAjmm0+AAAu9opvQ
	(envelope-from <linux-media+bounces-52673-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 17:30:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA2D12F6E2
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 17:29:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F690318C503
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 16:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 993373590A2;
	Thu, 12 Feb 2026 16:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="I/El3T4P"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E3B35FF69;
	Thu, 12 Feb 2026 16:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770913457; cv=none; b=VNBs9QEsGIB2Kk4Ff2bjHAfYprKMYaXVvC89KL3RC2J0rDvKsEZ8uDNlVZrzaVdU4kPlToZX2ljyk2hwlApIpOtvMmHQbGpD+iKs3mwXPmThd8lkMSdZonAZ7RRz0E04HJTvgeXubPK5fAgxvpcCBAX+Da0VCNfUak4eMpZdlX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770913457; c=relaxed/simple;
	bh=EgY6rRozA0nftZszqOZUvhTiePvvlTkScGicAmL6ngk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nB4ZVN8tRvR1s4pU53BrY+qihpcexWQV2uk4Y+L8Sf7tIFfGLlNmIHFJnp+jA7dyojuXF3GhEB8WFh/oDTpLKfcsaFhcDaBo/93RFT35tTeuelxelfKOK1OWKHDdfoWgocBZIxoFQTnRrZV4Lj91OEFyC87bAw+wjT2abOQ53s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=I/El3T4P; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770913453;
	bh=EgY6rRozA0nftZszqOZUvhTiePvvlTkScGicAmL6ngk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I/El3T4P0xovkgMTWcwcUXRdgkb5x/Jtnuc437sudcJIWdnjlnXYE41volTkySBfe
	 g7jQRcLsGl/6alBEVCexl9s9fNPtON5QVNL73QcPbYHGdDtI2xmR/0NTAl9fXhJD97
	 qFgkabxP+3rZGcrSj/VLHSKhIhAq7nLVYZzkjHJ1vCw1IqG+/MV1hueucPtyb6z0Ib
	 6JJCp4vP4H9d182O5pN+LiOzLutxAzCRJr2Iv2W1tiEb3dXrCcmuYPMCgXKDOukGs9
	 CiNst9RRZQqTFC8aF46h8zMFj8HeWJ7xWZO/9c9oit/M9SXY9Hz5RaDDX0zYuBPuZD
	 0q/HX4jCb7KJw==
Received: from trenzalore (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A672017E0A49;
	Thu, 12 Feb 2026 17:24:10 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Yunke Cao <yunkec@google.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Pavan Bobba <opensource206@gmail.com>,
	James Cowgill <james.cowgill@blaize.com>,
	Ma Ke <make24@iscas.ac.cn>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 11/11] media: hantro: Add fdinfo callback
Date: Thu, 12 Feb 2026 11:23:28 -0500
Message-ID: <20260212162328.192217-12-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212162328.192217-1-detlev.casanova@collabora.com>
References: <20260212162328.192217-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52673-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[collabora.com,pengutronix.de,kernel.org,sntech.de,goodmis.org,efficios.com,ideasonboard.com,chromium.org,google.com,linux.intel.com,gmail.com,blaize.com,iscas.ac.cn,vger.kernel.org,lists.infradead.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:mid,collabora.com:dkim,collabora.com:email]
X-Rspamd-Queue-Id: DEA2D12F6E2
X-Rspamd-Action: no action

The fdinfo shows the number of buffers in each queue and the total amount
of video buffer memory.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/platform/verisilicon/hantro.h      |  1 +
 drivers/media/platform/verisilicon/hantro_drv.c  | 15 +++++++++++++++
 drivers/media/platform/verisilicon/hantro_v4l2.c | 10 +++++++++-
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index d5cddc783688..9e9fc0658586 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -268,6 +268,7 @@ struct hantro_ctx {
 	const struct hantro_codec_ops *codec_ops;
 	struct hantro_postproc_ctx postproc;
 	bool need_postproc;
+	u64 stats_buf_memory;
 
 	/* Specific for particular codec modes. */
 	union {
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 8dd26ca32459..86d316a8a3e8 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -17,6 +17,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
+#include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
 #include <linux/workqueue.h>
@@ -711,6 +712,19 @@ static int hantro_release(struct file *filp)
 	return 0;
 }
 
+static void hantro_show_fdinfo(struct seq_file *m, struct file *filp)
+{
+	struct hantro_ctx *ctx =
+		container_of(filp->private_data, struct hantro_ctx, fh);
+
+	struct vb2_queue *src_q = v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx);
+	struct vb2_queue *dst_q = v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx);
+
+	seq_printf(m, "src-queued-count: %04u\n", src_q->queued_count);
+	seq_printf(m, "dst-queued-count: %04u\n", dst_q->queued_count);
+	seq_printf(m, "buf-size: %llu\n", ctx->stats_buf_memory);
+}
+
 static const struct v4l2_file_operations hantro_fops = {
 	.owner = THIS_MODULE,
 	.open = hantro_open,
@@ -718,6 +732,7 @@ static const struct v4l2_file_operations hantro_fops = {
 	.poll = v4l2_m2m_fop_poll,
 	.unlocked_ioctl = video_ioctl2,
 	.mmap = v4l2_m2m_fop_mmap,
+	.show_fdinfo = hantro_show_fdinfo,
 };
 
 static const struct of_device_id of_hantro_match[] = {
diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index fcf3bd9bcda2..6d129613ea3d 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -820,18 +820,26 @@ hantro_queue_setup(struct vb2_queue *vq, unsigned int *num_buffers,
 		return -EINVAL;
 	}
 
+	ctx->stats_buf_memory = 0;
+
 	if (*num_planes) {
 		if (*num_planes != pixfmt->num_planes)
 			return -EINVAL;
-		for (i = 0; i < pixfmt->num_planes; ++i)
+		for (i = 0; i < pixfmt->num_planes; ++i) {
 			if (sizes[i] < pixfmt->plane_fmt[i].sizeimage)
 				return -EINVAL;
+			ctx->stats_buf_memory += pixfmt->plane_fmt[i].sizeimage;
+		}
+
+		ctx->stats_buf_memory *= *num_buffers;
+
 		return 0;
 	}
 
 	*num_planes = pixfmt->num_planes;
 	for (i = 0; i < pixfmt->num_planes; ++i)
 		sizes[i] = pixfmt->plane_fmt[i].sizeimage;
+
 	return 0;
 }
 
-- 
2.53.0


