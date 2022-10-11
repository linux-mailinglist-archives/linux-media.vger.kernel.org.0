Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F3C65FB275
	for <lists+linux-media@lfdr.de>; Tue, 11 Oct 2022 14:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbiJKMch (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Oct 2022 08:32:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbiJKMcM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Oct 2022 08:32:12 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 689D87B1C8
        for <linux-media@vger.kernel.org>; Tue, 11 Oct 2022 05:32:11 -0700 (PDT)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29B8efH5018454;
        Tue, 11 Oct 2022 14:32:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=0k3AuTMGOK1lVLVMdHwfF4AwMm931FvjdNJtikIWCT8=;
 b=C+XBzCKnWxgtjI+vtBL67Y2cLdzJvsyddWDUNBaEn5U/q0yp7sRfsGozSNOXq8s1LIhu
 kFhPG17ijhPplKiWl8BrXvJWP224Tm0b3TTC5dggjQ303EjPHeCxEj2oPuvYWufXN/Jw
 ti24utSiqkOVdFjKLFJaXG4MW0moGWUdYF5iSfDfVC1bJ02zybR6u7Wt7d95UjfnIn12
 K84MufLPxDC3okLmqJy7JW9Ru9zJOjchubsAsHjq3bw8c2UngPncTaeSxawh7137WYYo
 4kpDTrTDd+VcPPNQO50Lde4XT/TF3OmwCs2eK/c3d0tnkNXF9L0xOj5lmH7Dai9/uvQ2 Vw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3k31exj6mt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 11 Oct 2022 14:32:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CF375100034;
        Tue, 11 Oct 2022 14:32:01 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CA69F22789A;
        Tue, 11 Oct 2022 14:32:01 +0200 (CEST)
Received: from localhost (10.75.127.121) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2375.31; Tue, 11 Oct
 2022 14:32:01 +0200
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To:     <linux-media@vger.kernel.org>
CC:     <alain.volmat@foss.st.com>, <hugues.fruchet@foss.st.com>,
        <sylvain.petinot@foss.st.com>, <dave.stevenson@raspberrypi.com>,
        <sakari.ailus@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>,
        <kieran.bingham@ideasonboard.com>, <nicolas@ndufresne.ca>,
        <hverkuil@xs4all.nl>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH v7 4/5] media: Documentation: Add ST VGXY61 driver documentation
Date:   Tue, 11 Oct 2022 14:30:29 +0200
Message-ID: <20221011123030.31802-2-benjamin.mugnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221011120555.28889-1-benjamin.mugnier@foss.st.com>
References: <20221011120555.28889-1-benjamin.mugnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.121]
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

Document V4L2_CID_HDR_MODE possible values for this sensor.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 .../userspace-api/media/drivers/st-vgxy61.rst | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/userspace-api/media/drivers/st-vgxy61.rst

diff --git a/Documentation/userspace-api/media/drivers/st-vgxy61.rst b/Documentation/userspace-api/media/drivers/st-vgxy61.rst
new file mode 100644
index 000000000000..213b884dcfa6
--- /dev/null
+++ b/Documentation/userspace-api/media/drivers/st-vgxy61.rst
@@ -0,0 +1,23 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+ST VGXY61 camera sensor driver
+==============================
+
+The ST VGXY61 driver implements the following controls:
+
+``V4L2_CID_HDR_SENSOR_MODE``
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
+    * - "No HDR"
+      - This mode is used for standard dynamic range (SDR) exposures.
-- 
2.25.1

