Return-Path: <linux-media+bounces-65406-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BpvPG8qeOWrFvgcAu9opvQ
	(envelope-from <linux-media+bounces-65406-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 22:44:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D726B2565
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 22:44:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b="mUpk/18p";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65406-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-65406-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36B713044115
	for <lists+linux-media@lfdr.de>; Mon, 22 Jun 2026 20:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A04363C6A;
	Mon, 22 Jun 2026 20:44:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f73.google.com (mail-qv1-f73.google.com [209.85.219.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A866357CE0
	for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 20:43:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782161041; cv=none; b=Dp1GQBCx0b7ANF3PwBBhOuchLNXl8+WEFMnFRVBNJLfzdehndLWCnaaBIiHReiyKH4LC61I1/xoZ2UM9Od4mKDJJVYYbKWSGy4PMmQOhN6mGvTpNwUOr2+J+lSpQsnwPunA97TEmNIkxITVSx0zzdYcCy8dR7VC9QEqQQRChEEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782161041; c=relaxed/simple;
	bh=IVQLABmb+jM9dcUJYK4O/h9eVh44A6ugotGik8TQcFU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Y1ku06ECCdC7aZgRutGfCHPsUDfGsWVkzkt05KuotT8Hb5HGzIWE7EGvE/juRpBrIqdiuVhEHKbO+q88QVPrIfKFvKmKPIAy6O4bZHAxqkOJMJkoMuHT1AazkwNbCVp+LpZmdUQvpc4PJV1X468aM0E4wF8j8vzgpaIl5blwBHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--briandaniels.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mUpk/18p; arc=none smtp.client-ip=209.85.219.73
Received: by mail-qv1-f73.google.com with SMTP id 6a1803df08f44-8dde1c4da4bso80995116d6.1
        for <linux-media@vger.kernel.org>; Mon, 22 Jun 2026 13:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782161038; x=1782765838; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9U1MlIjEq+OjQJi6i4/DTaCyDJRNKwrS8TtuW05m8Ow=;
        b=mUpk/18pjkXrTgRu40Pnh2w3vXU6O5+Yf0aQn4EgsWzdGv7SPm6pdPfnXq976ok5Lz
         foOafb5L8tAOghnEBCxnaRmN32K9ONy2vafBiTf9CHd2Wstaj6He68Gu7VrMMNwrWvo1
         ih87KUL6PninOCaC+o+MLbwdsoS0qrCYdXijFHh2kN+NxU18/4Bt+6N7zOTUq6JPguEH
         ZoOJBrr0nJfd0rj90Ca4+aqBMKKrBFBRKL0TGXb8lei91Mbxnb89gpN5lEbvJnLH1X69
         8qHBvBmL9ZrtTub4Ctc9Y41y5wRswCmu95Nfa2SH0rqY93tHI4f4RzuaLDL3R4aActzY
         KckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782161038; x=1782765838;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9U1MlIjEq+OjQJi6i4/DTaCyDJRNKwrS8TtuW05m8Ow=;
        b=EG0lB4X/iBXFiprxYyxLjRm6lxKh1qkyBEckfxfeRgM/ewSmklXX+Gctjxop9LPlGS
         BP+CGZ/M+hoad+IcnKKGAyDN+9PluW5C8uFNXURh1S1ESv5MVE1fvFN9l/by7dTNvYuM
         86JQAls61Y610PlLKSaWs1Cdk+iYTRAg8SFLgYYGz9LmsEj1i4rx0/Q2K5Q5V94wxJ3/
         DJ2w89IRLO+AAb8BVdYJQi2yPwn5CGJPF3A0H3K+WW1x1wlA6gOmZj5ff27tJAZSU6t+
         UJ8F3GYpw97HsXai5zCT+PRcZ9blK8riVIpqfWFTiSVdiJBBPbsNlHtbL4NoS3ujeR20
         BmZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+vxC5eanw0rVkAQc8EOqveGnoDByTowfJnFFH8ix8GN8M0fv9HTyX0SPHtDYX/2xAc9SFgchSH5E8sIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwX+m2c6nBDomO2TDHAIVKYKXV4kjHSRB9hE+D9OlusFiWGICD2
	7Wd1kH6PWKEN7JIBjh/lggvGHm+M3Li8y19nTtnSR/xUXHjzpAr0gWhjhMjTdfFH3N8HprM8Y1B
	wLDQly6i48CwNMXR0zdmJoIdfXQZR
X-Received: from qthc6.prod.google.com ([2002:ac8:546:0:b0:510:12be:1abd])
 (user=briandaniels job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:1923:b0:517:260f:8e95 with SMTP id d75a77b69052e-519e49155f4mr254675631cf.8.1782161038278;
 Mon, 22 Jun 2026 13:43:58 -0700 (PDT)
Date: Mon, 22 Jun 2026 16:43:36 -0400
In-Reply-To: <20260622204343.1994418-1-briandaniels@google.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260622204343.1994418-1-briandaniels@google.com>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
Message-ID: <20260622204343.1994418-2-briandaniels@google.com>
Subject: [PATCH v4 1/8] media: virtio: Add protocol
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
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
	TAGGED_FROM(0.00)[bounces-65406-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E4D726B2565

From: Alexandre Courbot <gnurou@gmail.com>

Add the identifiers and structs used to implement the virtio interface
as described in section 5.22 of version 1.4 of the virtio spec:

https://docs.oasis-open.org/virtio/virtio/v1.4/csprd01/virtio-v1.4-csprd01-diff-from-v1.2-cs01.html#x1-82200022

Signed-off-by: Alexandre Courbot <gnurou@gmail.com>
Co-developed-by: Brian Daniels <briandaniels@google.com>
Signed-off-by: Brian Daniels <briandaniels@google.com>
---
 drivers/media/virtio/protocol.h | 287 ++++++++++++++++++++++++++++++++
 1 file changed, 287 insertions(+)
 create mode 100644 drivers/media/virtio/protocol.h

diff --git a/drivers/media/virtio/protocol.h b/drivers/media/virtio/protocol.h
new file mode 100644
index 000000000..5878d107c
--- /dev/null
+++ b/drivers/media/virtio/protocol.h
@@ -0,0 +1,287 @@
+/* SPDX-License-Identifier: BSD-3-Clause OR GPL-2.0+ */
+
+/*
+ * Definitions of virtio-media protocol structures.
+ *
+ * Copyright (c) 2024-2025 Google LLC.
+ */
+
+#ifndef __VIRTIO_MEDIA_PROTOCOL_H
+#define __VIRTIO_MEDIA_PROTOCOL_H
+
+#include <linux/videodev2.h>
+#include <linux/bits.h>
+
+/*
+ * Virtio protocol definition.
+ */
+
+/**
+ * struct virtio_media_cmd_header - Header for all virtio-media commands.
+ * @cmd: one of VIRTIO_MEDIA_CMD_*.
+ * @__reserved: must be set to zero by the driver.
+ *
+ * This header starts all commands from the driver to the device on the
+ * commandq.
+ */
+struct virtio_media_cmd_header {
+	u32 cmd;
+	u32 __reserved;
+};
+
+/**
+ * struct virtio_media_resp_header - Header for all virtio-media responses.
+ * @status: 0 if the command was successful, or one of the standard Linux error
+ * codes.
+ * @__reserved: must be set to zero by the device.
+ *
+ * This header starts all responses from the device to the driver on the
+ * commandq.
+ */
+struct virtio_media_resp_header {
+	u32 status;
+	u32 __reserved;
+};
+
+/**
+ * VIRTIO_MEDIA_CMD_OPEN - Command for creating a new session.
+ *
+ * This is the equivalent of calling `open` on a V4L2 device node. Upon
+ * success, a session id is returned which can be used to perform other
+ * commands on the session, notably ioctls.
+ */
+#define VIRTIO_MEDIA_CMD_OPEN 1
+
+/**
+ * struct virtio_media_cmd_open - Driver command for VIRTIO_MEDIA_CMD_OPEN.
+ * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_OPEN.
+ */
+struct virtio_media_cmd_open {
+	struct virtio_media_cmd_header hdr;
+};
+
+/**
+ * struct virtio_media_resp_open - Device response for VIRTIO_MEDIA_CMD_OPEN.
+ * @hdr: header containing the status of the command.
+ * @session_id: if hdr.status == 0, contains the id of the newly created
+ *              session.
+ * @__reserved: must be set to zero by the device.
+ */
+struct virtio_media_resp_open {
+	struct virtio_media_resp_header hdr;
+	u32 session_id;
+	u32 __reserved;
+};
+
+/**
+ * VIRTIO_MEDIA_CMD_CLOSE - Command for closing an active session.
+ *
+ * This is the equivalent of calling `close` on a previously opened V4L2
+ * session. All resources associated with this session will be freed and the
+ * session ID shall not be used again after queueing this command.
+ *
+ * This command does not require a response from the device.
+ */
+#define VIRTIO_MEDIA_CMD_CLOSE 2
+
+/**
+ * struct virtio_media_cmd_close - Driver command for VIRTIO_MEDIA_CMD_CLOSE.
+ * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_CLOSE.
+ * @session_id: id of the session to close.
+ * @__reserved: must be set to zero by the driver.
+ */
+struct virtio_media_cmd_close {
+	struct virtio_media_cmd_header hdr;
+	u32 session_id;
+	u32 __reserved;
+};
+
+/**
+ * VIRTIO_MEDIA_CMD_IOCTL - Driver command for executing an ioctl.
+ *
+ * This command asks the device to run one of the `VIDIOC_*` ioctls on the
+ * active session.
+ *
+ * The code of the ioctl is extracted from the VIDIOC_* definitions in
+ * `videodev2.h`, and consists of the second argument of the `_IO*` macro.
+ *
+ * Each ioctl has a payload, which is defined by the third argument of the
+ * `_IO*` macro defining it. It can be writable by the driver (`_IOW`), the
+ * device (`_IOR`), or both (`_IOWR`).
+ *
+ * If an ioctl is writable by the driver, it must be followed by a
+ * driver-writable descriptor containing the payload.
+ *
+ * If an ioctl is writable by the device, it must be followed by a
+ * device-writable descriptor of the size of the payload that the device will
+ * write into.
+ *
+ */
+#define VIRTIO_MEDIA_CMD_IOCTL 3
+
+/**
+ * struct virtio_media_cmd_ioctl - Driver command for VIRTIO_MEDIA_CMD_IOCTL.
+ * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_IOCTL.
+ * @session_id: id of the session to run the ioctl on.
+ * @code: code of the ioctl to run.
+ */
+struct virtio_media_cmd_ioctl {
+	struct virtio_media_cmd_header hdr;
+	u32 session_id;
+	u32 code;
+};
+
+/**
+ * struct virtio_media_resp_ioctl - Device response for VIRTIO_MEDIA_CMD_IOCTL.
+ * @hdr: header containing the status of the ioctl.
+ */
+struct virtio_media_resp_ioctl {
+	struct virtio_media_resp_header hdr;
+};
+
+/**
+ * struct virtio_media_sg_entry - Description of part of a scattered guest
+ *                                memory.
+ * @start: start guest address of the memory segment.
+ * @len: length of this memory segment.
+ * @__reserved: must be set to zero by the driver.
+ */
+struct virtio_media_sg_entry {
+	u64 start;
+	u32 len;
+	u32 __reserved;
+};
+
+#define VIRTIO_MEDIA_MMAP_FLAG_RW BIT(0)
+
+/**
+ * VIRTIO_MEDIA_CMD_MMAP - Command for mapping a MMAP buffer into the driver's
+ * address space.
+ *
+ */
+#define VIRTIO_MEDIA_CMD_MMAP 4
+
+/**
+ * struct virtio_media_cmd_mmap - Driver command for VIRTIO_MEDIA_CMD_MMAP.
+ * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_MMAP.
+ * @session_id: ID of the session we are mapping for.
+ * @flags: combination of VIRTIO_MEDIA_MMAP_FLAG_*.
+ * @offset: mem_offset field of the plane to map, as returned by
+ *          VIDIOC_QUERYBUF.
+ */
+struct virtio_media_cmd_mmap {
+	struct virtio_media_cmd_header hdr;
+	u32 session_id;
+	u32 flags;
+	u32 offset;
+};
+
+/**
+ * struct virtio_media_resp_mmap - Device response for VIRTIO_MEDIA_CMD_MMAP.
+ * @hdr: header containing the status of the command.
+ * @driver_addr: offset into SHM region 0 of the start of the mapping.
+ * @len: length of the mapping.
+ */
+struct virtio_media_resp_mmap {
+	struct virtio_media_resp_header hdr;
+	u64 driver_addr;
+	u64 len;
+};
+
+/**
+ * VIRTIO_MEDIA_CMD_MUNMAP - Unmap a MMAP buffer previously mapped using
+ * VIRTIO_MEDIA_CMD_MMAP.
+ */
+#define VIRTIO_MEDIA_CMD_MUNMAP 5
+
+/**
+ * struct virtio_media_cmd_munmap - Driver command for VIRTIO_MEDIA_CMD_MUNMAP.
+ * @hdr: header with cmd member set to VIRTIO_MEDIA_CMD_MUNMAP.
+ * @driver_addr: offset into SHM region 0 at which the buffer has been
+ *               previously
+ * mapped.
+ */
+struct virtio_media_cmd_munmap {
+	struct virtio_media_cmd_header hdr;
+	u64 driver_addr;
+};
+
+/**
+ * struct virtio_media_resp_munmap - Device response for
+ *                                   VIRTIO_MEDIA_CMD_MUNMAP.
+ * @hdr: header containing the status of the command.
+ */
+struct virtio_media_resp_munmap {
+	struct virtio_media_resp_header hdr;
+};
+
+/* The values for these events are set by the virtio-media specification. */
+#define VIRTIO_MEDIA_EVT_ERROR 0
+#define VIRTIO_MEDIA_EVT_DQBUF 1
+#define VIRTIO_MEDIA_EVT_EVENT 2
+
+/**
+ * struct virtio_media_event_header - Header for events on the eventq.
+ * @event: one of VIRTIO_MEDIA_EVT_*
+ * @session_id: ID of the session the event applies to.
+ */
+struct virtio_media_event_header {
+	u32 event;
+	u32 session_id;
+};
+
+/**
+ * struct virtio_media_event_error - Unrecoverable device-side error.
+ * @hdr: header for the event.
+ * @errno: error code describing the kind of error that occurred.
+ * @__reserved: must to set to zero by the device.
+ *
+ * Upon receiving this event, the session mentioned in the header is considered
+ * corrupted and closed.
+ *
+ */
+struct virtio_media_event_error {
+	struct virtio_media_event_header hdr;
+	u32 errno;
+	u32 __reserved;
+};
+
+/* This is set to VIDEO_MAX_PLANES defined in include/uapi/linux/videodev2.h.
+ * It is renamed here to match the constant that is defined in the virtio-media
+ * specification.
+ */
+#define VIRTIO_MEDIA_MAX_PLANES VIDEO_MAX_PLANES
+
+/**
+ * struct virtio_media_event_dqbuf - Dequeued buffer event.
+ * @hdr: header for the event.
+ * @buffer: struct v4l2_buffer describing the buffer that has been dequeued.
+ * @planes: plane information for the dequeued buffer.
+ *
+ * This event is used to signal that a buffer is not being used anymore by the
+ * device and is returned to the driver.
+ */
+struct virtio_media_event_dqbuf {
+	struct virtio_media_event_header hdr;
+	struct v4l2_buffer buffer;
+	struct v4l2_plane planes[VIRTIO_MEDIA_MAX_PLANES];
+};
+
+/**
+ * struct virtio_media_event_event - V4L2 event.
+ * @hdr: header for the event.
+ * @event: description of the event that occurred.
+ *
+ * This event signals that a V4L2 event has been emitted for a session.
+ */
+struct virtio_media_event_event {
+	struct virtio_media_event_header hdr;
+	struct v4l2_event event;
+};
+
+/* Maximum size of an event. We will queue descriptors of this size on the
+ * eventq.
+ */
+#define VIRTIO_MEDIA_EVENT_MAX_SIZE sizeof(struct virtio_media_event_dqbuf)
+
+#endif // __VIRTIO_MEDIA_PROTOCOL_H
-- 
2.55.0.rc0.799.gd6f94ed593-goog


