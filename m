Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC887652B
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2019 14:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbfGZMIa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jul 2019 08:08:30 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:47943 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726124AbfGZMI3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jul 2019 08:08:29 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id qz1JhX1g2ur8Tqz1OhyBWF; Fri, 26 Jul 2019 14:08:27 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 1/3] v4l2-tpg: add support for new pixelformats
Date:   Fri, 26 Jul 2019 14:08:19 +0200
Message-Id: <20190726120821.12569-2-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190726120821.12569-1-hverkuil-cisco@xs4all.nl>
References: <20190726120821.12569-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4wfDCJvHOUgneMZiUnKG/Wt0MDiBaaBdulHy931OZx90S0u/UOEyMO7JvuOU/UgVkJOfHjVCYczaLT5OPPHKZgAafaRaDL+HSsPZGHB5tDrz342MOCUD83
 lkQidgcwyM0QnNPpEnAoyFWAzqa8DqK20qyjoceVpi0bCRPIKswWuoRSNeaIJL+v1QjAQ+xp58Gxvt9LUIHhlCWgfYcec2D8x0C9DO2soRTZN9s6n0+vTsLA
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Several new variations of RGB444, RGB555 and RGB32 were
added. Add support for these.

This is the list of new pixelformats:

V4L2_PIX_FMT_RGBX444
V4L2_PIX_FMT_RGBA444
V4L2_PIX_FMT_XBGR444
V4L2_PIX_FMT_ABGR444
V4L2_PIX_FMT_BGRX444
V4L2_PIX_FMT_BGRA444
V4L2_PIX_FMT_RGBX555
V4L2_PIX_FMT_RGBA555
V4L2_PIX_FMT_XBGR555
V4L2_PIX_FMT_ABGR555
V4L2_PIX_FMT_BGRX555
V4L2_PIX_FMT_BGRA555
V4L2_PIX_FMT_RGBX32
V4L2_PIX_FMT_BGRX32
V4L2_PIX_FMT_RGBA32
V4L2_PIX_FMT_BGRA32

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/common/v4l2-tpg/v4l2-tpg-core.c | 107 ++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
index 07e0629af8ed..50f1e0b28b25 100644
--- a/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
+++ b/drivers/media/common/v4l2-tpg/v4l2-tpg-core.c
@@ -217,9 +217,21 @@ bool tpg_s_fourcc(struct tpg_data *tpg, u32 fourcc)
 	case V4L2_PIX_FMT_RGB444:
 	case V4L2_PIX_FMT_XRGB444:
 	case V4L2_PIX_FMT_ARGB444:
+	case V4L2_PIX_FMT_RGBX444:
+	case V4L2_PIX_FMT_RGBA444:
+	case V4L2_PIX_FMT_XBGR444:
+	case V4L2_PIX_FMT_ABGR444:
+	case V4L2_PIX_FMT_BGRX444:
+	case V4L2_PIX_FMT_BGRA444:
 	case V4L2_PIX_FMT_RGB555:
 	case V4L2_PIX_FMT_XRGB555:
 	case V4L2_PIX_FMT_ARGB555:
+	case V4L2_PIX_FMT_RGBX555:
+	case V4L2_PIX_FMT_RGBA555:
+	case V4L2_PIX_FMT_XBGR555:
+	case V4L2_PIX_FMT_ABGR555:
+	case V4L2_PIX_FMT_BGRX555:
+	case V4L2_PIX_FMT_BGRA555:
 	case V4L2_PIX_FMT_RGB555X:
 	case V4L2_PIX_FMT_XRGB555X:
 	case V4L2_PIX_FMT_ARGB555X:
@@ -232,6 +244,10 @@ bool tpg_s_fourcc(struct tpg_data *tpg, u32 fourcc)
 	case V4L2_PIX_FMT_XBGR32:
 	case V4L2_PIX_FMT_ARGB32:
 	case V4L2_PIX_FMT_ABGR32:
+	case V4L2_PIX_FMT_RGBX32:
+	case V4L2_PIX_FMT_BGRX32:
+	case V4L2_PIX_FMT_RGBA32:
+	case V4L2_PIX_FMT_BGRA32:
 		tpg->color_enc = TGP_COLOR_ENC_RGB;
 		break;
 	case V4L2_PIX_FMT_GREY:
