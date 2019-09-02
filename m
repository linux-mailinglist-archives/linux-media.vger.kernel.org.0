Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0E0FA5050
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 09:52:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729939AbfIBHwQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 03:52:16 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:1470 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729893AbfIBHwQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Sep 2019 03:52:16 -0400
X-UUID: 814f308423094da7935c87b52f5b20c9-20190902
X-UUID: 814f308423094da7935c87b52f5b20c9-20190902
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1764895840; Mon, 02 Sep 2019 15:52:00 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 2 Sep 2019 15:51:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 2 Sep 2019 15:51:54 +0800
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
Subject: [RFC,v5, 4/5] media: pixfmt: Add Mediatek ISP P1 image & meta formats
Date:   Mon, 2 Sep 2019 15:51:34 +0800
Message-ID: <20190902075135.1332-5-jungo.lin@mediatek.com>
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

Add packed/full-g bayer formats with 8/10/12/14 bit
for image output. Add Pass 1 (P1) specific meta formats for
parameter processing and 3A/other statistics.

(The current metadata format used in meta input and partial
meta nodes is only a temporary solution to kick off the driver
development and is not ready to be reviewed yet.)

Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
---
 .../media/uapi/v4l/pixfmt-mtisp-sbggr10.rst   |  65 +++++++++++
 .../media/uapi/v4l/pixfmt-mtisp-sbggr10f.rst  |  90 ++++++++++++++
 .../media/uapi/v4l/pixfmt-mtisp-sbggr12.rst   |  61 ++++++++++
 .../media/uapi/v4l/pixfmt-mtisp-sbggr12f.rst  | 110 ++++++++++++++++++
 .../media/uapi/v4l/pixfmt-mtisp-sbggr14.rst   |  73 ++++++++++++
 .../media/uapi/v4l/pixfmt-mtisp-sbggr14f.rst  | 110 ++++++++++++++++++
 .../media/uapi/v4l/pixfmt-mtisp-sbggr8.rst    |  51 ++++++++
 .../media/uapi/v4l/pixfmt-mtisp-sbggr8f.rst   |  78 +++++++++++++
 Documentation/media/uapi/v4l/pixfmt-rgb.rst   |   8 ++
 drivers/media/v4l2-core/v4l2-ioctl.c          |  37 ++++++
 include/uapi/linux/videodev2.h                |  39 +++++++
 11 files changed, 722 insertions(+)
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr10.rst
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr10f.rst
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr12.rst
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr12f.rst
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr14.rst
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr14f.rst
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr8.rst
 create mode 100644 Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr8f.rst

