Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66C4736C5C8
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 14:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236091AbhD0MIO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 08:08:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236087AbhD0MIN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 08:08:13 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C71BC061574
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 05:07:30 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1lbMUm-0006DH-0K; Tue, 27 Apr 2021 14:07:16 +0200
Received: from mfe by dude02.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1lbMUl-0005uo-BA; Tue, 27 Apr 2021 14:07:15 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     p.zabel@pengutronix.de, mchehab@kernel.org, slongerbeam@gmail.com,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        sakari.ailus@linux.intel.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 2/6] media: v4l: Add definition for bayered IR formats
Date:   Tue, 27 Apr 2021 14:06:57 +0200
Message-Id: <20210427120701.21809-3-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210427120701.21809-1-m.felsch@pengutronix.de>
References: <20210427120701.21809-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add special 8/12bit bayer media bus format for the OnSemi AR0237IR
camera sensor [1]. OnSemi calls this format RGB-IR, the pixel array
with the interleaved IR pixels looks like:

        |  G |  R |  G |  B | ...
        +----+----+----+----+---
        | IR |  G | IR |  G | ...
        +----+----+----+----+---
        |  G |  B |  G |  R | ...
        +----+----+----+----+---
        | IR |  G | IR |  G | ...
        +----+----+----+----+---
        | .. | .. | .. | .. | ..

[1] https://www.framos.com/media/pdf/96/ac/8f/AR0237CS-D-PDF-framos.pdf

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 include/uapi/linux/videodev2.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 311a01cc5775..45ffd3867394 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -632,6 +632,8 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_SGBRG8  v4l2_fourcc('G', 'B', 'R', 'G') /*  8  GBGB.. RGRG.. */
 #define V4L2_PIX_FMT_SGRBG8  v4l2_fourcc('G', 'R', 'B', 'G') /*  8  GRGR.. BGBG.. */
 #define V4L2_PIX_FMT_SRGGB8  v4l2_fourcc('R', 'G', 'G', 'B') /*  8  RGRG.. GBGB.. */
+	/* 8bit infrared interleaved bayer format */
+#define V4L2_PIX_FMT_SGRGB_IGIG_GBGR_IGIG8 v4l2_fourcc('I', 'R', '0', '8') /* 8 GRGB.. IGIG.. GBGR.. IGIG.. */
 #define V4L2_PIX_FMT_SBGGR10 v4l2_fourcc('B', 'G', '1', '0') /* 10  BGBG.. GRGR.. */
 #define V4L2_PIX_FMT_SGBRG10 v4l2_fourcc('G', 'B', '1', '0') /* 10  GBGB.. RGRG.. */
 #define V4L2_PIX_FMT_SGRBG10 v4l2_fourcc('B', 'A', '1', '0') /* 10  GRGR.. BGBG.. */
@@ -673,6 +675,8 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_SGBRG16 v4l2_fourcc('G', 'B', '1', '6') /* 16  GBGB.. RGRG.. */
 #define V4L2_PIX_FMT_SGRBG16 v4l2_fourcc('G', 'R', '1', '6') /* 16  GRGR.. BGBG.. */
 #define V4L2_PIX_FMT_SRGGB16 v4l2_fourcc('R', 'G', '1', '6') /* 16  RGRG.. GBGB.. */
+	/* 16bit infrared interleaved bayer format */
+#define V4L2_PIX_FMT_SGRGB_IGIG_GBGR_IGIG16 v4l2_fourcc('I', 'R', '1', '6') /* 16 GRGB.. IGIG.. GBGR.. IGIG.. */
 
 /* HSV formats */
 #define V4L2_PIX_FMT_HSV24 v4l2_fourcc('H', 'S', 'V', '3')
-- 
2.29.2