@@ -343,9 +359,21 @@ bool tpg_s_fourcc(struct tpg_data *tpg, u32 fourcc)
 	case V4L2_PIX_FMT_RGB444:
 	case V4L2_PIX_FMT_XRGB444:
 	case V4L2_PIX_FMT_ARGB444:
+	case V4L2_PIX_FMT_RGBX444:
+	case V4L2_PIX_FMT_RGBA444:
+	case V4L2_PIX_FMT_XBGR444:
+	case V4L2_PIX_FMT_ABGR444:
+	case V4L2_PIX_FMT_BGRX444:
+	case V4L2_PIX_FMT_BGRA444:
 	case V4L2_PIX_FMT_RGB555:
 	case V4L2_PIX_FMT_XRGB555:
 	case V4L2_PIX_FMT_ARGB555:
+	case V4L2_PIX_FMT_RGBX555:
+	case V4L2_PIX_FMT_RGBA555:
+	case V4L2_PIX_FMT_XBGR555:
+	case V4L2_PIX_FMT_ABGR555:
+	case V4L2_PIX_FMT_BGRX555:
+	case V4L2_PIX_FMT_BGRA555:
 	case V4L2_PIX_FMT_RGB555X:
 	case V4L2_PIX_FMT_XRGB555X:
 	case V4L2_PIX_FMT_ARGB555X:
@@ -375,6 +403,10 @@ bool tpg_s_fourcc(struct tpg_data *tpg, u32 fourcc)
 	case V4L2_PIX_FMT_XBGR32:
 	case V4L2_PIX_FMT_ARGB32:
 	case V4L2_PIX_FMT_ABGR32:
+	case V4L2_PIX_FMT_RGBX32:
+	case V4L2_PIX_FMT_BGRX32:
+	case V4L2_PIX_FMT_RGBA32:
+	case V4L2_PIX_FMT_BGRA32:
 	case V4L2_PIX_FMT_YUV32:
 	case V4L2_PIX_FMT_AYUV32:
 	case V4L2_PIX_FMT_XYUV32:
@@ -1007,6 +1039,12 @@ static void precalculate_color(struct tpg_data *tpg, int k)
 		case V4L2_PIX_FMT_RGB444:
 		case V4L2_PIX_FMT_XRGB444:
 		case V4L2_PIX_FMT_ARGB444:
+		case V4L2_PIX_FMT_RGBX444:
+		case V4L2_PIX_FMT_RGBA444:
+		case V4L2_PIX_FMT_XBGR444:
+		case V4L2_PIX_FMT_ABGR444:
+		case V4L2_PIX_FMT_BGRX444:
+		case V4L2_PIX_FMT_BGRA444:
 			r >>= 8;
 			g >>= 8;
 			b >>= 8;
@@ -1014,6 +1052,12 @@ static void precalculate_color(struct tpg_data *tpg, int k)
 		case V4L2_PIX_FMT_RGB555:
 		case V4L2_PIX_FMT_XRGB555:
 		case V4L2_PIX_FMT_ARGB555:
+		case V4L2_PIX_FMT_RGBX555:
+		case V4L2_PIX_FMT_RGBA555:
+		case V4L2_PIX_FMT_XBGR555:
+		case V4L2_PIX_FMT_ABGR555:
+		case V4L2_PIX_FMT_BGRX555:
+		case V4L2_PIX_FMT_BGRA555:
 		case V4L2_PIX_FMT_RGB555X:
 		case V4L2_PIX_FMT_XRGB555X:
 		case V4L2_PIX_FMT_ARGB555X:
