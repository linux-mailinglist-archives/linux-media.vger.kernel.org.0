Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53DEDA504B
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 09:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729927AbfIBHwH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 03:52:07 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:1470 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729916AbfIBHwG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Sep 2019 03:52:06 -0400
X-UUID: 3b182cdddd12460493b0efe7f040a4e6-20190902
X-UUID: 3b182cdddd12460493b0efe7f040a4e6-20190902
Received: from mtkmrs01.mediatek.inc [(172.21.131.159)] by mailgw02.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1135539371; Mon, 02 Sep 2019 15:51:59 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 2 Sep 2019 15:51:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 2 Sep 2019 15:51:53 +0800
From:   Jungo Lin <jungo.lin@mediatek.com>
To:     <tfiga@chromium.org>, <hverkuil-cisco@xs4all.nl>,
        <laurent.pinchart@ideasonboard.com>, <matthias.bgg@gmail.com>,
        <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <ddavenport@chromium.org>, <robh@kernel.org>,
        <Sean.Cheng@mediatek.com>, <sj.huang@mediatek.com>,
        <frederic.chen@mediatek.com>, <Jerry-ch.Chen@mediatek.com>,
        <frankie.chiu@mediatek.com>, <ryan.yu@mediatek.com>,
        <Rynn.Wu@mediatek.com>, <yuzhao@chromium.org>,
        <zwisler@chromium.org>, <shik@chromium.org>,
        <suleiman@chromium.org>, <jungo.lin@mediatek.com>
Subject: [RFC,v5, 3/5] media: videodev2.h: Add new boottime timestamp type
Date:   Mon, 2 Sep 2019 15:51:33 +0800
Message-ID: <20190902075135.1332-4-jungo.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20190902075135.1332-1-jungo.lin@mediatek.com>
References: <Jungo Lin <jungo.lin@mediatek.com>
 <20190902075135.1332-1-jungo.lin@mediatek.com>
Reply-To: Jungo Lin <jungo.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For Camera AR(Augmented Reality) application requires camera timestamps
to be reported with CLOCK_BOOTTIME to sync timestamp with other sensor
sources.

The boottime timestamp is identical to monotonic timestamp,
except it also includes any time that the system is suspended.

Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
---
 Documentation/media/uapi/v4l/buffer.rst | 11 ++++++++++-
 include/uapi/linux/videodev2.h          |  2 ++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/media/uapi/v4l/buffer.rst b/Documentation/media/uapi/v4l/buffer.rst
index 1cbd9cde57f3..9e636f4118f5 100644
--- a/Documentation/media/uapi/v4l/buffer.rst
+++ b/Documentation/media/uapi/v4l/buffer.rst
@@ -649,13 +649,22 @@ Buffer Flags
       - 0x00002000
       - The buffer timestamp has been taken from the ``CLOCK_MONOTONIC``
 	clock. To access the same clock outside V4L2, use
-	:c:func:`clock_gettime`.
+	:c:func:`clock_gettime` using clock IDs ``CLOCK_MONOTONIC``.
     * .. _`V4L2-BUF-FLAG-TIMESTAMP-COPY`:
 
       - ``V4L2_BUF_FLAG_TIMESTAMP_COPY``
       - 0x00004000
       - The CAPTURE buffer timestamp has been taken from the corresponding
 	OUTPUT buffer. This flag applies only to mem2mem devices.
+    * .. _`V4L2_BUF_FLAG_TIMESTAMP_BOOTIME`:
+
+      - ``V4L2_BUF_FLAG_TIMESTAMP_BOOTIME``
+      - 0x00008000
+      - The buffer timestamp has been taken from the ``CLOCK_BOOTTIME``
+	clock. To access the same clock outside V4L2, use
+	:c:func:`clock_gettime` using clock IDs ``CLOCK_BOOTTIME``.
+	Identical to CLOCK_MONOTONIC, except it also includes any time that
+	the system is suspended.
     * .. _`V4L2-BUF-FLAG-TSTAMP-SRC-MASK`:
 
       - ``V4L2_BUF_FLAG_TSTAMP_SRC_MASK``
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 9d9705ceda76..a4fd271348e7 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1043,6 +1043,8 @@ static inline __u64 v4l2_timeval_to_ns(const struct timeval *tv)
 #define V4L2_BUF_FLAG_TIMESTAMP_UNKNOWN		0x00000000
 #define V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC	0x00002000
 #define V4L2_BUF_FLAG_TIMESTAMP_COPY		0x00004000
+#define V4L2_BUF_FLAG_TIMESTAMP_BOOTIME		0x00008000
+
 /* Timestamp sources. */
 #define V4L2_BUF_FLAG_TSTAMP_SRC_MASK		0x00070000
 #define V4L2_BUF_FLAG_TSTAMP_SRC_EOF		0x00000000
-- 
2.18.0

