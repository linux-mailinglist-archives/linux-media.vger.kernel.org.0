Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E19552472C
	for <lists+linux-media@lfdr.de>; Thu, 12 May 2022 09:42:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350644AbiELHm1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 May 2022 03:42:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351108AbiELHm0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 May 2022 03:42:26 -0400
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36A38197F66
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 00:42:25 -0700 (PDT)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24C0nNvP010247;
        Thu, 12 May 2022 09:42:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=selector1;
 bh=aWEhwF64biWlgDFbzFms/QHNG13IyeLPA+Enhz/Np4M=;
 b=tRzCMbqwdh/RQJTMtSOSSzX7EKgoNJyd08E9GMY+/vVjuA1tsGZZudMfj1pXrksO/tT4
 /4J+zorb2N5pqwis/GMQJ5ybHcB1Vvn7wKjB8Xoy7DBp2/WHBjuUTUtYi0B44yjv1b4A
 2K8xvjhV5GPIK4mdWqP8ibF95OblTFC/1IKiHkzxFcCMGHl3VyIhDz/1ULZN6lQtRQVW
 r0/f36nyHvDbRuGNz0PylGBgN6BvDOBPFXkSrW1kq4bHV3Yn/MY0ljSYjKmz4A2uY8qe
 CFnlv16KCILKfYJwn5u06XGoV7DzOmQaOXUilpOyOzZb6XTuDJB+fB7y4m5QyLxjhhxG aQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3fwdw9g4ha-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 12 May 2022 09:42:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 399F5100038;
        Thu, 12 May 2022 09:42:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 30307214D2B;
        Thu, 12 May 2022 09:42:04 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.26; Thu, 12 May 2022 09:42:03
 +0200
From:   Benjamin Mugnier <benjamin.mugnier@foss.st.com>
To:     <linux-media@vger.kernel.org>
CC:     <alain.volmat@foss.st.com>, <hugues.fruchet@foss.st.com>,
        <sylvain.petinot@foss.st.com>, <dave.stevenson@raspberrypi.com>,
        <sakari.ailus@linux.intel.com>,
        <laurent.pinchart@ideasonboard.com>,
        <kieran.bingham@ideasonboard.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH v3 2/5] media: v4l: ctrls: Add user control base for st-vgxy61 controls
Date:   Thu, 12 May 2022 09:40:34 +0200
Message-ID: <20220512074037.3829926-3-benjamin.mugnier@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220512074037.3829926-1-benjamin.mugnier@foss.st.com>
References: <20220512074037.3829926-1-benjamin.mugnier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
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

Add a control base for st-vgxy61 controls and reserve 16 controls.
This is required for HDR mode user control on the st-vgxy61 camera
sensor.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
 include/uapi/linux/v4l2-controls.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index dfff69ed88f7..f0ea2a0691f6 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -225,6 +225,11 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_ISL7998X_BASE		(V4L2_CID_USER_BASE + 0x1180)
 
+/* The base for the st-vgxy61 driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_STVGXY61_BASE		(V4L2_CID_USER_BASE + 0x1190)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
2.25.1