diff --git a/Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr10.rst b/Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr10.rst
new file mode 100644
index 000000000000..534edb4f0fd4
--- /dev/null
+++ b/Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr10.rst
@@ -0,0 +1,65 @@
+.. -*- coding: utf-8; mode: rst -*-
+
+.. _v4l2-pix-fmt-mtisp-sbggr10:
+.. _v4l2-pix-fmt-mtisp-sgbrg10:
+.. _v4l2-pix-fmt-mtisp-sgrbg10:
+.. _v4l2-pix-fmt-mtisp-srggb10:
+
+*******************************
+V4L2_PIX_FMT_MTISP_SBGGR10 ('MBBA'), V4L2_PIX_FMT_MTISP_SGBRG10('MBGA'), V4L2_PIX_FMT_MTISP_SGRBG10('MBgA'), V4L2_PIX_FMT_MTISP_SRGGB10('MBRA')
+*******************************
+
+10-bit Packed Bayer formats.
+
+Description
+===========
+
+These four pixel formats are used by Mediatek ISP P1.
+This is a packed format, meaning all the data bits for a pixel lying
+next to each other with no padding in memory, with a depth of 10 bits per pixel.
+The least significant byte is stored at lower memory addresses (little-endian).
+The RGB byte order follows raw sRGB / Bayer format from sensor.
+They are conventionally described as GRGR... BGBG..., RGRG... GBGB..., etc.
+Below is an example of conventional RGB byte order BGGR.
+
+**Byte Order.**
+Each cell is one byte.
+
+pixels cross the byte boundary and have a ratio of 5 bytes for each 4 pixels.
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - start + 0:
+      - B\ :sub:`00low bits 7--0`
+      - G\ :sub:`01low bits 5--0` (bits 7--2) B\ :sub:`00high bits 9--8`\ (bits 1--0)
+    * - start + 2:
+      - B\ :sub:`02low bits 3--0`\ (bits 7--4) G\ :sub:`01high bits 9--6`\ (bits 3--0)
+      - G\ :sub:`03low bits 1--0`\ (bits 7--6) B\ :sub:`02high bits 9--4`\ (bits 5--0)
+    * - start + 4:
+      - G\ :sub:`03high bits 9--2`
+    * - start + 6:
+      - G\ :sub:`10low bits 7--0`
+      - R\ :sub:`11low bits 5--0`\ (bits 7--2) G\ :sub:`10high bits 9--8`\ (bits 1--0)
+    * - start + 8:
+      - G\ :sub:`12low bits 3--0`\ (bits 7--4) R\ :sub:`11high bits 9--6`\ (bits 3--0)
+      - R\ :sub:`13low bits 1--0`\ (bits 7--6) G\ :sub:`12high bits 9--4`\ (bits 5--0)
+    * - start + 10:
+      - R\ :sub:`13high bits 9--2`
+    * - start + 12:
+      - B\ :sub:`20low bits 7--0`
+      - G\ :sub:`21low bits 5--0`\ (bits 7--2) B\ :sub:`20high bits 9--8`\ (bits 1--0)
+    * - start + 14:
+      - B\ :sub:`22low bits 3--0`\ (bits 7--4) G\ :sub:`21high bits 9--6`\ (bits 3--0)
+      - G\ :sub:`23low bits 1--0`\ (bits 7--6) B\ :sub:`22high bits 9--4`\ (bits 5--0)
+    * - start + 16:
+      - G\ :sub:`23high bits 9--2`
+    * - start + 18:
+      - G\ :sub:`30low bits 7--0`
+      - R\ :sub:`31low bits 5--0`\ (bits 7--2) G\ :sub:`30high bits 9--8`\ (bits 1--0)
+    * - start + 20:
+      - G\ :sub:`32low bits 3--0`\ (bits 7--4) R\ :sub:`31high bits 9--6`\ (bits 3--0)
+      - R\ :sub:`33low bits 1--0`\ (bits 7--6) G\ :sub:`32high bits 9--4`\ (bits 5--0)
+    * - start + 22:
+      - R\ :sub:`33high bits 9--2` (bits 7--0)
\ No newline at end of file
diff --git a/Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr10f.rst b/Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr10f.rst
new file mode 100644
index 000000000000..7be527711602
--- /dev/null
+++ b/Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr10f.rst
@@ -0,0 +1,90 @@
+.. -*- coding: utf-8; mode: rst -*-
+
+.. _v4l2-pix-fmt-mtisp-sbggr10f:
+.. _v4l2-pix-fmt-mtisp-sgbrg10f:
+.. _v4l2-pix-fmt-mtisp-sgrbg10f:
+.. _v4l2-pix-fmt-mtisp-srggb10f:
+
+*******************************
+V4L2_PIX_FMT_MTISP_SBGGR10F ('MFBA'), V4L2_PIX_FMT_MTISP_SGBRG10F('MFGA'), V4L2_PIX_FMT_MTISP_SGRBG10F('MFgA'), V4L2_PIX_FMT_MTISP_SRGGB10F('MFRA')
+*******************************
+
+10-bit Packed Full-G Bayer formats.
+
+Description
+===========
+
+These four pixel formats are used by Mediatek ISP P1.
+This is a packed format with a depth of 10 bits per sample with every 4 pixels.
+Full-G means 1 more pixel for green channel every 2 pixels.
+The least significant byte is stored at lower memory addresses (little-endian).
+The RGB byte order follows raw sRGB / Bayer format from sensor. They are conventionally
+described as GRGR... BGBG..., RGRG... GBGB..., etc. Below is an example of conventional
+RGB byte order BGGR.
+
+**Bit-packed representation.**
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - B\ :sub:`00`
+      - FG\ :sub:`01`
+      - G\ :sub:`02`
+      - B\ :sub:`03`
+      - FG\ :sub:`04`
+      - G\ :sub:`05`
+    * - G\ :sub:`10`
+      - R\ :sub:`11`
+      - FG\ :sub:`12`
+      - G\ :sub:`13`
+      - R\ :sub:`14`
+      - FG\ :sub:`15`
+
+**Byte Order.**
+Each cell is one byte.
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - start + 0:
+      - B\ :sub:`00low bits 7--0`
+      - FG\ :sub:`01low bits 5--0`\ (bits 7--2) B\ :sub:`00high bits 9--8`\ (bits 1--0)
+      - G\ :sub:`02low bits 3--0`\ (bits 7--4) FG\ :sub:`01high bits 9--6`\ (bits 3--0)
+      - B\ :sub:`03low bits 1--0`\ (bits 7--6) G\ :sub:`02high bits 9--4`\ (bits 5--0)
+    * - start + 4:
+      - B\ :sub:`03high bits 9--2`
+      - FG\ :sub:`04low bits 7--0`
+      - G\ :sub:`05low bits 5--0`\ (bits 7--2) FG\ :sub:`04high bits 9--8`\ (bits 1--0)
+      - G\ :sub:`05high bits 3--0`
+    * - start + 8:
+      - G\ :sub:`10low bits 7--0`
+      - R\ :sub:`11low bits 5--0`\ (bits 7--2) G\ :sub:`10high bits 9--8`\ (bits 1--0)
+      - FG\ :sub:`12low bits 3--0`\ (bits 7--4) R\ :sub:`11high bits 9--6`\ (bits 3--0)
+      - G\ :sub:`13low bits 1--0`\ (bits 7--6) FG\ :sub:`12high bits 9--4`\ (bits 5--0)
+    * - start + 12:
+      - G\ :sub:`13high bits 9--2`
+      - R\ :sub:`14low bits 7--0`
+      - FG\ :sub:`15low bits 5--0`\ (bits 7--2) R\ :sub:`14high bits 9--8`\ (bits 1--0)
+      - FG\ :sub:`15high bits 3--0`
+    * - start + 16:
+      - B\ :sub:`20low bits 7--0`
+      - FG\ :sub:`21low bits 5--0`\ (bits 7--2) B\ :sub:`20high bits 9--8`\ (bits 1--0)
+      - G\ :sub:`22low bits 3--0`\ (bits 7--4) FG\ :sub:`21high bits 9--6`\ (bits 3--0)
+      - B\ :sub:`23low bits 1--0`\ (bits 7--6) G\ :sub:`22high bits 9--4`\ (bits 5--0)
+    * - start + 20:
+      - B\ :sub:`23high bits 9--2`
+      - FG\ :sub:`24low bits 7--0`
+      - G\ :sub:`25low bits 5--0`\ (bits 7--2) FG\ :sub:`24high bits 9--8`\ (bits 1--0)
+      - G\ :sub:`25high bits 3--0`
+    * - start + 24:
+      - G\ :sub:`30low bits 7--0`
+      - R\ :sub:`31low bits 5--0`\ (bits 7--2) G\ :sub:`30high bits 9--8`\ (bits 1--0)
+      - FG\ :sub:`32low bits 3--0`\ (bits 7--4) R\ :sub:`31high bits 9--6`\ (bits 3--0)
+      - G\ :sub:`33low bits 1--0`\ (bits 7--6) FG\ :sub:`32high bits 9--4`\ (bits 5--0)
+    * - start + 28:
+      - G\ :sub:`33high bits 9--2`
+      - R\ :sub:`34low bits 7--0`
+      - FG\ :sub:`35low bits 5--0`\ (bits 7--2) R\ :sub:`34high bits 9--8`\ (bits 1--0)
+      - FG\ :sub:`35high bits 3--0`
\ No newline at end of file
diff --git a/Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr12.rst b/Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr12.rst
new file mode 100644
index 000000000000..cc888aac42c2
--- /dev/null
+++ b/Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr12.rst
@@ -0,0 +1,61 @@
+.. -*- coding: utf-8; mode: rst -*-
+
+.. _v4l2-pix-fmt-mtisp-sbggr12:
+.. _v4l2-pix-fmt-mtisp-sgbrg12:
+.. _v4l2-pix-fmt-mtisp-sgrbg12:
+.. _v4l2-pix-fmt-mtisp-srggb12:
+
+*******************************
+V4L2_PIX_FMT_MTISP_SBGGR12 ('MBBC'), V4L2_PIX_FMT_MTISP_SGBRG12('MBGC'), V4L2_PIX_FMT_MTISP_SGRBG12('MBgC'), V4L2_PIX_FMT_MTISP_SRGGB12('MBRC')
+*******************************
+
+12-bit Packed Bayer formats.
+
+Description
+===========
+
+These four pixel formats are used by Mediatek ISP P1.
+This is a packed format, meaning all the data bits for a pixel lying
+next to each other with no padding in memory, with a depth of 12 bits per pixel.
+The least significant byte is stored at lower memory addresses (little-endian).
+The RGB byte order follows raw sRGB / Bayer format from sensor.
+They are conventionally described as GRGR... BGBG..., RGRG... GBGB..., etc.
+Below is an example of conventional RGB byte order BGGR.
+
+**Byte Order.**
+Each cell is one byte.
+
+pixels cross the byte boundary and have a ratio of 6 bytes for each 4 pixels.
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - start + 0:
+      - B\ :sub:`00lowbits 7--0`
+      - G\ :sub:`01lowbits 3--0`\ (bits 7--4) B\ :sub:`00highbits 11--8`\ (bits 3--0)
+      - G\ :sub:`01highbits 7--0`
+      - B\ :sub:`02lowbits 7--0`
+      - G\ :sub:`03lowbits 3--0`\ (bits 7--4) B\ :sub:`02highbits 11--8`\ (bits 3--0)
+      - G\ :sub:`03highbits 7--0`
+    * - start + 6:
+      - G\ :sub:`10lowbits 7--0`
+      - R\ :sub:`11lowbits 3--0`\ (bits 7--4) G\ :sub:`10highbits 11--8`\ (bits 3--0)
+      - R\ :sub:`11highbits 7--0`
+      - G\ :sub:`12lowbits 7--0`
+      - R\ :sub:`13lowbits 3--0`\ (bits 7--4) G\ :sub:`12highbits 11--8`\ (bits 3--0)
+      - R\ :sub:`13highbits 7--0`
+    * - start + 12:
+      - B\ :sub:`20lowbits 7--0`
+      - G\ :sub:`21lowbits 3--0`\ (bits 7--4) B\ :sub:`20highbits 11--8`\ (bits 3--0)
+      - G\ :sub:`21highbits 7--0`
+      - B\ :sub:`22lowbits 7--0`
+      - G\ :sub:`23lowbits 3--0`\ (bits 7--4) B\ :sub:`22highbits 11--8`\ (bits 3--0)
+      - G\ :sub:`23highbits 7--0`
+    * - start + 18:
+      - G\ :sub:`30lowbits 7--0`
+      - R\ :sub:`31lowbits 3--0`\ (bits 7--4) G\ :sub:`30highbits 11--8`\ (bits 3--0)
+      - R\ :sub:`31highbits 7--0`
+      - G\ :sub:`32lowbits 7--0`
+      - R\ :sub:`33lowbits 3--0`\ (bits 7--4) G\ :sub:`32highbits 11--8`\ (bits 3--0)
+      - R\ :sub:`33highbits 7--0`
diff --git a/Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr12f.rst b/Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr12f.rst
new file mode 100644
index 000000000000..c063de9f9ad8
--- /dev/null
+++ b/Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr12f.rst
@@ -0,0 +1,110 @@
+.. -*- coding: utf-8; mode: rst -*-
+
+.. _v4l2-pix-fmt-mtisp-sbggr12f:
+.. _v4l2-pix-fmt-mtisp-sgbrg12f:
+.. _v4l2-pix-fmt-mtisp-sgrbg12f:
+.. _v4l2-pix-fmt-mtisp-srggb12f:
+
+*******************************
+V4L2_PIX_FMT_MTISP_SBGGR12F ('MFBC'), V4L2_PIX_FMT_MTISP_SGBRG12F('MFGC'), V4L2_PIX_FMT_MTISP_SGRBG12F('MFgC'), V4L2_PIX_FMT_MTISP_SRGGB12F('MFRC')
+*******************************
+
+12-bit Packed Full-G Bayer formats.
+
+Description
+===========
+
+These four pixel formats are used by Mediatek ISP P1.
+This is a packed format with a depth of 12 bits per sample with every 4 pixels.
+Full-G means 1 more pixel for green channel every 2 pixels.
+The least significant byte is stored at lower memory addresses (little-endian).
+The RGB byte order follows raw sRGB / Bayer format from sensor. They are conventionally
+described as GRGR... BGBG..., RGRG... GBGB..., etc. Below is an example of conventional
+RGB byte order BGGR.
+
+**Bit-packed representation.**
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - B\ :sub:`00`
+      - FG\ :sub:`01`
+      - G\ :sub:`02`
+      - B\ :sub:`03`
+      - FG\ :sub:`04`
+      - G\ :sub:`05`
+    * - G\ :sub:`10`
+      - R\ :sub:`11`
+      - FG\ :sub:`12`
+      - G\ :sub:`13`
+      - R\ :sub:`14`
+      - FG\ :sub:`15`
+
+**Byte Order.**
+Each cell is one byte.
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - start + 0:
+      - B\ :sub:`00low bits 7--0`
+      - FG\ :sub:`01low bits 3--0`\ (bits 7--4) B\ :sub:`00high bits 11--8`\ (bits 3--0)
+    * - start + 2:
+      - FG\ :sub:`01high bits 7--0`
+      - G\ :sub:`02low bits 7--0`
+    * - start + 4:
+      - B\ :sub:`03low bits 3--0`\ (bits 7--4) G\ :sub:`02high bits 11--8`\ (bits 3--0)
+      - B\ :sub:`03high bits 7--0`
+    * - start + 6:
+      - FG\ :sub:`04low bits 7--0`
+      - G\ :sub:`05low bits 3--0`\ (bits 7--4) FG\ :sub:`04high bits 11--8`\ (bits 3--0)
+    * - start + 8:
+      - G\ :sub:`05high bits 7--0`
+      -
+    * - start + 10:
+      - G\ :sub:`10low bits 7--0`
+      - R\ :sub:`11low bits 3--0`\ (bits 7--4) G\ :sub:`10high bits 11--8`\ (bits 3--0)
+    * - start + 12:
+      - R\ :sub:`11high bits 7--0`
+      - FG\ :sub:`12low bits 7--0`
+    * - start + 14:
+      - G\ :sub:`13low bits 3--0`\ (bits 7--4) FG\ :sub:`12high bits 11--8`\ (bits 3--0)
+      - G\ :sub:`13high bits 7--0`
+    * - start + 16:
+      - R\ :sub:`14low bits 7--0`
+      - FG\ :sub:`15low bits 3--0`\ (bits 7--4) R\ :sub:`14high bits 11--8`\ (bits 3--0)
+    * - start + 18:
+      - FG\ :sub:`15high bits 7--0`
+      -
+    * - start + 20:
+      - B\ :sub:`20low bits 7--0`
+      - FG\ :sub:`21low bits 3--0`\ (bits 7--4) B\ :sub:`20high bits 11--8`\ (bits 3--0)
+    * - start + 22:
+      - FG\ :sub:`21high bits 7--0`
+      - G\ :sub:`22low bits 7--0`
+    * - start + 24:
+      - B\ :sub:`23low bits 3--0`\ (bits 7--4) G\ :sub:`22high bits 11--8`\ (bits 3--0)
+      - B\ :sub:`23high bits 7--0`
+    * - start + 26:
+      - FG\ :sub:`24low bits 7--0`
+      - G\ :sub:`25low bits 3--0`\ (bits 7--4) FG\ :sub:`24high bits 11--8`\ (bits 3--0)
+    * - start + 28:
+      - G\ :sub:`25high bits 7--0`
+      -
+    * - start + 30:
+      - G\ :sub:`30low bits 7--0`
+      - R\ :sub:`31low bits 3--0`\ (bits 7--4) G\ :sub:`30high bits 11--8`\ (bits 3--0)
+    * - start + 32:
+      - R\ :sub:`31high bits 7--0`
+      - FG\ :sub:`32low bits 7--0`
+    * - start + 34:
+      - G\ :sub:`33low bits 3--0`\ (bits 7--4) FG\ :sub:`32high bits 11--8`\ (bits 3--0)
+      - G\ :sub:`33high bits 7--0`
+    * - start + 36:
+      - R\ :sub:`34low bits 7--0`
+      - FG\ :sub:`35low bits 3--0`\ (bits 7--4) R\ :sub:`34high bits 11--8`\ (bits 3--0)
+    * - start + 38:
+      - FG\ :sub:`35high bits 7--0`
+      -
\ No newline at end of file
diff --git a/Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr14.rst b/Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr14.rst
new file mode 100644
index 000000000000..39ea9882a792
--- /dev/null
+++ b/Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr14.rst
@@ -0,0 +1,73 @@
+.. -*- coding: utf-8; mode: rst -*-
+
+.. _v4l2-pix-fmt-mtisp-sbggr14:
+.. _v4l2-pix-fmt-mtisp-sgbrg14:
+.. _v4l2-pix-fmt-mtisp-sgrbg14:
+.. _v4l2-pix-fmt-mtisp-srggb14:
+
+*******************************
+V4L2_PIX_FMT_MTISP_SBGGR14 ('MBBE'), V4L2_PIX_FMT_MTISP_SGBRG14('MBGE'), V4L2_PIX_FMT_MTISP_SGRBG14('MBgE'), V4L2_PIX_FMT_MTISP_SRGGB14('MBRE')
+*******************************
+
+14-bit Packed Bayer formats.
+
+Description
+===========
+
+These four pixel formats are used by Mediatek ISP P1.
+This is a packed format, meaning all the data bits for a pixel lying
+next to each other with no padding in memory, with a depth of 14 bits per pixel.
+The least significant byte is stored at lower memory addresses (little-endian).
+The RGB byte order follows raw sRGB / Bayer format from sensor.
+They are conventionally described as GRGR... BGBG..., RGRG... GBGB..., etc.
+Below is an example of conventional RGB byte order BGGR.
+
+**Byte Order.**
+Each cell is one byte.
+
+pixels cross the byte boundary and have a ratio of 7 bytes for each 4 pixels.
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - start + 0:
+      - B\ :sub:`00low bits 7--0`
+      - G\ :sub:`01low bits 1--0`\ (bits 7--6) B\ :sub:`00high bits 13--8`\ (bits 5--0)
+      - G\ :sub:`01low bits 9--2`\
+      - B\ :sub:`02low bits 3--0`\ (bits 7--4) G\ :sub:`01high bits 13--10`\ (bits 3--0)
+    * - start + 4:
+      - B\ :sub:`02low bits 11--4`\
+      - G\ :sub:`03low bits 5--0`\ (bits 7--2) B\ :sub:`02high bits 13--12`\ (bits 1--0)
+      - G\ :sub:`03high bits 13--6`\
+      -
+    * - start + 8:
+      - G\ :sub:`10low bits 7--0`
+      - R\ :sub:`11low bits 1--0`\ (bits 7--6) G\ :sub:`10high bits 13--8`\ (bits 5--0)
+      - R\ :sub:`11low bits 9--2`\
+      - G\ :sub:`12low bits 3--0`\ (bits 7--4) R\ :sub:`11high bits 13--10`\ (bits 3--0)
+    * - start + 12:
+      - G\ :sub:`12low bits 11--4`\
+      - R\ :sub:`13low bits 5--0`\ (bits 7--2) G\ :sub:`12high bits 13--12`\ (bits 1--0)
+      - R\ :sub:`13high bits 13--6`\
+      -
+    * - start + 16:
+      - B\ :sub:`20low bits 7--0`
+      - G\ :sub:`21low bits 1--0`\ (bits 7--6) B\ :sub:`20high bits 13--8`\ (bits 5--0)
+      - G\ :sub:`21low bits 9--2`\
+      - B\ :sub:`22low bits 3--0`\ (bits 7--4) G\ :sub:`21high bits 13--10`\ (bits 3--0)
+    * - start + 20:
+      - B\ :sub:`22low bits 11--4`\
+      - G\ :sub:`23low bits 5--0`\ (bits 7--2) B\ :sub:`22high bits 13--12`\ (bits 1--0)
+      - G\ :sub:`23high bits 13--6`\
+      -
+    * - start + 24:
+      - G\ :sub:`30low bits 7--0`
+      - R\ :sub:`31low bits 1--0`\ (bits 7--6) G\ :sub:`30high bits 13--8`\ (bits 5--0)
+      - R\ :sub:`31low bits 9--2`\
+      - G\ :sub:`32low bits 3--0`\ (bits 7--4) R\ :sub:`31high bits 13--10`\ (bits 3--0)
+    * - start + 28:
+      - G\ :sub:`32low bits 11--4`\
+      - R\ :sub:`33low bits 5--0`\ (bits 7--2) G\ :sub:`32high bits 13--12`\ (bits 1--0)
+      - R\ :sub:`33high bits 13--6`\
+      -
\ No newline at end of file
diff --git a/Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr14f.rst b/Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr14f.rst
new file mode 100644
index 000000000000..010b1c190c60
--- /dev/null
+++ b/Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr14f.rst
@@ -0,0 +1,110 @@
+.. -*- coding: utf-8; mode: rst -*-
+
+.. _v4l2-pix-fmt-mtisp-sbggr14f:
+.. _v4l2-pix-fmt-mtisp-sgbrg14f:
+.. _v4l2-pix-fmt-mtisp-sgrbg14f:
+.. _v4l2-pix-fmt-mtisp-srggb14f:
+
+*******************************
+V4L2_PIX_FMT_MTISP_SBGGR14F ('MFBE'), V4L2_PIX_FMT_MTISP_SGBRG14F('MFGE'), V4L2_PIX_FMT_MTISP_SGRBG14F('MFgE'), V4L2_PIX_FMT_MTISP_SRGGB14F('MFRE')
+*******************************
+
+14-bit Packed Full-G Bayer formats.
+
+Description
+===========
+
+These four pixel formats are used by Mediatek ISP P1.
+This is a packed format with a depth of 14 bits per sample with every 4 pixels.
+Full-G means 1 more pixel for green channel every 2 pixels.
+The least significant byte is stored at lower memory addresses (little-endian).
+The RGB byte order follows raw sRGB / Bayer format from sensor. They are conventionally
+described as GRGR... BGBG..., RGRG... GBGB..., etc. Below is an example of conventional
+RGB byte order BGGR.
+
+**Bit-packed representation.**
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - B\ :sub:`00`
+      - FG\ :sub:`01`
+      - G\ :sub:`02`
+      - B\ :sub:`03`
+      - FG\ :sub:`04`
+      - G\ :sub:`05`
+    * - G\ :sub:`10`
+      - R\ :sub:`11`
+      - FG\ :sub:`12`
+      - G\ :sub:`13`
+      - R\ :sub:`14`
+      - FG\ :sub:`15`
+
+**Byte Order.**
+Each cell is one byte.
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - start + 0:
+      - B\ :sub:`00low bits 7--0`
+      - FG\ :sub:`01low bits 1--0`\ (bits 7--6) B\ :sub:`00high bits 13--8`\ (bits 5--0)
+      - FG\ :sub:`01low bits 9--2`
+      - G\ :sub:`02low bits 3--0`\ (bits 7--4) FG\ :sub:`01high bits 13--10`\ (bits 3--0)
+    * - start + 4:
+      - G\ :sub:`02low bits 11--4`
+      - B\ :sub:`03low bits 5--0`\ (bits 7--2) G\ :sub:`02high bits 13--12`\ (bits 1--0)
+      - B\ :sub:`03high bits 13--6`
+      - FG\ :sub:`04low bits 7--0`
+    * - start + 8:
+      - G\ :sub:`05low bits 1--0`\ (bits 7--6) FG\ :sub:`04high bits 13--8`\ (bits 5--0)
+      - G\ :sub:`05high bits 9--2`
+      - G\ :sub:`05high bits 13--10`
+      -
+    * - start + 12:
+      - G\ :sub:`10low bits 7--0`
+      - R\ :sub:`11low bits 1--0`\ (bits 7--6) G\ :sub:`10high bits 13--8`\ (bits 5--0)
+      - R\ :sub:`11low bits 9--2`
+      - FG\ :sub:`12low bits 3--0`\ (bits 7--4) R\ :sub:`11high bits 13--10`\ (bits 3--0)
+    * - start + 16:
+      - FG\ :sub:`12low bits 11--4`
+      - G\ :sub:`13low bits 5--0`\ (bits 7--2) FG\ :sub:`12high bits 13--12`\ (bits 1--0)
+      - G\ :sub:`13high bits 13--6`
+      - R\ :sub:`14low bits 7--0`
+    * - start + 20:
+      - FG\ :sub:`15low bits 1--0`\ (bits 7--6) R\ :sub:`14high bits 13--8`\ (bits 5--0)
+      - FG\ :sub:`15high bits 9--2`
+      - FG\ :sub:`15high bits 13--10`
+      -
+    * - start + 24:
+      - B\ :sub:`20low bits 7--0`
+      - FG\ :sub:`21low bits 1--0`\ (bits 7--6) B\ :sub:`20high bits 13--8`\ (bits 5--0)
+      - FG\ :sub:`21low bits 9--2`
+      - G\ :sub:`22low bits 3--0`\ (bits 7--4) FG\ :sub:`21high bits 13--10`\ (bits 3--0)
+    * - start + 28:
+      - G\ :sub:`22low bits 11--4`
+      - B\ :sub:`23low bits 5--0`\ (bits 7--2) G\ :sub:`22high bits 13--12`\ (bits 1--0)
+      - B\ :sub:`23high bits 13--6`
+      - FG\ :sub:`24low bits 7--0`
+    * - start + 32:
+      - G\ :sub:`25low bits 1--0`\ (bits 7--6) FG\ :sub:`24high bits 13--8`\ (bits 5--0)
+      - G\ :sub:`25high bits 9--2`
+      - G\ :sub:`25high bits 13--10`
+      -
+    * - start + 36:
+      - G\ :sub:`30low bits 7--0`
+      - R\ :sub:`31low bits 1--0`\ (bits 7--6) G\ :sub:`30high bits 13--8`\ (bits 5--0)
+      - R\ :sub:`31low bits 9--2`
+      - FG\ :sub:`32low bits 3--0`\ (bits 7--4) R\ :sub:`31high bits 13--10`\ (bits 3--0)
+    * - start + 40:
+      - FG\ :sub:`32low bits 11--4`
+      - G\ :sub:`33low bits 5--0`\ (bits 7--2) FG\ :sub:`32high bits 13--12`\ (bits 1--0)
+      - G\ :sub:`33high bits 13--6`
+      - R\ :sub:`34low bits 7--0`
+    * - start + 44:
+      - FG\ :sub:`35low bits 1--0`\ (bits 7--6) R\ :sub:`34high bits 13--8`\ (bits 5--0)
+      - FG\ :sub:`35high bits 9--2`
+      - FG\ :sub:`35high bits 13--10`
+      -
\ No newline at end of file
diff --git a/Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr8.rst b/Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr8.rst
new file mode 100644
index 000000000000..86cadbf38175
--- /dev/null
+++ b/Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr8.rst
@@ -0,0 +1,51 @@
+.. -*- coding: utf-8; mode: rst -*-
+
+.. _v4l2-pix-fmt-mtisp-sbggr8:
+.. _v4l2-pix-fmt-mtisp-sgbrg8:
+.. _v4l2-pix-fmt-mtisp-sgrbg8:
+.. _v4l2-pix-fmt-mtisp-srggb8:
+
+*******************************
+V4L2_PIX_FMT_MTISP_SBGGR8 ('MBB8'), V4L2_PIX_FMT_MTISP_SGBRG8('MBG8'), V4L2_PIX_FMT_MTISP_SGRBG8('MBg8'), V4L2_PIX_FMT_MTISP_SRGGB8('MBR8')
+*******************************
+
+8-bit Packed Bayer formats.
+
+Description
+===========
+
+These four pixel formats are used by Mediatek ISP P1.
+This is a packed format, meaning all the data bits for a pixel lying
+next to each other with no padding in memory, with a depth of 8 bits per pixel.
+The least significant byte is stored at lower memory addresses (little-endian).
+The RGB byte order follows raw sRGB / Bayer format from sensor.
+They are conventionally described as GRGR... BGBG..., RGRG... GBGB..., etc.
+Below is an example of conventional RGB byte order BGGR.
+
+**Byte Order.**
+Each cell is one byte.
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - start + 0:
+      - B\ :sub:`00`
+      - G\ :sub:`01`
+      - B\ :sub:`02`
+      - G\ :sub:`03`
+    * - start + 4:
+      - G\ :sub:`10`
+      - R\ :sub:`11`
+      - G\ :sub:`12`
+      - R\ :sub:`13`
+    * - start + 8:
+      - B\ :sub:`20`
+      - G\ :sub:`21`
+      - B\ :sub:`22`
+      - G\ :sub:`23`
+    * - start + 12:
+      - G\ :sub:`30`
+      - R\ :sub:`31`
+      - G\ :sub:`32`
+      - R\ :sub:`33`
\ No newline at end of file
diff --git a/Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr8f.rst b/Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr8f.rst
new file mode 100644
index 000000000000..ca5151312bca
--- /dev/null
+++ b/Documentation/media/uapi/v4l/pixfmt-mtisp-sbggr8f.rst
@@ -0,0 +1,78 @@
+.. -*- coding: utf-8; mode: rst -*-
+
+.. _v4l2-pix-fmt-mtisp-sbggr8f:
+.. _v4l2-pix-fmt-mtisp-sgbrg8f:
+.. _v4l2-pix-fmt-mtisp-sgrbg8f:
+.. _v4l2-pix-fmt-mtisp-srggb8f:
+
+*******************************
+V4L2_PIX_FMT_MTISP_SBGGR8F ('MFB8'), V4L2_PIX_FMT_MTISP_SGBRG8F('MFG8'), V4L2_PIX_FMT_MTISP_SGRBG8F('MFg8'), V4L2_PIX_FMT_MTISP_SRGGB8F('MFR8')
+*******************************
+
+8-bit Packed Full-G Bayer formats.
+
+Description
+===========
+
+These four pixel formats are used by Mediatek ISP P1.
+This is a packed format with a depth of 8 bits per sample with every 4 pixels.
+Full-G means 1 more pixel for green channel every 2 pixels.
+The least significant byte is stored at lower memory addresses (little-endian).
+The RGB byte order follows raw sRGB / Bayer format from sensor. They are conventionally
+described as GRGR... BGBG..., RGRG... GBGB..., etc. Below is an example of conventional
+RGB byte order BGGR.
+
+**Bit-packed representation.**
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - B\ :sub:`00`
+      - FG\ :sub:`01`
+      - G\ :sub:`02`
+      - B\ :sub:`03`
+      - FG\ :sub:`04`
+      - G\ :sub:`05`
+    * - G\ :sub:`10`
+      - R\ :sub:`11`
+      - FG\ :sub:`12`
+      - G\ :sub:`13`
+      - R\ :sub:`14`
+      - FG\ :sub:`15`
+
+**Byte Order.**
+Each cell is one byte.
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - start + 0:
+      - B\ :sub:`00`
+      - FG\ :sub:`01`
+      - G\ :sub:`02`
+      - B\ :sub:`03`
+      - FG\ :sub:`04`
+      - G\ :sub:`05`
+    * - start + 6:
+      - G\ :sub:`10`
+      - R\ :sub:`11`
+      - FG\ :sub:`12`
+      - G\ :sub:`13`
+      - R\ :sub:`14`
+      - FG\ :sub:`15`
+    * - start + 12:
+      - B\ :sub:`20`
+      - FG\ :sub:`21`
+      - G\ :sub:`22`
+      - B\ :sub:`23`
+      - FG\ :sub:`24`
+      - G\ :sub:`25`
+    * - start + 18:
+      - G\ :sub:`30`
+      - R\ :sub:`31`
+      - FG\ :sub:`32`
+      - G\ :sub:`33`
+      - R\ :sub:`34`
+      - FG\ :sub:`35`
\ No newline at end of file
diff --git a/Documentation/media/uapi/v4l/pixfmt-rgb.rst b/Documentation/media/uapi/v4l/pixfmt-rgb.rst
index 48ab80024835..1ba260c84083 100644
--- a/Documentation/media/uapi/v4l/pixfmt-rgb.rst
+++ b/Documentation/media/uapi/v4l/pixfmt-rgb.rst
@@ -28,3 +28,11 @@ RGB Formats
     pixfmt-srggb12p
     pixfmt-srggb14p
     pixfmt-srggb16
