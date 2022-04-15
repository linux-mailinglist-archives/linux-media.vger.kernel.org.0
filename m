Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 212B45028CC
	for <lists+linux-media@lfdr.de>; Fri, 15 Apr 2022 13:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352655AbiDOLVn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Apr 2022 07:21:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352630AbiDOLVh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Apr 2022 07:21:37 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D99A18F9AA
        for <linux-media@vger.kernel.org>; Fri, 15 Apr 2022 04:19:09 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23F8nOv6016362;
        Fri, 15 Apr 2022 13:19:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=V0RCXxUOU5lBmkDwLkBgc3A+UiLWdWdOm3CZTXT9WZo=;
 b=dJJpQT7mALaCrF8Mh8OetiCU2X7rxQa9mDCGHCSJMpA1Ce6rjfH4VzzJbaA1wbk3TpE+
 rlNlhpiYWAIh1wJDBOQFT+tUmEijJmYXdsy1Wrqyjsnd+XVajXnJ8THZVi1FBIKvJhxp
 AgFJvJBA5FhYeRGzzXXWUCxTgCcWXiO5QIABlhiv0YU/HakzXfuGHZLOzHahrw40OnEc
 kk5DfTtmhAgiIFExiZefOZoNXR5jglUeexzEGaX4yoII9zKAc+09kS+aHSkAQ+ZD2gbN
 +IXQpYP9bPq6zHVB90cHByk6kXqSZVomttSqQkAKry1Yf3J++nqICySXhSjC5No/LpSh yQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fb74qt3ag-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Apr 2022 13:19:01 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 351EC100034;
        Fri, 15 Apr 2022 13:19:01 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node1.st.com [10.75.127.4])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2D5DE21E672;
        Fri, 15 Apr 2022 13:19:01 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE1.st.com (10.75.127.4)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Fri, 15 Apr 2022 13:19:00
 +0200
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To:     <linux-media@vger.kernel.org>
CC:     <alain.volmat@foss.st.com>, <hugues.fruchet@foss.st.com>,
        <sylvain.petinot@foss.st.com>, <dave.stevenson@raspberrypi.com>,
        <sakari.ailus@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>,
        <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH v2 1/5] media: v4l: Add 1X16 16-bit greyscale media bus code definition
Date:   Fri, 15 Apr 2022 13:18:41 +0200
Message-ID: <20220415111845.27130-2-benjamin.mugnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220415111845.27130-1-benjamin.mugnier@foss.st.com>
References: <20220415111845.27130-1-benjamin.mugnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE1.st.com
 (10.75.127.4)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-15_04,2022-04-15_01,2022-02-23_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This extends the greyscale media bus family originally from
MEDIA_BUS_FMT_Y8_1X8 up to MEDIA_BUS_FMT_Y14_1X14 by adding
MEDIA_BUS_FMT_Y16_1X16, and behaves the same way with 16 bits.
Add its documentation in subdev-formats.rst

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 .../media/v4l/subdev-formats.rst              | 37 +++++++++++++++++++
 include/uapi/linux/media-bus-format.h         |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 0cbc045d5df6..b8bb16c70d62 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -7387,6 +7387,43 @@ The following table list existing packed 36bit wide YUV formats.
       - v\ :sub:`2`
       - v\ :sub:`1`
       - v\ :sub:`0`
+    * .. _MEDIA-BUS-FMT-Y16-1X16:
+
+      - MEDIA_BUS_FMT_Y16_1X16
+      - 0x202e
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      - y\ :sub:`15`
+      - y\ :sub:`14`
+      - y\ :sub:`13`
+      - y\ :sub:`12`
+      - y\ :sub:`11`
+      - y\ :sub:`10`
+      - y\ :sub:`9`
+      - y\ :sub:`8`
+      - y\ :sub:`7`
+      - y\ :sub:`6`
+      - y\ :sub:`5`
+      - y\ :sub:`4`
+      - y\ :sub:`3`
+      - y\ :sub:`2`
+      - y\ :sub:`1`
+      - y\ :sub:`0`
 
 
 .. raw:: latex
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index 0dfc11ee243a..0b436759d94d 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -65,7 +65,7 @@
 #define MEDIA_BUS_FMT_RGB121212_1X36		0x1019
 #define MEDIA_BUS_FMT_RGB161616_1X48		0x101a
 
-/* YUV (including grey) - next is	0x202e */
+/* YUV (including grey) - next is	0x202f */
 #define MEDIA_BUS_FMT_Y8_1X8			0x2001
 #define MEDIA_BUS_FMT_UV8_1X8			0x2015
 #define MEDIA_BUS_FMT_UYVY8_1_5X8		0x2002
@@ -111,6 +111,7 @@
 #define MEDIA_BUS_FMT_YUV12_1X36		0x2029
 #define MEDIA_BUS_FMT_YUV16_1X48		0x202a
 #define MEDIA_BUS_FMT_UYYVYY16_0_5X48		0x202b
+#define MEDIA_BUS_FMT_Y16_1X16			0x202e
 
 /* Bayer - next is	0x3021 */
 #define MEDIA_BUS_FMT_SBGGR8_1X8		0x3001
-- 
2.25.1

