Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF4CC98FD4
	for <lists+linux-media@lfdr.de>; Thu, 22 Aug 2019 11:39:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732134AbfHVJhA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 22 Aug 2019 05:37:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49236 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731857AbfHVJg6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 22 Aug 2019 05:36:58 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id BB49F309175F;
        Thu, 22 Aug 2019 09:36:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com [10.36.116.60])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DE522600CD;
        Thu, 22 Aug 2019 09:36:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 3A3757F; Thu, 22 Aug 2019 11:36:54 +0200 (CEST)
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     dri-devel@lists.freedesktop.org
Cc:     laurent.pinchart@ideasonboard.com, daniel@ffwll.ch,
        Gerd Hoffmann <kraxel@redhat.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-media@vger.kernel.org (open list:DMA BUFFER SHARING FRAMEWORK),
        linaro-mm-sig@lists.linaro.org (moderated list:DMA BUFFER SHARING
        FRAMEWORK), linux-doc@vger.kernel.org (open list:DOCUMENTATION),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] udmabuf: add documentation
Date:   Thu, 22 Aug 2019 11:36:52 +0200
Message-Id: <20190822093654.23752-2-kraxel@redhat.com>
In-Reply-To: <20190822093654.23752-1-kraxel@redhat.com>
References: <20190822093654.23752-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Thu, 22 Aug 2019 09:36:58 +0000 (UTC)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/uapi/linux/udmabuf.h         | 52 ++++++++++++++++++++++++++--
 Documentation/driver-api/dma-buf.rst |  8 +++++
 2 files changed, 57 insertions(+), 3 deletions(-)

diff --git a/include/uapi/linux/udmabuf.h b/include/uapi/linux/udmabuf.h
index 46b6532ed855..9fe440abf2f9 100644
--- a/include/uapi/linux/udmabuf.h
+++ b/include/uapi/linux/udmabuf.h
@@ -5,8 +5,39 @@
 #include <linux/types.h>
 #include <linux/ioctl.h>
 
+/**
+ * DOC: udmabuf
+ *
+ * udmabuf is a device driver which allows userspace to create
+ * dmabufs.  The memory used for these dmabufs must be backed by
+ * memfd.  The memfd must have F_SEAL_SHRINK and it must not have
+ * F_SEAL_WRITE.
+ *
+ * The driver has two ioctls, one to create a dmabuf from a single
+ * memory block and one to create a dmabuf from a list of memory
+ * blocks.
+ *
+ * UDMABUF_CREATE - _IOW('u', 0x42, udmabuf_create)
+ *
+ * UDMABUF_CREATE_LIST - _IOW('u', 0x43, udmabuf_create_list)
+ */
+
+#define UDMABUF_CREATE       _IOW('u', 0x42, struct udmabuf_create)
+#define UDMABUF_CREATE_LIST  _IOW('u', 0x43, struct udmabuf_create_list)
+
 #define UDMABUF_FLAGS_CLOEXEC	0x01
 
+/**
+ * struct udmabuf_create - create a dmabuf from a single memory block.
+ *
+ * @memfd: The file handle.
+ * @offset: Start of the buffer (from memfd start).
+ * Must be page aligned.
+ * @size: Size of the buffer.  Must be rounded to page size.
+ *
+ * @flags:
+ * UDMABUF_FLAGS_CLOEXEC: set CLOEXEC flag for the dmabuf.
+ */
 struct udmabuf_create {
 	__u32 memfd;
 	__u32 flags;
@@ -14,6 +45,15 @@ struct udmabuf_create {
 	__u64 size;
 };
 
+/**
+ * struct udmabuf_create_item - one memory block list item.
+ *
+ * @memfd: The file handle.
+ * @__pad: Padding field (unused).
+ * @offset: Start of the buffer (from memfd start).
+ * Must be page aligned.
+ * @size: Size of the buffer.  Must be rounded to page size.
+ */
 struct udmabuf_create_item {
 	__u32 memfd;
 	__u32 __pad;
@@ -21,13 +61,19 @@ struct udmabuf_create_item {
 	__u64 size;
 };
 
+/**
+ * struct udmabuf_create_list - create a dmabuf from a memory block list.
+ *
+ * @count: The number of list elements.
+ * @list: The memory block list
+ *
+ * @flags:
+ * UDMABUF_FLAGS_CLOEXEC: set CLOEXEC flag for the dmabuf.
+ */
 struct udmabuf_create_list {
 	__u32 flags;
 	__u32 count;
 	struct udmabuf_create_item list[];
 };
 
-#define UDMABUF_CREATE       _IOW('u', 0x42, struct udmabuf_create)
-#define UDMABUF_CREATE_LIST  _IOW('u', 0x43, struct udmabuf_create_list)
-
 #endif /* _UAPI_LINUX_UDMABUF_H */
diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
index b541e97c7ab1..1f62c30a14b0 100644
--- a/Documentation/driver-api/dma-buf.rst
+++ b/Documentation/driver-api/dma-buf.rst
@@ -166,3 +166,11 @@ DMA Fence uABI/Sync File
 .. kernel-doc:: include/linux/sync_file.h
    :internal:
 
+Userspace DMA Buffer driver
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+.. kernel-doc:: include/uapi/linux/udmabuf.h
+   :doc: udmabuf
+
+.. kernel-doc:: include/uapi/linux/udmabuf.h
+   :internal:
-- 
2.18.1

