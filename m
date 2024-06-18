Return-Path: <linux-media+bounces-13518-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A96CC90C8F0
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 13:19:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30E55287ABF
	for <lists+linux-media@lfdr.de>; Tue, 18 Jun 2024 11:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F7EC213162;
	Tue, 18 Jun 2024 10:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="wleQHN+L"
X-Original-To: linux-media@vger.kernel.org
Received: from aposti.net (aposti.net [89.234.176.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0DF213150;
	Tue, 18 Jun 2024 10:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.234.176.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718705043; cv=none; b=jW/xUH0jAU8UHvwj78cqGgZDbHt6txSHxw6zj9+v8sDChpkjBnvwMSF40dzBKHc+b3MAAiPFPJDiSjRxRdreOD5+Fs9vt76lHUuYjy+BHkN8XBUVVPe8g8FznwYSNM4GHCzJQNXE2CpuYJH1+Gz/n9KipzFx1XyhtNNc7y+FCpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718705043; c=relaxed/simple;
	bh=rxuxrnuLAzYnJpChC7mDsaXMHmsflaOSlgWDLcGldHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mFqknFGJNvmcd4EZnmtAhH2/fdigNeLLCWIBBKQ1s8sm0+v3Xhr+Q8znVzMdx7d32T1tXkgVhox5Nc8qJa3HJ4fydmAR1m3RGdXc11TRgYqUZsYrlDKo/rMgLL3Sprw92q+sfDhMUQ2W/0e9pWeXdLSjrlUI6Kk2tM/K089NtBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net; spf=pass smtp.mailfrom=crapouillou.net; dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b=wleQHN+L; arc=none smtp.client-ip=89.234.176.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
	s=mail; t=1718704996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/uHGRMKk9xND9JDSJXhO37j4a+IBIelBDXj6Y7q76eE=;
	b=wleQHN+LHyOTHs6JuLerJ6ZqtYWdCaGlTtq72+FIoVFzZ4WDm/KCd3HJ9jYx2HhfM7fZ7u
	b6V5zwgB3CkAX9ZLkM0GoT4UHSlQnCsIekEWIM2Cg8+YViZch9wtu26hpbTql1owb9MzF2
	lAK3YSy1wg6MhxxYumfLRE0+vy+cZAI=
From: Paul Cercueil <paul@crapouillou.net>
To: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Vinod Koul <vkoul@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Nuno Sa <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v11 6/7] Documentation: iio: Document high-speed DMABUF based API
Date: Tue, 18 Jun 2024 12:03:01 +0200
Message-ID: <20240618100302.72886-7-paul@crapouillou.net>
In-Reply-To: <20240618100302.72886-1-paul@crapouillou.net>
References: <20240618100302.72886-1-paul@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the new DMABUF based API.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Co-developed-by: Nuno Sa <nuno.sa@analog.com>
Signed-off-by: Nuno Sa <nuno.sa@analog.com>

---
v2: - Explicitly state that the new interface is optional and is
      not implemented by all drivers.
    - The IOCTLs can now only be called on the buffer FD returned by
      IIO_BUFFER_GET_FD_IOCTL.
    - Move the page up a bit in the index since it is core stuff and not
      driver-specific.

v3: Update the documentation to reflect the new API.

v5: Use description lists for the documentation of the three new IOCTLs
    instead of abusing subsections.

v8: Renamed dmabuf_api.rst -> iio_dmabuf_api.rst, and updated index.rst
    whose format changed in iio/togreg.

v11:
- "a IIO buffer" -> "an IIO buffer"
- Add variable name in IOCTL calls
---
 Documentation/iio/iio_dmabuf_api.rst | 54 ++++++++++++++++++++++++++++
 Documentation/iio/index.rst          |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 Documentation/iio/iio_dmabuf_api.rst

diff --git a/Documentation/iio/iio_dmabuf_api.rst b/Documentation/iio/iio_dmabuf_api.rst
new file mode 100644
index 000000000000..ad0177c3fef2
--- /dev/null
+++ b/Documentation/iio/iio_dmabuf_api.rst
@@ -0,0 +1,54 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===================================
+High-speed DMABUF interface for IIO
+===================================
+
+1. Overview
+===========
+
+The Industrial I/O subsystem supports access to buffers through a
+file-based interface, with read() and write() access calls through the
+IIO device's dev node.
+
+It additionally supports a DMABUF based interface, where the userspace
+can attach DMABUF objects (externally created) to an IIO buffer, and
+subsequently use them for data transfers.
+
+A userspace application can then use this interface to share DMABUF
+objects between several interfaces, allowing it to transfer data in a
+zero-copy fashion, for instance between IIO and the USB stack.
+
+The userspace application can also memory-map the DMABUF objects, and
+access the sample data directly. The advantage of doing this vs. the
+read() interface is that it avoids an extra copy of the data between the
+kernel and userspace. This is particularly useful for high-speed devices
+which produce several megabytes or even gigabytes of data per second.
+It does however increase the userspace-kernelspace synchronization
+overhead, as the DMA_BUF_SYNC_START and DMA_BUF_SYNC_END IOCTLs have to
+be used for data integrity.
+
+2. User API
+===========
+
+As part of this interface, three new IOCTLs have been added. These three
+IOCTLs have to be performed on the IIO buffer's file descriptor,
+obtained using the IIO_BUFFER_GET_FD_IOCTL() ioctl.
+
+  ``IIO_BUFFER_DMABUF_ATTACH_IOCTL(int fd)``
+    Attach the DMABUF object, identified by its file descriptor, to the
+    IIO buffer. Returns zero on success, and a negative errno value on
+    error.
+
+  ``IIO_BUFFER_DMABUF_DETACH_IOCTL(int fd)``
+    Detach the given DMABUF object, identified by its file descriptor,
+    from the IIO buffer. Returns zero on success, and a negative errno
+    value on error.
+
+    Note that closing the IIO buffer's file descriptor will
+    automatically detach all previously attached DMABUF objects.
+
+  ``IIO_BUFFER_DMABUF_ENQUEUE_IOCTL(struct iio_dmabuf *iio_dmabuf)``
+    Enqueue a previously attached DMABUF object to the buffer queue.
+    Enqueued DMABUFs will be read from (if output buffer) or written to
+    (if input buffer) as long as the buffer is enabled.
diff --git a/Documentation/iio/index.rst b/Documentation/iio/index.rst
index 4c13bfa2865c..9cb4c50cb20d 100644
--- a/Documentation/iio/index.rst
+++ b/Documentation/iio/index.rst
@@ -9,6 +9,7 @@ Industrial I/O
 
    iio_configfs
    iio_devbuf
+   iio_dmabuf_api
    iio_tools
 
 Industrial I/O Kernel Drivers
-- 
2.43.0


