Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D6855A630B
	for <lists+linux-media@lfdr.de>; Tue, 30 Aug 2022 14:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbiH3MQo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Aug 2022 08:16:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbiH3MQm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Aug 2022 08:16:42 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74BD1AB188
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 05:16:41 -0700 (PDT)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27U97Ujs028671;
        Tue, 30 Aug 2022 14:16:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=ABaUSPMcGFQRZBlJJ8VLV4LzmOa70Z6qC2E0EUutZxE=;
 b=HEuaF3kaB7LsUCGRDIwXUd7q39atVqmFPRw1gAA7cIMqcJ72oYAQVnEmN/9dRaWAERPS
 rYYLYxlwpvF12DLMicqhahN/UuCcwzjz75H7cZ3P9TS3/p1nFy5lrkDaK7ynfAFYiOtX
 +l08GkRmrfYZc+N4dOcyhuDjvRmHwKdz4xIzw0W7MBgR2fUJ/utkJNtkiA4z4L5Qz2/s
 WVIRNbpjhiId2gVlHcG2YRA6sssUJrQerj/C+ivnTH4G/zZ76FbFS/SIe9f+jeBfgeJy
 jUJV0LQBVZ1YCbWeQtdR68eg9iMT3hqrL7aXnku646wEbVA/C7iqMTYseyN5sQdiW3Iq MA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3j9fmy130k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 30 Aug 2022 14:16:35 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6D29F10002A;
        Tue, 30 Aug 2022 14:16:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 68C1C226FDC;
        Tue, 30 Aug 2022 14:16:35 +0200 (CEST)
Received: from localhost (10.75.127.44) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.7; Tue, 30 Aug
 2022 14:16:35 +0200
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To:     <linux-media@vger.kernel.org>
CC:     <alain.volmat@foss.st.com>, <hugues.fruchet@foss.st.com>,
        <sylvain.petinot@foss.st.com>, <dave.stevenson@raspberrypi.com>,
        <sakari.ailus@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>,
        <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH v4 2/4] media: v4l: ctrls: Add a control for HDR mode
Date:   Tue, 30 Aug 2022 14:16:06 +0200
Message-ID: <20220830121608.12047-3-benjamin.mugnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220830121608.12047-1-benjamin.mugnier@foss.st.com>
References: <20220830121608.12047-1-benjamin.mugnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-30_06,2022-08-30_01,2022-06-22_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add V4L2_CID_HDR_MODE as a menu item control to set the HDR mode of the
sensor, and its documentation.
Menu items are not standardized as they differ for each sensors.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 .../userspace-api/media/v4l/ext-ctrls-camera.rst          | 8 ++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c                 | 2 ++
 include/uapi/linux/v4l2-controls.h                        | 2 ++
 3 files changed, 12 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
index 4c5061aa9cd4..0ee09ff250e7 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-camera.rst
@@ -661,3 +661,11 @@ enum v4l2_scene_mode -
 .. [#f1]
    This control may be changed to a menu control in the future, if more
    options are required.
+
+``V4L2_CID_HDR_MODE (menu)``
+    Change the sensor HDR mode. A HDR picture is obtained by merging two
+    captures of the same scene using two different exposure periods. HDR mode
+    describes the way these two captures are merged in the sensor.
+
+    As modes differ for each sensor, menu items are not standardized by this
+    control and are left to the programmer.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index e22921e7ea61..0854de1ef1a5 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1043,6 +1043,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_UNIT_CELL_SIZE:		return "Unit Cell Size";
 	case V4L2_CID_CAMERA_ORIENTATION:	return "Camera Orientation";
 	case V4L2_CID_CAMERA_SENSOR_ROTATION:	return "Camera Sensor Rotation";
+	case V4L2_CID_HDR_MODE:			return "HDR mode";
 
 	/* FM Radio Modulator controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1370,6 +1371,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_STATELESS_H264_START_CODE:
 	case V4L2_CID_CAMERA_ORIENTATION:
 	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:
+	case V4L2_CID_HDR_MODE:
 		*type = V4L2_CTRL_TYPE_MENU;
 		break;
 	case V4L2_CID_LINK_FREQ:
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 5f46bf4a570c..5dfd38b09768 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1013,6 +1013,8 @@ enum v4l2_auto_focus_range {
 
 #define V4L2_CID_CAMERA_SENSOR_ROTATION		(V4L2_CID_CAMERA_CLASS_BASE+35)
 
+#define V4L2_CID_HDR_MODE			(V4L2_CID_CAMERA_CLASS_BASE+36)
+
 /* FM Modulator class control IDs */
 
 #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)
-- 
2.25.1

