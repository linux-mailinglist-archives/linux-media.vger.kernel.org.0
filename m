Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E031E3A2A63
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 13:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230465AbhFJLiX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 07:38:23 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:47187 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230446AbhFJLiU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 07:38:20 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id rIytl7kZmhqltrIz0lXjSo; Thu, 10 Jun 2021 13:36:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1623324983; bh=eNgd9lW+L9rPHrGo4H7z/pW1zi06P9qNFByilVROqxk=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=XljXC+6oCcTh3tkOm7njn9WK1/3jzHHKorSRsGuIGgqtEv8ekl7+VqGO2gJBODU0b
         o2dQ0xgpwOvjzAi1KnIgsT6fCWYK+2x/039BflUmlhCDjDp0T4m5EurGXtIRmELosk
         zKji79dkAtAA7tZ0/z+JiF4e6qCpQeY1Bgll8G85KEZ4ZCjBvpGcFtwF5+WEUvV8D4
         IoxSWSB58P0QxdeG124eUG4tKYxM5ncFi0inEQ6yM2ji1tekRe1Pa9uOa2zJAJNRtM
         b284jQly1aALEEOcllksIKmhb5HEeCxoNDjnmHsHL4BtS6/qQEAIESZNa8FzgxW1tz
         KGlFslLsAndRA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        John Cox <jc@kynesim.co.uk>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [RFC PATCHv2 04/11] media: document read-only requests
Date:   Thu, 10 Jun 2021 13:36:08 +0200
Message-Id: <20210610113615.785359-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210610113615.785359-1-hverkuil-cisco@xs4all.nl>
References: <20210610113615.785359-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfOQXvprzNOxv3dllV8tYfCqFEZTxHVPvxwWq5j8/dztnYXnbIicoUV+916/WWo0LY09C7617zTll/A7TMa6JUFvfEI1cabtbfthGymVXA0bj0OTVGvmw
 32gLTaZy4XaVSdDIhHJ6fkbG0mBttYK1ToKmZsQiTpwbb1XalHZWI/3X9wdNyTVrYY0q1yIwAI7Rb4+ieozrulYufEwfhUnekUPcIgNxExwxp4q3Nf2X5c42
 Leobpu8kZOX3ZFgSPlwyQnR4MT9ODGPWxWTbdyBSUfGs8zs2LXF/FtbQ+IUiyMjxY9WV/zcClPUmxYcBDI+z34stHLy+n15SyLqaZLNMQGCn+veDXqRp+Ut/
 2b7QvzCsLz/EIQObz+K1JoGhVoC7JwavZrfwg1CpwTsujvZCyWFfDfllN8TalhXPKy6EvvvF
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch documents read-only requests, including the new
V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS capability flag.

Based in part on a patch from Yunfei Dong <yunfei.dong@mediatek.com>.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/mediactl/media-request-ioc-queue.rst        |  5 +++++
 .../userspace-api/media/mediactl/request-api.rst      | 11 +++++++++++
 .../userspace-api/media/v4l/vidioc-reqbufs.rst        |  6 ++++++
 3 files changed, 22 insertions(+)

diff --git a/Documentation/userspace-api/media/mediactl/media-request-ioc-queue.rst b/Documentation/userspace-api/media/mediactl/media-request-ioc-queue.rst
index 04b33db2bb45..aee65ad765fc 100644
--- a/Documentation/userspace-api/media/mediactl/media-request-ioc-queue.rst
+++ b/Documentation/userspace-api/media/mediactl/media-request-ioc-queue.rst
@@ -51,6 +51,11 @@ queued directly and you next try to queue a request, or vice versa.
 A request must contain at least one buffer, otherwise this ioctl will
 return an ``ENOENT`` error.
 
+If the :ref:`buffer capabilities <v4l2-buf-capabilities>` indicate that
+only read-only requests are supported, then the request can only contain
+buffers. If anything else is present then this ioctl will return an
+``EINVAL`` error.
+
 Return Value
 ============
 
diff --git a/Documentation/userspace-api/media/mediactl/request-api.rst b/Documentation/userspace-api/media/mediactl/request-api.rst
index 6c4cbd9f08a5..71259cff590f 100644
--- a/Documentation/userspace-api/media/mediactl/request-api.rst
+++ b/Documentation/userspace-api/media/mediactl/request-api.rst
@@ -30,6 +30,13 @@ with different configurations in advance, knowing that the configuration will be
 applied when needed to get the expected result. Configuration values at the time
 of request completion are also available for reading.
 
+In some cases it does not make sense for user-space to associate configuration
+values with a frame, instead it only makes sense to retrieving configuration
+values at the time of request completion. In that case read-only requests can be
+used that only allow buffers to be queued and not configuration values. Which
+type of requests (regular or read-only) are supported is signalled through
+:ref:`buffer capabilities <v4l2-buf-capabilities>`.
+
 General Usage
 -------------
 
@@ -72,6 +79,10 @@ A queued request cannot be modified anymore.
    output buffers, not for capture buffers. Attempting to add a capture buffer
    to a request will result in an ``EBADR`` error.
 
+If the buffer type supports only read-only requests, and the request contains
+configuration values such as controls, then ``EINVAL`` is returned since no
+configuration values are allowed when submitting a read-only request.
+
 If the request contains configurations for multiple entities, individual drivers
 may synchronize so the requested pipeline's topology is applied before the
 buffers are processed. Media controller drivers do a best effort implementation
diff --git a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
index 50ea72043bb0..0451da50de51 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
@@ -117,6 +117,7 @@ aborting or finishing any DMA in progress, an implicit
 .. _V4L2-BUF-CAP-SUPPORTS-ORPHANED-BUFS:
 .. _V4L2-BUF-CAP-SUPPORTS-M2M-HOLD-CAPTURE-BUF:
 .. _V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS:
+.. _V4L2-BUF-CAP-SUPPORTS-RO-REQUESTS:
 
 .. raw:: latex
 
@@ -143,6 +144,7 @@ aborting or finishing any DMA in progress, an implicit
     * - ``V4L2_BUF_CAP_SUPPORTS_REQUESTS``
       - 0x00000008
       - This buffer type supports :ref:`requests <media-request-api>`.
+        This flag is mutually exclusive with ``V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS``.
     * - ``V4L2_BUF_CAP_SUPPORTS_ORPHANED_BUFS``
       - 0x00000010
       - The kernel allows calling :ref:`VIDIOC_REQBUFS` while buffers are still
@@ -160,6 +162,10 @@ aborting or finishing any DMA in progress, an implicit
         queue is used for :ref:`memory mapping <mmap>` streaming I/O. See
         :ref:`V4L2_BUF_FLAG_NO_CACHE_INVALIDATE <V4L2-BUF-FLAG-NO-CACHE-INVALIDATE>` and
         :ref:`V4L2_BUF_FLAG_NO_CACHE_CLEAN <V4L2-BUF-FLAG-NO-CACHE-CLEAN>`.
+    * - ``V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS``
+      - 0x00000080
+      - This buffer type supports read-only :ref:`requests <media-request-api>`.
+        This flag is mutually exclusive with ``V4L2_BUF_CAP_SUPPORTS_REQUESTS``.
 
 .. raw:: latex
 
-- 
2.30.2

