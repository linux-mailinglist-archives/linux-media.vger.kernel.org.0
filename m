Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6B351C93DD
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2020 17:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728003AbgEGPKC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 May 2020 11:10:02 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:44663 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726308AbgEGPKB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 May 2020 11:10:01 -0400
Received: from localhost.localdomain (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 417AB200021;
        Thu,  7 May 2020 15:09:57 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     linux-media@vger.kernel.org, libcamera-devel@lists.libcamera.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org, laurent.pinchart@ideasonboard.com,
        Hans Verkuil <hans.verkuil@cisco.com>
Subject: [PATCH v7 6/6] v4l: document VIDIOC_SUBDEV_QUERYCAP
Date:   Thu,  7 May 2020 17:12:53 +0200
Message-Id: <20200507151253.2951492-7-jacopo@jmondi.org>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200507151253.2951492-1-jacopo@jmondi.org>
References: <20200507151253.2951492-1-jacopo@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Hans Verkuil <hans.verkuil@cisco.com>

Add documentation for the new VIDIOC_SUBDEV_QUERYCAP ioctl.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hans.verkuil@cisco.com>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 .../userspace-api/media/v4l/user-func.rst     |   1 +
 .../media/v4l/vidioc-subdev-querycap.rst      | 112 ++++++++++++++++++
 2 files changed, 113 insertions(+)
 create mode 100644 Documentation/userspace-api/media/v4l/vidioc-subdev-querycap.rst

diff --git a/Documentation/userspace-api/media/v4l/user-func.rst b/Documentation/userspace-api/media/v4l/user-func.rst
index f235f88efe891..bf77c842718e5 100644
--- a/Documentation/userspace-api/media/v4l/user-func.rst
+++ b/Documentation/userspace-api/media/v4l/user-func.rst
@@ -78,6 +78,7 @@ Function Reference
     vidioc-subdev-g-fmt
     vidioc-subdev-g-frame-interval
     vidioc-subdev-g-selection
+    vidioc-subdev-querycap
     vidioc-subscribe-event
     func-mmap
     func-munmap
diff --git a/Documentation/userspace-api/media/v4l/vidioc-subdev-querycap.rst b/Documentation/userspace-api/media/v4l/vidioc-subdev-querycap.rst
new file mode 100644
index 0000000000000..0371a76321af8
--- /dev/null
+++ b/Documentation/userspace-api/media/v4l/vidioc-subdev-querycap.rst
@@ -0,0 +1,112 @@
+.. Permission is granted to copy, distribute and/or modify this
+.. document under the terms of the GNU Free Documentation License,
+.. Version 1.1 or any later version published by the Free Software
+.. Foundation, with no Invariant Sections, no Front-Cover Texts
+.. and no Back-Cover Texts. A copy of the license is included at
+.. Documentation/userspace-api/media/fdl-appendix.rst.
+..
+.. TODO: replace it to GFDL-1.1-or-later WITH no-invariant-sections
+
+.. _VIDIOC_SUBDEV_QUERYCAP:
+
+****************************
+ioctl VIDIOC_SUBDEV_QUERYCAP
+****************************
+
+Name
+====
+
+VIDIOC_SUBDEV_QUERYCAP - Query sub-device capabilities
+
+
+Synopsis
+========
+
+.. c:function:: int ioctl( int fd, VIDIOC_SUBDEV_QUERYCAP, struct v4l2_subdev_capability *argp )
+    :name: VIDIOC_SUBDEV_QUERYCAP
+
+
+Arguments
+=========
+
+``fd``
+    File descriptor returned by :ref:`open() <func-open>`.
+
+``argp``
+    Pointer to struct :c:type:`v4l2_subdev_capability`.
+
+
+Description
+===========
+
+All V4L2 sub-devices support the ``VIDIOC_SUBDEV_QUERYCAP`` ioctl. It is used to
+identify kernel devices compatible with this specification and to obtain
+information about driver and hardware capabilities. The ioctl takes a pointer to
+a struct :c:type:`v4l2_subdev_capability` which is filled by the driver. When
+the driver is not compatible with this specification the ioctl returns
+``ENOTTY`` error code.
+
+.. tabularcolumns:: |p{1.5cm}|p{2.5cm}|p{13cm}|
+
+.. c:type:: v4l2_subdev_capability
+
+.. flat-table:: struct v4l2_subdev_capability
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       3 4 20
+
+    * - __u32
+      - ``version``
+      - Version number of the driver.
+
+	The version reported is provided by the V4L2 subsystem following the
+	kernel numbering scheme. However, it may not always return the same
+	version as the kernel if, for example, a stable or
+	distribution-modified kernel uses the V4L2 stack from a newer kernel.
+
+	The version number is formatted using the ``KERNEL_VERSION()``
+	macro:
+    * - :cspan:`2`
+
+	``#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))``
+
+	``__u32 version = KERNEL_VERSION(0, 8, 1);``
+
+	``printf ("Version: %u.%u.%u\\n",``
+
+	``(version >> 16) & 0xFF, (version >> 8) & 0xFF, version & 0xFF);``
+    * - __u32
+      - ``capabilities``
+      - Sub-device capabilities of the opened device, see
+	:ref:`subdevice-capabilities`.
+    * - __u32
+      - ``reserved``\ [14]
+      - Reserved for future extensions. Set to 0 by the V4L2 core.
+
+.. tabularcolumns:: |p{6cm}|p{2.2cm}|p{8.8cm}|
+
+.. _subdevice-capabilities:
+
+.. cssclass:: longtable
+
+.. flat-table:: Sub-Device Capabilities Flags
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       3 1 4
+
+    * - V4L2_SUBDEV_CAP_RO_SUBDEV
+      - 0x00000001
+      - The sub-device device node is registered in read-only mode.
+	Access to the sub-device ioctls that modify the device state is
+	restricted. Refer to each individual subdevice ioctl documentation
+	for a description of which restrictions apply to a read-only sub-device.
+
+Return Value
+============
+
+On success 0 is returned, on error -1 and the ``errno`` variable is set
+appropriately. The generic error codes are described at the
+:ref:`Generic Error Codes <gen-errors>` chapter.
+
+ENOTTY
+    The device node is not a V4L2 sub-device.
-- 
2.26.1

