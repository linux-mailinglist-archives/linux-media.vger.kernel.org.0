Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49C586A832B
	for <lists+linux-media@lfdr.de>; Thu,  2 Mar 2023 14:03:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbjCBNDz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Mar 2023 08:03:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229955AbjCBNDy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Mar 2023 08:03:54 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ECA2136DA
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 05:03:52 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 56A89B8121D
        for <linux-media@vger.kernel.org>; Thu,  2 Mar 2023 13:03:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6706BC433A0;
        Thu,  2 Mar 2023 13:03:49 +0000 (UTC)
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 17/17] media: pci: saa7146: advertise only those TV standard that are supported
Date:   Thu,  2 Mar 2023 14:03:30 +0100
Message-Id: <20230302130330.1125172-18-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302130330.1125172-1-hverkuil-cisco@xs4all.nl>
References: <20230302130330.1125172-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
        UPPERCASE_50_75 autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V4L2_STD_ALL advertises more standards than these boards
actually support. This causes a V4L2 compliance issue. Limit
the supported standards to those that are actually implemented.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/pci/saa7146/hexium_gemini.c | 19 ++++++++++---------
 drivers/media/pci/saa7146/hexium_orion.c  | 19 ++++++++++---------
 drivers/media/pci/saa7146/mxb.c           |  7 ++++---
 3 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/drivers/media/pci/saa7146/hexium_gemini.c b/drivers/media/pci/saa7146/hexium_gemini.c
index 7dead0dfcc9f..40b35098f3ea 100644
--- a/drivers/media/pci/saa7146/hexium_gemini.c
+++ b/drivers/media/pci/saa7146/hexium_gemini.c
@@ -27,17 +27,18 @@ static int hexium_num;
 #define HEXIUM_GEMINI			4
 #define HEXIUM_GEMINI_DUAL		5
 
+#define HEXIUM_STD (V4L2_STD_PAL | V4L2_STD_SECAM | V4L2_STD_NTSC)
 #define HEXIUM_INPUTS	9
 static struct v4l2_input hexium_inputs[HEXIUM_INPUTS] = {
-	{ 0, "CVBS 1",	V4L2_INPUT_TYPE_CAMERA,	0, 0, V4L2_STD_ALL, 0, V4L2_IN_CAP_STD },
-	{ 1, "CVBS 2",	V4L2_INPUT_TYPE_CAMERA,	0, 0, V4L2_STD_ALL, 0, V4L2_IN_CAP_STD },
-	{ 2, "CVBS 3",	V4L2_INPUT_TYPE_CAMERA,	0, 0, V4L2_STD_ALL, 0, V4L2_IN_CAP_STD },
-	{ 3, "CVBS 4",	V4L2_INPUT_TYPE_CAMERA,	0, 0, V4L2_STD_ALL, 0, V4L2_IN_CAP_STD },
-	{ 4, "CVBS 5",	V4L2_INPUT_TYPE_CAMERA,	0, 0, V4L2_STD_ALL, 0, V4L2_IN_CAP_STD },
-	{ 5, "CVBS 6",	V4L2_INPUT_TYPE_CAMERA,	0, 0, V4L2_STD_ALL, 0, V4L2_IN_CAP_STD },
-	{ 6, "Y/C 1",	V4L2_INPUT_TYPE_CAMERA,	0, 0, V4L2_STD_ALL, 0, V4L2_IN_CAP_STD },
-	{ 7, "Y/C 2",	V4L2_INPUT_TYPE_CAMERA,	0, 0, V4L2_STD_ALL, 0, V4L2_IN_CAP_STD },
-	{ 8, "Y/C 3",	V4L2_INPUT_TYPE_CAMERA,	0, 0, V4L2_STD_ALL, 0, V4L2_IN_CAP_STD },
+	{ 0, "CVBS 1",	V4L2_INPUT_TYPE_CAMERA,	0, 0, HEXIUM_STD, 0, V4L2_IN_CAP_STD },
+	{ 1, "CVBS 2",	V4L2_INPUT_TYPE_CAMERA,	0, 0, HEXIUM_STD, 0, V4L2_IN_CAP_STD },
+	{ 2, "CVBS 3",	V4L2_INPUT_TYPE_CAMERA,	0, 0, HEXIUM_STD, 0, V4L2_IN_CAP_STD },
+	{ 3, "CVBS 4",	V4L2_INPUT_TYPE_CAMERA,	0, 0, HEXIUM_STD, 0, V4L2_IN_CAP_STD },
+	{ 4, "CVBS 5",	V4L2_INPUT_TYPE_CAMERA,	0, 0, HEXIUM_STD, 0, V4L2_IN_CAP_STD },
+	{ 5, "CVBS 6",	V4L2_INPUT_TYPE_CAMERA,	0, 0, HEXIUM_STD, 0, V4L2_IN_CAP_STD },
+	{ 6, "Y/C 1",	V4L2_INPUT_TYPE_CAMERA,	0, 0, HEXIUM_STD, 0, V4L2_IN_CAP_STD },
+	{ 7, "Y/C 2",	V4L2_INPUT_TYPE_CAMERA,	0, 0, HEXIUM_STD, 0, V4L2_IN_CAP_STD },
+	{ 8, "Y/C 3",	V4L2_INPUT_TYPE_CAMERA,	0, 0, HEXIUM_STD, 0, V4L2_IN_CAP_STD },
 };
 
 #define HEXIUM_AUDIOS	0
diff --git a/drivers/media/pci/saa7146/hexium_orion.c b/drivers/media/pci/saa7146/hexium_orion.c
index a83fd5d19add..8c26fe554986 100644
--- a/drivers/media/pci/saa7146/hexium_orion.c
+++ b/drivers/media/pci/saa7146/hexium_orion.c
@@ -28,17 +28,18 @@ static int hexium_num;
 #define HEXIUM_ORION_1SVHS_3BNC		2
 #define HEXIUM_ORION_4BNC		3
 
