Return-Path: <linux-media+bounces-38398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7127B10CF1
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 16:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C545AA7A83
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 14:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C241C2E9735;
	Thu, 24 Jul 2025 14:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fagt0BE+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DE92E8E04;
	Thu, 24 Jul 2025 14:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753366257; cv=none; b=PvwIQsQyhoCKrmeG8Z1V2dGlXxM3FfSZ6ClfGEu53aOLOvGCwb+UVm7qheYDCCng6GzGwVsXlhEpnda5yeT2Cddhh4rs8aPxL1UB7jZ9x13isUCquN3kWMrUkvpR5L/aII+WvcD7Y64WqhKBy1t4px/YDKQQq08RZJF/2GAfYiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753366257; c=relaxed/simple;
	bh=u88FSqcsc0N2ZFvrgby11vKsM4ytR+rXokZ729cwq9o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fxKqg9BO0bqEaIc8vdlu3NUcecUlV125/GJaYdk9aElHfGJmP907mr1vkpPtcHEBysJ32++3PK4J2lSJ8cshI5xd1rnyo1FqRF+IzZUhr34hiCd+OiNFdO7xK3puXdxpUhmq09oZOcDxMwanBsPVeS7/2vui0acqPQEjg1XFinM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fagt0BE+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.76] (unknown [IPv6:2001:b07:6462:5de2:520d:d7a3:63ca:99e8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 667371A04;
	Thu, 24 Jul 2025 16:10:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753366205;
	bh=u88FSqcsc0N2ZFvrgby11vKsM4ytR+rXokZ729cwq9o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fagt0BE+diV9+AbBlekTOJdiPNc9GafAg6df8urVTH54TtuiOuc+JsvT6NYdgjLXN
	 bKddHDJe8MFsWKz+fFdcy+kZhBK/DoO/FgptKqeFRblUI4DR9zFzAkC9LNDR+A/o3A
	 /gB+AseHNs27lfHnjM6zMkhQM1uHUeA54TfOS0JA=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Thu, 24 Jul 2025 16:10:21 +0200
Subject: [PATCH v2 14/27] media: Documentation: Add
 VIDIOC_SUBDEV_BIND_CONTEXT
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-multicontext-mainline-2025-v2-14-c9b316773486@ideasonboard.com>
References: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
In-Reply-To: <20250724-multicontext-mainline-2025-v2-0-c9b316773486@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4626;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=u88FSqcsc0N2ZFvrgby11vKsM4ytR+rXokZ729cwq9o=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBogj7PW7QjD8qMwTZWuNE7c3zeDKhIIFd1UylOr
 B9O82Ilv2eJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaII+zwAKCRByNAaPFqFW
 PE5eD/0buLR1LLpJcJn9kC4eWv+0KZur9zub9kI1BX9gWa1EIB8n+0lF9Z67+hSsSxR9dXZmgvW
 WtKuLlkcMG9/NmXE68PdkQwi1DlaJOcE4EurwMVNclTQ7SBwSIlP1RC6lA0d6PPHQKNE82foEg4
 aolXSHns/6BrZSWgKLYXi8mx/KJpQuilfJPCwdGcR7HYhw01ypp14n1NaOtFIaa4EnWACNX4Gxv
 CssDizDXc0oHSjmLrSUoWWtawSlONG6cZkq9r76Uhf3EefgtFxKCG4+oAFKVO2rc6HQfA1nXDvn
 KSZNNnm1anSksyTAQm3VYh3YT5d0XaW+DcFJ0OIzJc9gbKJKBoRVoPRnvqrLNQOqjKCh5ERgtkP
 ztF2L1UcGkErdKlAKOZnejnomjVTk2XVaXy1QUtjQJD4caxkzTvMZ3LPufJtSkIBCU/BC3ENKi7
 ZkzyZttc4ji5CMX4C11CobV6+OjCxdgCNVrwhQDVcIGQXRoAiD5TzYhiUZkMkIpWtKFnWJ02Zfn
 sQJpi/Axm/DAR0xgZfal7cuvjdMXGKhzAudiHvF5H+iPwX0QvEk67NQxzKL0yak2XyyQIcJVj9X
 rD6Izu5650bFcxtR5mssVGKJH4wUiA8PnpYhG7/MEqyxB0PSoxdL2duP98Cf4lT6P3j5RvpOI/6
 wFcuenFV9OXNInQ==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Document the newly introduced VIDIOC_SUBDEV_BIND_CONTEXT ioctl.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 .../userspace-api/media/v4l/user-func.rst          |  1 +
 .../media/v4l/vidioc-subdev-bind-context.rst       | 81 ++++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/user-func.rst b/Documentation/userspace-api/media/v4l/user-func.rst
index 0d9aff56ab653b2a4f6afe4828f88bc5637addf1..236847a1d6cb2a266bea30ecf7583979099b0343 100644
--- a/Documentation/userspace-api/media/v4l/user-func.rst
+++ b/Documentation/userspace-api/media/v4l/user-func.rst
@@ -66,6 +66,7 @@ Function Reference
     vidioc-remove-bufs
     vidioc-s-hw-freq-seek
     vidioc-streamon
+    vidioc-subdev-bind-context
     vidioc-subdev-enum-frame-interval
     vidioc-subdev-enum-frame-size
     vidioc-subdev-enum-mbus-code
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-bind-context.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-bind-context.rst
new file mode 100644
index 0000000000000000000000000000000000000000..5cba529a3cdcb63c7257f871d667fa792c0ca382
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-bind-context.rst
@@ -0,0 +1,81 @@
+.. SPDX-License-Identifier: GFDL-1.1-no-invariants-or-later
+.. c:namespace:: V4L
+
+.. _vidioc_subdev_bind_context:
+
+********************************
+ioctl VIDIOC_SUBDEV_BIND_CONTEXT
+********************************
+
+Name
+====
+
+VIDIOC_SUBDEV_BIND_CONTEXT - Bind a subdevice file handle to a media device
+context
+
+Synopsis
+========
+
+.. c:macro:: VIDIOC_SUBDEV_BIND_CONTEXT
+
+``int ioctl(int fd, VIDIOC_SUBDEV_BIND_CONTEXT, struct v4l2_subdev_bind_context *argp)``
+
+Arguments
+=========
+
+``fd``
+    File descriptor returned by :c:func:`open()`.
+
+``argp``
+    Pointer to struct :c:type:`v4l2_subdev_bind_context`.
+
+Description
+===========
+
+Applications call the ``VIDIOC_SUBDEV_BIND_CONTEXT`` ioctl to bind a subdevice
+file handle to a media device  context. Binding a subdevice file handle to a
+media device context creates an isolated execution context which allows to
+multiplex the usage of a video device. This means, in practice, that the
+subdevice configuration (format, sizes etc) applied on a file handle bound to a
+media device context won't be visible on file handles bound to a different media
+device context (or not bound at all).
+
+By opening a media device applications create a media device context to which
+video devices and subdevices file handles can be bound to. The file descriptor
+returned by a call to :c:func:`open()` on the media device identifies uniquely
+the media device context. Application populates the ``context_fd`` field of
+:c:type:`v4l2_subdev_bind_context` with the file descriptor of an open media
+device to identify the media context to which they want to bind a subdevice
+to.
+
+Applications can open a subdevice node multiple times, and call
+``VIDIOC_BIND_CONTEXT`` on each file handle returned by a successful call to
+:c:func:`open()` to isolate the operations performed on that file handle from
+any operation performed on other file handles bound to different contexts. This
+means, in example, that the subdevice format and sizes are isolated from the
+ones associated with a file descriptor, obtained by opening the same subdevice
+but bound to a different media device context (or not bound at all).
+
+The bounding operation realizes a permanent association valid until the
+subdevice context is released by closing the file handle.
+
+A subdevice file handle can be bound to the same media device context once
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
+    subdevice file handle is already bound to a context.

-- 
2.49.0