+    pixfmt-pixfmt-mtisp-srggb8
+    pixfmt-pixfmt-mtisp-srggb10
+    pixfmt-pixfmt-mtisp-srggb12
+    pixfmt-pixfmt-mtisp-srggb14
+    pixfmt-pixfmt-mtisp-srggb8f
+    pixfmt-pixfmt-mtisp-srggb10f
+    pixfmt-pixfmt-mtisp-srggb12f
+    pixfmt-pixfmt-mtisp-srggb14f
\ No newline at end of file
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index b1f4b991dba6..451dada2146d 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1293,6 +1293,38 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_KONICA420:	descr = "GSPCA KONICA420"; break;
 	case V4L2_PIX_FMT_HSV24:	descr = "24-bit HSV 8-8-8"; break;
 	case V4L2_PIX_FMT_HSV32:	descr = "32-bit XHSV 8-8-8-8"; break;
+	case V4L2_PIX_FMT_MTISP_SBGGR8: descr = "8-bit Bayer BGGR MTISP Packed"; break;
+	case V4L2_PIX_FMT_MTISP_SGBRG8: descr = "8-bit Bayer GBRG MTISP Packed"; break;
+	case V4L2_PIX_FMT_MTISP_SGRBG8: descr = "8-bit Bayer GRBG MTISP Packed"; break;
+	case V4L2_PIX_FMT_MTISP_SRGGB8: descr = "8-bit Bayer RGGB MTISP Packed"; break;
+	case V4L2_PIX_FMT_MTISP_SBGGR10: descr = "10-bit Bayer BGGR MTISP Packed"; break;
+	case V4L2_PIX_FMT_MTISP_SGBRG10: descr = "10-bit Bayer GBRG MTISP Packed"; break;
+	case V4L2_PIX_FMT_MTISP_SGRBG10: descr = "10-bit Bayer GRBG MTISP Packed"; break;
+	case V4L2_PIX_FMT_MTISP_SRGGB10: descr = "10-bit Bayer RGGB MTISP Packed"; break;
+	case V4L2_PIX_FMT_MTISP_SBGGR12: descr = "12-bit Bayer BGGR MTISP Packed"; break;
+	case V4L2_PIX_FMT_MTISP_SGBRG12: descr = "12-bit Bayer GBRG MTISP Packed"; break;
+	case V4L2_PIX_FMT_MTISP_SGRBG12: descr = "12-bit Bayer GRBG MTISP Packed"; break;
+	case V4L2_PIX_FMT_MTISP_SRGGB12: descr = "12-bit Bayer RGGB MTISP Packed"; break;
+	case V4L2_PIX_FMT_MTISP_SBGGR14: descr = "14-bit Bayer BGGR MTISP Packed"; break;
+	case V4L2_PIX_FMT_MTISP_SGBRG14: descr = "14-bit Bayer GBRG MTISP Packed"; break;
+	case V4L2_PIX_FMT_MTISP_SGRBG14: descr = "14-bit Bayer GRBG MTISP Packed"; break;
+	case V4L2_PIX_FMT_MTISP_SRGGB14: descr = "14-bit Bayer RGGB MTISP Packed"; break;
+	case V4L2_PIX_FMT_MTISP_SBGGR8F: descr = "8-bit Full-G Bayer BGGR Packed"; break;
+	case V4L2_PIX_FMT_MTISP_SGBRG8F: descr = "8-bit Full-G Bayer GBRG Packed"; break;
+	case V4L2_PIX_FMT_MTISP_SGRBG8F: descr = "8-bit Full-G Bayer GRBG Packed"; break;
+	case V4L2_PIX_FMT_MTISP_SRGGB8F: descr = "8-bit Full-G Bayer RGGB Packed"; break;
+	case V4L2_PIX_FMT_MTISP_SBGGR10F: descr = "10-bit Full-G Bayer BGGR Packed"; break;
+	case V4L2_PIX_FMT_MTISP_SGBRG10F: descr = "10-bit Full-G Bayer GBRG Packed"; break;
+	case V4L2_PIX_FMT_MTISP_SGRBG10F: descr = "10-bit Full-G Bayer GRBG Packed"; break;
+	case V4L2_PIX_FMT_MTISP_SRGGB10F: descr = "10-bit Full-G Bayer RGGB Packed"; break;
+	case V4L2_PIX_FMT_MTISP_SBGGR12F: descr = "12-bit Full-G Bayer BGGR Packed"; break;
+	case V4L2_PIX_FMT_MTISP_SGBRG12F: descr = "12-bit Full-G Bayer GBRG Packed"; break;
+	case V4L2_PIX_FMT_MTISP_SGRBG12F: descr = "12-bit Full-G Bayer GRBG Packed"; break;
+	case V4L2_PIX_FMT_MTISP_SRGGB12F: descr = "12-bit Full-G Bayer RGGB Packed"; break;
+	case V4L2_PIX_FMT_MTISP_SBGGR14F: descr = "14-bit Full-G Bayer BGGR Packed"; break;
+	case V4L2_PIX_FMT_MTISP_SGBRG14F: descr = "14-bit Full-G Bayer GBRG Packed"; break;
+	case V4L2_PIX_FMT_MTISP_SGRBG14F: descr = "14-bit Full-G Bayer GRBG Packed"; break;
+	case V4L2_PIX_FMT_MTISP_SRGGB14F: descr = "14-bit Full-G Bayer RGGB Packed"; break;
 	case V4L2_SDR_FMT_CU8:		descr = "Complex U8"; break;
 	case V4L2_SDR_FMT_CU16LE:	descr = "Complex U16LE"; break;
 	case V4L2_SDR_FMT_CS8:		descr = "Complex S8"; break;