+#define HEXIUM_STD (V4L2_STD_PAL | V4L2_STD_SECAM | V4L2_STD_NTSC)
 #define HEXIUM_INPUTS	9
 static struct v4l2_input hexium_inputs[HEXIUM_INPUTS] = {
-	{ 0, "CVBS 1",	V4L2_INPUT_TYPE_CAMERA,	0, 0, V4L2_STD_ALL, 0, V4L2_IN_CAP_STD },
-	{ 1, "CVBS 2",	V4L2_INPUT_TYPE_CAMERA,	0, 0, V4L2_STD_ALL, 0, V4L2_IN_CAP_STD },
-	{ 2, "CVBS 3",	V4L2_INPUT_TYPE_CAMERA,	0, 0, V4L2_STD_ALL, 0, V4L2_IN_CAP_STD },
-	{ 3, "CVBS 4",	V4L2_INPUT_TYPE_CAMERA,	0, 0, V4L2_STD_ALL, 0, V4L2_IN_CAP_STD },
-	{ 4, "CVBS 5",	V4L2_INPUT_TYPE_CAMERA,	0, 0, V4L2_STD_ALL, 0, V4L2_IN_CAP_STD },
-	{ 5, "CVBS 6",	V4L2_INPUT_TYPE_CAMERA,	0, 0, V4L2_STD_ALL, 0, V4L2_IN_CAP_STD },
-	{ 6, "Y/C 1",	V4L2_INPUT_TYPE_CAMERA,	0, 0, V4L2_STD_ALL, 0, V4L2_IN_CAP_STD },
-	{ 7, "Y/C 2",	V4L2_INPUT_TYPE_CAMERA,	0, 0, V4L2_STD_ALL, 0, V4L2_IN_CAP_STD },
-	{ 8, "Y/C 3",	V4L2_INPUT_TYPE_CAMERA,	0, 0, V4L2_STD_ALL, 0, V4L2_IN_CAP_STD },
+	{ 0, "CVBS 1",	V4L2_INPUT_TYPE_CAMERA,	0, 0, HEXIUM_STD, 0, V4L2_IN_CAP_STD },
+	{ 1, "CVBS 2",	V4L2_INPUT_TYPE_CAMERA,	0, 0, HEXIUM_STD, 0, V4L2_IN_CAP_STD },
+	{ 2, "CVBS 3",	V4L2_INPUT_TYPE_CAMERA,	0, 0, HEXIUM_STD, 0, V4L2_IN_CAP_STD },
+	{ 3, "CVBS 4",	V4L2_INPUT_TYPE_CAMERA,	0, 0, HEXIUM_STD, 0, V4L2_IN_CAP_STD },
+	{ 4, "CVBS 5",	V4L2_INPUT_TYPE_CAMERA,	0, 0, HEXIUM_STD, 0, V4L2_IN_CAP_STD },
+	{ 5, "CVBS 6",	V4L2_INPUT_TYPE_CAMERA,	0, 0, HEXIUM_STD, 0, V4L2_IN_CAP_STD },
+	{ 6, "Y/C 1",	V4L2_INPUT_TYPE_CAMERA,	0, 0, HEXIUM_STD, 0, V4L2_IN_CAP_STD },
+	{ 7, "Y/C 2",	V4L2_INPUT_TYPE_CAMERA,	0, 0, HEXIUM_STD, 0, V4L2_IN_CAP_STD },
+	{ 8, "Y/C 3",	V4L2_INPUT_TYPE_CAMERA,	0, 0, HEXIUM_STD, 0, V4L2_IN_CAP_STD },
 };
 
 #define HEXIUM_AUDIOS	0
diff --git a/drivers/media/pci/saa7146/mxb.c b/drivers/media/pci/saa7146/mxb.c
index 8f1843baa732..a14b839098b8 100644
--- a/drivers/media/pci/saa7146/mxb.c
+++ b/drivers/media/pci/saa7146/mxb.c
@@ -48,6 +48,7 @@ static int debug;
 module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "Turn on/off device debugging (default:off).");
 
+#define MXB_STD (V4L2_STD_PAL_BG | V4L2_STD_PAL_I | V4L2_STD_SECAM | V4L2_STD_NTSC)
 #define MXB_INPUTS 4
 enum { TUNER, AUX1, AUX3, AUX3_YC };
 
@@ -55,11 +56,11 @@ static struct v4l2_input mxb_inputs[MXB_INPUTS] = {
 	{ TUNER,   "Tuner",          V4L2_INPUT_TYPE_TUNER,  0x3f, 0,
 		V4L2_STD_PAL_BG | V4L2_STD_PAL_I, 0, V4L2_IN_CAP_STD },
 	{ AUX1,	   "AUX1",           V4L2_INPUT_TYPE_CAMERA, 0x3f, 0,
-		V4L2_STD_ALL, 0, V4L2_IN_CAP_STD },
+		MXB_STD, 0, V4L2_IN_CAP_STD },
 	{ AUX3,	   "AUX3 Composite", V4L2_INPUT_TYPE_CAMERA, 0x3f, 0,
-		V4L2_STD_ALL, 0, V4L2_IN_CAP_STD },
+		MXB_STD, 0, V4L2_IN_CAP_STD },
 	{ AUX3_YC, "AUX3 S-Video",   V4L2_INPUT_TYPE_CAMERA, 0x3f, 0,
-		V4L2_STD_ALL, 0, V4L2_IN_CAP_STD },
+		MXB_STD, 0, V4L2_IN_CAP_STD },
 };
 
 /* this array holds the information, which port of the saa7146 each
-- 
2.39.1

