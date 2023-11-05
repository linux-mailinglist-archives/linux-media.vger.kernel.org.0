Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E9C37E154B
	for <lists+linux-media@lfdr.de>; Sun,  5 Nov 2023 17:55:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjKEQzp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Nov 2023 11:55:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjKEQzm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Nov 2023 11:55:42 -0500
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C1083;
        Sun,  5 Nov 2023 08:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1699203336; bh=VBY0FHZGIpUm3P9r+IeT6rGp7Go4Kcp8zODviR0ogjA=;
 b=BKDG4dDc9E/ZgiRG/Ru2++h4WwhGmSBs+ypZlLeawtW/RGt/AaLCHiGqdm+rglxe3LuoobCDP
 Z1McdMSA8+pGaOGUjrkNcejfcOiStGk2dyup5CL6o2cffFmwXiddU2IHSGyIsuPiKQMdW9vg06V
 +Am3LQs7O/C62i61U99NwL+/OQLIrYdmIa4qIfN0Q2jD0pzCSQNUQqT9Km6MaKtalT6vgB5uBkz
 dUUFyzSfjUIGLYrDsn7Krz0TAMgW3h1o+DmNrU9ADxowdsgtpe/KXGyoNvgNzmZVjUl1yPHmV2N
 tXo2xLb10U5ZdhnEMg9J5mdqQWl3Z0x8mVyzpn4DbH8g==
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Alex Bee <knaerzche@gmail.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Sebastian Fricke <sebastian.fricke@collabora.com>,
        Christopher Obbard <chris.obbard@collabora.com>,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v4 02/11] media: v4l2: Add NV15 and NV20 pixel formats
Date:   Sun,  5 Nov 2023 16:55:01 +0000
Message-ID: <20231105165521.3592037-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231105165521.3592037-1-jonas@kwiboo.se>
References: <20231105165521.3592037-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 6547c90742ad2f8d152468f4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add NV15 and NV20 pixel formats used by the Rockchip Video Decoder for
10-bit buffers.

NV15 and NV20 is 10-bit 4:2:0/4:2:2 semi-planar YUV formats similar to
NV12 and NV16, using 10-bit components with no padding between each
component. Instead, a group of 4 luminance/chrominance samples are
stored over 5 bytes in little endian order:

YYYY = UVUV = 4 * 10 bits = 40 bits = 5 bytes

The '15' and '20' suffix refers to the optimum effective bits per pixel
which is achieved when the total number of luminance samples is a
multiple of 8 for NV15 and 4 for NV20.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v4:
- No change

v3:
- Use bpp and bpp_div instead of the misuse of block_w/block_h
- Update documentation, expand to use full 4x4 sample image

 .../media/v4l/pixfmt-yuv-planar.rst           | 128 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-common.c         |   2 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   2 +
 include/uapi/linux/videodev2.h                |   2 +
 4 files changed, 134 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
index 1840224faa41..4366cdcb970e 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
@@ -79,6 +79,13 @@ All components are stored with the same number of bits per component.
       - Cr, Cb
       - Yes
       - Linear
+    * - V4L2_PIX_FMT_NV15
+      - 'NV15'
+      - 10
+      - 4:2:0
+      - Cb, Cr
+      - Yes
+      - Linear
     * - V4L2_PIX_FMT_NV12M
       - 'NM12'
       - 8
@@ -158,6 +165,13 @@ All components are stored with the same number of bits per component.
       - Cr, Cb
       - Yes
       - Linear
+    * - V4L2_PIX_FMT_NV20
+      - 'NV20'
+      - 10
+      - 4:2:2
+      - Cb, Cr
+      - Yes
+      - Linear
     * - V4L2_PIX_FMT_NV16M
       - 'NM16'
       - 8
@@ -288,6 +302,57 @@ of the luma plane.
       - Cr\ :sub:`11`
 
 
