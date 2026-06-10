Return-Path: <linux-media+bounces-64456-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IMY7F795KWrqXQMAu9opvQ
	(envelope-from <linux-media+bounces-64456-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 16:50:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DC266A689
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 16:50:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=IfVmDkwA;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64456-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64456-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4C72304DBA0
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 14:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7116C411682;
	Wed, 10 Jun 2026 14:34:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C943EBF04;
	Wed, 10 Jun 2026 14:34:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102063; cv=none; b=BD2u+GhO61EbQTUaZoIFu3Vjpadke7u3cDCJRrVWUsXdcp4k7mowwalo4S5z2Y7pOcnVVPD+C464cGMCm/s8bXUtTXYnCJmaFpvAJLW5qpy36SAC62lh8F7G6nkauVs6iBvNX9EaBNwUwUNHDn1G2PmEvh7C6xhpdmc+zNKQSAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102063; c=relaxed/simple;
	bh=HyWTbyGJ/YxiyOxTmP3CmKvqM9AIBkFvj7FncysHdAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZuG0J9P95oerRLhRsHt35AbBostjrDyEEqlueIiy503ztZInCCho1Zh2iSeouXSmhiwQuPBw/hIfjf8+iyyDY1BH5GohGcWThe1ICS9ddMGXaJOH7ZQXVWshKE1eA8+C6EiBumEXjoZAysVnjhJf6bPtpoZjF8F+qC2JoEkn8mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=IfVmDkwA; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781102056;
	bh=HyWTbyGJ/YxiyOxTmP3CmKvqM9AIBkFvj7FncysHdAU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IfVmDkwAqc9AuJSpvM75+MHT2eLaD4v72NesicHD/NAj39vPLvXfSntFvPn/0OjWA
	 PvQPGi8wjaZDg4mTJbkCtEkZGAYoROBbbRdggn3o2KRu7E6Tupgb1p+d55rryYzTCD
	 4KAoGF4R1pHSCm2PagoxV1d1IE8D9tLK1E/5d3Lxt326Kxe5a0R8+NN7QN1VoZ6wph
	 Zv2QnG6qiuqsQYu+NweViL0jSM+rgtivGGbUSGAm1vaLDLeLVl1sOHWLcXuw9T6siO
	 74F2J7JEgp3jriSfTkLtt7Oj6xRcO8n6znQHdxJHY3pOHz7k+PhyLbpkj6Bldvgg43
	 liljoxado1rQA==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3996F17E0DE1;
	Wed, 10 Jun 2026 16:34:14 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 10 Jun 2026 10:33:33 -0400
Subject: [PATCH v2 3/9] media: Add tgid and fd fields in v4l2_fh struct
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-v4l2-add-ftrace-v2-3-9756edf72ac1@collabora.com>
References: <20260610-v4l2-add-ftrace-v2-0-9756edf72ac1@collabora.com>
In-Reply-To: <20260610-v4l2-add-ftrace-v2-0-9756edf72ac1@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>
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
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:daniel.almeida@collabora.com,m:mchehab@kernel.org,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:nicolas.dufresne@collabora.com,m:benjamin.gaignard@collabora.com,m:p.zabel@pengutronix.de,m:heiko@sntech.de,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:kernel@collabora.com,m:detlev.casanova@collabora.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-64456-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,collabora.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A7DC266A689

These fields will be used in traces to help userspace tracing tools
identify streams.

The tgid field will keep the PID of the process that opened the video
file.
That is needed because trace calls can happen in IRQs, for which there is
no current PID.

The fd field helps identify the context in case the same process opens the
video device multiple times.
Note that the fd field is set in the __video_do_ioctl() function.
That is because the file descriptor has not been allocated yet when
v4l2_open() is called.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 drivers/media/v4l2-core/v4l2-fh.c    |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c | 17 +++++++++++++++++
 include/media/v4l2-fh.h              |  4 ++++
 3 files changed, 22 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-fh.c b/drivers/media/v4l2-core/v4l2-fh.c
index b184bed8aca9..9c2ddd1c2137 100644
--- a/drivers/media/v4l2-core/v4l2-fh.c
+++ b/drivers/media/v4l2-core/v4l2-fh.c
@@ -37,6 +37,7 @@ void v4l2_fh_init(struct v4l2_fh *fh, struct video_device *vdev)
 	INIT_LIST_HEAD(&fh->available);
 	INIT_LIST_HEAD(&fh->subscribed);
 	fh->sequence = -1;
+	fh->tgid = current->tgid;
 	mutex_init(&fh->subscribe_lock);
 }
 EXPORT_SYMBOL_GPL(v4l2_fh_init);
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index a2b650f4ec3c..c8746a1637f5 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/compat.h>
+#include <linux/fdtable.h>
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -3061,6 +3062,16 @@ void v4l_printk_ioctl(const char *prefix, unsigned int cmd)
 }
 EXPORT_SYMBOL(v4l_printk_ioctl);
 
+static int _file_iterate(const void *priv, struct file *filp, unsigned int fd)
+{
+	const struct file *fh_filp = priv;
+
+	if (fh_filp == filp)
+		return fd;
+
+	return 0;
+}
+
 static long __video_do_ioctl(struct file *file,
 		unsigned int cmd, void *arg)
 {
@@ -3081,6 +3092,12 @@ static long __video_do_ioctl(struct file *file,
 		return ret;
 	}
 
+	if (unlikely(!vfh->fd)) {
+		vfh->fd = iterate_fd(current->files, 0, _file_iterate, file);
+		if (!vfh->fd)
+			vfh->fd = -1;
+	}
+
 	/*
 	 * We need to serialize streamon/off/reqbufs with queueing new requests.
 	 * These ioctls may trigger the cancellation of a streaming
diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
index aad4b3689d7e..4ef4e58ab8d1 100644
--- a/include/media/v4l2-fh.h
+++ b/include/media/v4l2-fh.h
@@ -28,6 +28,8 @@ struct v4l2_ctrl_handler;
  * @vdev: pointer to &struct video_device
  * @ctrl_handler: pointer to &struct v4l2_ctrl_handler
  * @prio: priority of the file handler, as defined by &enum v4l2_priority
+ * @tgid: process id that initialized the v4l2_fh
+ * @fd: file descriptor associated to this v4l2_fh for the process id in tgid
  *
  * @wait: event' s wait queue
  * @subscribe_lock: serialise changes to the subscribed list; guarantee that
@@ -44,6 +46,8 @@ struct v4l2_fh {
 	struct video_device	*vdev;
 	struct v4l2_ctrl_handler *ctrl_handler;
 	enum v4l2_priority	prio;
+	uint32_t		tgid;
+	int			fd;
 
 	/* Events */
 	wait_queue_head_t	wait;

-- 
2.54.0


