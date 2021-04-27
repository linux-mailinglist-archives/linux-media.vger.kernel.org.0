Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D15DD36C5CF
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 14:07:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237756AbhD0MIa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 08:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237609AbhD0MIa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 08:08:30 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15F72C061574
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 05:07:47 -0700 (PDT)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1lbMUm-0006DI-0E; Tue, 27 Apr 2021 14:07:16 +0200
Received: from mfe by dude02.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1lbMUl-0005ur-Bo; Tue, 27 Apr 2021 14:07:15 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     p.zabel@pengutronix.de, mchehab@kernel.org, slongerbeam@gmail.com,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        sakari.ailus@linux.intel.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 3/6] media: v4l2-ioctl.c: add V4L2_PIX_FMT_SGRGB_IGIG_GBGR_IGIG to v4l_fill_fmtdesc
Date:   Tue, 27 Apr 2021 14:06:58 +0200
Message-Id: <20210427120701.21809-4-m.felsch@pengutronix.de>
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

Add custom OnSemi RGB-IR pixel formats to the list of pixelformats
that v4l_fill_fmtdesc() understands. This format is used by the OnSemi
AR0237IR camera sensor [1].

[1] https://www.framos.com/media/pdf/96/ac/8f/AR0237CS-D-PDF-framos.pdf

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 6a5d1c6d11d6..e9d0c9417719 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1337,6 +1337,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_SGBRG8:	descr = "8-bit Bayer GBGB/RGRG"; break;
 	case V4L2_PIX_FMT_SGRBG8:	descr = "8-bit Bayer GRGR/BGBG"; break;
 	case V4L2_PIX_FMT_SRGGB8:	descr = "8-bit Bayer RGRG/GBGB"; break;
+	case V4L2_PIX_FMT_SGRGB_IGIG_GBGR_IGIG8: descr = "8-bit GRGB/IGIG/GBGR/IGIG"; break;
 	case V4L2_PIX_FMT_SBGGR10:	descr = "10-bit Bayer BGBG/GRGR"; break;
 	case V4L2_PIX_FMT_SGBRG10:	descr = "10-bit Bayer GBGB/RGRG"; break;
 	case V4L2_PIX_FMT_SGRBG10:	descr = "10-bit Bayer GRGR/BGBG"; break;
@@ -1377,6 +1378,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_PIX_FMT_SGBRG16:	descr = "16-bit Bayer GBGB/RGRG"; break;
 	case V4L2_PIX_FMT_SGRBG16:	descr = "16-bit Bayer GRGR/BGBG"; break;
 	case V4L2_PIX_FMT_SRGGB16:	descr = "16-bit Bayer RGRG/GBGB"; break;
+	case V4L2_PIX_FMT_SGRGB_IGIG_GBGR_IGIG16: descr = "16-bit GRGB/IGIG/GBGR/IGIG"; break;
 	case V4L2_PIX_FMT_SN9C20X_I420:	descr = "GSPCA SN9C20X I420"; break;
 	case V4L2_PIX_FMT_SPCA501:	descr = "GSPCA SPCA501"; break;
 	case V4L2_PIX_FMT_SPCA505:	descr = "GSPCA SPCA505"; break;
-- 
2.29.2

