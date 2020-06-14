Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 433CD1F8B6D
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728066AbgFOAAW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:00:22 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33340 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728061AbgFOAAV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:00:21 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 225B11262;
        Mon, 15 Jun 2020 02:00:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179214;
        bh=uhYtBHCSEB2YKu9sfyHQsuRv4PVn/Jv+Y40CThoJX18=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dHmZ9yLlVB7EsLxq2kCE+wT/Hw513o1GdxRXe6WZTj51kAmiVg2yPWRx6BHJ2Bepp
         GI1jAAPaBIyl19IkjgTUr8msuJPbgJ7DR33iMX2BywqywEKf79lJ4TGqnjFpasQVEC
         9f5Z82uXfnbgCuBR3JZQjB9ydsKETtI2iVUiwL3M=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 009/107] media: ti-vpe: cal: Make cal_formats array const
Date:   Mon, 15 Jun 2020 02:58:06 +0300
Message-Id: <20200614235944.17716-10-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The static cal_formats array contains const data, make it const. This
requires turning a few cal_fmt pointers into const pointers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 8c068af936f0..35df94da7f2c 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -89,7 +89,7 @@ struct cal_fmt {
 	u8	bpp;
 };
 
-static struct cal_fmt cal_formats[] = {
+static const struct cal_fmt cal_formats[] = {
 	{
 		.fourcc		= V4L2_PIX_FMT_YUYV,
 		.code		= MEDIA_BUS_FMT_YUYV8_2X8,
@@ -392,7 +392,7 @@ struct cal_ctx {
 	struct v4l2_mbus_framefmt	m_fmt;
 
 	/* Current subdev enumerated format */
-	struct cal_fmt		*active_fmt[ARRAY_SIZE(cal_formats)];
+	const struct cal_fmt	*active_fmt[ARRAY_SIZE(cal_formats)];
 	int			num_active_fmt;
 
 	struct v4l2_fract	timeperframe;
@@ -1927,7 +1927,6 @@ static int cal_async_bound(struct v4l2_async_notifier *notifier,
 	/* Enumerate sub device formats and enable all matching local formats */
 	ctx->num_active_fmt = 0;
 	for (j = 0, i = 0; ret != -EINVAL; ++j) {
-		struct cal_fmt *fmt;
 
 		memset(&mbus_code, 0, sizeof(mbus_code));
 		mbus_code.index = j;
@@ -1942,7 +1941,7 @@ static int cal_async_bound(struct v4l2_async_notifier *notifier,
 			subdev->name, mbus_code.code, j);
 
 		for (k = 0; k < ARRAY_SIZE(cal_formats); k++) {
-			fmt = &cal_formats[k];
+			const struct cal_fmt *fmt = &cal_formats[k];
 
 			if (mbus_code.code == fmt->code) {
 				ctx->active_fmt[i] = fmt;
-- 
Regards,

Laurent Pinchart