@@ -1237,6 +1281,27 @@ static void gen_twopix(struct tpg_data *tpg,
 		buf[0][offset] = (g_u_s << 4) | b_v;
 		buf[0][offset + 1] = (alpha & 0xf0) | r_y_h;
 		break;
+	case V4L2_PIX_FMT_RGBX444:
+		alpha = 0;
+		/* fall through */
+	case V4L2_PIX_FMT_RGBA444:
+		buf[0][offset] = (b_v << 4) | (alpha >> 4);
+		buf[0][offset + 1] = (r_y_h << 4) | g_u_s;
+		break;
+	case V4L2_PIX_FMT_XBGR444:
+		alpha = 0;
+		/* fall through */
+	case V4L2_PIX_FMT_ABGR444:
+		buf[0][offset] = (g_u_s << 4) | r_y_h;
+		buf[0][offset + 1] = (alpha & 0xf0) | b_v;
+		break;
+	case V4L2_PIX_FMT_BGRX444:
+		alpha = 0;
+		/* fall through */
+	case V4L2_PIX_FMT_BGRA444:
+		buf[0][offset] = (r_y_h << 4) | (alpha >> 4);
+		buf[0][offset + 1] = (b_v << 4) | g_u_s;
+		break;
 	case V4L2_PIX_FMT_RGB555:
 	case V4L2_PIX_FMT_XRGB555:
 		alpha = 0;
@@ -1247,6 +1312,30 @@ static void gen_twopix(struct tpg_data *tpg,
 		buf[0][offset + 1] = (alpha & 0x80) | (r_y_h << 2)
 						    | (g_u_s >> 3);
 		break;
+	case V4L2_PIX_FMT_RGBX555:
+		alpha = 0;
+		/* fall through */
+	case V4L2_PIX_FMT_RGBA555:
+		buf[0][offset] = (g_u_s << 6) | (b_v << 1) |
+				 ((alpha & 0x80) >> 7);
+		buf[0][offset + 1] = (r_y_h << 3) | (g_u_s >> 2);
+		break;
+	case V4L2_PIX_FMT_XBGR555:
+		alpha = 0;
+		/* fall through */
+	case V4L2_PIX_FMT_ABGR555:
+		buf[0][offset] = (g_u_s << 5) | r_y_h;
+		buf[0][offset + 1] = (alpha & 0x80) | (b_v << 2)
+						    | (g_u_s >> 3);
+		break;
+	case V4L2_PIX_FMT_BGRX555:
+		alpha = 0;
+		/* fall through */
+	case V4L2_PIX_FMT_BGRA555:
+		buf[0][offset] = (g_u_s << 6) | (r_y_h << 1) |
+				 ((alpha & 0x80) >> 7);
+		buf[0][offset + 1] = (b_v << 3) | (g_u_s >> 2);
+		break;
 	case V4L2_PIX_FMT_RGB555X:
 	case V4L2_PIX_FMT_XRGB555X:
 		alpha = 0;
@@ -1286,6 +1375,15 @@ static void gen_twopix(struct tpg_data *tpg,
 		buf[0][offset + 2] = g_u_s;
 		buf[0][offset + 3] = b_v;
 		break;
+	case V4L2_PIX_FMT_RGBX32:
+		alpha = 0;
+		/* fall through */
+	case V4L2_PIX_FMT_RGBA32:
+		buf[0][offset] = r_y_h;
+		buf[0][offset + 1] = g_u_s;
+		buf[0][offset + 2] = b_v;
+		buf[0][offset + 3] = alpha;
+		break;
 	case V4L2_PIX_FMT_BGR32:
 	case V4L2_PIX_FMT_XBGR32:
 	case V4L2_PIX_FMT_VUYX32:
@@ -1298,6 +1396,15 @@ static void gen_twopix(struct tpg_data *tpg,
 		buf[0][offset + 2] = r_y_h;
 		buf[0][offset + 3] = alpha;
 		break;
+	case V4L2_PIX_FMT_BGRX32:
+		alpha = 0;
+		/* fall through */
+	case V4L2_PIX_FMT_BGRA32:
+		buf[0][offset] = alpha;
+		buf[0][offset + 1] = b_v;
+		buf[0][offset + 2] = g_u_s;
+		buf[0][offset + 3] = r_y_h;
+		break;
 	case V4L2_PIX_FMT_SBGGR8:
 		buf[0][offset] = odd ? g_u_s : b_v;
 		buf[1][offset] = odd ? r_y_h : g_u_s;
-- 
2.20.1

