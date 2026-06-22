Return-Path: <linux-media+bounces-65408-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rZwLGCqfOWrMvgcAu9opvQ
	(envelope-from <linux-media+bounces-65408-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 22:46:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0FD6B2578
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 22:46:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=kt60Qybc;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65408-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65408-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EEE83061279
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 20:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C48364E85;
	Mon, 22 Jun 2026 20:44:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F23B364952
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 20:44:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782161047; cv=none; b=nj6+xrf+GrFiwz1aZmIXsP+WctonMS/c0+R/2XLdjat4YvegCkL6XuNpMt3S0fl8eBn5HXNrlKQeK5pemZBa7BvCsqIF/tPfGkcgdlGhzr6zjpG2BIVL1hwAFW9OLsiMZZlz+RBsfUY+WbVCZx/RF/zJncoDOD74zF/rFZNh7o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782161047; c=relaxed/simple;
	bh=/kpLieeyRS1BS4DZ/dRcxu1Pc7dUIIoREFKQ6Zh9SR8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rgIACxJMqQBahzxTDqB/Y8zEyVbQi7uOxOUmLT6EFrfVagfRCTRHQTPcCmLvnOPOdgL3Khovz0dCxQ3fSlSHxq/FVGEfppXiQiDcOJRiaj+cQUovJTfqLnCpo4dNtoHLmUNB6atnbGIYi3d8Od/uZwy75gXg3fucwEfNKS3zYKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--briandaniels.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kt60Qybc; arc=none smtp.client-ip=209.85.128.201
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-7ea35baee37so83374497b3.1
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 13:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782161044; x=1782765844; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dqtxCvW5AADhPRykM+XCtVf3bYVhrjchM1ftr7eV1fE=;
        b=kt60Qybc/oW3xAphh0FCfguHc9HRVJHCrdi02fmljRiPzkS0jakKZsAq+s5Y/vM8vk
         3h4YzBD+A5oiQLI1CqD6E4WLX5DtvKLjIs+CW7f1P3oLYAIm9+K0ErJyfMfVWSEP8ydu
         VCBI8yLAa69+tmTRkNSgTFdPGbWZYy4z5o1acaGW5PI0VR1Hmzv38Rk4ZK4MZRSyG9oJ
         Op4izyv6mZvDyC5cL7RaxLud1E67l4pNC1GwJZXWwgTHUVEc/bGvRg+71T8xNUBnxiC7
         rRvhZBpd0mFzXfWiLe7iYYSOtqP90wvcBjBfAc5yx81cgnLXyQsPH+7jaO/SNTkC76G+
         ZOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782161044; x=1782765844;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dqtxCvW5AADhPRykM+XCtVf3bYVhrjchM1ftr7eV1fE=;
        b=GeNpGutgV8X14Rpv/7mcdfiBce09fNY5c+oFwWwGEnZS5yoveVNvtx8bE6KZF8KUw/
         IUbxav0N1i9aM8WZ+GBh0zORVOsUwMt5hxtiaCO7VVFDShFYlvbQJKyGaER0v/Jy2Gob
         qcoV0+/tIMkUaFxOZNhshDCS3275WcHKQFUMgCGWk1QonLWxhmIPJX+ZosjJD4k6u8N3
         D7hIsU1+lqgk6ikcoaLl8UOK25Dpk5H/+r7tyikF/CtW5DGzEeA0eL9vZqZVC7soWQA8
         hVySAtBqdCeReUnYTJ9mcFHkXBgwdYLATvya/F68U5+6OspR0d8nWc74CcjsmGb/lVem
         RGOA==
X-Forwarded-Encrypted: i=1; AHgh+Rrve2PtYOZbMhBnJ8jgYt5Sw8EbFTat63AIXKxQVuHalLJy1OrsLNoDMUhqgOVD/sPD8GXAjAmF6zx4hQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHrSN1fMR6KklMtEHvIzPm4CccQp27SNLZtCEBm4JDHSiKEobP
	Jiz4IYYXEGE2xxIpFNlhkTqEWNf0URbAt2m7+3zopZVS3dOczscPGdCSJHCb+okMlqxTOn9N/u/
	n1rAnOtkK7TThzUZERRyDCxSGHgLR
X-Received: from ywbcd4.prod.google.com ([2002:a05:690c:884:b0:7fd:e2e8:a199])
 (user=briandaniels job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:690c:6713:b0:7db:e20c:2b24 with SMTP id 00721157ae682-80133ec5ecbmr170295097b3.45.1782161044011;
 Mon, 22 Jun 2026 13:44:04 -0700 (PDT)
Date: Mon, 22 Jun 2026 16:43:38 -0400
In-Reply-To: <20260622204343.1994418-1-briandaniels@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260622204343.1994418-1-briandaniels@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260622204343.1994418-4-briandaniels@google.com>
Subject: [PATCH v4 3/8] media: virtio: Add virtio-media session related structures
From: Brian Daniels <briandaniels@google.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: acourbot@google.com, adelva@google.com, aesteve@redhat.com, 
	changyeon@google.com, daniel.almeida@collabora.com, eperezma@redhat.com, 
	gnurou@gmail.com, gurchetansingh@google.com, hverkuil@xs4all.nl, 
	jasowang@redhat.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, mst@redhat.com, nicolas.dufresne@collabora.com, 
	virtualization@lists.linux.dev, xuanzhuo@linux.alibaba.com, 
	Brian Daniels <briandaniels@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:acourbot@google.com,m:adelva@google.com,m:aesteve@redhat.com,m:changyeon@google.com,m:daniel.almeida@collabora.com,m:eperezma@redhat.com,m:gnurou@gmail.com,m:gurchetansingh@google.com,m:hverkuil@xs4all.nl,m:jasowang@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:mst@redhat.com,m:nicolas.dufresne@collabora.com,m:virtualization@lists.linux.dev,m:xuanzhuo@linux.alibaba.com,m:briandaniels@google.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[briandaniels@google.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65408-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[briandaniels@google.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[google.com,redhat.com,collabora.com,gmail.com,xs4all.nl,vger.kernel.org,lists.linux.dev,linux.alibaba.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AF0FD6B2578

From: Alexandre Courbot <gnurou@gmail.com>

Add the structs and functions to manage sessions. A session is
equivalent to opening the /dev/videoX device file of the V4L2 device.

Depending on the type of device, it may be possible to open several
sessions concurrently.

While the session is opened, its ID can be used to perform actions on
it, most commonly V4L2 ioctls.

Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
Co-developed-by: Brian Daniels <briandaniels@google.com>
Signed-off-by: Brian Daniels <briandaniels@google.com>
---
 drivers/media/virtio/session.h | 130 +++++++++++++++++++++++++++++++++
 1 file changed, 130 insertions(+)
 create mode 100644 drivers/media/virtio/session.h

diff --git a/drivers/media/virtio/session.h b/drivers/media/virtio/session.h
new file mode 100644
index 000000000..4a2360625
--- /dev/null
+++ b/drivers/media/virtio/session.h
@@ -0,0 +1,130 @@
+/* SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+ */
+
+/*
+ * Definitions of virtio-media session related structures.
+ *
+ * Copyright (c) 2024-2025 Google LLC.
+ */
+
+#ifndef __VIRTIO_MEDIA_SESSION_H
+#define __VIRTIO_MEDIA_SESSION_H
+
+#include <linux/scatterlist.h>
+#include <media/v4l2-fh.h>
+
+#include "protocol.h"
+
+#define VIRTIO_MEDIA_LAST_QUEUE (V4L2_BUF_TYPE_META_OUTPUT)
+
+/*
+ * Size of the per-session virtio shadow and event buffers. 16K should be
+ * enough to contain everything we need.
+ */
+#define VIRTIO_SHADOW_BUF_SIZE 0x4000
+
+/**
+ * struct virtio_media_buffer - Current state of a buffer.
+ * @buffer: ``struct v4l2_buffer`` with current information about the buffer.
+ * @planes: backing planes array for @buffer.
+ * @list: link into the list of buffers pending dequeue.
+ */
+struct virtio_media_buffer {
+	struct v4l2_buffer buffer;
+	struct v4l2_plane planes[VIDEO_MAX_PLANES];
+	struct list_head list;
+};
+
+/**
+ * struct virtio_media_queue_state - Represents the state of a V4L2 queue.
+ * @streaming: Whether the queue is currently streaming.
+ * @allocated_bufs: How many buffers are currently allocated.
+ * @is_capture_last: set to true when the last buffer has been received on a
+ * capture queue, so we can return -EPIPE on subsequent DQBUF requests.
+ * @buffers: Buffer state array of size @allocated_bufs.
+ * @queued_bufs: How many buffers are currently queued on the device.
+ * @pending_dqbufs: Buffers that are available for being dequeued.
+ */
+struct virtio_media_queue_state {
+	bool streaming;
+	size_t allocated_bufs;
+	bool is_capture_last;
+
+	struct virtio_media_buffer *buffers;
+	size_t queued_bufs;
+	struct list_head pending_dqbufs;
+};
+
+/**
+ * struct virtio_media_session - A session on a virtio_media device.
+ * @fh: file handler for the session.
+ * @file: file pointer associated with the session's file handler.
+ * @id: session ID used to communicate with the device.
+ * @nonblocking_dequeue: whether dequeue should block or not (nonblocking if
+ * file opened with O_NONBLOCK).
+ * @uses_mplane: whether the queues for this session use the MPLANE API or not.
+ * @cmd: union of session commands "close", "ioctl", and "mmap". A session can
+ *       have one command currently running. The rest of the commands are
+ *       handled by @struct virtio_media.
+ * @resp: union of responses to session commands "close", "ioctl", and "mmap".
+ *        A session can wait on one command only.The rest of the responses are
+ *        handled by @struct virtio_media.
+ * @shadow_buf: shadow buffer where data to be added to the descriptor chain can
+ * be staged before being sent to the device.
+ * @command_sgs: SG table gathering descriptors for a given command and its
+ *               response.
+ * @queues: state of all the queues for this session.
+ * @queues_lock: protects all members for the queues for this session.
+ * virtio_media_queue_state`.
+ * @dqbuf_wait: waitqueue for dequeued buffers, if ``VIDIOC_DQBUF`` needs to
+ * block or when polling.
+ * @list: link into the list of sessions for the device.
+ */
+struct virtio_media_session {
+	struct v4l2_fh fh;
+	struct file *file;
+	u32 id;
+	bool nonblocking_dequeue;
+	bool uses_mplane;
+
+	union {
+		struct virtio_media_cmd_close close;
+		struct virtio_media_cmd_ioctl ioctl;
+		struct virtio_media_cmd_mmap mmap;
+	} cmd;
+
+	union {
+		struct virtio_media_resp_ioctl ioctl;
+		struct virtio_media_resp_mmap mmap;
+	} resp;
+
+	void *shadow_buf;
+
+	struct sg_table command_sgs;
+
+	struct virtio_media_queue_state queues[VIRTIO_MEDIA_LAST_QUEUE + 1];
+	struct mutex queues_lock; /* protects queues array and states */
+	wait_queue_head_t dqbuf_wait;
+
+	struct list_head list;
+};
+
+static inline struct virtio_media_session *fh_to_session(struct v4l2_fh *fh)
+{
+	return container_of(fh, struct virtio_media_session, fh);
+}
+
+static inline void
+virtio_media_session_fh_add(struct virtio_media_session *session,
+			    struct file *file)
+{
+	v4l2_fh_add(&session->fh, file);
+	session->file = file;
+}
+
+static inline void
+virtio_media_session_fh_del(struct virtio_media_session *session)
+{
+	v4l2_fh_del(&session->fh, session->file);
+}
+
+#endif // __VIRTIO_MEDIA_SESSION_H
-- 
2.55.0.rc0.799.gd6f94ed593-goog


