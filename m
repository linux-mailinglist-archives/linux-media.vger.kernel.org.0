Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC725FB22D
	for <lists+linux-media@lfdr.de>; Tue, 11 Oct 2022 14:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbiJKMQu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Oct 2022 08:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbiJKMQg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Oct 2022 08:16:36 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95ABE558EA
        for <linux-media@vger.kernel.org>; Tue, 11 Oct 2022 05:16:32 -0700 (PDT)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29B8WQiK029025;
        Tue, 11 Oct 2022 14:16:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=dOtZLIKS1GQiuz4nvL5HL95q1vv+3b68sY288kUJMwA=;
 b=CJfAJ4NP3SetvxeLWoG45rYatLv9PYAho65ct/SzQa6PYg9f5SOcTg9YaxGeEPbEshUR
 Yz0/ejnEAcN3noHj17FF+kc/oNrnkxWtGgT2JqdNdXtlaBJuyBnHxaQtxf3wKw/3GwkZ
 8JJyuVI8pgJ5s7MkZpvKA244pEErlrywwQqDkuAo+rvLah7pwqGoxvekV2C9OAodvlnq
 eCk4RQ+UL5MSTXILDOBXtyPTl7maJQY+fOUywoI51SV7noKlN/eVLblsrT3WRtpozyU5
 qNszYfdUMk1HsDYFkzZeu/kChKs2/T9gIHSkgxt4NryvYJQaHdicU9VCpwrcegjg+4Nv Dg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k31gpu487-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 11 Oct 2022 14:16:25 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 1011E10002A;
        Tue, 11 Oct 2022 14:16:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 09568226FB7;
        Tue, 11 Oct 2022 14:16:21 +0200 (CEST)
Received: from localhost (10.75.127.119) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Tue, 11 Oct
 2022 14:16:20 +0200
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To:     <linux-media@vger.kernel.org>
CC:     <alain.volmat@foss.st.com>, <hugues.fruchet@foss.st.com>,
        <sylvain.petinot@foss.st.com>, <dave.stevenson@raspberrypi.com>,
        <sakari.ailus@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>,
        <kieran.bingham@ideasonboard.com>, <nicolas@ndufresne.ca>,
        <hverkuil@xs4all.nl>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH v7 1/5] media: v4l: Add 1X16 16-bit greyscale media bus code definition
Date:   Tue, 11 Oct 2022 14:16:01 +0200
Message-ID: <20221011121605.30260-1-benjamin.mugnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221011120555.28889-1-benjamin.mugnier@foss.st.com>
References: <20221011120555.28889-1-benjamin.mugnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.119]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-11_07,2022-10-11_02,2022-06-22_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../media/v4l/subdev-formats.rst              | 37 +++++++++++++++++++
 include/uapi/linux/media-bus-format.h         |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index d21d532eee15..16ef3b41932e 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -6057,6 +6057,43 @@ the following codes.
       - y\ :sub:`2`
       - y\ :sub:`1`
       - y\ :sub:`0`
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
     * .. _MEDIA-BUS-FMT-UYVY8-1X16:
 
       - MEDIA_BUS_FMT_UYVY8_1X16
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index ec3323dbb927..ca9a24c874da 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -69,7 +69,7 @@
 #define MEDIA_BUS_FMT_RGB121212_1X36		0x1019
 #define MEDIA_BUS_FMT_RGB161616_1X48		0x101a
 
-/* YUV (including grey) - next is	0x202e */
+/* YUV (including grey) - next is	0x202f */
 #define MEDIA_BUS_FMT_Y8_1X8			0x2001
 #define MEDIA_BUS_FMT_UV8_1X8			0x2015
 #define MEDIA_BUS_FMT_UYVY8_1_5X8		0x2002
@@ -92,6 +92,7 @@
 #define MEDIA_BUS_FMT_YUYV12_2X12		0x201e
 #define MEDIA_BUS_FMT_YVYU12_2X12		0x201f
 #define MEDIA_BUS_FMT_Y14_1X14			0x202d
+#define MEDIA_BUS_FMT_Y16_1X16			0x202e
 #define MEDIA_BUS_FMT_UYVY8_1X16		0x200f
 #define MEDIA_BUS_FMT_VYUY8_1X16		0x2010
 #define MEDIA_BUS_FMT_YUYV8_1X16		0x2011
-- 
2.25.1

