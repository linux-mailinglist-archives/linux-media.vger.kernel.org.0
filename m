Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF8A6D4CDB
	for <lists+linux-media@lfdr.de>; Mon,  3 Apr 2023 17:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232937AbjDCP5j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Apr 2023 11:57:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232932AbjDCP5Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Apr 2023 11:57:25 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC66C448E;
        Mon,  3 Apr 2023 08:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1680537006;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WQ7k7KsV39QPGYjokDQtx5Buy0HkE7q//zbkWOqAhK8=;
        b=DEzFQ5dHQ52MTjpnNy7RIpuyYfglVdd9G+QCmQAVvx+THx1Dg3RcG9JdnozS0UiT+lI+RR
        CwJVsJsAsQoVJKd/Og7/j2Tt0PnG/Sny+C9Ea9H9gfozB95dYUVccWs0aEeC/OjeWUzyfq
        tjjtxRST8Z3B0Ek776+YV19sFnLRNGg=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Vinod Koul <vkoul@kernel.org>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        =?UTF-8?q?Nuno=20S=C3=A1?= <noname.nuno@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        Paul Cercueil <paul@crapouillou.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: [PATCH v3 11/11] Documentation: iio: Document high-speed DMABUF based API
Date:   Mon,  3 Apr 2023 17:49:55 +0200
Message-Id: <20230403154955.216148-2-paul@crapouillou.net>
In-Reply-To: <20230403154955.216148-1-paul@crapouillou.net>
References: <20230403154800.215924-1-paul@crapouillou.net>
 <20230403154955.216148-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document the new DMABUF based API.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org

---
v2: - Explicitly state that the new interface is optional and is
      not implemented by all drivers.
    - The IOCTLs can now only be called on the buffer FD returned by
      IIO_BUFFER_GET_FD_IOCTL.
    - Move the page up a bit in the index since it is core stuff and not
      driver-specific.
v3: Update the documentation to reflect the new API.
---
 Documentation/iio/dmabuf_api.rst | 59 ++++++++++++++++++++++++++++++++
 Documentation/iio/index.rst      |  2 ++
 2 files changed, 61 insertions(+)
 create mode 100644 Documentation/iio/dmabuf_api.rst

diff --git a/Documentation/iio/dmabuf_api.rst b/Documentation/iio/dmabuf_api.rst
new file mode 100644
index 000000000000..4d70372c7ebd
--- /dev/null
+++ b/Documentation/iio/dmabuf_api.rst
@@ -0,0 +1,59 @@
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
+can attach DMABUF objects (externally created) to a IIO buffer, and
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
+``IIO_BUFFER_DMABUF_ATTACH_IOCTL(int)``
+----------------------------------------------------------------
+
+Attach the DMABUF object, identified by its file descriptor, to the IIO
+buffer. Returns zero on success, and a negative errno value on error.
+
+``IIO_BUFFER_DMABUF_DETACH_IOCTL(int)``
+--------------------------------------------------------
+
+Detach the given DMABUF object, identified by its file descriptor, from
+the IIO buffer. Returns zero on success, and a negative errno value on
+error.
+
+Note that closing the IIO buffer's file descriptor will automatically
+detach all previously attached DMABUF objects.
+
+``IIO_BUFFER_DMABUF_ENQUEUE_IOCTL(struct iio_dmabuf *iio_dmabuf)``
+--------------------------------------------------------
+
+Enqueue a previously attached DMABUF object to the buffer queue.
+Enqueued DMABUFs will be read from (if output buffer) or written to
+(if input buffer) as long as the buffer is enabled.
diff --git a/Documentation/iio/index.rst b/Documentation/iio/index.rst
index 1b7292c58cd0..3eae8fcb1938 100644
--- a/Documentation/iio/index.rst
+++ b/Documentation/iio/index.rst
@@ -9,6 +9,8 @@ Industrial I/O
 
    iio_configfs
 
+   dmabuf_api
+
    ep93xx_adc
 
    bno055
-- 
2.39.2

