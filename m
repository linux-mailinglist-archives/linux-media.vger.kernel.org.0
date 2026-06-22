Return-Path: <linux-media+bounces-65407-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b9cnEf+eOWrIvgcAu9opvQ
	(envelope-from <linux-media+bounces-65407-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 22:45:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B6B6B2570
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 22:45:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b=HKPMNv3t;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65407-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65407-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 026583055817
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 20:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3C2364E85;
	Mon, 22 Jun 2026 20:44:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f201.google.com (mail-qk1-f201.google.com [209.85.222.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0D2352F95
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 20:44:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782161044; cv=none; b=N/YYLE8HryBuuwdA9s8QP+f8D0OhSmb07o3um8HFV/xUhR58hG4FTyNd7f5GbYc+NYzuyr2P4hkIRraUmlq7T05E7mnBdGWb0ShR2Q/TmHI0VX6P5STa4Cue48FyFr74qn1nAeX/kGhET6ap1woU7xmTETR4VBtNfE7To6xHuU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782161044; c=relaxed/simple;
	bh=2mJ61I5TJUNkGm0PDhijKpL+/E3zhoJyaxpTIBWn790=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mcqI2ZifeOI3t3poFB8x9SEC0d7RCfOyuwKJSPpulnNb9179TWt4HJUwuko+TPvMZmnI69bDRvlvQH53wosEhbQDlRahFAsbSJiJf2L2ijRVOeDvFhc6UoLgocJsElE2dW0WA2j9loJwFX8OeJrPSMmCLbCBLd8pc5TzBqR3QRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--briandaniels.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HKPMNv3t; arc=none smtp.client-ip=209.85.222.201
Received: by mail-qk1-f201.google.com with SMTP id af79cd13be357-92229624a71so476248785a.3
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 13:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782161042; x=1782765842; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qPeGazJ7KQoOREISM/XZdRZoBpHzQAXAz7NAUNnaOTw=;
        b=HKPMNv3tOxdx6mQzdX2aOUc9w00BR4XQIeaqZnuEIsBZpz3cEOndy0pAp8DgLJ6MNJ
         r1kZ4aSqvm0wGC+CfIncOs28afVS08boIieHSbLND68j5e6ZjuEGmu5+AMzf0CnNVuUt
         ZxUK700RafyAy7nj0Ym1g7pcR5+y4BAbHOWRGG1Ny9xhGOMYRQlzAy3IXY2PKMOELg8d
         lP+XWSfUkWlyrBFGXzrqyEwwXJ+guY9SktRk++gDeBU8z8g5fMyT0+qjotXiuudeo27X
         3XI6YuQ4rChchkBiqO9b8x8i06JuLPleE0QmIklStMElkWm5odUIUGvbVmszKwgj2Kp1
         lNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782161042; x=1782765842;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qPeGazJ7KQoOREISM/XZdRZoBpHzQAXAz7NAUNnaOTw=;
        b=AwlGSNmSTM3jHmPuIaLv4qLK7yCZWCLdV8Q9gONEonWmigJcBM4pOQ7MWMsVpm8EVF
         35BTw6/DqirFNWfwc9uKKWYWwxlNB8qmZaPRx/b7fXSQKr7b5Ne0olfTD8/xySxQfulm
         8vmDOycLdNoshxUxzjZ/H7gGiZguEHDBjmvN8fQoVwZkaLCCnKDpklAKHsJoT26FZdQj
         2bWqyKQxQcpZDdGjWYNOXMXyKbL0bJPWDTV2M14pJ9/dGnBTVreYHWsixaQSfVLyJ1C2
         YIBVq+trqUT4mG3eLj4lwGDLpbts0xl+Qs6wo9amDVR3b5zRXfh3BZvx+v9GEuwPFCSM
         or6w==
X-Forwarded-Encrypted: i=1; AFNElJ/944gWZ0fFISTsu7DqyPIdEtKMIKZmkE3UMkGF75RPxT7R7sAauxW7YBQBPv8QGzsDBikgTlZ1a+HVhQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxphGdS/RswOnnVL+mixpjNvyBm4u6BQrA2udqCbclD8OcxLWFA
	oupMOAUDqKL8hKiYrEGn0zUdOi6wYDHSUBXY7Wcs87tiNJZPXtXNPEwrwfG8+spijOfYzdOSz9i
	4CWA94ymCfh7RERYARBobyFy9Pf0M
X-Received: from qknru1.prod.google.com ([2002:a05:620a:6841:b0:915:73e8:b754])
 (user=briandaniels job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:278a:b0:915:f27f:e70e with SMTP id af79cd13be357-9208f161e9bmr2529029185a.23.1782161042055;
 Mon, 22 Jun 2026 13:44:02 -0700 (PDT)
Date: Mon, 22 Jun 2026 16:43:37 -0400
In-Reply-To: <20260622204343.1994418-1-briandaniels@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260622204343.1994418-1-briandaniels@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260622204343.1994418-3-briandaniels@google.com>
Subject: [PATCH v4 2/8] media: virtio: Add virtio-media driver structs and
 function declarations
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
	TAGGED_FROM(0.00)[bounces-65407-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93B6B6B2570

From: Alexandre Courbot <gnurou@gmail.com>

Add the structs and function declarations for the new virtio-media drvier.

Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
Co-developed-by: Brian Daniels <briandaniels@google.com>
Signed-off-by: Brian Daniels <briandaniels@google.com>
---
 drivers/media/virtio/virtio_media.h | 95 +++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 drivers/media/virtio/virtio_media.h

diff --git a/drivers/media/virtio/virtio_media.h b/drivers/media/virtio/virtio_media.h
new file mode 100644
index 000000000..52809d4e9
--- /dev/null
+++ b/drivers/media/virtio/virtio_media.h
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+ */
+
+/*
+ * Virtio-media structures & functions declarations.
+ *
+ * Copyright (c) 2024-2025 Google LLC.
+ */
+
+#ifndef __VIRTIO_MEDIA_H
+#define __VIRTIO_MEDIA_H
+
+#include <linux/virtio_config.h>
+#include <media/v4l2-device.h>
+
+#include "protocol.h"
+
+#define DESC_CHAIN_MAX_LEN SG_MAX_SINGLE_ALLOC
+
+#define VIRTIO_MEDIA_DEFAULT_DRIVER_NAME "virtio-media"
+
+extern char *virtio_media_driver_name;
+extern bool virtio_media_allow_userptr;
+
+/**
+ * struct virtio_media - Virtio-media device.
+ * @v4l2_dev: v4l2_device for the media device.
+ * @video_dev: video_device for the media device.
+ * @virtio_dev: virtio device for the media device.
+ * @commandq: virtio command queue.
+ * @eventq: virtio event queue.
+ * @eventq_work: work to run when events are received on @eventq.
+ * @mmap_region: region into which MMAP buffers are mapped by the host.
+ * @event_buffer: buffer for event descriptors.
+ * @sessions: list of active sessions on the device.
+ * @sessions_lock: protects @sessions and ``virtio_media_session::list``.
+ * @events_lock: prevents concurrent processing of events.
+ * @cmd: union of the device commands "open" and "munmap". The other
+ *       commands are handled by @struct virtio_media_session
+ * @resp: union of responses.to device commands "open" and "munmap". The
+ *        other responses are handled by @struct virtio_media_session
+ * @vlock: serializes access to the command queue.
+ * @wq: waitqueue for host responses on the command queue.
+ */
+struct virtio_media {
+	struct v4l2_device v4l2_dev;
+	struct video_device video_dev;
+
+	struct virtio_device *virtio_dev;
+	struct virtqueue *commandq;
+	struct virtqueue *eventq;
+	struct work_struct eventq_work;
+
+	struct virtio_shm_region mmap_region;
+
+	void *event_buffer;
+
+	struct list_head sessions;
+	struct mutex sessions_lock; /* protects sessions list */
+
+	struct mutex events_lock; /* prevents concurrent event processing */
+
+	union {
+		struct virtio_media_cmd_open open;
+		struct virtio_media_cmd_munmap munmap;
+	} cmd;
+
+	union {
+		struct virtio_media_resp_open open;
+		struct virtio_media_resp_munmap munmap;
+	} resp;
+
+	struct mutex vlock; /* serializes command queue access */
+	wait_queue_head_t wq;
+};
+
+static inline struct virtio_media *
+to_virtio_media(struct video_device *video_dev)
+{
+	return container_of(video_dev, struct virtio_media, video_dev);
+}
+
+/* virtio_media_driver.c */
+
+int virtio_media_send_command(struct virtio_media *vv, struct scatterlist **sgs,
+			      const size_t out_sgs, const size_t in_sgs,
+			      size_t minimum_resp_len, size_t *resp_len);
+void virtio_media_process_events(struct virtio_media *vv);
+
+/* virtio_media_ioctls.c */
+
+long virtio_media_device_ioctl(struct file *file, unsigned int cmd,
+			       unsigned long arg);
+extern const struct v4l2_ioctl_ops virtio_media_ioctl_ops;
+
+#endif // __VIRTIO_MEDIA_H
-- 
2.55.0.rc0.799.gd6f94ed593-goog


