Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1B161F431
	for <lists+linux-media@lfdr.de>; Mon,  7 Nov 2022 14:21:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231860AbiKGNVs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Nov 2022 08:21:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231752AbiKGNVr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Nov 2022 08:21:47 -0500
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E7E61B787
        for <linux-media@vger.kernel.org>; Mon,  7 Nov 2022 05:21:46 -0800 (PST)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2A7Abh2D017954;
        Mon, 7 Nov 2022 14:21:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=GhrbjOgWo1pyYgKGEkydIlETPq7feXxzl1lxo+nXCkY=;
 b=mXLU0zXh0752cvZwg4dkoyjnPoLkMeRCeD3FUH6+DJTy8y4DnYHYCsK1qXr/vDORvoEn
 9TsQcMkqspEDIVgd8LHy+k2dnGrh+qkVlsW29Gk1/2PvMZF0iTzEL4Ejxl84NR4Oq//Q
 AxYcIQkQ+SKIJGysvnmMKyR59p3xQeftifvoD1apLko25qIiTeX1/Hipt9CjGQSqeXcZ
 tl8BfmkxB+5kqhx9VXaKYodX3Dm+OSDCxcI+ks/whPrqO94uEvTHWc5fP7ZGqgANOX34
 Sp0t9JUbVeR8/BaJvkUqwMQrkHkKsl2yTbwt2kiLAdY4qu2+MIz2lWjj55EPM/IxYhcS Ig== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3kq0ec9025-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 07 Nov 2022 14:21:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4A0DE10003E;
        Mon,  7 Nov 2022 14:21:17 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 468BE21685C;
        Mon,  7 Nov 2022 14:21:17 +0100 (CET)
Received: from localhost (10.129.167.233) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.32; Mon, 7 Nov
 2022 14:21:17 +0100
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To:     <linux-media@vger.kernel.org>
CC:     <sylvain.petinot@foss.st.com>, <mchehab@kernel.org>,
        <sakari.ailus@iki.fi>, <laurent.pinchart@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH 1/3] media: Documentation: st-vgxy61: Limit driver specific documentation to 80 characters
Date:   Mon, 7 Nov 2022 14:19:43 +0100
Message-ID: <20221107131945.40753-2-benjamin.mugnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221107131945.40753-1-benjamin.mugnier@foss.st.com>
References: <20221107131945.40753-1-benjamin.mugnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.129.167.233]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_06,2022-11-07_01,2022-06-22_01
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 .../userspace-api/media/drivers/st-vgxy61.rst          | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/userspace-api/media/drivers/st-vgxy61.rst b/Documentation/userspace-api/media/drivers/st-vgxy61.rst
index 213b884dcfa6..fb08aef03502 100644
--- a/Documentation/userspace-api/media/drivers/st-vgxy61.rst
+++ b/Documentation/userspace-api/media/drivers/st-vgxy61.rst
@@ -7,8 +7,8 @@ The ST VGXY61 driver implements the following controls:
 
 ``V4L2_CID_HDR_SENSOR_MODE``
 -------------------------------
-    Change the sensor HDR mode. A HDR picture is obtained by merging two captures of the same scene
-    using two different exposure periods.
+    Change the sensor HDR mode. A HDR picture is obtained by merging two
+    captures of the same scene using two different exposure periods.
 
 .. flat-table::
     :header-rows:  0
@@ -16,8 +16,10 @@ The ST VGXY61 driver implements the following controls:
     :widths:       1 4
 
     * - HDR linearize
-      - The merger outputs a long exposure capture as long as it is not saturated.
+      - The merger outputs a long exposure capture as long as it is not
+        saturated.
     * - HDR substraction
-      - This involves subtracting the short exposure frame from the long exposure frame.
+      - This involves subtracting the short exposure frame from the long
+        exposure frame.
     * - "No HDR"
       - This mode is used for standard dynamic range (SDR) exposures.
-- 
2.25.1