@@ -1308,6 +1340,11 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_VSP1_HGO:	descr = "R-Car VSP1 1-D Histogram"; break;
 	case V4L2_META_FMT_VSP1_HGT:	descr = "R-Car VSP1 2-D Histogram"; break;
 	case V4L2_META_FMT_UVC:		descr = "UVC payload header metadata"; break;
+	case V4L2_META_FMT_MTISP_3A:	descr = "AE/AWB Histogram"; break;
+	case V4L2_META_FMT_MTISP_AF:	descr = "AF Histogram"; break;
+	case V4L2_META_FMT_MTISP_LCS:	descr = "Local Contrast Enhancement Stat"; break;
+	case V4L2_META_FMT_MTISP_LMV:	descr = "Local Motion Vector Histogram"; break;
+	case V4L2_META_FMT_MTISP_PARAMS: descr = "MTK ISP Tuning Metadata"; break;
 
 	default:
 		/* Compressed formats */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index a4fd271348e7..e515e681838c 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -728,6 +728,40 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_IPU3_SGRBG10	v4l2_fourcc('i', 'p', '3', 'G') /* IPU3 packed 10-bit GRBG bayer */
 #define V4L2_PIX_FMT_IPU3_SRGGB10	v4l2_fourcc('i', 'p', '3', 'r') /* IPU3 packed 10-bit RGGB bayer */
 
