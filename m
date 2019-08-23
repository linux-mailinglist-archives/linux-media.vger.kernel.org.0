Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8CEC9AF1D
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 14:21:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390980AbfHWMVG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 08:21:06 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:47339 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732316AbfHWMVG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 08:21:06 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 18YtikrR6Thuu18YxiozdL; Fri, 23 Aug 2019 14:21:03 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv10 2/2] cec: document CEC_ADAP_G_CONNECTOR_INFO and capability
Date:   Fri, 23 Aug 2019 14:20:59 +0200
Message-Id: <20190823122059.5270-3-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190823122059.5270-1-hverkuil-cisco@xs4all.nl>
References: <20190823122059.5270-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfKh+SZzZ2rShfi+p8vWdWdkw+bHyBRsIuueZcTujRPG5yVjmn4iotge5YX9orx7VYY7kWh5ODCpy2itE4U2kriexfTmLqTbCENn9vysS3vFjy4SyGKxn
 1K6Pb2YbKI65Ala+U34x/+ZCTcrfGWEKcvr5W9ffjjPqR6vp3Fm5q9UCjwFaugwF0sr+RykKZmtHaz2Ec4bNDZNtVjZkBUZon+SSSrlV5AEvQlnPo5vOb3i4
 gRoHGGmNBSdy7BP+CYMWMnout9kJZUJCliyMX1ofFPrZBtndLWB+dYbQ2n0ccHxI
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document the new CEC_ADAP_G_CONNECTOR_INFO ioctl and the new
CEC_CAP_CONNECTOR_INFO capability.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
Co-developed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
[hverkuil-cisco@xs4all.nl: added CEC_CAP_CONNECTOR_INFO]
[hverkuil-cisco@xs4all.nl: added DQEVENT have_conn_info]
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/media/uapi/cec/cec-funcs.rst    |   1 +
 .../media/uapi/cec/cec-ioc-adap-g-caps.rst    |   6 +-
 .../uapi/cec/cec-ioc-adap-g-conn-info.rst     | 105 ++++++++++++++++++
 .../media/uapi/cec/cec-ioc-dqevent.rst        |   8 ++
 4 files changed, 119 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/media/uapi/cec/cec-ioc-adap-g-conn-info.rst

diff --git a/Documentation/media/uapi/cec/cec-funcs.rst b/Documentation/media/uapi/cec/cec-funcs.rst
index 620590b168c9..dc6da9c639a8 100644
--- a/Documentation/media/uapi/cec/cec-funcs.rst
+++ b/Documentation/media/uapi/cec/cec-funcs.rst
@@ -24,6 +24,7 @@ Function Reference
     cec-ioc-adap-g-caps
     cec-ioc-adap-g-log-addrs
     cec-ioc-adap-g-phys-addr
+    cec-ioc-adap-g-conn-info
     cec-ioc-dqevent
     cec-ioc-g-mode
     cec-ioc-receive
diff --git a/Documentation/media/uapi/cec/cec-ioc-adap-g-caps.rst b/Documentation/media/uapi/cec/cec-ioc-adap-g-caps.rst
index 0c44f31a9b59..76761a98c312 100644
--- a/Documentation/media/uapi/cec/cec-ioc-adap-g-caps.rst
+++ b/Documentation/media/uapi/cec/cec-ioc-adap-g-caps.rst
@@ -135,8 +135,12 @@ returns the information to the application. The ioctl never fails.
       - The CEC hardware can monitor CEC pin changes from low to high voltage
         and vice versa. When in pin monitoring mode the application will
 	receive ``CEC_EVENT_PIN_CEC_LOW`` and ``CEC_EVENT_PIN_CEC_HIGH`` events.
+    * .. _`CEC-CAP-CONNECTOR-INFO`:
 
-
+      - ``CEC_CAP_CONNECTOR_INFO``
+      - 0x00000100
+      - If this capability is set, then :ref:`CEC_ADAP_G_CONNECTOR_INFO` can
+        be used.
 
 Return Value
 ============
