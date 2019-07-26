Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6AA07652A
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2019 14:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbfGZMI3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jul 2019 08:08:29 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:37289 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726207AbfGZMI3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jul 2019 08:08:29 -0400
Received: from tschai.fritz.box ([46.9.232.237])
        by smtp-cloud7.xs4all.net with ESMTPA
        id qz1JhX1g2ur8Tqz1PhyBWL; Fri, 26 Jul 2019 14:08:27 +0200
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 3/3] vivid: add support for new pixelformats
Date:   Fri, 26 Jul 2019 14:08:21 +0200
Message-Id: <20190726120821.12569-4-hverkuil-cisco@xs4all.nl>
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

New RGB444, RGB555 and RGB32 variants were recently added. Now also
support them in vivid.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/platform/vivid/vivid-vid-common.c   | 132 +++++++++++++++++-
 1 file changed, 129 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/vivid/vivid-vid-common.c b/drivers/media/platform/vivid/vivid-vid-common.c
index 1f33eb1a76b6..8665dfd25eb4 100644
--- a/drivers/media/platform/vivid/vivid-vid-common.c
+++ b/drivers/media/platform/vivid/vivid-vid-common.c
@@ -262,21 +262,66 @@ struct vivid_fmt vivid_formats[] = {
 		.can_do_overlay = true,
 	},
 	{
-		.fourcc   = V4L2_PIX_FMT_RGB444, /* xxxxrrrr ggggbbbb */
+		.fourcc   = V4L2_PIX_FMT_RGB444, /* ggggbbbb xxxxrrrr */
 		.vdownsampling = { 1 },
 		.bit_depth = { 16 },
 		.planes   = 1,
 		.buffers = 1,
 	},
 	{
-		.fourcc   = V4L2_PIX_FMT_XRGB444, /* xxxxrrrr ggggbbbb */
+		.fourcc   = V4L2_PIX_FMT_XRGB444, /* ggggbbbb xxxxrrrr */
 		.vdownsampling = { 1 },
 		.bit_depth = { 16 },
 		.planes   = 1,
 		.buffers = 1,
 	},
 	{
-		.fourcc   = V4L2_PIX_FMT_ARGB444, /* aaaarrrr ggggbbbb */
+		.fourcc   = V4L2_PIX_FMT_ARGB444, /* ggggbbbb aaaarrrr */
+		.vdownsampling = { 1 },
+		.bit_depth = { 16 },
+		.planes   = 1,
+		.buffers = 1,
+		.alpha_mask = 0x00f0,
+	},
+	{
+		.fourcc   = V4L2_PIX_FMT_RGBX444, /* bbbbxxxx rrrrgggg */
+		.vdownsampling = { 1 },
+		.bit_depth = { 16 },
+		.planes   = 1,
+		.buffers = 1,
+	},
+	{
+		.fourcc   = V4L2_PIX_FMT_RGBA444, /* bbbbaaaa rrrrgggg */
+		.vdownsampling = { 1 },
+		.bit_depth = { 16 },
+		.planes   = 1,
+		.buffers = 1,
+		.alpha_mask = 0x00f0,
+	},
+	{
+		.fourcc   = V4L2_PIX_FMT_XBGR444, /* ggggrrrr xxxxbbbb */
+		.vdownsampling = { 1 },
+		.bit_depth = { 16 },
+		.planes   = 1,
+		.buffers = 1,
+	},
+	{
+		.fourcc   = V4L2_PIX_FMT_ABGR444, /* ggggrrrr aaaabbbb */
+		.vdownsampling = { 1 },
+		.bit_depth = { 16 },
+		.planes   = 1,
+		.buffers = 1,
+		.alpha_mask = 0x00f0,
+	},
+	{
+		.fourcc   = V4L2_PIX_FMT_BGRX444, /* rrrrxxxx bbbbgggg */
+		.vdownsampling = { 1 },
+		.bit_depth = { 16 },
+		.planes   = 1,
+		.buffers = 1,
+	},
+	{
+		.fourcc   = V4L2_PIX_FMT_BGRA444, /* rrrraaaa bbbbgggg  */
 		.vdownsampling = { 1 },
 		.bit_depth = { 16 },
 		.planes   = 1,
@@ -308,6 +353,57 @@ struct vivid_fmt vivid_formats[] = {
 		.can_do_overlay = true,
 		.alpha_mask = 0x8000,
 	},
+	{
+		.fourcc   = V4L2_PIX_FMT_RGBX555, /* ggbbbbbx rrrrrggg */
+		.vdownsampling = { 1 },
+		.bit_depth = { 16 },
+		.planes   = 1,
+		.buffers = 1,
+		.can_do_overlay = true,
+	},
+	{
+		.fourcc   = V4L2_PIX_FMT_RGBA555, /* ggbbbbba rrrrrggg */
+		.vdownsampling = { 1 },
+		.bit_depth = { 16 },
+		.planes   = 1,
+		.buffers = 1,
+		.can_do_overlay = true,
+		.alpha_mask = 0x8000,
+	},
+	{
+		.fourcc   = V4L2_PIX_FMT_XBGR555, /* gggrrrrr xbbbbbgg */
+		.vdownsampling = { 1 },
+		.bit_depth = { 16 },
+		.planes   = 1,
+		.buffers = 1,
+		.can_do_overlay = true,
+	},
+	{
+		.fourcc   = V4L2_PIX_FMT_ABGR555, /* gggrrrrr abbbbbgg */
+		.vdownsampling = { 1 },
+		.bit_depth = { 16 },
+		.planes   = 1,
+		.buffers = 1,
+		.can_do_overlay = true,
+		.alpha_mask = 0x8000,
+	},
+	{
+		.fourcc   = V4L2_PIX_FMT_BGRX555, /* ggrrrrrx bbbbbggg */
+		.vdownsampling = { 1 },
+		.bit_depth = { 16 },
+		.planes   = 1,
+		.buffers = 1,
+		.can_do_overlay = true,
+	},
+	{
+		.fourcc   = V4L2_PIX_FMT_BGRA555, /* ggrrrrra bbbbbggg */
+		.vdownsampling = { 1 },
+		.bit_depth = { 16 },
+		.planes   = 1,
+		.buffers = 1,
+		.can_do_overlay = true,
+		.alpha_mask = 0x8000,
+	},
 	{
 		.fourcc   = V4L2_PIX_FMT_RGB555X, /* xrrrrrgg gggbbbbb */
 		.vdownsampling = { 1 },
@@ -395,6 +491,36 @@ struct vivid_fmt vivid_formats[] = {
 		.buffers = 1,
 		.alpha_mask = 0xff000000,
 	},
+	{
+		.fourcc   = V4L2_PIX_FMT_RGBX32, /* rgbx */
+		.vdownsampling = { 1 },
+		.bit_depth = { 32 },
+		.planes   = 1,
+		.buffers = 1,
+	},
+	{
+		.fourcc   = V4L2_PIX_FMT_BGRX32, /* xbgr */
+		.vdownsampling = { 1 },
+		.bit_depth = { 32 },
+		.planes   = 1,
+		.buffers = 1,
+	},
+	{
+		.fourcc   = V4L2_PIX_FMT_RGBA32, /* rgba */
+		.vdownsampling = { 1 },
+		.bit_depth = { 32 },
+		.planes   = 1,
+		.buffers = 1,
+		.alpha_mask = 0x000000ff,
+	},
+	{
+		.fourcc   = V4L2_PIX_FMT_BGRA32, /* abgr */
+		.vdownsampling = { 1 },
+		.bit_depth = { 32 },
+		.planes   = 1,
+		.buffers = 1,
+		.alpha_mask = 0xff000000,
+	},
 	{
 		.fourcc   = V4L2_PIX_FMT_SBGGR8, /* Bayer BG/GR */
 		.vdownsampling = { 1 },
-- 
2.20.1

