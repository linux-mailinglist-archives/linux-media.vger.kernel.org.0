Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5E52BC2FB
	for <lists+linux-media@lfdr.de>; Tue, 24 Sep 2019 09:44:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503781AbfIXHoI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Sep 2019 03:44:08 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:42327 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S2503745AbfIXHoI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Sep 2019 03:44:08 -0400
X-UUID: d9f8117364cd40f09c4436505c6ecf1f-20190924
X-UUID: d9f8117364cd40f09c4436505c6ecf1f-20190924
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw02.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1018321716; Tue, 24 Sep 2019 15:44:02 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 24 Sep 2019 15:43:59 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 24 Sep 2019 15:43:59 +0800
From:   Xia Jiang <xia.jiang@mediatek.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        <srv_heupstream@mediatek.com>, Xia Jiang <xia.jiang@mediatek.com>
Subject: [PATCH v3 4/5] media: v4l2-ctrl: Add jpeg enc exif mode control
Date:   Tue, 24 Sep 2019 15:43:04 +0800
Message-ID: <20190924074303.22713-5-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190924074303.22713-1-xia.jiang@mediatek.com>
References: <20190924074303.22713-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add jpeg enc CID definition for exif mode control.

Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
---
v3: new add patch for V4L2_CID_JPEG_ENABLE_EXIF
---
 Documentation/media/uapi/v4l/ext-ctrls-jpeg.rst | 10 ++++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c            |  1 +
 include/uapi/linux/v4l2-controls.h              |  2 ++
 3 files changed, 13 insertions(+)

diff --git a/Documentation/media/uapi/v4l/ext-ctrls-jpeg.rst b/Documentation/media/uapi/v4l/ext-ctrls-jpeg.rst
index 60ce3f949319..d44a539e2eb4 100644
--- a/Documentation/media/uapi/v4l/ext-ctrls-jpeg.rst
+++ b/Documentation/media/uapi/v4l/ext-ctrls-jpeg.rst
@@ -109,5 +109,15 @@ JPEG Control IDs
 
 
 
+``V4L2_CID_JPEG_ENABLE_EXIF (integer)``
+    ``V4L2_CID_JPEG_ENABLE_EXIF (integer)`` control determines JPEG
+    encoder mode. Its value of 0 means JPEG mode, 1 means EXIF mode. If
+    EXIF mode is enabled, the JPEG encoder will not write out SOI marker
+    (start from 0xffd8) but write out from DQT marker(start from
+    0xffdb). Software program can fill the EXIF content above the DQT
+    marker to finish one EXIF JPEG.
+
+
+
 For more details about JPEG specification, refer to :ref:`itu-t81`,
 :ref:`jfif`, :ref:`w3c-jpeg-jfif`.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 371537dd8cd3..c96c10480ebd 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -1025,6 +1025,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_JPEG_RESTART_INTERVAL:	return "Restart Interval";
 	case V4L2_CID_JPEG_COMPRESSION_QUALITY:	return "Compression Quality";
 	case V4L2_CID_JPEG_ACTIVE_MARKER:	return "Active Markers";
+	case V4L2_CID_JPEG_ENABLE_EXIF:		return "Enable Exif";
 
 	/* Image source controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index a2669b79b294..da619f43de65 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1022,6 +1022,8 @@ enum v4l2_jpeg_chroma_subsampling {
 #define	V4L2_JPEG_ACTIVE_MARKER_DQT		(1 << 17)
 #define	V4L2_JPEG_ACTIVE_MARKER_DHT		(1 << 18)
 
+#define	V4L2_CID_JPEG_ENABLE_EXIF		(V4L2_CID_JPEG_CLASS_BASE + 5)
+
 
 /* Image source controls */
 #define V4L2_CID_IMAGE_SOURCE_CLASS_BASE	(V4L2_CTRL_CLASS_IMAGE_SOURCE | 0x900)
-- 
2.18.0

