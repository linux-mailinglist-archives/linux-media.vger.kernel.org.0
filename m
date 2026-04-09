Return-Path: <linux-media+bounces-58334-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJ6fHVKv12kORggAu9opvQ
	(envelope-from <linux-media+bounces-58334-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 15:53:22 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A0F3CB9B9
	for <lists+linux-media@lfdr.de>; Thu, 09 Apr 2026 15:53:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1B07A302FDC7
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2026 13:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DEAE3D6470;
	Thu,  9 Apr 2026 13:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dXvO3xJx"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841CF3D3489;
	Thu,  9 Apr 2026 13:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775742700; cv=none; b=Pi6ugevXK5TbMclGI506+yXPIUkMk0CjEwz8/+nE7k8SpEn1CnK9EJYJITg3/GxAPrPSiVe+9du0/fPcRYgykfBG37ek2XcKBIDH/UPN8111dqVNFRkChHSkgL0klc4kEwctLipnVCjLsRh0hfDaopM3b4ewxrgj6LwbRPL71Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775742700; c=relaxed/simple;
	bh=EANjXK0pUgPsxuTannl80kTzacZ17wagSvF/zmR7XQE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N8NR8orMqIb5wzc7Uz5CMNnOkHo9gx7W8KdjNtjVBTV0BQvvC0y2UkVwp/S246VNPIU4vhNKAw5KkYtrFL6Y09YWWdppYWOixxPo+eIWPoeZ5aYwOuEbQz0HYfToQ+fxXnXP8xsfwg9msA0aoMHOCHWdF2sjMIRYuB3Pq4OWoBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dXvO3xJx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775742690;
	bh=EANjXK0pUgPsxuTannl80kTzacZ17wagSvF/zmR7XQE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dXvO3xJxl7lDEOkIRDGLuC+39/Sm6Y2njQQiRjybGrV0XFhGDJ9mL99rvQktUq7cN
	 VqFYAexEknC3JnYkGlCzdstdGN9PalgO49S6bStNXE5piAuVPXWxh5v8uypHd7Mltj
	 KhlW0hg5HJg+jJjVATlAwO8MtJf97+deopOT6vum7r9xBfiL4IWuiRl+7zYLBD+XTO
	 nRjJbzSkrl4GNPBHgmoeBfJZJWpYKtT2LY72khK5p9LqnpnJOxbWimZUSmlj/HnuLR
	 hVlCld99uuUMyy1wucuS/xXkYmx6UdWdb8LwbDEb8SNcz5CnCsdegNBPmRdYMUT6fk
	 xmDcvA5ir4z+w==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2C1C917E0D23;
	Thu,  9 Apr 2026 15:51:29 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Thu, 09 Apr 2026 09:50:36 -0400
Subject: [PATCH 1/7] media: v4l2-mem2mem: Add v4l2_m2m_buf_done_manual()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-rkvdec-multicore-v1-1-62b316abf0f7@collabora.com>
References: <20260409-rkvdec-multicore-v1-0-62b316abf0f7@collabora.com>
In-Reply-To: <20260409-rkvdec-multicore-v1-0-62b316abf0f7@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, Jonas Karlman <jonas@kwiboo.se>
Cc: kernel@collabora.com, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.1
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58334-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:email,collabora.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 11A0F3CB9B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This function can be used to mark buffers as done, handling locking, but
not finishing the job as it is done by v4l2_m2m_buf_done_and_finish_job().

To avoid copying similar code, a static function is added with an extra
finish argument.
The code path of v4l2_m2m_buf_done_and_finish_job() is unchanged.

This allows for finer grained buffer management in drivers, scheduling
new jobs before the previous one is finished and prepares for enabling
multicore support in rkvdec.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 27 ++++++++++++++++++++++-----
 include/media/v4l2-mem2mem.h           | 20 ++++++++++++++++++++
 2 files changed, 42 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index a65cbb124cfe..7f9fad4f6807 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -503,9 +503,9 @@ void v4l2_m2m_job_finish(struct v4l2_m2m_dev *m2m_dev,
 }
 EXPORT_SYMBOL(v4l2_m2m_job_finish);
 
-void v4l2_m2m_buf_done_and_job_finish(struct v4l2_m2m_dev *m2m_dev,
-				      struct v4l2_m2m_ctx *m2m_ctx,
-				      enum vb2_buffer_state state)
+static void _buf_done_and_job_finish(struct v4l2_m2m_dev *m2m_dev,
+				     struct v4l2_m2m_ctx *m2m_ctx,
+				     enum vb2_buffer_state state, bool finish)
 {
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
 	bool schedule_next = false;
@@ -532,13 +532,30 @@ void v4l2_m2m_buf_done_and_job_finish(struct v4l2_m2m_dev *m2m_dev,
 	 * before the CAPTURE buffer is done.
 	 */
 	v4l2_m2m_buf_done(src_buf, state);
-	schedule_next = _v4l2_m2m_job_finish(m2m_dev, m2m_ctx);
+	if (finish)
+		schedule_next = _v4l2_m2m_job_finish(m2m_dev, m2m_ctx);
 unlock:
 	spin_unlock_irqrestore(&m2m_dev->job_spinlock, flags);
 
-	if (schedule_next)
+	if (schedule_next || !finish)
 		v4l2_m2m_schedule_next_job(m2m_dev, m2m_ctx);
 }
+
+
+void v4l2_m2m_buf_done_manual(struct v4l2_m2m_dev *m2m_dev,
+			      struct v4l2_m2m_ctx *m2m_ctx,
+			      enum vb2_buffer_state state)
+{
+	_buf_done_and_job_finish(m2m_dev, m2m_ctx, state, false);
+}
+EXPORT_SYMBOL(v4l2_m2m_buf_done_manual);
+
+void v4l2_m2m_buf_done_and_job_finish(struct v4l2_m2m_dev *m2m_dev,
+				      struct v4l2_m2m_ctx *m2m_ctx,
+				      enum vb2_buffer_state state)
+{
+	_buf_done_and_job_finish(m2m_dev, m2m_ctx, state, true);
+}
 EXPORT_SYMBOL(v4l2_m2m_buf_done_and_job_finish);
 
 void v4l2_m2m_suspend(struct v4l2_m2m_dev *m2m_dev)
diff --git a/include/media/v4l2-mem2mem.h b/include/media/v4l2-mem2mem.h
index 31de25d792b9..6a36fc885f5f 100644
--- a/include/media/v4l2-mem2mem.h
+++ b/include/media/v4l2-mem2mem.h
@@ -227,6 +227,26 @@ void v4l2_m2m_buf_done_and_job_finish(struct v4l2_m2m_dev *m2m_dev,
 				      struct v4l2_m2m_ctx *m2m_ctx,
 				      enum vb2_buffer_state state);
 
+/**
+ * v4l2_m2m_buf_done_manual() - manually mark the job as done, but do not
+ * finish it.
+ *
+ * @m2m_dev: opaque pointer to the internal data to handle M2M context
+ * @m2m_ctx: m2m context assigned to the instance given by struct &v4l2_m2m_ctx
+ * @state: vb2 buffer state passed to v4l2_m2m_buf_done().
+ *
+ * The function works the same way as v4l2_m2m_buf_done_and_job_finish()
+ * but does not inform the framework that the job has been finished,
+ * leaving the user the responsability to call v4l2_m2m_job_finish()
+ * when a buffer can be released to userspace.
+ *
+ * It allows driver to process new buffers, before the previous one is
+ * done.
+ */
+void v4l2_m2m_buf_done_manual(struct v4l2_m2m_dev *m2m_dev,
+			      struct v4l2_m2m_ctx *m2m_ctx,
+			      enum vb2_buffer_state state);
+
 static inline void
 v4l2_m2m_buf_done(struct vb2_v4l2_buffer *buf, enum vb2_buffer_state state)
 {

-- 
2.53.0


