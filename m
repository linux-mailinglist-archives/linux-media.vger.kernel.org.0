Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA9FE517E8
	for <lists+linux-media@lfdr.de>; Mon, 24 Jun 2019 18:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731483AbfFXQDl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Jun 2019 12:03:41 -0400
Received: from lb1-smtp-cloud7.xs4all.net ([194.109.24.24]:41047 "EHLO
        lb1-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729496AbfFXQDk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Jun 2019 12:03:40 -0400
Received: from tschai.fritz.box ([46.9.252.75])
        by smtp-cloud7.xs4all.net with ESMTPA
        id fRRKhHRxHF85OfRRShZab5; Mon, 24 Jun 2019 18:03:38 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        dri-devel@lists.freedesktop.org,
        Cheng-yi Chiang <cychiang@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv8 05/13] cec: document CEC_ADAP_G_CONNECTOR_INFO
Date:   Mon, 24 Jun 2019 18:03:22 +0200
Message-Id: <20190624160330.38048-6-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl>
References: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfJHC8gnzmC6VsiHnhAT8Mnidw5ZU62gn3HZHqKNX7UVaXyuhfnr8nar7qUT3qlGmLsDkHKBOJjxOpQkAxPvSMU3uLSYaB+Wh29+IGNwTHaGSotCleMaH
 jydz2acYQRgsFtg5uESRnzo2+IhsZuls1iSK2+Qfkk2rRICKaq20ln8sxj5KvqE5TGegRK8uzBLdcF1HlbC6OaX8lMJjgnGzWc0jjfkuWs4X7YDCfmEum+4X
 EcZCyIsFh8k2xFRLcU5Gc0W61YkPGvB1b8ApD3uhy0omGT08+E7McH1Hf2S5Ig/VzyXS/OrQ4ZvogWElIONKW9fR0hITkbJmUhYwMOL6l1o=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Document the new CEC_ADAP_G_CONNECTOR_INFO ioctl.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/media/uapi/cec/cec-funcs.rst    |   1 +
 .../uapi/cec/cec-ioc-adap-g-conn-info.rst     | 109 ++++++++++++++++++
 2 files changed, 110 insertions(+)
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
diff --git a/Documentation/media/uapi/cec/cec-ioc-adap-g-conn-info.rst b/Documentation/media/uapi/cec/cec-ioc-adap-g-conn-info.rst
new file mode 100644
index 000000000000..87f475d7dfed
--- /dev/null
+++ b/Documentation/media/uapi/cec/cec-ioc-adap-g-conn-info.rst
@@ -0,0 +1,109 @@
+.. SPDX-License-Identifier: GPL-2.0
+..
+.. Copyright 2019 Google LLC
+..
+.. This documentation is free software; you can redistribute it and/or
+.. modify it under the terms of the GNU General Public License
+.. version 2 as published by the Free Software Foundation.
+..
+.. This documentation is distributed in the hope that it will be useful,
+.. but WITHOUT ANY WARRANTY; without even the implied warranty of
+.. MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
+.. GNU General Public License for more details.
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
+provide pointer to a cec_connector_info struct which will be populated
+by the kernel with the info provided by the adapter's driver. Not all
+drivers supply this information.
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
+      - :ref:`cec-drm-connector-info`.
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
+      - No connector is associated with the adapter/the information is not provided by the driver.
+    * .. _`CEC-CONNECTOR-TYPE-DRM`:
+
+      - ``CEC_CONNECTOR_TYPE_DRM``
+      - 1
+      - Indicates that a DRM connector is associated with this adapter. Info about the
+        connector can be found in :ref:`cec-drm-connector-info`.
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
+      - DRM card number - the digit from a card's path, e.g. 0 in case of /dev/card0.
+    * .. _`CEC-DRM-CONNECTOR-TYPE-CONNECTOR_ID`:
+
+      - __u32
-- 
2.20.1

