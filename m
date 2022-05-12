Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 805D3524731
	for <lists+linux-media@lfdr.de>; Thu, 12 May 2022 09:43:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351122AbiELHnD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 May 2022 03:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351119AbiELHnB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 May 2022 03:43:01 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 690181A15D7
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 00:43:00 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24C1bPNh016797;
        Thu, 12 May 2022 09:42:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=Dk4jB0qOiGtssuTmZb1vAWn4iphmwptwfFSFrB7k0a4=;
 b=H6JU/BnKFEYNqnpM4UvO0jTZOuVSwxK2a8/7HElVDI4Q7yzpfrTXEvGt2jg+eWkRhSkG
 nB6pKA6JPoJCznTJ94ki6pTf7nqNYI1pr+h3Tp9nY8fy4r0pev+hLgwd8xvq9cZgdUHD
 6GtRdPkWywvqOb3WqiyDR3lM4NZ+cg7Z60VRS2ljkFzntmlpOpUcm9s984I7Oe4O4FQi
 bLvZNnJC3CtIo4eccQUXDAciKiiojmTUIQkXMH5CBgK3GnMAr6t4ZjJWmBVZsRCVqpaP
 HiR/nV+91xkuWk4hGc+JnZ9At+Zzw+3Ihe/7KZPzOtsHX6/gIwaXpM9HWG5l23Ephh/v kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3g083hyy6p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 12 May 2022 09:42:55 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ACB6010003A;
        Thu, 12 May 2022 09:42:14 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A60C721683D;
        Thu, 12 May 2022 09:42:14 +0200 (CEST)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 12 May 2022 09:42:14
 +0200
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To:     <linux-media@vger.kernel.org>
CC:     <alain.volmat@foss.st.com>, <hugues.fruchet@foss.st.com>,
        <sylvain.petinot@foss.st.com>, <dave.stevenson@raspberrypi.com>,
        <sakari.ailus@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>,
        <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH v3 3/5] media: uapi: Add ST VGXY61 header file
Date:   Thu, 12 May 2022 09:40:35 +0200
Message-ID: <20220512074037.3829926-4-benjamin.mugnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220512074037.3829926-1-benjamin.mugnier@foss.st.com>
References: <20220512074037.3829926-1-benjamin.mugnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_07,2022-05-12_01,2022-02-23_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Define an HDR control in it, and adds its documentation in st-vgxy61.rst
file.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 .../userspace-api/media/drivers/st-vgxy61.rst | 23 +++++++++++++++++++
 include/uapi/linux/st-vgxy61.h                | 15 ++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 Documentation/userspace-api/media/drivers/st-vgxy61.rst
 create mode 100644 include/uapi/linux/st-vgxy61.h

diff --git a/Documentation/userspace-api/media/drivers/st-vgxy61.rst b/Documentation/userspace-api/media/drivers/st-vgxy61.rst
new file mode 100644
index 000000000000..7a11adbb558f
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/st-vgxy61.rst
@@ -0,0 +1,23 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+ST VGXY61 camera sensor driver
+==============================
+
+The ST VGXY61 driver implements the following driver-specific controls:
+
+``V4L2_CID_STVGXY61_HDR``
+-------------------------------
+    Change the sensor HDR mode. A HDR picture is obtained by merging two captures of the same scene
+    using two different exposure periods.
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths:       1 4
+
+    * - HDR linearize
+      - The merger outputs a long exposure capture as long as it is not saturated.
+    * - HDR substraction
+      - This involves subtracting the short exposure frame from the long exposure frame.
+    * - "no HDR"
+      - This mode is used for standard dynamic range (SDR) exposures.
diff --git a/include/uapi/linux/st-vgxy61.h b/include/uapi/linux/st-vgxy61.h
new file mode 100644
index 000000000000..fbabe2cb64ac
--- /dev/null
+++ b/include/uapi/linux/st-vgxy61.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2022 STMicroelectronics SA
+ *
+ */
+
+#ifndef __UAPI_STVGXY61_H_
+#define __UAPI_STVGXY61_H_
+
+#include <linux/v4l2-controls.h>
+
+/* Control HDR mode */
+#define V4L2_CID_STVGXY61_HDR	(V4L2_CID_USER_STVGXY61_BASE + 0)
+
+#endif /* __UAPI_STVGXY61_H_ */
-- 
2.25.1