+/* Vendor specific - Mediatek ISP bayer formats */
+#define V4L2_PIX_FMT_MTISP_SBGGR8   v4l2_fourcc('M', 'B', 'B', '8') /*  Packed  8-bit  */
+#define V4L2_PIX_FMT_MTISP_SGBRG8   v4l2_fourcc('M', 'B', 'G', '8') /*  Packed  8-bit  */
+#define V4L2_PIX_FMT_MTISP_SGRBG8   v4l2_fourcc('M', 'B', 'g', '8') /*  Packed  8-bit  */
+#define V4L2_PIX_FMT_MTISP_SRGGB8   v4l2_fourcc('M', 'B', 'R', '8') /*  Packed  8-bit  */
+#define V4L2_PIX_FMT_MTISP_SBGGR10  v4l2_fourcc('M', 'B', 'B', 'A') /*  Packed 10-bit  */
+#define V4L2_PIX_FMT_MTISP_SGBRG10  v4l2_fourcc('M', 'B', 'G', 'A') /*  Packed 10-bit  */
+#define V4L2_PIX_FMT_MTISP_SGRBG10  v4l2_fourcc('M', 'B', 'g', 'A') /*  Packed 10-bit  */
+#define V4L2_PIX_FMT_MTISP_SRGGB10  v4l2_fourcc('M', 'B', 'R', 'A') /*  Packed 10-bit  */
+#define V4L2_PIX_FMT_MTISP_SBGGR12  v4l2_fourcc('M', 'B', 'B', 'C') /*  Packed 12-bit  */
+#define V4L2_PIX_FMT_MTISP_SGBRG12  v4l2_fourcc('M', 'B', 'G', 'C') /*  Packed 12-bit  */
+#define V4L2_PIX_FMT_MTISP_SGRBG12  v4l2_fourcc('M', 'B', 'g', 'C') /*  Packed 12-bit  */
+#define V4L2_PIX_FMT_MTISP_SRGGB12  v4l2_fourcc('M', 'B', 'R', 'C') /*  Packed 12-bit  */
+#define V4L2_PIX_FMT_MTISP_SBGGR14  v4l2_fourcc('M', 'B', 'B', 'E') /*  Packed 14-bit  */
+#define V4L2_PIX_FMT_MTISP_SGBRG14  v4l2_fourcc('M', 'B', 'G', 'E') /*  Packed 14-bit  */
+#define V4L2_PIX_FMT_MTISP_SGRBG14  v4l2_fourcc('M', 'B', 'g', 'E') /*  Packed 14-bit  */
+#define V4L2_PIX_FMT_MTISP_SRGGB14  v4l2_fourcc('M', 'B', 'R', 'E') /*  Packed 14-bit  */
+#define V4L2_PIX_FMT_MTISP_SBGGR8F  v4l2_fourcc('M', 'F', 'B', '8') /*  Full-G  8-bit  */
+#define V4L2_PIX_FMT_MTISP_SGBRG8F  v4l2_fourcc('M', 'F', 'G', '8') /*  Full-G  8-bit  */
+#define V4L2_PIX_FMT_MTISP_SGRBG8F  v4l2_fourcc('M', 'F', 'g', '8') /*  Full-G  8-bit  */
+#define V4L2_PIX_FMT_MTISP_SRGGB8F  v4l2_fourcc('M', 'F', 'R', '8') /*  Full-G  8-bit  */
+#define V4L2_PIX_FMT_MTISP_SBGGR10F  v4l2_fourcc('M', 'F', 'B', 'A') /*  Full-G 10-bit  */
+#define V4L2_PIX_FMT_MTISP_SGBRG10F  v4l2_fourcc('M', 'F', 'G', 'A') /*  Full-G 10-bit  */
+#define V4L2_PIX_FMT_MTISP_SGRBG10F  v4l2_fourcc('M', 'F', 'g', 'A') /*  Full-G 10-bit  */
+#define V4L2_PIX_FMT_MTISP_SRGGB10F  v4l2_fourcc('M', 'F', 'R', 'A') /*  Full-G 10-bit  */
+#define V4L2_PIX_FMT_MTISP_SBGGR12F  v4l2_fourcc('M', 'F', 'B', 'C') /*  Full-G 12-bit  */
+#define V4L2_PIX_FMT_MTISP_SGBRG12F  v4l2_fourcc('M', 'F', 'G', 'C') /*  Full-G 12-bit  */
+#define V4L2_PIX_FMT_MTISP_SGRBG12F  v4l2_fourcc('M', 'F', 'g', 'C') /*  Full-G 12-bit  */
+#define V4L2_PIX_FMT_MTISP_SRGGB12F  v4l2_fourcc('M', 'F', 'R', 'C') /*  Full-G 12-bit  */
+#define V4L2_PIX_FMT_MTISP_SBGGR14F  v4l2_fourcc('M', 'F', 'B', 'E') /*  Full-G 14-bit  */
+#define V4L2_PIX_FMT_MTISP_SGBRG14F  v4l2_fourcc('M', 'F', 'G', 'E') /*  Full-G 14-bit  */
+#define V4L2_PIX_FMT_MTISP_SGRBG14F  v4l2_fourcc('M', 'F', 'g', 'E') /*  Full-G 14-bit  */
+#define V4L2_PIX_FMT_MTISP_SRGGB14F  v4l2_fourcc('M', 'F', 'R', 'E') /*  Full-G 14-bit  */
+
 /* SDR formats - used only for Software Defined Radio devices */
 #define V4L2_SDR_FMT_CU8          v4l2_fourcc('C', 'U', '0', '8') /* IQ u8 */
 #define V4L2_SDR_FMT_CU16LE       v4l2_fourcc('C', 'U', '1', '6') /* IQ u16le */
@@ -749,6 +783,11 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_VSP1_HGT    v4l2_fourcc('V', 'S', 'P', 'T') /* R-Car VSP1 2-D Histogram */
 #define V4L2_META_FMT_UVC         v4l2_fourcc('U', 'V', 'C', 'H') /* UVC Payload Header metadata */
 #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D4XX Payload Header metadata */
+#define V4L2_META_FMT_MTISP_3A    v4l2_fourcc('M', 'T', 'f', 'a') /* AE/AWB histogram */
+#define V4L2_META_FMT_MTISP_AF    v4l2_fourcc('M', 'T', 'f', 'f') /* AF histogram */
+#define V4L2_META_FMT_MTISP_LCS   v4l2_fourcc('M', 'T', 'f', 'c') /* Local contrast enhanced statistics */
+#define V4L2_META_FMT_MTISP_LMV   v4l2_fourcc('M', 'T', 'f', 'm') /* Local motion vector histogram */
+#define V4L2_META_FMT_MTISP_PARAMS v4l2_fourcc('M', 'T', 'f', 'p') /* ISP tuning parameters */
 
 /* priv field value to indicates that subsequent fields are valid. */
 #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
-- 
2.18.0

