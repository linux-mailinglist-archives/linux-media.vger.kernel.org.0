Return-Path: <linux-media+bounces-52665-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPbmKIv/jWm0+AAAu9opvQ
	(envelope-from <linux-media+bounces-52665-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 17:27:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACAB12F66B
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 17:27:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61157312B9F6
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 16:23:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD34835CBA3;
	Thu, 12 Feb 2026 16:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ruq7eDmd"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35C435B624;
	Thu, 12 Feb 2026 16:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770913429; cv=none; b=EYuQ2ZVZ/yE39SyRUi1jhwJlDIBmi7Mcr3SrXcRbRsU6RCUkAa4xhR028ZtxLyrVPyzuCzTgpj4JOrKngP/SB3a8ikmLSEUPDlhiI9nnAXXeo3x4rmFaYC3HFBm+zOtSDfdQ5HyXl8IZ7cjHB/GBVtAK53Cpeu3ApNWBMGIVAlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770913429; c=relaxed/simple;
	bh=b6iQGMkGcjBVVv0K+5rsTGEPunZ8R76rYg3Zy/SqlNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ii4G41kYX/8ZrmI3VTFFmg1+7KRg2n34wwEZk3+YTfDAJa1q+ve/5wZm3j7ZTBLxMDGqfPrDHWhjvfkYvzGv7LKryEpW9xgseR6ntsKMEyceKtJnYyljuQlnCeZmucFoYeTWi2wfEZYOzZKVjKqbJ4OPMlBYNQXj8ACNManxs9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ruq7eDmd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770913426;
	bh=b6iQGMkGcjBVVv0K+5rsTGEPunZ8R76rYg3Zy/SqlNM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ruq7eDmdRq6+pPoP/6THf/N7FxwquhpvR0F6ZOqwcjxTrCvNXl4cfUjHQ4/4pSnya
	 ihWJ5BOEX92zJwzUHp83k0WClx4/2FNpzXdf2Z8uY+hday6c5vl99DjKnKigSVFvBJ
	 kUigE+Pjv0zx++qygsib2v8kp62t4XS+/jgjDaW2ceUu49FRffvGafaZI897jzI+tB
	 UedZlTCmobQWtYeql/qpNV8HtPA29MCbn1ICKleaTQ9X8lbp71d6AFepEmDIxWmYJ5
	 3gA+NiDmRYcRh0/MmS1DmjD8I1uDkAmNG+VRbzMR1Guiq9OyEVdzrH7wykwJlNLB+4
	 +susdeBZdtWBg==
Received: from trenzalore (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D1C0217E1144;
	Thu, 12 Feb 2026 17:23:42 +0100 (CET)
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
Subject: [PATCH 03/11] media: Add tgid and fd fields in v4l2_fh struct
Date: Thu, 12 Feb 2026 11:23:20 -0500
Message-ID: <20260212162328.192217-4-detlev.casanova@collabora.com>
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
	TAGGED_FROM(0.00)[bounces-52665-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 0ACAB12F66B
X-Rspamd-Action: no action

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
---
 drivers/media/v4l2-core/v4l2-fh.c    |  1 +
 drivers/media/v4l2-core/v4l2-ioctl.c | 17 +++++++++++++++++
 include/media/v4l2-fh.h              |  4 ++++
 3 files changed, 22 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-fh.c b/drivers/media/v4l2-core/v4l2-fh.c
index df3ba9d4674b..86e8223b46cb 100644
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
index 37d33d4a363d..a3b6df0571d6 100644
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
 	 * We need to serialize streamon/off with queueing new requests.
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
2.53.0


