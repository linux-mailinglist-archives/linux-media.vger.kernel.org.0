Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FFA570D853
	for <lists+linux-media@lfdr.de>; Tue, 23 May 2023 11:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235720AbjEWJDY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 May 2023 05:03:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236172AbjEWJDX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 May 2023 05:03:23 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E158A102
        for <linux-media@vger.kernel.org>; Tue, 23 May 2023 02:03:21 -0700 (PDT)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1q1NvI-0001oU-3j; Tue, 23 May 2023 11:03:16 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     jacob-chen@iotwrt.com, ezequiel@vanguardiasur.com.ar,
        mchehab@kernel.org, heiko@sntech.de
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
        m.tretter@pengutronix.de
Subject: [PATCH] media: rockchip: rga: use v4l2_m2m_buf_copy_metadata
Date:   Tue, 23 May 2023 11:03:09 +0200
Message-Id: <20230523090309.3323983-1-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The v4l2_m2m_buf_copy_metadata function correctly copies the metadata of
the buffer. Use that function instead of open-coding the metadata copy.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/rockchip/rga/rga.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index 67dcf22e5ba3..e4b8ce9ab3c6 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -76,10 +76,7 @@ static irqreturn_t rga_isr(int irq, void *prv)
 		WARN_ON(!src);
 		WARN_ON(!dst);
 
-		dst->timecode = src->timecode;
-		dst->vb2_buf.timestamp = src->vb2_buf.timestamp;
-		dst->flags &= ~V4L2_BUF_FLAG_TSTAMP_SRC_MASK;
-		dst->flags |= src->flags & V4L2_BUF_FLAG_TSTAMP_SRC_MASK;
+		v4l2_m2m_buf_copy_metadata(src, dst, true);
 
 		v4l2_m2m_buf_done(src, VB2_BUF_STATE_DONE);
 		v4l2_m2m_buf_done(dst, VB2_BUF_STATE_DONE);
-- 
2.39.2

