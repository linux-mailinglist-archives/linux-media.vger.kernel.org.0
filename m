Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECA617FF2D
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2020 14:45:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbgCJNom (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 09:44:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:37666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727179AbgCJNnT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 09:43:19 -0400
Received: from mail.kernel.org (ip5f5ad4e9.dynamic.kabel-deutschland.de [95.90.212.233])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 137DE2468D;
        Tue, 10 Mar 2020 13:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583847797;
        bh=/r/NFkdIeELwpL9c26kF2D5eSHsJTk+9/bC+o0QS3GY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jtwOezClQpAKS/ZPG9Yo3VcbEJjq+pYQBPFNtTnhU9GKvJlt+5E+zzOAuYxbLEQ1U
         cFwfTQE5JM3jXoPNWp4AlWF10VbklFEUa0QBsvhTv7Gu+KQLsPT+k+xq53106EJ9X/
         OGrWe2zgbX26t2A4LgF7AGkxFLQM5fRrkBJOQH+k=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jBfAB-0005vs-84; Tue, 10 Mar 2020 14:43:15 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-media@vger.kernel.org
Subject: [PATCH v2 09/22] media: docs: split cx2341x.rst into different audiences
Date:   Tue, 10 Mar 2020 14:43:00 +0100
Message-Id: <5164e140428b241144396847c4485096cf6c6ae4.1583847556.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <cover.1583847556.git.mchehab+huawei@kernel.org>
References: <cover.1583847556.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This file contains both driver develompent documentation
(basically, firmware documentation) and IVTV-specific
documentation about VBI and raw formats, focused on uAPI
development.

Split on two, as they're usually read by different audiences.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../{cx2341x.rst => cx2341x-devel.rst}        | 175 -----------------
 .../media/v4l-drivers/cx2341x-uapi.rst        | 179 ++++++++++++++++++
 Documentation/media/v4l-drivers/index.rst     |   3 +-
 3 files changed, 181 insertions(+), 176 deletions(-)
 rename Documentation/media/v4l-drivers/{cx2341x.rst => cx2341x-devel.rst} (91%)
 create mode 100644 Documentation/media/v4l-drivers/cx2341x-uapi.rst

diff --git a/Documentation/media/v4l-drivers/cx2341x.rst b/Documentation/media/v4l-drivers/cx2341x-devel.rst
similarity index 91%
rename from Documentation/media/v4l-drivers/cx2341x.rst
rename to Documentation/media/v4l-drivers/cx2341x-devel.rst
index 8ca37deb56b6..97699df6ea2e 100644
--- a/Documentation/media/v4l-drivers/cx2341x.rst
+++ b/Documentation/media/v4l-drivers/cx2341x-devel.rst
@@ -3683,178 +3683,3 @@ Register 0x0004 holds the DMA Transfer Status:
 - bit 2:   DMA read error
 - bit 3:   DMA write error
 - bit 4:   Scatter-Gather array error
-
-Non-compressed file format
---------------------------
-
-The cx23416 can produce (and the cx23415 can also read) raw YUV output. The
-format of a YUV frame is specific to this chip and is called HM12. 'HM' stands
-for 'Hauppauge Macroblock', which is a misnomer as 'Conexant Macroblock' would
-be more accurate.
-
-The format is YUV 4:2:0 which uses 1 Y byte per pixel and 1 U and V byte per
-four pixels.
-
-The data is encoded as two macroblock planes, the first containing the Y
-values, the second containing UV macroblocks.
-
-The Y plane is divided into blocks of 16x16 pixels from left to right
-and from top to bottom. Each block is transmitted in turn, line-by-line.
-
-So the first 16 bytes are the first line of the top-left block, the
-second 16 bytes are the second line of the top-left block, etc. After
-transmitting this block the first line of the block on the right to the
-first block is transmitted, etc.
-
-The UV plane is divided into blocks of 16x8 UV values going from left
-to right, top to bottom. Each block is transmitted in turn, line-by-line.
-
-So the first 16 bytes are the first line of the top-left block and
-contain 8 UV value pairs (16 bytes in total). The second 16 bytes are the
-second line of 8 UV pairs of the top-left block, etc. After transmitting
-this block the first line of the block on the right to the first block is
-transmitted, etc.
-
-The code below is given as an example on how to convert HM12 to separate
-Y, U and V planes. This code assumes frames of 720x576 (PAL) pixels.
-
-The width of a frame is always 720 pixels, regardless of the actual specified
-width.
-
-If the height is not a multiple of 32 lines, then the captured video is
-missing macroblocks at the end and is unusable. So the height must be a
-multiple of 32.
-
-Raw format c example
-~~~~~~~~~~~~~~~~~~~~
-
-.. code-block:: c
-
-	#include <stdio.h>
-	#include <stdlib.h>
-	#include <string.h>
-
-	static unsigned char frame[576*720*3/2];
-	static unsigned char framey[576*720];
-	static unsigned char frameu[576*720 / 4];
-	static unsigned char framev[576*720 / 4];
-
-	static void de_macro_y(unsigned char* dst, unsigned char *src, int dstride, int w, int h)
-	{
-	unsigned int y, x, i;
-
-	// descramble Y plane
-	// dstride = 720 = w
-	// The Y plane is divided into blocks of 16x16 pixels
-	// Each block in transmitted in turn, line-by-line.
-	for (y = 0; y < h; y += 16) {
-		for (x = 0; x < w; x += 16) {
-		for (i = 0; i < 16; i++) {
-			memcpy(dst + x + (y + i) * dstride, src, 16);
-			src += 16;
-		}
-		}
-	}
-	}
-
-	static void de_macro_uv(unsigned char *dstu, unsigned char *dstv, unsigned char *src, int dstride, int w, int h)
-	{
-	unsigned int y, x, i;
-
-	// descramble U/V plane
-	// dstride = 720 / 2 = w
-	// The U/V values are interlaced (UVUV...).
-	// Again, the UV plane is divided into blocks of 16x16 UV values.
-	// Each block in transmitted in turn, line-by-line.
-	for (y = 0; y < h; y += 16) {
-		for (x = 0; x < w; x += 8) {
-		for (i = 0; i < 16; i++) {
-			int idx = x + (y + i) * dstride;
-
-			dstu[idx+0] = src[0];  dstv[idx+0] = src[1];
-			dstu[idx+1] = src[2];  dstv[idx+1] = src[3];
-			dstu[idx+2] = src[4];  dstv[idx+2] = src[5];
-			dstu[idx+3] = src[6];  dstv[idx+3] = src[7];
-			dstu[idx+4] = src[8];  dstv[idx+4] = src[9];
-			dstu[idx+5] = src[10]; dstv[idx+5] = src[11];
-			dstu[idx+6] = src[12]; dstv[idx+6] = src[13];
-			dstu[idx+7] = src[14]; dstv[idx+7] = src[15];
-			src += 16;
-		}
-		}
-	}
-	}
-
-	/*************************************************************************/
-	int main(int argc, char **argv)
-	{
-	FILE *fin;
-	int i;
-
-	if (argc == 1) fin = stdin;
-	else fin = fopen(argv[1], "r");
-
-	if (fin == NULL) {
-		fprintf(stderr, "cannot open input\n");
-		exit(-1);
-	}
-	while (fread(frame, sizeof(frame), 1, fin) == 1) {
-		de_macro_y(framey, frame, 720, 720, 576);
-		de_macro_uv(frameu, framev, frame + 720 * 576, 720 / 2, 720 / 2, 576 / 2);
-		fwrite(framey, sizeof(framey), 1, stdout);
-		fwrite(framev, sizeof(framev), 1, stdout);
-		fwrite(frameu, sizeof(frameu), 1, stdout);
-	}
-	fclose(fin);
-	return 0;
-	}
-
-
-Format of embedded V4L2_MPEG_STREAM_VBI_FMT_IVTV VBI data
----------------------------------------------------------
-
-Author: Hans Verkuil <hverkuil@xs4all.nl>
-
-
-This section describes the V4L2_MPEG_STREAM_VBI_FMT_IVTV format of the VBI data
-embedded in an MPEG-2 program stream. This format is in part dictated by some
-hardware limitations of the ivtv driver (the driver for the Conexant cx23415/6
-chips), in particular a maximum size for the VBI data. Anything longer is cut
-off when the MPEG stream is played back through the cx23415.
-
-The advantage of this format is it is very compact and that all VBI data for
-all lines can be stored while still fitting within the maximum allowed size.
-
-The stream ID of the VBI data is 0xBD. The maximum size of the embedded data is
-4 + 43 * 36, which is 4 bytes for a header and 2 * 18 VBI lines with a 1 byte
-header and a 42 bytes payload each. Anything beyond this limit is cut off by
-the cx23415/6 firmware. Besides the data for the VBI lines we also need 36 bits
-for a bitmask determining which lines are captured and 4 bytes for a magic cookie,
-signifying that this data package contains V4L2_MPEG_STREAM_VBI_FMT_IVTV VBI data.
-If all lines are used, then there is no longer room for the bitmask. To solve this
-two different magic numbers were introduced:
-
-'itv0': After this magic number two unsigned longs follow. Bits 0-17 of the first
-unsigned long denote which lines of the first field are captured. Bits 18-31 of
-the first unsigned long and bits 0-3 of the second unsigned long are used for the
-second field.
-
-'ITV0': This magic number assumes all VBI lines are captured, i.e. it implicitly
-implies that the bitmasks are 0xffffffff and 0xf.
-
-After these magic cookies (and the 8 byte bitmask in case of cookie 'itv0') the
-captured VBI lines start:
-
-For each line the least significant 4 bits of the first byte contain the data type.
-Possible values are shown in the table below. The payload is in the following 42
-bytes.
-
-Here is the list of possible data types:
-
-.. code-block:: c
-
-	#define IVTV_SLICED_TYPE_TELETEXT       0x1     // Teletext (uses lines 6-22 for PAL)
-	#define IVTV_SLICED_TYPE_CC             0x4     // Closed Captions (line 21 NTSC)
-	#define IVTV_SLICED_TYPE_WSS            0x5     // Wide Screen Signal (line 23 PAL)
-	#define IVTV_SLICED_TYPE_VPS            0x7     // Video Programming System (PAL) (line 16)
-
diff --git a/Documentation/media/v4l-drivers/cx2341x-uapi.rst b/Documentation/media/v4l-drivers/cx2341x-uapi.rst
new file mode 100644
index 000000000000..8a7977af79d5
--- /dev/null
+++ b/Documentation/media/v4l-drivers/cx2341x-uapi.rst
@@ -0,0 +1,179 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+The cx2341x driver
+==================
+
+Non-compressed file format
+--------------------------
+
+The cx23416 can produce (and the cx23415 can also read) raw YUV output. The
+format of a YUV frame is specific to this chip and is called HM12. 'HM' stands
+for 'Hauppauge Macroblock', which is a misnomer as 'Conexant Macroblock' would
+be more accurate.
+
+The format is YUV 4:2:0 which uses 1 Y byte per pixel and 1 U and V byte per
+four pixels.
+
+The data is encoded as two macroblock planes, the first containing the Y
+values, the second containing UV macroblocks.
+
+The Y plane is divided into blocks of 16x16 pixels from left to right
+and from top to bottom. Each block is transmitted in turn, line-by-line.
+
+So the first 16 bytes are the first line of the top-left block, the
+second 16 bytes are the second line of the top-left block, etc. After
+transmitting this block the first line of the block on the right to the
+first block is transmitted, etc.
+
+The UV plane is divided into blocks of 16x8 UV values going from left
+to right, top to bottom. Each block is transmitted in turn, line-by-line.
+
+So the first 16 bytes are the first line of the top-left block and
+contain 8 UV value pairs (16 bytes in total). The second 16 bytes are the
+second line of 8 UV pairs of the top-left block, etc. After transmitting
+this block the first line of the block on the right to the first block is
+transmitted, etc.
+
+The code below is given as an example on how to convert HM12 to separate
+Y, U and V planes. This code assumes frames of 720x576 (PAL) pixels.
+
+The width of a frame is always 720 pixels, regardless of the actual specified
+width.
+
+If the height is not a multiple of 32 lines, then the captured video is
+missing macroblocks at the end and is unusable. So the height must be a
+multiple of 32.
+
+Raw format c example
+~~~~~~~~~~~~~~~~~~~~
+
+.. code-block:: c
+
+	#include <stdio.h>
+	#include <stdlib.h>
+	#include <string.h>
+
+	static unsigned char frame[576*720*3/2];
+	static unsigned char framey[576*720];
+	static unsigned char frameu[576*720 / 4];
+	static unsigned char framev[576*720 / 4];
+
+	static void de_macro_y(unsigned char* dst, unsigned char *src, int dstride, int w, int h)
+	{
+	unsigned int y, x, i;
+
+	// descramble Y plane
+	// dstride = 720 = w
+	// The Y plane is divided into blocks of 16x16 pixels
+	// Each block in transmitted in turn, line-by-line.
+	for (y = 0; y < h; y += 16) {
+		for (x = 0; x < w; x += 16) {
+		for (i = 0; i < 16; i++) {
+			memcpy(dst + x + (y + i) * dstride, src, 16);
+			src += 16;
+		}
+		}
+	}
+	}
+
+	static void de_macro_uv(unsigned char *dstu, unsigned char *dstv, unsigned char *src, int dstride, int w, int h)
+	{
+	unsigned int y, x, i;
+
+	// descramble U/V plane
+	// dstride = 720 / 2 = w
+	// The U/V values are interlaced (UVUV...).
+	// Again, the UV plane is divided into blocks of 16x16 UV values.
+	// Each block in transmitted in turn, line-by-line.
+	for (y = 0; y < h; y += 16) {
+		for (x = 0; x < w; x += 8) {
+		for (i = 0; i < 16; i++) {
+			int idx = x + (y + i) * dstride;
+
+			dstu[idx+0] = src[0];  dstv[idx+0] = src[1];
+			dstu[idx+1] = src[2];  dstv[idx+1] = src[3];
+			dstu[idx+2] = src[4];  dstv[idx+2] = src[5];
+			dstu[idx+3] = src[6];  dstv[idx+3] = src[7];
+			dstu[idx+4] = src[8];  dstv[idx+4] = src[9];
+			dstu[idx+5] = src[10]; dstv[idx+5] = src[11];
+			dstu[idx+6] = src[12]; dstv[idx+6] = src[13];
+			dstu[idx+7] = src[14]; dstv[idx+7] = src[15];
+			src += 16;
+		}
+		}
+	}
+	}
+
+	/*************************************************************************/
+	int main(int argc, char **argv)
+	{
+	FILE *fin;
+	int i;
+
+	if (argc == 1) fin = stdin;
+	else fin = fopen(argv[1], "r");
+
+	if (fin == NULL) {
+		fprintf(stderr, "cannot open input\n");
+		exit(-1);
+	}
+	while (fread(frame, sizeof(frame), 1, fin) == 1) {
+		de_macro_y(framey, frame, 720, 720, 576);
+		de_macro_uv(frameu, framev, frame + 720 * 576, 720 / 2, 720 / 2, 576 / 2);
+		fwrite(framey, sizeof(framey), 1, stdout);
+		fwrite(framev, sizeof(framev), 1, stdout);
+		fwrite(frameu, sizeof(frameu), 1, stdout);
+	}
+	fclose(fin);
+	return 0;
+	}
+
+
+Format of embedded V4L2_MPEG_STREAM_VBI_FMT_IVTV VBI data
+---------------------------------------------------------
+
+Author: Hans Verkuil <hverkuil@xs4all.nl>
+
+
+This section describes the V4L2_MPEG_STREAM_VBI_FMT_IVTV format of the VBI data
+embedded in an MPEG-2 program stream. This format is in part dictated by some
+hardware limitations of the ivtv driver (the driver for the Conexant cx23415/6
+chips), in particular a maximum size for the VBI data. Anything longer is cut
+off when the MPEG stream is played back through the cx23415.
+
+The advantage of this format is it is very compact and that all VBI data for
+all lines can be stored while still fitting within the maximum allowed size.
+
+The stream ID of the VBI data is 0xBD. The maximum size of the embedded data is
+4 + 43 * 36, which is 4 bytes for a header and 2 * 18 VBI lines with a 1 byte
+header and a 42 bytes payload each. Anything beyond this limit is cut off by
+the cx23415/6 firmware. Besides the data for the VBI lines we also need 36 bits
+for a bitmask determining which lines are captured and 4 bytes for a magic cookie,
+signifying that this data package contains V4L2_MPEG_STREAM_VBI_FMT_IVTV VBI data.
+If all lines are used, then there is no longer room for the bitmask. To solve this
+two different magic numbers were introduced:
+
+'itv0': After this magic number two unsigned longs follow. Bits 0-17 of the first
+unsigned long denote which lines of the first field are captured. Bits 18-31 of
+the first unsigned long and bits 0-3 of the second unsigned long are used for the
+second field.
+
+'ITV0': This magic number assumes all VBI lines are captured, i.e. it implicitly
+implies that the bitmasks are 0xffffffff and 0xf.
+
+After these magic cookies (and the 8 byte bitmask in case of cookie 'itv0') the
+captured VBI lines start:
+
+For each line the least significant 4 bits of the first byte contain the data type.
+Possible values are shown in the table below. The payload is in the following 42
+bytes.
+
+Here is the list of possible data types:
+
+.. code-block:: c
+
+	#define IVTV_SLICED_TYPE_TELETEXT       0x1     // Teletext (uses lines 6-22 for PAL)
+	#define IVTV_SLICED_TYPE_CC             0x4     // Closed Captions (line 21 NTSC)
+	#define IVTV_SLICED_TYPE_WSS            0x5     // Wide Screen Signal (line 23 PAL)
+	#define IVTV_SLICED_TYPE_VPS            0x7     // Video Programming System (PAL) (line 16)
+
diff --git a/Documentation/media/v4l-drivers/index.rst b/Documentation/media/v4l-drivers/index.rst
index dfc878c050da..f3e34ccaf365 100644
--- a/Documentation/media/v4l-drivers/index.rst
+++ b/Documentation/media/v4l-drivers/index.rst
@@ -38,7 +38,6 @@ For more details see the file COPYING in the source distribution of Linux.
 	bttv
 	cafe_ccic
 	cpia2
-	cx2341x
 	cx88
 	davinci-vpbe
 	fimc
@@ -68,7 +67,9 @@ For more details see the file COPYING in the source distribution of Linux.
 
 	bttv-devel
 	cpia2_devel
+	cx2341x-devel
 	cx88-devel
 	vimc-devel
 
+	cx2341x-uapi
 	meye-uapi
-- 
2.24.1