+.. _V4L2-PIX-FMT-NV15:
+
+NV15
+----
+
+Semi-planar 10-bit YUV 4:2:0 format similar to NV12, using 10-bit components
+with no padding between each component. A group of 4 components are stored over
+5 bytes in little endian order.
+
+.. flat-table:: Sample 4x4 NV15 Image (1 byte per cell)
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - start + 0:
+      - Y'\ :sub:`00[7:0]`
+      - Y'\ :sub:`01[5:0]`\ Y'\ :sub:`00[9:8]`
+      - Y'\ :sub:`02[3:0]`\ Y'\ :sub:`01[9:6]`
+      - Y'\ :sub:`03[1:0]`\ Y'\ :sub:`02[9:4]`
+      - Y'\ :sub:`03[9:2]`
+    * - start + 5:
+      - Y'\ :sub:`10[7:0]`
+      - Y'\ :sub:`11[5:0]`\ Y'\ :sub:`10[9:8]`
+      - Y'\ :sub:`12[3:0]`\ Y'\ :sub:`11[9:6]`
+      - Y'\ :sub:`13[1:0]`\ Y'\ :sub:`12[9:4]`
+      - Y'\ :sub:`13[9:2]`
+    * - start + 10:
+      - Y'\ :sub:`20[7:0]`
+      - Y'\ :sub:`21[5:0]`\ Y'\ :sub:`20[9:8]`
+      - Y'\ :sub:`22[3:0]`\ Y'\ :sub:`21[9:6]`
+      - Y'\ :sub:`23[1:0]`\ Y'\ :sub:`22[9:4]`
+      - Y'\ :sub:`23[9:2]`
+    * - start + 15:
+      - Y'\ :sub:`30[7:0]`
+      - Y'\ :sub:`31[5:0]`\ Y'\ :sub:`30[9:8]`
+      - Y'\ :sub:`32[3:0]`\ Y'\ :sub:`31[9:6]`
+      - Y'\ :sub:`33[1:0]`\ Y'\ :sub:`32[9:4]`
+      - Y'\ :sub:`33[9:2]`
+    * - start + 20:
+      - Cb\ :sub:`00[7:0]`
+      - Cr\ :sub:`00[5:0]`\ Cb\ :sub:`00[9:8]`
+      - Cb\ :sub:`01[3:0]`\ Cr\ :sub:`00[9:6]`
+      - Cr\ :sub:`01[1:0]`\ Cb\ :sub:`01[9:4]`
+      - Cr\ :sub:`01[9:2]`
+    * - start + 25:
+      - Cb\ :sub:`10[7:0]`
+      - Cr\ :sub:`10[5:0]`\ Cb\ :sub:`10[9:8]`
+      - Cb\ :sub:`11[3:0]`\ Cr\ :sub:`10[9:6]`
+      - Cr\ :sub:`11[1:0]`\ Cb\ :sub:`11[9:4]`
+      - Cr\ :sub:`11[9:2]`
+
+
 .. _V4L2-PIX-FMT-NV12MT:
 .. _V4L2-PIX-FMT-NV12MT-16X16:
 .. _V4L2-PIX-FMT-NV12-4L4:
@@ -500,6 +565,69 @@ number of lines as the luma plane.
       - Cr\ :sub:`32`
 
 
+.. _V4L2-PIX-FMT-NV20:
+
+NV20
+----
+
+Semi-planar 10-bit YUV 4:2:2 format similar to NV16, using 10-bit components
+with no padding between each component. A group of 4 components are stored over
+5 bytes in little endian order.
+
+.. flat-table:: Sample 4x4 NV20 Image (1 byte per cell)
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - start + 0:
+      - Y'\ :sub:`00[7:0]`
+      - Y'\ :sub:`01[5:0]`\ Y'\ :sub:`00[9:8]`
+      - Y'\ :sub:`02[3:0]`\ Y'\ :sub:`01[9:6]`
+      - Y'\ :sub:`03[1:0]`\ Y'\ :sub:`02[9:4]`
+      - Y'\ :sub:`03[9:2]`
+    * - start + 5:
+      - Y'\ :sub:`10[7:0]`
+      - Y'\ :sub:`11[5:0]`\ Y'\ :sub:`10[9:8]`
+      - Y'\ :sub:`12[3:0]`\ Y'\ :sub:`11[9:6]`
+      - Y'\ :sub:`13[1:0]`\ Y'\ :sub:`12[9:4]`
+      - Y'\ :sub:`13[9:2]`
+    * - start + 10:
+      - Y'\ :sub:`20[7:0]`
+      - Y'\ :sub:`21[5:0]`\ Y'\ :sub:`20[9:8]`
+      - Y'\ :sub:`22[3:0]`\ Y'\ :sub:`21[9:6]`
+      - Y'\ :sub:`23[1:0]`\ Y'\ :sub:`22[9:4]`
+      - Y'\ :sub:`23[9:2]`
+    * - start + 15:
+      - Y'\ :sub:`30[7:0]`
+      - Y'\ :sub:`31[5:0]`\ Y'\ :sub:`30[9:8]`
+      - Y'\ :sub:`32[3:0]`\ Y'\ :sub:`31[9:6]`
+      - Y'\ :sub:`33[1:0]`\ Y'\ :sub:`32[9:4]`
+      - Y'\ :sub:`33[9:2]`
+    * - start + 20:
+      - Cb\ :sub:`00[7:0]`
+      - Cr\ :sub:`00[5:0]`\ Cb\ :sub:`00[9:8]`
+      - Cb\ :sub:`01[3:0]`\ Cr\ :sub:`00[9:6]`
+      - Cr\ :sub:`01[1:0]`\ Cb\ :sub:`01[9:4]`
+      - Cr\ :sub:`01[9:2]`
+    * - start + 25:
+      - Cb\ :sub:`10[7:0]`
+      - Cr\ :sub:`10[5:0]`\ Cb\ :sub:`10[9:8]`
+      - Cb\ :sub:`11[3:0]`\ Cr\ :sub:`10[9:6]`
+      - Cr\ :sub:`11[1:0]`\ Cb\ :sub:`11[9:4]`
+      - Cr\ :sub:`11[9:2]`
+    * - start + 30:
+      - Cb\ :sub:`20[7:0]`
+      - Cr\ :sub:`20[5:0]`\ Cb\ :sub:`20[9:8]`
+      - Cb\ :sub:`21[3:0]`\ Cr\ :sub:`20[9:6]`
+      - Cr\ :sub:`21[1:0]`\ Cb\ :sub:`21[9:4]`
+      - Cr\ :sub:`21[9:2]`
+    * - start + 35:
+      - Cb\ :sub:`30[7:0]`
+      - Cr\ :sub:`30[5:0]`\ Cb\ :sub:`30[9:8]`
+      - Cb\ :sub:`31[3:0]`\ Cr\ :sub:`30[9:6]`
+      - Cr\ :sub:`31[1:0]`\ Cb\ :sub:`31[9:4]`
+      - Cr\ :sub:`31[9:2]`
+
+
 .. _V4L2-PIX-FMT-NV24:
 .. _V4L2-PIX-FMT-NV42:
 
diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index 834b426da8b1..c65ffab5800a 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -270,8 +270,10 @@ const struct v4l2_format_info *v4l2_format_info(u32 format)
 		/* YUV planar formats */
 		{ .format = V4L2_PIX_FMT_NV12,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
 		{ .format = V4L2_PIX_FMT_NV21,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 2 },
+		{ .format = V4L2_PIX_FMT_NV15,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 2 },
 		{ .format = V4L2_PIX_FMT_NV16,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_NV61,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
+		{ .format = V4L2_PIX_FMT_NV20,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 5, 10, 0, 0 }, .bpp_div = { 4, 4, 1, 1 }, .hdiv = 2, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_NV24,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_NV42,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 1, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 1, .vdiv = 1 },
 		{ .format = V4L2_PIX_FMT_P010,    .pixel_enc = V4L2_PIXEL_ENC_YUV, .mem_planes = 1, .comp_planes = 2, .bpp = { 2, 2, 0, 0 }, .bpp_div = { 1, 1, 1, 1 }, .hdiv = 2, .vdiv = 1 },
diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 9b1de54ce379..937434e5f2c1 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1347,8 +1347,10 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_YUV48_12:	descr = "12-bit YUV 4:4:4 Packed"; break;
 	case V4L2_PIX_FMT_NV12:		descr = "Y/UV 4:2:0"; break;
 	case V4L2_PIX_FMT_NV21:		descr = "Y/VU 4:2:0"; break;
+	case V4L2_PIX_FMT_NV15:		descr = "10-bit Y/UV 4:2:0 (Packed)"; break;
 	case V4L2_PIX_FMT_NV16:		descr = "Y/UV 4:2:2"; break;
 	case V4L2_PIX_FMT_NV61:		descr = "Y/VU 4:2:2"; break;
+	case V4L2_PIX_FMT_NV20:		descr = "10-bit Y/UV 4:2:2 (Packed)"; break;
 	case V4L2_PIX_FMT_NV24:		descr = "Y/UV 4:4:4"; break;
 	case V4L2_PIX_FMT_NV42:		descr = "Y/VU 4:4:4"; break;
 	case V4L2_PIX_FMT_P010:		descr = "10-bit Y/UV 4:2:0"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index c3d4e490ce7c..617340c43e40 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -638,8 +638,10 @@ struct v4l2_pix_format {
 /* two planes -- one Y, one Cr + Cb interleaved  */
 #define V4L2_PIX_FMT_NV12    v4l2_fourcc('N', 'V', '1', '2') /* 12  Y/CbCr 4:2:0  */
 #define V4L2_PIX_FMT_NV21    v4l2_fourcc('N', 'V', '2', '1') /* 12  Y/CrCb 4:2:0  */
+#define V4L2_PIX_FMT_NV15    v4l2_fourcc('N', 'V', '1', '5') /* 15  Y/CbCr 4:2:0 10-bit packed */
 #define V4L2_PIX_FMT_NV16    v4l2_fourcc('N', 'V', '1', '6') /* 16  Y/CbCr 4:2:2  */
 #define V4L2_PIX_FMT_NV61    v4l2_fourcc('N', 'V', '6', '1') /* 16  Y/CrCb 4:2:2  */
+#define V4L2_PIX_FMT_NV20    v4l2_fourcc('N', 'V', '2', '0') /* 20  Y/CbCr 4:2:2 10-bit packed */
 #define V4L2_PIX_FMT_NV24    v4l2_fourcc('N', 'V', '2', '4') /* 24  Y/CbCr 4:4:4  */
 #define V4L2_PIX_FMT_NV42    v4l2_fourcc('N', 'V', '4', '2') /* 24  Y/CrCb 4:4:4  */
 #define V4L2_PIX_FMT_P010    v4l2_fourcc('P', '0', '1', '0') /* 24  Y/CbCr 4:2:0 10-bit per component */
-- 
2.42.0