diff --git a/Documentation/media/uapi/cec/cec-ioc-adap-g-conn-info.rst b/Documentation/media/uapi/cec/cec-ioc-adap-g-conn-info.rst
new file mode 100644
index 000000000000..a21659d55c6b
--- /dev/null
+++ b/Documentation/media/uapi/cec/cec-ioc-adap-g-conn-info.rst
@@ -0,0 +1,105 @@
+.. SPDX-License-Identifier: GPL-2.0
+..
+.. Copyright 2019 Google LLC
+..
+.. _CEC_ADAP_G_CONNECTOR_INFO:
+
+*******************************
+ioctl CEC_ADAP_G_CONNECTOR_INFO
+*******************************
+
+Name
+====
+
+CEC_ADAP_G_CONNECTOR_INFO - Query HDMI connector information
+
+Synopsis
+========
+
+.. c:function:: int ioctl( int fd, CEC_ADAP_G_CONNECTOR_INFO, struct cec_connector_info *argp )
+    :name: CEC_ADAP_G_CONNECTOR_INFO
+
+Arguments
+=========
+
+``fd``
+    File descriptor returned by :c:func:`open() <cec-open>`.
+
+``argp``
+
+
+Description
+===========
+
+Using this ioctl an application can learn which HDMI connector this CEC
+device corresponds to. While calling this ioctl the application should
+provide a pointer to a cec_connector_info struct which will be populated
+by the kernel with the info provided by the adapter's driver. This ioctl
+is only available if the ``CEC_CAP_CONNECTOR_INFO`` capability is set.
+
+.. tabularcolumns:: |p{1.0cm}|p{4.4cm}|p{2.5cm}|p{9.6cm}|
+
+.. c:type:: cec_connector_info
+
+.. flat-table:: struct cec_connector_info
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 1 1 8
+
+    * - __u32
+      - ``type``
+      - The type of connector this adapter is associated with.
+    * - union
+      - ``(anonymous)``
+      -
+    * -
+      - ``struct cec_drm_connector_info``
+      - drm
+      - :ref:`cec-drm-connector-info`
+
+
+.. tabularcolumns:: |p{4.4cm}|p{2.5cm}|p{10.6cm}|
+
+.. _connector-type:
+
+.. flat-table:: Connector types
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       3 1 8
+
+    * .. _`CEC-CONNECTOR-TYPE-NO-CONNECTOR`:
+
+      - ``CEC_CONNECTOR_TYPE_NO_CONNECTOR``
+      - 0
+      - No connector is associated with the adapter/the information is not
+        provided by the driver.
+    * .. _`CEC-CONNECTOR-TYPE-DRM`:
+
+      - ``CEC_CONNECTOR_TYPE_DRM``
+      - 1
+      - Indicates that a DRM connector is associated with this adapter.
+        Information about the connector can be found in
+	:ref:`cec-drm-connector-info`.
+
+.. tabularcolumns:: |p{4.4cm}|p{2.5cm}|p{10.6cm}|
+
+.. c:type:: cec_drm_connector_info
+
+.. _cec-drm-connector-info:
+
+.. flat-table:: struct cec_drm_connector_info
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       3 1 8
+
+    * .. _`CEC-DRM-CONNECTOR-TYPE-CARD-NO`:
+
+      - __u32
+      - ``card_no``
+      - DRM card number: the number from a card's path, e.g. 0 in case of
+        /dev/card0.
+    * .. _`CEC-DRM-CONNECTOR-TYPE-CONNECTOR_ID`:
+
+      - __u32
+      - ``connector_id``
+      - DRM connector ID.
diff --git a/Documentation/media/uapi/cec/cec-ioc-dqevent.rst b/Documentation/media/uapi/cec/cec-ioc-dqevent.rst
index 46a1c99a595e..5e21b1fbfc01 100644
--- a/Documentation/media/uapi/cec/cec-ioc-dqevent.rst
+++ b/Documentation/media/uapi/cec/cec-ioc-dqevent.rst
@@ -70,6 +70,14 @@ it is guaranteed that the state did change in between the two events.
         addresses are claimed or if ``phys_addr`` is ``CEC_PHYS_ADDR_INVALID``.
 	If bit 15 is set (``1 << CEC_LOG_ADDR_UNREGISTERED``) then this device
 	has the unregistered logical address. In that case all other bits are 0.
+    * - __u16
+      - ``have_conn_info``
+      - If non-zero, then HDMI connector information is available.
+        This field is only valid if ``CEC_CAP_CONNECTOR_INFO`` is set. If that
+        capability is set and ``have_conn_info`` is zero, then that indicates
+        that the HDMI connector device is not instantiated, either because
+        the HDMI driver is still configuring the device or because the HDMI
+        device was unbound.
 
 
 .. c:type:: cec_event_lost_msgs
-- 
2.20.1

