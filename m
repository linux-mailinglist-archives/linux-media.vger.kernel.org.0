Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A38D61083B
	for <lists+linux-media@lfdr.de>; Fri, 28 Oct 2022 04:38:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236443AbiJ1CiN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Oct 2022 22:38:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236424AbiJ1Ch7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Oct 2022 22:37:59 -0400
Received: from twspam01.aspeedtech.com (twspam01.aspeedtech.com [211.20.114.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB87940579;
        Thu, 27 Oct 2022 19:37:53 -0700 (PDT)
Received: from mail.aspeedtech.com ([192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id 29S2D5KE054600;
        Fri, 28 Oct 2022 10:13:05 +0800 (GMT-8)
        (envelope-from jammy_huang@aspeedtech.com)
Received: from JammyHuang-PC.aspeed.com (192.168.2.115) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 28 Oct
 2022 10:35:59 +0800
From:   Jammy Huang <jammy_huang@aspeedtech.com>
To:     <eajames@linux.ibm.com>, <mchehab@kernel.org>, <joel@jms.id.au>,
        <andrew@aj.id.au>, <hverkuil-cisco@xs4all.nl>,
        <laurent.pinchart@ideasonboard.com>, <xavier.roumegue@oss.nxp.com>,
        <ezequiel@vanguardiasur.com.ar>, <stanimir.varbanov@linaro.org>,
        <nicolas.dufresne@collabora.com>, <sakari.ailus@linux.intel.com>,
        <ming.qian@nxp.com>, <andrzej.p@collabora.com>,
        <linux-media@vger.kernel.org>, <openbmc@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 2/5] media: v4l2-ctrls: Reserve controls for ASPEED
Date:   Fri, 28 Oct 2022 10:35:51 +0800
Message-ID: <20221028023554.928-3-jammy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028023554.928-1-jammy_huang@aspeedtech.com>
References: <20221028023554.928-1-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.2.115]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 29S2D5KE054600
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reserve controls for ASPEED video family. Aspeed video engine contains a
few features which improve video quality, reduce amount of compressed
data, and etc. Hence, 16 controls are reserved for these aspeed
proprietary features.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
v11:
  - no update
v10:
  - no update
v9:
  - Rebase on new kernel
v8:
  - no update
v7:
  - no update
v6:
  - no update
v5:
  - no update
v4:
  - new
---
 include/uapi/linux/v4l2-controls.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index b5e7d082b8ad..60a6bed21c56 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -231,6 +231,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_DW100_BASE		(V4L2_CID_USER_BASE + 0x1190)
 
+/*
+ * The base for Aspeed driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_ASPEED_BASE		(V4L2_CID_USER_BASE + 0x11A0)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
2.25.1

