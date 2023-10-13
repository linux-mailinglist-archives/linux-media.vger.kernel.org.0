Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9B87C83DE
	for <lists+linux-media@lfdr.de>; Fri, 13 Oct 2023 13:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbjJMLBR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Oct 2023 07:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjJMLBP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Oct 2023 07:01:15 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D103BBD
        for <linux-media@vger.kernel.org>; Fri, 13 Oct 2023 04:01:13 -0700 (PDT)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1qrFuU-0006xJ-AV; Fri, 13 Oct 2023 13:00:50 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
Date:   Fri, 13 Oct 2023 13:00:28 +0200
Subject: [PATCH v2 07/13] media: rockchip: rga: use clamp() to clamp size
 to limits
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230914-rockchip-rga-multiplanar-v2-7-bbfa6abf8bbf@pengutronix.de>
References: <20230914-rockchip-rga-multiplanar-v2-0-bbfa6abf8bbf@pengutronix.de>
In-Reply-To: <20230914-rockchip-rga-multiplanar-v2-0-bbfa6abf8bbf@pengutronix.de>
To:     Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Shengyu Qu <wiagn233@outlook.com>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Diederik de Haas <didi.debian@cknow.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
X-Mailer: b4 0.12.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The try_fmt should limit the width and height to the know limits of the
RGA. Use the clamp() helper instead of open coding the clamping.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changes in v2: None
---
 drivers/media/platform/rockchip/rga/rga.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index ea566c11734a..792084918798 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -482,15 +482,10 @@ static int vidioc_try_fmt(struct file *file, void *prv, struct v4l2_format *f)
 
 	f->fmt.pix.field = V4L2_FIELD_NONE;
 
-	if (f->fmt.pix.width > MAX_WIDTH)
-		f->fmt.pix.width = MAX_WIDTH;
-	if (f->fmt.pix.height > MAX_HEIGHT)
-		f->fmt.pix.height = MAX_HEIGHT;
-
-	if (f->fmt.pix.width < MIN_WIDTH)
-		f->fmt.pix.width = MIN_WIDTH;
-	if (f->fmt.pix.height < MIN_HEIGHT)
-		f->fmt.pix.height = MIN_HEIGHT;
+	f->fmt.pix.width = clamp(f->fmt.pix.width,
+				 (u32)MIN_WIDTH, (u32)MAX_WIDTH);
+	f->fmt.pix.height = clamp(f->fmt.pix.height,
+				  (u32)MIN_HEIGHT, (u32)MAX_HEIGHT);
 
 	if (fmt->hw_format >= RGA_COLOR_FMT_YUV422SP)
 		f->fmt.pix.bytesperline = f->fmt.pix.width;

-- 
2.39.2

