Return-Path: <linux-media+bounces-64462-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tF3OADl4KWpeXQMAu9opvQ
	(envelope-from <linux-media+bounces-64462-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 16:44:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4590D66A581
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 16:44:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=KT1t72BX;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64462-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64462-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=collabora.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F19E3492780
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2026 14:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31EDC41B354;
	Wed, 10 Jun 2026 14:34:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BF1372680;
	Wed, 10 Jun 2026 14:34:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102075; cv=none; b=Lt9nB0Ef7yaNstGjg7QKsI++sXFwSKan8zlJvbcWqpRIJQT6ajFcwS4dIQmIfeCVedVsuK5GeaohR/g7V5ot9X1NlKmNtQI3DnZK6klw42ihAOv0RS6/h44o/3hWiDdMntFknIbG03ofzevPDJxzLBZLXsYc69i0O2a0NzTcJ2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102075; c=relaxed/simple;
	bh=buWzY0LM2eBzVDux6FwBX3Iv5Uvnb04/g09QnKbCclg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j7tFADJPNPdAOIYXASx6IPjH9q91CPU9Lcgi25xQGYrdGCbXhUXYk4z8Td8ia7/4I7fqz5O7nk+3vqYGgRBVJUCySa5XpKQp8D7VcMCQTLT9sWXOgDjF2IiNIGf5xmLLNZMxv/ANvZ+MSk/ST/O359vCJJmrM9o/DzLVTW+fV1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=KT1t72BX; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781102067;
	bh=buWzY0LM2eBzVDux6FwBX3Iv5Uvnb04/g09QnKbCclg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KT1t72BXfj58snpFIw5YXgBpFC2bpxE+moW/BmKWtzJ6XZc+ZolVxCWLP7OYiAOXJ
	 +/Q8wXqCW4a4bROEJP+CqgSbsPquhTVm7038tDPxTfKIhQRINaV1Sw8yTr2mLgFexc
	 4MPO2jN0wzqGNfsjtplSPsXiW2W25/9J6cYyZIeEAq9Z+jIw7eZovd+i64OMdYLr97
	 OewOvLVHLhC7oOhYoldlkS9ELzFRwhBxy6fx7Kj0EY5+htLioBAQxlAhEah5SsL/Xe
	 xXvSs1iRpYoRAMutPaaTUrsWuCR9zU0MchoPBNgSpufHqAykD7SXeUgHgV1wZwDuQ5
	 1L3CgcqVdKOMQ==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E5E3F17E11FB;
	Wed, 10 Jun 2026 16:34:25 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 10 Jun 2026 10:33:38 -0400
Subject: [PATCH v2 8/9] media: Add HW run/done trace events
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-v4l2-add-ftrace-v2-8-9756edf72ac1@collabora.com>
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
	FORGED_RECIPIENTS(0.00)[m:daniel.almeida@collabora.com,m:mchehab@kernel.org,m:rostedt@goodmis.org,m:mhiramat@kernel.org,m:mathieu.desnoyers@efficios.com,m:nicolas.dufresne@collabora.com,m:benjamin.gaignard@collabora.com,m:p.zabel@pengutronix.de,m:heiko@sntech.de,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:kernel@collabora.com,m:detlev.casanova@collabora.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-64462-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,collabora.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4590D66A581

The events can be fired by drivers when the hardware is run and when it
is done.
That can be used by userspace tracers to see HW performance and usage.

The hw_done event allows setting the number of clock cycles the HW needed
to do the work, to help tools evaluate performances.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/v4l2-core/v4l2-trace.c |  3 +++
 include/trace/events/v4l2.h          | 40 ++++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-trace.c b/drivers/media/v4l2-core/v4l2-trace.c
index 183d5ecb49c5..59cf6f8807ac 100644
--- a/drivers/media/v4l2-core/v4l2-trace.c
+++ b/drivers/media/v4l2-core/v4l2-trace.c
@@ -12,6 +12,9 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(vb2_v4l2_buf_queue);
 EXPORT_TRACEPOINT_SYMBOL_GPL(vb2_v4l2_dqbuf);
 EXPORT_TRACEPOINT_SYMBOL_GPL(vb2_v4l2_qbuf);
 
+EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_hw_run);
+EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_hw_done);
+
 /* Export AV1 controls */
 EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ctrl_av1_sequence);
 EXPORT_TRACEPOINT_SYMBOL_GPL(v4l2_ctrl_av1_frame);
diff --git a/include/trace/events/v4l2.h b/include/trace/events/v4l2.h
index e5b80aeecc30..6f1bbb085cb0 100644
--- a/include/trace/events/v4l2.h
+++ b/include/trace/events/v4l2.h
@@ -299,6 +299,46 @@ DEFINE_EVENT(v4l2_stream_class, v4l2_streamoff,
 	TP_ARGS(tgid, fd)
 );
 
+
+/* Events for hardware run/done.
+ *
+ * These events will be fired respectively when the hardware is run (v4l2_hw_run) and done
+ * (v4l2_hw_done).
+ * As for other events, tgid and fd are used to identify the process that opened the video device.
+ *
+ * The v4l2_hw_done event also includes the number of hardware cycles taken by the hardware to
+ * process the command.
+ */
+DEFINE_EVENT(v4l2_stream_class, v4l2_hw_run,
+	TP_PROTO(u32 tgid, u32 fd),
+	TP_ARGS(tgid, fd)
+);
+
+DECLARE_EVENT_CLASS(v4l2_hw_done_class,
+	TP_PROTO(u32 tgid, u32 fd, u32 hw_cycles),
+	TP_ARGS(tgid, fd, hw_cycles),
+
+	TP_STRUCT__entry(
+		__field(u32, tgid)
+		__field(u32, fd)
+		__field(u32, hw_cycles)
+	),
+
+	TP_fast_assign(
+		__entry->tgid = tgid;
+		__entry->fd = fd;
+		__entry->hw_cycles = hw_cycles;
+	),
+
+	TP_printk("tgid = %u, fd = %u, hw_cycles = %u",
+		  __entry->tgid, __entry->fd, __entry->hw_cycles)
+);
+
+DEFINE_EVENT(v4l2_hw_done_class, v4l2_hw_done,
+	TP_PROTO(u32 tgid, u32 fd, u32 hw_cycles),
+	TP_ARGS(tgid, fd, hw_cycles)
+);
+
 #endif /* if !defined(_TRACE_V4L2_H) || defined(TRACE_HEADER_MULTI_READ) */
 
 /* This part must be outside protection */

-- 
2.54.0


