Return-Path: <linux-media+bounces-64461-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id w8P3E/N5KWr8XQMAu9opvQ
	(envelope-from <linux-media+bounces-64461-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 16:51:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9208666A69B
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 16:51:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=fFW6RbZS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64461-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-64461-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40BE4348BC3E
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 14:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF69419312;
	Wed, 10 Jun 2026 14:34:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4E2331EB5;
	Wed, 10 Jun 2026 14:34:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102074; cv=none; b=oiWuBqQA36y3lpnQPILDD+AoCmPVgyqsVz7rYbEPJ2lke1Bo7eF8NvS7MD2p81bjVF+pz4gTs4WMhbSnVj4HmCStECUDpa0Tc76HTUMHJBso8dgKmj4h3yHIYkESXKxVNVgXFpAlvVcz65oB1XM8AgZg5u9GZA0YEtgWrJwcRAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102074; c=relaxed/simple;
	bh=imIJfpRcOAXZkKMN35QT7SUgXw4VKmoxeFQ2uczhIcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dfgNQsL3PytYm2LBKkCxH1ey/5x3dTC2xWNAvpUONkzJt2SKMLXbX9EPVB6UiKZGWSzCrpQStxDREz67+PgiR34xlRAoN9zein5Lr1HenUgxvEcfX7NdlNu8TfT62YHcgDZgW5TDOVD7N/4q3nGHZYwOQQ2WmrNwnMmYortvmdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fFW6RbZS; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781102065;
	bh=imIJfpRcOAXZkKMN35QT7SUgXw4VKmoxeFQ2uczhIcg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fFW6RbZSPilm5GxZYrBFfAt7g7lwLPUUIKf0dJGMrgXVngRFn6RzJdpzpkcLEQdjb
	 N2jI1RbHnxKhNNtHPZR2+nMFAFOzwnDBs6yjZK7WALOmFEecwGDmVH0eptfAXp5vab
	 63CrE6aYFmJvlIZmGb3YEjXQM2pV0tQLIQ/umgRXVQE2v5vtcBiwTcY7zMSOyBoydi
	 N3RcHJH68fS4LjplhVUI8b3Rnv7oebKJ+cZ+h28nkl5gY8WqK3D1AEPWZ86OghOXms
	 hUyCRrVk9AvaK3eDG1CgF8+8JlnxwkvKmfr8W09O0/Dcd3coq1S87glW8OYgVVmUPE
	 sb0CXxPppt27Q==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9A2C017E1168;
	Wed, 10 Jun 2026 16:34:23 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 10 Jun 2026 10:33:37 -0400
Subject: [PATCH v2 7/9] media: Add stream on/off traces and run them in the
 ioctl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-v4l2-add-ftrace-v2-7-9756edf72ac1@collabora.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daniel.almeida@collabora.com,m:mchehab@kernel.org,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:nicolas.dufresne@collabora.com,m:benjamin.gaignard@collabora.com,m:p.zabel@pengutronix.de,m:heiko@sntech.de,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:kernel@collabora.com,m:detlev.casanova@collabora.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-64461-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,collabora.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9208666A69B

This will automatically add stream on/off tracing for all v4l2 drivers.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 20 +++++++++++++++++--
 include/trace/events/v4l2.h          | 37 ++++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index c8746a1637f5..b09489baff3e 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1963,13 +1963,29 @@ static int v4l_try_fmt(const struct v4l2_ioctl_ops *ops, struct file *file,
 static int v4l_streamon(const struct v4l2_ioctl_ops *ops, struct file *file,
 			void *arg)
 {
-	return ops->vidioc_streamon(file, NULL, *(unsigned int *)arg);
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
+	int err;
+
+	err = ops->vidioc_streamon(file, NULL, *(unsigned int *)arg);
+
+	if (!err)
+		trace_v4l2_streamon(fh->tgid, fh->fd);
+
+	return err;
 }
 
 static int v4l_streamoff(const struct v4l2_ioctl_ops *ops, struct file *file,
 			 void *arg)
 {
-	return ops->vidioc_streamoff(file, NULL, *(unsigned int *)arg);
+	struct v4l2_fh *fh = file_to_v4l2_fh(file);
+	int err;
+
+	err = ops->vidioc_streamoff(file, NULL, *(unsigned int *)arg);
+
+	if (!err)
+		trace_v4l2_streamoff(fh->tgid, fh->fd);
+
+	return err;
 }
 
 static int v4l_g_tuner(const struct v4l2_ioctl_ops *ops, struct file *file,
diff --git a/include/trace/events/v4l2.h b/include/trace/events/v4l2.h
index 248bc09bfc99..e5b80aeecc30 100644
--- a/include/trace/events/v4l2.h
+++ b/include/trace/events/v4l2.h
@@ -262,6 +262,43 @@ DEFINE_EVENT(vb2_v4l2_event_class, vb2_v4l2_qbuf,
 	TP_ARGS(q, vb)
 );
 
+
+/* Events for stream on/off.
+ *
+ * These events will be fired every time userspace starts or stops a stream.
+ * tgid and fd are used to identify the process that opened the video device.
+ *
+ * Note that this even can be fired multiple times for a given tgid/fd pair.
+ * E.g.: mem2mem drivers expect stream on/off on both output and capture queues.
+ */
+DECLARE_EVENT_CLASS(v4l2_stream_class,
+	TP_PROTO(u32 tgid, u32 fd),
+	TP_ARGS(tgid, fd),
+
+	TP_STRUCT__entry(
+		__field(u32, tgid)
+		__field(u32, fd)
+	),
+
+	TP_fast_assign(
+		__entry->tgid = tgid;
+		__entry->fd = fd;
+	),
+
+	TP_printk("tgid = %u, fd = %u",
+		  __entry->tgid, __entry->fd)
+);
+
+DEFINE_EVENT(v4l2_stream_class, v4l2_streamon,
+	TP_PROTO(u32 tgid, u32 fd),
+	TP_ARGS(tgid, fd)
+);
+
+DEFINE_EVENT(v4l2_stream_class, v4l2_streamoff,
+	TP_PROTO(u32 tgid, u32 fd),
+	TP_ARGS(tgid, fd)
+);
+
 #endif /* if !defined(_TRACE_V4L2_H) || defined(TRACE_HEADER_MULTI_READ) */
 
 /* This part must be outside protection */

-- 
2.54.0


