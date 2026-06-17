Return-Path: <linux-media+bounces-65133-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IaBAIJbjMmq/6gUAu9opvQ
	(envelope-from <linux-media+bounces-65133-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 20:12:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D7869BE35
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 20:12:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=gOqVGTrk;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65133-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-65133-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1093630E9F95
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2026 18:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4718137B40E;
	Wed, 17 Jun 2026 18:11:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B52E379C49;
	Wed, 17 Jun 2026 18:11:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781719878; cv=none; b=bWcOiChGRAG2/uRhjM9evslphGhkel+VkN6mv8KcZ2MVFrAPLQmC8jYOjUlpippuyGq63oSvqB6nQcj2Awmd6ITtgcKb8RvfwqTJJU5hYfZYJWHEAOyiqH8GZbExu+NjW6QGnLWRnaK9kS3vkxbHzSlV+1FlMoOdXjD2UBCyyfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781719878; c=relaxed/simple;
	bh=YnqoAsM+n7/rUu05Sgxly+qH8JSizCmB9lhmFd3tT2s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gd6pA5+Cexf3Y0cMB2m48wIZeHJXRBRww0XLw/Wfg+4topT2XI7v+xaWYcjkSZCMbZpFVYyPXpGff/wNa7XJIRca2rFGHzezvQ0fevqSTIooFr13pEBwlRPUCxL80KD7yxzl2rVDEsI/vYUST0rx9Uzbix/DJWuuOIYcp9LDgFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gOqVGTrk; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781719875;
	bh=YnqoAsM+n7/rUu05Sgxly+qH8JSizCmB9lhmFd3tT2s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gOqVGTrkfd23DUjiBDe/loQZbClcq/e4CcjS/0n4LbNsGdqsF0eJPm4GPV/r1y211
	 YMUk//TSjNgrE2MZ/uw2GRFTG0w5Im5L744yigFL7lLkaYsiK4iASCkMxb63Lo1zDr
	 IhWq5ar5m8HZgkojnxEtYHDWncmbRPBVw+P+iu/3ugbLANI8dl6LF2Ypz/5aFgN5y/
	 rVeIPRqkHIzVHLxIhxitFP3YtmfjNih7RBEFxvGlVDdpesg1A04m4L3Zv5fuDcGcmw
	 Go6ItiY3WUxe/LA+Mjkl1xJhqVdq030m8g8SqSM/Kq5oJD47AbiG9TtWJ3uguoOtHu
	 mG2kvMnBCyRmg==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2374117E0C54;
	Wed, 17 Jun 2026 20:11:14 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 17 Jun 2026 14:10:58 -0400
Subject: [PATCH v2 3/5] media: v4l2-core: Add v4l2-stats interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-v4l2-add-fdinfo-v2-3-d298e98ce06a@collabora.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
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
	TAGGED_FROM(0.00)[bounces-65133-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 15D7869BE35

Provide helpers for media drivers to set fdinfo data and print the
key:value pairs in a standard way.

User drivers can set stats values with helpers like:
 - v4l2_stats_update_hw_usage
 - v4l2_stats_set_media_dev_type

And also call the show helpers from their show_fdinfo callback with:
 - v4l2_stats_show -- Shows the values set previously
 - v4l2_stats_show_clock -- Shows the main clock state.

The show_clock helper is used instead of updating a clock value in
v4l2_stats for the following reasons:
 - Clocks are at the device level, this is not a per-fd information
 - This avoids having clock references in v4l2-core
 - Drivers can use different approaches to manage clocks
   (e.g.: bulk_data or not: A set helper wouldn't please all drivers)
 - Arguably, clocks could be exposed elsewhere (like a debugfs), but we
   want something close to what DRM does and centralizing information has
   its advantages for userspace tooling.

In DRM the key:value pair format for clocks is documented and each driver
can write them directly based on that.
In this case, provide a helper and document the format.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/v4l2-core/Makefile     |  2 +-
 drivers/media/v4l2-core/v4l2-dev.c   |  2 ++
 drivers/media/v4l2-core/v4l2-fh.c    |  3 ++
 drivers/media/v4l2-core/v4l2-stats.c | 65 ++++++++++++++++++++++++++++++++++++
 include/media/v4l2-fh.h              |  2 ++
 include/media/v4l2-stats.h           | 44 ++++++++++++++++++++++++
 6 files changed, 117 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
index 329f0eadce99..20e1ab74ac09 100644
--- a/drivers/media/v4l2-core/Makefile
+++ b/drivers/media/v4l2-core/Makefile
@@ -9,7 +9,7 @@ ccflags-y += -I$(srctree)/drivers/media/tuners
 tuner-objs	:=	tuner-core.o
 
 videodev-objs	:=	v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
-			v4l2-event.o v4l2-subdev.o v4l2-common.o \
+			v4l2-event.o v4l2-subdev.o v4l2-common.o v4l2-stats.o \
 			v4l2-ctrls-core.o v4l2-ctrls-api.o \
 			v4l2-ctrls-request.o v4l2-ctrls-defs.o
 
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 3878fa2ff73e..3e7a6876dffd 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -486,6 +486,8 @@ static void v4l2_show_fdinfo(struct seq_file *m, struct file *filp)
 {
 	struct video_device *vdev = video_devdata(filp);
 
+	seq_printf(m, "media-driver:\t%s\n", vdev->v4l2_dev->name);
+
 	if (vdev->fops->show_fdinfo)
 		vdev->fops->show_fdinfo(m, filp);
 }
diff --git a/drivers/media/v4l2-core/v4l2-fh.c b/drivers/media/v4l2-core/v4l2-fh.c
index b184bed8aca9..1b655672c718 100644
--- a/drivers/media/v4l2-core/v4l2-fh.c
+++ b/drivers/media/v4l2-core/v4l2-fh.c
@@ -17,6 +17,7 @@
 #include <media/v4l2-event.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mc.h>
+#include <media/v4l2-stats.h>
 
 void v4l2_fh_init(struct v4l2_fh *fh, struct video_device *vdev)
 {
@@ -38,6 +39,7 @@ void v4l2_fh_init(struct v4l2_fh *fh, struct video_device *vdev)
 	INIT_LIST_HEAD(&fh->subscribed);
 	fh->sequence = -1;
 	mutex_init(&fh->subscribe_lock);
+	v4l2_stats_init(&fh->stats);
 }
 EXPORT_SYMBOL_GPL(v4l2_fh_init);
 
@@ -88,6 +90,7 @@ void v4l2_fh_exit(struct v4l2_fh *fh)
 	v4l2_event_unsubscribe_all(fh);
 	mutex_destroy(&fh->subscribe_lock);
 	fh->vdev = NULL;
+	v4l2_stats_exit(&fh->stats);
 }
 EXPORT_SYMBOL_GPL(v4l2_fh_exit);
 
diff --git a/drivers/media/v4l2-core/v4l2-stats.c b/drivers/media/v4l2-core/v4l2-stats.c
new file mode 100644
index 000000000000..93e64ef2e7bb
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-stats.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * v4l2-stats.c
+ *
+ * V4L2 statistics management.
+ *
+ * Maintain a per-file handle list of statistics about the hardware and handle
+ * exposing it in the fdinfo.
+ *
+ * Copyright (C) 2026 Collabora.
+ *
+ * Contact: Detlev Casanova <detlev.casanova@collabora.com>
+ */
+
+#include <linux/types.h>
+#include <linux/seq_file.h>
+#include <linux/clk.h>
+#include <media/v4l2-stats.h>
+
+static const char * const dev_type_name[] = {
+	[MEDIA_DEV_TYPE_V4L2] = "media",
+	[MEDIA_DEV_TYPE_V4L2_STATELESS_ENCODER] = "encoder",
+	[MEDIA_DEV_TYPE_V4L2_STATELESS_DECODER] = "decoder",
+};
+
+void v4l2_stats_init(struct v4l2_stats *stats)
+{
+	stats->hw_usage_time = 0;
+	stats->media_dev_type = MEDIA_DEV_TYPE_V4L2;
+}
+
+void v4l2_stats_exit(struct v4l2_stats *stats)
+{
+}
+
+void v4l2_stats_update_hw_usage(struct v4l2_stats *stats, u64 usage_time)
+{
+	stats->hw_usage_time += usage_time;
+}
+EXPORT_SYMBOL_GPL(v4l2_stats_update_hw_usage);
+
+void v4l2_stats_set_media_dev_type(struct v4l2_stats *stats, enum v4l2_media_dev_type type)
+{
+	if (type >= MEDIA_DEV_TYPE_COUNT)
+		return;
+
+	stats->media_dev_type = type;
+}
+EXPORT_SYMBOL_GPL(v4l2_stats_set_media_dev_type);
+
+void v4l2_stats_show(struct v4l2_stats *stats, struct seq_file *m)
+{
+	seq_printf(m, "media-type:\t%s\n", dev_type_name[stats->media_dev_type]);
+	seq_printf(m, "media-engine-usage:\t%llu ns\n", stats->hw_usage_time);
+}
+EXPORT_SYMBOL_GPL(v4l2_stats_show);
+
+void v4l2_stats_show_clock(struct seq_file *m, struct clk *clk)
+{
+	seq_printf(m, "media-maxfreq:\t%lu Hz\n",
+		   clk_get_rate(clk));
+	seq_printf(m, "media-curfreq:\t%lu Hz\n",
+		   clk_get_rate(clk));
+}
+EXPORT_SYMBOL_GPL(v4l2_stats_show_clock);
diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
index aad4b3689d7e..ae6688722bee 100644
--- a/include/media/v4l2-fh.h
+++ b/include/media/v4l2-fh.h
@@ -17,6 +17,7 @@
 #include <linux/kconfig.h>
 #include <linux/list.h>
 #include <linux/videodev2.h>
+#include <media/v4l2-stats.h>
 
 struct video_device;
 struct v4l2_ctrl_handler;
@@ -43,6 +44,7 @@ struct v4l2_fh {
 	struct list_head	list;
 	struct video_device	*vdev;
 	struct v4l2_ctrl_handler *ctrl_handler;
+	struct v4l2_stats	stats;
 	enum v4l2_priority	prio;
 
 	/* Events */
diff --git a/include/media/v4l2-stats.h b/include/media/v4l2-stats.h
new file mode 100644
index 000000000000..d580933c4181
--- /dev/null
+++ b/include/media/v4l2-stats.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * v4l2-stats.h
+ *
+ * V4L2 statistics management.
+ *
+ * Maintain a per-file handle list of statistics about the hardware and handle
+ * exposing it in the fdinfo.
+ *
+ * Copyright (C) 2026 Collabora.
+ *
+ * Contact: Detlev Casanova <detlev.casanova@collabora.com>
+ */
+#ifndef V4L2_STATS_H
+#define V4L2_STATS_H
+
+#include <linux/types.h>
+
+struct clk;
+struct seq_file;
+
+enum v4l2_media_dev_type {
+	MEDIA_DEV_TYPE_V4L2 = 0,
+	MEDIA_DEV_TYPE_V4L2_STATELESS_ENCODER,
+	MEDIA_DEV_TYPE_V4L2_STATELESS_DECODER,
+
+	MEDIA_DEV_TYPE_COUNT,
+};
+
+struct v4l2_stats {
+	u64 hw_usage_time;
+	enum v4l2_media_dev_type media_dev_type;
+};
+
+void v4l2_stats_init(struct v4l2_stats *stats);
+void v4l2_stats_exit(struct v4l2_stats *stats);
+
+void v4l2_stats_update_hw_usage(struct v4l2_stats *stats, u64 usage_time);
+void v4l2_stats_set_media_dev_type(struct v4l2_stats *stats, enum v4l2_media_dev_type type);
+
+void v4l2_stats_show(struct v4l2_stats *stats, struct seq_file *m);
+void v4l2_stats_show_clock(struct seq_file *m, struct clk *clk);
+
+#endif /* V4L2_STATS_H */

-- 
2.54.0


