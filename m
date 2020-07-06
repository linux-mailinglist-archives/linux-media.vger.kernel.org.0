Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5FA215E78
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729858AbgGFShj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:37:39 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729854AbgGFShh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:37:37 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B50881959;
        Mon,  6 Jul 2020 20:37:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060652;
        bh=MonulVn5HZGUO0zR5Pz2EFA0YEUuXcoiYcTAgAuFSlM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kXuaYRIP+ZCf5mtXz1miZbLo2TFXe2Vx9gC2XN7u8+GSsdWxyorOuYUakHHAc4mZB
         oea7PtUJUSG2gpcmWxNJMdRETCXLw5yVUV/HsvOQRlC66EgSBZOMhNaFKkoccMN3Uz
         ijKqYhIAFDkBqIVBt4oHzy/2eTWqd2zqxo8LWtW4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 009/108] media: ti-vpe: cal: Make cal_formats array const
Date:   Mon,  6 Jul 2020 21:35:30 +0300
Message-Id: <20200706183709.12238-10-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The static cal_formats array contains const data, make it const. This
requires turning a few cal_fmt pointers into const pointers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 278477cf0ae9..3668c4d445fe 100644
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
@@ -1932,7 +1932,6 @@ static int cal_async_bound(struct v4l2_async_notifier *notifier,
 	/* Enumerate sub device formats and enable all matching local formats */
 	ctx->num_active_fmt = 0;
 	for (j = 0, i = 0; ret != -EINVAL; ++j) {
-		struct cal_fmt *fmt;
 
 		memset(&mbus_code, 0, sizeof(mbus_code));
 		mbus_code.index = j;
@@ -1947,7 +1946,7 @@ static int cal_async_bound(struct v4l2_async_notifier *notifier,
 			subdev->name, mbus_code.code, j);
 
 		for (k = 0; k < ARRAY_SIZE(cal_formats); k++) {
-			fmt = &cal_formats[k];
+			const struct cal_fmt *fmt = &cal_formats[k];
 
 			if (mbus_code.code == fmt->code) {
 				ctx->active_fmt[i] = fmt;
-- 
Regards,

Laurent Pinchart

