Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B4C15EBD8E
	for <lists+linux-media@lfdr.de>; Tue, 27 Sep 2022 10:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231403AbiI0IjN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Sep 2022 04:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231735AbiI0Iiv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Sep 2022 04:38:51 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83C76CBAF5
        for <linux-media@vger.kernel.org>; Tue, 27 Sep 2022 01:37:55 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28R7TFUe013191;
        Tue, 27 Sep 2022 10:37:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=fKnYzdrEABWZO37keqOg6jgonNVQMe1IhdZRYRDZPCk=;
 b=K5hwKP1Skk9vweEUrNaVykZ3ke7MtBfd2IH6kjmlHgT5TbyKHOgEQibtIcVPz9vZ70ll
 uhmDqknYJLdgv7ZlEFX17PlRA9TnmaoW4BOinn+va2gG+bMwpC7vdlHptNYY2WIN2iL7
 +uj9jL6Lmv63pa8dzhXDnyBLZ64KhOBdcOl5cTQtY2JYaMgGt342+oMR1p8MEZAaIdPR
 ZheGqJ6m8es4pxC3KkPmOQsUh4Mhz68E4lSqhk/njMevt4LSXWTPorVg0+2esGeSXeBE
 dCCVuvVp3OryWDPKRgdrAbmm5QZkvXcvUIxS9JZwBmPtJjDN/QXoJwPyXST3vq5GUHfc XA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3jsqam8akn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 27 Sep 2022 10:37:19 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 045D910002A;
        Tue, 27 Sep 2022 10:37:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F3B21216EDF;
        Tue, 27 Sep 2022 10:37:18 +0200 (CEST)
Received: from localhost (10.75.127.123) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Tue, 27 Sep
 2022 10:37:18 +0200
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To:     <linux-media@vger.kernel.org>
CC:     <alain.volmat@foss.st.com>, <hugues.fruchet@foss.st.com>,
        <sylvain.petinot@foss.st.com>, <dave.stevenson@raspberrypi.com>,
        <sakari.ailus@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>,
        <kieran.bingham@ideasonboard.com>, <nicolas@ndufresne.ca>,
        <hverkuil@xs4all.nl>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH v6 1/4] media: v4l: Add 1X16 16-bit greyscale media bus code definition
Date:   Tue, 27 Sep 2022 10:36:59 +0200
Message-ID: <20220927083702.14138-2-benjamin.mugnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220927083702.14138-1-benjamin.mugnier@foss.st.com>
References: <20220927083702.14138-1-benjamin.mugnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.123]
X-ClientProxiedBy: GPXDAG2NODE4.st.com (10.75.127.68) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-27_02,2022-09-22_02,2022-06-22_01
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
---
 .../media/v4l/subdev-formats.rst              | 37 +++++++++++++++++++
 include/uapi/linux/media-bus-format.h         |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index d21d532eee15..19025e9ba447 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -7355,6 +7355,43 @@ the following codes.
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
index ec3323dbb927..b078dd125e57 100644
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
@@ -115,6 +115,7 @@
 #define MEDIA_BUS_FMT_YUV12_1X36		0x2029
 #define MEDIA_BUS_FMT_YUV16_1X48		0x202a
 #define MEDIA_BUS_FMT_UYYVYY16_0_5X48		0x202b
+#define MEDIA_BUS_FMT_Y16_1X16			0x202e
 
 /* Bayer - next is	0x3021 */
 #define MEDIA_BUS_FMT_SBGGR8_1X8		0x3001
-- 
2.25.1

