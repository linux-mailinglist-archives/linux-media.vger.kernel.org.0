Return-Path: <linux-media+bounces-37972-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 396DEB08B0C
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 12:47:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 194993B39DE
	for <lists+linux-media@lfdr.de>; Thu, 17 Jul 2025 10:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901AB29E113;
	Thu, 17 Jul 2025 10:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="daPpCCeU"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AA229DB8F;
	Thu, 17 Jul 2025 10:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752749157; cv=none; b=A41eSsm76l5uc9eqylo5zcpf2C6x4KlvK3ocy+jkmdA615Vl0bnIOkbONuJ6BNnI7+yzYJVu3CRRgY6nDVAgyHmgE5iSmVXnjxynW8Pgoy0dabcXX5PptxSM7fUa3Z2mg76rToi1wzAskYstrb+vZCUuu5Ore0f6Sr8oJEO7khk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752749157; c=relaxed/simple;
	bh=V29a6qX8KA0ELmVzRolMfVBPPzH85sU33AYkFGGSdRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LBRQdwRm1SBABd2eMHgrStzUmKNgc+Jgz+4v2Hs35Xnmqj9Jd8KkSaGgP08QUE7W4nYhcUTbH4g4muijGaZwMwBjYtltPLkP3ouLxxzfiw8rSxeyV/n8gKlVLaCNSLL+F09Ke3HtOEcp791hc5poNqO4xnUfIzOvuTQOmJGJPlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=daPpCCeU; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-140-254.net.vodafone.it [5.90.140.254])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4CBDA1AE2;
	Thu, 17 Jul 2025 12:45:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752749116;
	bh=V29a6qX8KA0ELmVzRolMfVBPPzH85sU33AYkFGGSdRI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=daPpCCeUW43d24KCryQ2pdLtbpWDh0u0qHqEytOQnQlF0qWHGt/4IkmWWRVRszmH6
	 27EHu2j1Ny/2xPvIBpyQkcxN/9fmBz+l6YXd9Iu0kM/MJ7ZScL8K5WPl5xOWZ7ievn
	 kRdtsuh1udrJAOqP16K+GfFV/75LDAUGhXuUXWrc=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 17 Jul 2025 12:45:33 +0200
Subject: [PATCH 07/26] media: Documentation: Add VIDIOC_BIND_CONTEXT
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-multicontext-mainline-2025-v1-7-81ac18979c03@ideasonboard.com>
References: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
In-Reply-To: <20250717-multicontext-mainline-2025-v1-0-81ac18979c03@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4469;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=V29a6qX8KA0ELmVzRolMfVBPPzH85sU33AYkFGGSdRI=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoeNRP4kD2I23sWOplrDqy5y3c+7A+RTx3u8rN9
 jYoHzA0q+6JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaHjUTwAKCRByNAaPFqFW
 PHo6EACcywtLQFchr4d0k6G4vWMujDGLd+QdUrBmIoK1W9TQKB97vJKK0bBo2m4z0VdVzN7/iQf
 xBnqB9Kffzup/5jvPbijDrdud6CsXCU9DO3JXpdA04Me2ZDl7wa+cGUtQ8EcF8+/SMGaPvo4q7t
 SllO+1g5Y2Vu6RCg1AqQR6LyxrZuxp3+kq03dlLPX1RLy8F9yAMGhwKcYLt3XU+/wlttt14ULM+
 IAsMavvf2Rk7FZHi9RzCJHBeFDXWBroLPpgpBn+qf8oTNHk5FKvpCwfn0ukYV1TbxuOrluNnhKO
 WEZnRODoJLK9EO4bCEeRh3RL/ZCILC6ynpeLyV95HzQwdKRDPb0DobzqPIk31qsk9tz0XuiZ1rl
 g+Qx7qwGwqvyYx5tgheiiZDJ5f6hBraeQDEPfANHJxYuSQ1jA7cziTS4SJa6mEKJxicFdXPUpcr
 APzKQvJSgCob8Ce2RcJpvTBlRcJzPsfuNUYqKBp9jXV/obI2PeQmO2AaCHZhgUMuL+BZ0oMD9Yq
 0HygKlidcXBm0z1FAlOgduNnpAvANlRN5Nw6716e/p8aOYAlha6FLv2vna3AXlBFJ7x+lO/YFHI
 5U1zMW0aSFbalRzvQY9eL8PYty8lx9rvd/QnVNPqQmfkbttddmIqPKQ4flmBJJaYB8yjBr8ZoTv
 g/y4JE7cV972vnA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Document the newly introduced VIDIOC_BIND_CONTEXT ioctl.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../userspace-api/media/v4l/user-func.rst          |  1 +
 .../media/v4l/vidioc-bind-context.rst              | 80 ++++++++++++++++++++++
 2 files changed, 81 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/user-func.rst b/Documentation/userspace-api/media/v4l/user-func.rst
