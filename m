Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5F62375EE4
	for <lists+linux-media@lfdr.de>; Fri,  7 May 2021 04:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234221AbhEGCyu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 22:54:50 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:44118 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S234097AbhEGCyt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 May 2021 22:54:49 -0400
X-UUID: 8692f411e9bc436e9e2b6114e1c9c519-20210507
X-UUID: 8692f411e9bc436e9e2b6114e1c9c519-20210507
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <john.wei@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1022193804; Fri, 07 May 2021 10:53:47 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 May 2021 10:53:44 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 7 May 2021 10:53:44 +0800
From:   <john.wei@mediatek.com>
To:     <john.wei@mediatek.com>, <louis.kuo@mediak.com>,
        <mchehab@kernel.org>, <matthias.bgg@gmail.com>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>
Subject: [RFC PATCH V0 2/2] media: v4l2-ctrl: Add user defined base for ISP user control
Date:   Fri, 7 May 2021 10:53:37 +0800
Message-ID: <1620356017-26486-3-git-send-email-john.wei@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1620356017-26486-1-git-send-email-john.wei@mediatek.com>
References: <1620356017-26486-1-git-send-email-john.wei@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 4A7844A57F2EE1055F8E10CEB30C986A9EB0024C59559241BD322A03A6385BD12000:8
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: John Wei <john.wei@mediatek.com>

This patch is to add V4L2_CID_USER_SENINF_BASE and
V4L2_CID_USER_MTK_SENSOR_BASE for Mediatek ISP-only features

Signed-off-by: John Wei <john.wei@mediatek.com>
---
 include/uapi/linux/v4l2-controls.h |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d43bec5..2bcde70 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -211,6 +211,16 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_CCS_BASE			(V4L2_CID_USER_BASE + 0x10f0)
 
+/* The base for the mediatek sensor driver controls
+ * We reserve 64 controls for this driver.
+ */
+#define V4L2_CID_USER_MTK_SENSOR_BASE		(V4L2_CID_USER_BASE + 0x1100)
+
+/* The base for the mediatek sensor driver controls
+ * We reserve 64 controls for this driver.
+ */
+#define V4L2_CID_USER_MTK_SENINF_BASE		(V4L2_CID_USER_BASE + 0x1140)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
1.7.9.5

