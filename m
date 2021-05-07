Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 563CD375EE2
	for <lists+linux-media@lfdr.de>; Fri,  7 May 2021 04:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234151AbhEGCyt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 22:54:49 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:44118 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S230294AbhEGCys (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 May 2021 22:54:48 -0400
X-UUID: c1428aed7e1341c181f146c1464fc15f-20210507
X-UUID: c1428aed7e1341c181f146c1464fc15f-20210507
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
        (envelope-from <john.wei@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 55639792; Fri, 07 May 2021 10:53:45 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
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
Subject: [RFC PATCH V0 1/2] media: v4l2: Add fields to frame descriptors
Date:   Fri, 7 May 2021 10:53:36 +0800
Message-ID: <1620356017-26486-2-git-send-email-john.wei@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1620356017-26486-1-git-send-email-john.wei@mediatek.com>
References: <1620356017-26486-1-git-send-email-john.wei@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: John Wei <john.wei@mediatek.com>

Add enable, hsize, vsize, user_data_desc to frame descriptors

This patch is derived from following patches
https://patchwork.kernel.org/patch/10875875/
https://patchwork.kernel.org/patch/10875869/

Signed-off-by: John Wei <john.wei@mediatek.com>
---
 include/media/v4l2-subdev.h |   25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 30ec011..f603831 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -308,15 +308,38 @@ struct v4l2_subdev_audio_ops {
 	int (*s_stream)(struct v4l2_subdev *sd, int enable);
 };
 
+enum v4l2_mbus_csi2_user_defined_data_desc {
+	V4L2_MBUS_CSI2_USER_DEFINED_DATA_DESC_NONE,
+	V4L2_MBUS_CSI2_USER_DEFINED_DATA_DESC_Y_HIST,
+	V4L2_MBUS_CSI2_USER_DEFINED_DATA_DESC_AE_HIST,
+	V4L2_MBUS_CSI2_USER_DEFINED_DATA_DESC_FLICKER,
+	V4L2_MBUS_CSI2_USER_DEFINED_DATA_DESC_GYRO,
+	V4L2_MBUS_CSI2_USER_DEFINED_DATA_DESC_PDAF_PIXEL,
+	V4L2_MBUS_CSI2_USER_DEFINED_DATA_DESC_PDAF_DIFF,
+	V4L2_MBUS_CSI2_USER_DEFINED_DATA_DESC_HDR_LE,
+	V4L2_MBUS_CSI2_USER_DEFINED_DATA_DESC_HDR_ME,
+	V4L2_MBUS_CSI2_USER_DEFINED_DATA_DESC_HDR_SE,
+	V4L2_MBUS_CSI2_USER_DEFINED_DATA_DESC_HDR_SSE,
+	V4L2_MBUS_CSI2_USER_DEFINED_DATA_DESC_HDR_SSSE,
+};
+
 /**
  * struct v4l2_mbus_frame_desc_entry_csi2
  *
  * @channel: CSI-2 virtual channel
  * @data_type: CSI-2 data type ID
+ * @enable: enable this data identifier
+ * @hsize: horizontal size
+ * @vsize: vertical size
+ * @user_data_desc: the description of user defined data
  */
 struct v4l2_mbus_frame_desc_entry_csi2 {
 	u8 channel;
 	u8 data_type;
+	u8 enable;
+	u16 hsize;
+	u16 vsize;
+	enum v4l2_mbus_csi2_user_defined_data_desc user_data_desc;
 };
 
 /**
@@ -354,7 +377,7 @@ struct v4l2_mbus_frame_desc_entry {
 	} bus;
 };
 
-#define V4L2_FRAME_DESC_ENTRY_MAX	4
+#define V4L2_FRAME_DESC_ENTRY_MAX	8
 
 enum v4l2_mbus_frame_desc_type {
 	V4L2_MBUS_FRAME_DESC_TYPE_PLATFORM,
-- 
1.7.9.5