index 6f661138801cde2810997740ee8305085fe73a43..0d9aff56ab653b2a4f6afe4828f88bc5637addf1 100644
--- a/Documentation/userspace-api/media/v4l/user-func.rst
+++ b/Documentation/userspace-api/media/v4l/user-func.rst
@@ -12,6 +12,7 @@ Function Reference
 
     func-close
     func-ioctl
+    vidioc-bind-context
     vidioc-create-bufs
     vidioc-cropcap
     vidioc-dbg-g-chip-info
diff --git a/Documentation/userspace-api/media/v4l/vidioc-bind-context.rst b/Documentation/userspace-api/media/v4l/vidioc-bind-context.rst
new file mode 100644
index 0000000000000000000000000000000000000000..74c885169e22c495056a9364e722e2140d8f21c5
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/vidioc-bind-context.rst
@@ -0,0 +1,80 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
+
+.. _vidioc_bind_context:
+
+*************************
+ioctl VIDIOC_BIND_CONTEXT
+*************************
+
+Name
+====
+
+VIDIOC_BIND_CONTEXT - Bind a video device file handle to a media device context
+
+Synopsis
+========
+
+.. c:macro:: VIDIOC_BIND_CONTEXT
+
+``int ioctl(int fd, VIDIOC_BIND_CONTEXT, struct v4l2_context *argp)``
+
+Arguments
+=========
+
+``fd``
+    File descriptor returned by :c:func:`open()`.
+
+``argp``
+    Pointer to struct :c:type:`v4l2_context`.
+
+Description
+===========
+
+Applications call the ``VIDIOC_BIND_CONTEXT`` ioctl to bind a video device file
+handle to a media device  context. Binding a video device file handle to a media
+device context creates an isolated execution context which allows to multiplex
+the usage of a video device. This means, in practice, that the video device
+configuration (format, sizes etc) applied on a file handle bound to a media
+device context won't be visible on file handles bound to a different media
+device context (or not bound at all).
+
+By opening a media device applications create a media device context to which
+video devices and subdevices file handles can be bound to. The file descriptor
+returned by a call to :c:func:`open()` on the media device identifies uniquely
+the media device context. Application populates the ``context_fd`` field of
+:c:type:`v4l2_context` with the file descriptor of an open media device to
+identify the media context to which they want to bind a video device to.
+
+Applications can open a video device node multiple times, and call
+``VIDIOC_BIND_CONTEXT`` on each file handle returned by a successful call to
+:c:func:`open()` to isolate the operations performed on that file handle from
+any operation performed on other file handles bound to different contexts. This
+means, in example, that the video device format, sizes and the buffers are
+isolated from the ones associated with a file descriptor, obtained by opening
+the same video device but bound to a different media device context (or not
+bound at all).
+
+The bounding operation realizes a permanent association valid until the video
+device context is released by closing the file handle.
+
+A video device file handle can be bound to the same media device context once
+only. Trying to bind the same file handle to the same media device context a
+second time, without releasing the already established context by closing the
+bound file descriptor first, will result in an error.
+
+Bounding is an opt-in feature that applications are free to ignore. Any
+operation directed to a non bound file handle will continue to work as it used
+to, and the video device configuration (formats, sizes etc) will be visible
+across all the other non-bound file handles.
+
+Return Value
+============
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+EINVAL
+    The media device context file handle ``context_fd`` is not valid or the
+    video device file handle is already bound to a context.

-- 
2.49.0


