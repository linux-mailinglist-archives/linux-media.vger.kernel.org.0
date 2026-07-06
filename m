Return-Path: <linux-media+bounces-66770-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lCkMLgbDS2pnZwEAu9opvQ
	(envelope-from <linux-media+bounces-66770-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 17:00:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7430A7124E0
	for <lists+linux-media@lfdr.de>; Mon, 06 Jul 2026 17:00:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=FnqeIn1I;
	dmarc=pass (policy=none) header.from=collabora.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66770-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-66770-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F012343B629
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2026 13:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED4F9423779;
	Mon,  6 Jul 2026 13:42:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C330D41DEDA;
	Mon,  6 Jul 2026 13:42:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345356; cv=none; b=bYapyFAoTFRE3VgBygh5fCeDdQmr/Wo8duxFr9UBY5f9GnkzgLDtv7PtxA6wDthpTYiCuB18jkJUrVDQEboX6Feeb9yAGV2KgUAoJ20OxeYqiujN6pa3m67JhAQTmPQCe+oR6L/zV+1tL9HRVsGxTNAzYcJkrl4np0i2eXiq1X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345356; c=relaxed/simple;
	bh=pUl9FsOIf6aE9phFRjIpg2+uYD+KI5Cz/rHIEI3dceM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LHqXjqJezAycDSNFKeLG5V2SKHKFlJ7ED8V2wbBTADUfzQ6B2ybiPly2QnOllhyWui9J34EDbvKryIlURCft23WfaJjzBYPFP6x/t0xCpby6uCHtCJmUIQVaJnmmld/YRhYl9Epo0bfMJNh58DkAamb0+bEjOlTQSmaMrHveGyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=FnqeIn1I; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783345353;
	bh=pUl9FsOIf6aE9phFRjIpg2+uYD+KI5Cz/rHIEI3dceM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FnqeIn1IMGx4kOcqXs+l90hgm1oFshPB5vPZfuVg1lji0+JzOuL+f/9xXg9fayJyq
	 yeotN36Eg/mKZA59U+pIqXjl5Z4CcDnEgOhWVsjDQnhswwrIgOB+MDf47tFvOuQlhV
	 i01vpFUYPCEUW6/w4WjgQaVG1NeG+BMtStNQlXdE/+Q3iiaEDv9rnavENoH+2niBM/
	 QKgKZbDmrCGWjj3sxlGbRBpi6rwm+xFaPtfBbVNYlYSogc9Ar+03xGTxPw6nokTgmm
	 4T2rWnHEznsmb0U+0wBgt2j96YUl5NQxpjTKjOORx7Gdig+Mz0wlO5MQozcxMt7VPu
	 7yhfG+mHio4JQ==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B8FAA17E0E95;
	Mon, 06 Jul 2026 15:42:31 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Mon, 06 Jul 2026 09:42:20 -0400
Subject: [PATCH v3 3/5] media: v4l2-core: Add v4l2-metrics interface
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-v4l2-add-fdinfo-v3-3-d556568cf38e@collabora.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
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
	TAGGED_FROM(0.00)[bounces-66770-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:from_mime,collabora.com:email,collabora.com:mid,collabora.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7430A7124E0

Provide helpers for V4L2 drivers to set fdinfo data and print the
key:value pairs in a standard way.

Drivers can set metrics values with helpers like:
 - v4l2_metrics_update_hw_usage
 - v4l2_metrics_set_driver_type

And also call the show helpers from their show_fdinfo callback with:
 - v4l2_metrics_show -- Shows the values set previously
 - v4l2_metrics_show_clock -- Shows the main clock state.

Per-core metrics are supported by passing a numeric core_id to the
show helpers, so a single file descriptor can report metrics for
multiple hardware cores.

The show_clock helper is used instead of storing a clock reference in
v4l2_metrics for the following reasons:
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
 drivers/media/v4l2-core/Makefile       |  2 +-
 drivers/media/v4l2-core/v4l2-dev.c     |  2 +
 drivers/media/v4l2-core/v4l2-fh.c      |  3 ++
 drivers/media/v4l2-core/v4l2-metrics.c | 78 ++++++++++++++++++++++++++++++++++
 include/media/v4l2-fh.h                |  2 +
 include/media/v4l2-metrics.h           | 47 ++++++++++++++++++++
 6 files changed, 133 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
index 329f0eadce99..4bfd4e19dff8 100644
--- a/drivers/media/v4l2-core/Makefile
+++ b/drivers/media/v4l2-core/Makefile
@@ -9,7 +9,7 @@ ccflags-y += -I$(srctree)/drivers/media/tuners
 tuner-objs	:=	tuner-core.o
 
 videodev-objs	:=	v4l2-dev.o v4l2-ioctl.o v4l2-device.o v4l2-fh.o \
-			v4l2-event.o v4l2-subdev.o v4l2-common.o \
+			v4l2-event.o v4l2-subdev.o v4l2-common.o v4l2-metrics.o \
 			v4l2-ctrls-core.o v4l2-ctrls-api.o \
 			v4l2-ctrls-request.o v4l2-ctrls-defs.o
 
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 6de85de0fd76..b7cd77397aad 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -486,6 +486,8 @@ static void v4l2_show_fdinfo(struct seq_file *m, struct file *filp)
 {
 	struct video_device *vdev = video_devdata(filp);
 
+	seq_printf(m, "v4l2-driver:\t%s\n", vdev->v4l2_dev->name);
+
 	if (vdev->fops->show_fdinfo)
 		vdev->fops->show_fdinfo(m, filp);
 }
diff --git a/drivers/media/v4l2-core/v4l2-fh.c b/drivers/media/v4l2-core/v4l2-fh.c
index b184bed8aca9..1ed91d344f4e 100644
--- a/drivers/media/v4l2-core/v4l2-fh.c
+++ b/drivers/media/v4l2-core/v4l2-fh.c
@@ -17,6 +17,7 @@
 #include <media/v4l2-event.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-mc.h>
+#include <media/v4l2-metrics.h>
 
 void v4l2_fh_init(struct v4l2_fh *fh, struct video_device *vdev)
 {
@@ -38,6 +39,7 @@ void v4l2_fh_init(struct v4l2_fh *fh, struct video_device *vdev)
 	INIT_LIST_HEAD(&fh->subscribed);
 	fh->sequence = -1;
 	mutex_init(&fh->subscribe_lock);
+	v4l2_metrics_init(&fh->metrics);
 }
 EXPORT_SYMBOL_GPL(v4l2_fh_init);
 
@@ -88,6 +90,7 @@ void v4l2_fh_exit(struct v4l2_fh *fh)
 	v4l2_event_unsubscribe_all(fh);
 	mutex_destroy(&fh->subscribe_lock);
 	fh->vdev = NULL;
+	v4l2_metrics_exit(&fh->metrics);
 }
 EXPORT_SYMBOL_GPL(v4l2_fh_exit);
 
diff --git a/drivers/media/v4l2-core/v4l2-metrics.c b/drivers/media/v4l2-core/v4l2-metrics.c
new file mode 100644
index 000000000000..5de68c0f3969
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-metrics.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * v4l2-metrics.c
+ *
+ * V4L2 metrics management.
+ *
+ * Maintain a per-file handle list of metrics about the hardware and handle
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
+#include <media/v4l2-metrics.h>
+
+static const char * const driver_type_name[] = {
+	[V4L2_DRIVER_TYPE_UNKNOWN] = "unknown",
+	[V4L2_DRIVER_TYPE_STATELESS_ENCODER] = "stateless-encoder",
+	[V4L2_DRIVER_TYPE_STATELESS_DECODER] = "stateless-decoder",
+};
+
+void v4l2_metrics_init(struct v4l2_metrics *metrics)
+{
+	metrics->hw_usage_time = 0;
+	metrics->hw_usage_cycles = 0;
+	metrics->has_hw_usage_cycles = false;
+	metrics->driver_type = V4L2_DRIVER_TYPE_UNKNOWN;
+}
+
+void v4l2_metrics_exit(struct v4l2_metrics *metrics)
+{
+}
+
+void v4l2_metrics_update_hw_time(struct v4l2_metrics *metrics, u64 time_ns)
+{
+	metrics->hw_usage_time += time_ns;
+}
+EXPORT_SYMBOL_GPL(v4l2_metrics_update_hw_time);
+
+void v4l2_metrics_update_hw_cycles(struct v4l2_metrics *metrics, u64 cycles)
+{
+	metrics->hw_usage_cycles += cycles;
+	metrics->has_hw_usage_cycles = true;
+}
+EXPORT_SYMBOL_GPL(v4l2_metrics_update_hw_cycles);
+
+void v4l2_metrics_set_driver_type(struct v4l2_metrics *metrics, enum v4l2_driver_type type)
+{
+	if (type >= V4L2_DRIVER_TYPE_COUNT)
+		return;
+
+	metrics->driver_type = type;
+}
+EXPORT_SYMBOL_GPL(v4l2_metrics_set_driver_type);
+
+void v4l2_metrics_show(struct v4l2_metrics *metrics, struct seq_file *m, unsigned int core_id)
+{
+	seq_printf(m, "v4l2-driver-type:\t%s\n", driver_type_name[metrics->driver_type]);
+	seq_printf(m, "v4l2-core-usage-time-%u:\t%llu ns\n", core_id, metrics->hw_usage_time);
+
+	if (metrics->has_hw_usage_cycles)
+		seq_printf(m, "v4l2-core-usage-cycles-%u:\t%llu\n",
+			   core_id, metrics->hw_usage_cycles);
+}
+EXPORT_SYMBOL_GPL(v4l2_metrics_show);
+
+void v4l2_metrics_show_clock(struct seq_file *m, struct clk *clk, unsigned int core_id)
+{
+	seq_printf(m, "v4l2-maxfreq-%u:\t%lu Hz\n",
+		   core_id, clk_get_rate(clk));
+	seq_printf(m, "v4l2-curfreq-%u:\t%lu Hz\n",
+		   core_id, clk_get_rate(clk));
+}
+EXPORT_SYMBOL_GPL(v4l2_metrics_show_clock);
diff --git a/include/media/v4l2-fh.h b/include/media/v4l2-fh.h
index aad4b3689d7e..4642e7f6b084 100644
--- a/include/media/v4l2-fh.h
+++ b/include/media/v4l2-fh.h
@@ -17,6 +17,7 @@
 #include <linux/kconfig.h>
 #include <linux/list.h>
 #include <linux/videodev2.h>
+#include <media/v4l2-metrics.h>
 
 struct video_device;
 struct v4l2_ctrl_handler;
@@ -43,6 +44,7 @@ struct v4l2_fh {
 	struct list_head	list;
 	struct video_device	*vdev;
 	struct v4l2_ctrl_handler *ctrl_handler;
+	struct v4l2_metrics	metrics;
 	enum v4l2_priority	prio;
 
 	/* Events */
diff --git a/include/media/v4l2-metrics.h b/include/media/v4l2-metrics.h
new file mode 100644
index 000000000000..fc493b65f117
--- /dev/null
+++ b/include/media/v4l2-metrics.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * v4l2-metrics.h
+ *
+ * V4L2 metrics management.
+ *
+ * Maintain a per-file handle list of statistics about the hardware and handle
+ * exposing it in the fdinfo.
+ *
+ * Copyright (C) 2026 Collabora.
+ *
+ * Contact: Detlev Casanova <detlev.casanova@collabora.com>
+ */
+#ifndef V4L2_METRICS_H
+#define V4L2_METRICS_H
+
+#include <linux/types.h>
+
+struct clk;
+struct seq_file;
+
+enum v4l2_driver_type {
+	V4L2_DRIVER_TYPE_UNKNOWN = 0,
+	V4L2_DRIVER_TYPE_STATELESS_ENCODER,
+	V4L2_DRIVER_TYPE_STATELESS_DECODER,
+
+	V4L2_DRIVER_TYPE_COUNT,
+};
+
+struct v4l2_metrics {
+	u64 hw_usage_time;
+	u64 hw_usage_cycles;
+	bool has_hw_usage_cycles;
+	enum v4l2_driver_type driver_type;
+};
+
+void v4l2_metrics_init(struct v4l2_metrics *metrics);
+void v4l2_metrics_exit(struct v4l2_metrics *metrics);
+
+void v4l2_metrics_update_hw_time(struct v4l2_metrics *metrics, u64 time_ns);
+void v4l2_metrics_update_hw_cycles(struct v4l2_metrics *metrics, u64 cycles);
+void v4l2_metrics_set_driver_type(struct v4l2_metrics *metrics, enum v4l2_driver_type type);
+
+void v4l2_metrics_show(struct v4l2_metrics *metrics, struct seq_file *m, unsigned int core_id);
+void v4l2_metrics_show_clock(struct seq_file *m, struct clk *clk, unsigned int core_id);
+
+#endif /* V4L2_METRICS_H */

-- 
2.54.0


