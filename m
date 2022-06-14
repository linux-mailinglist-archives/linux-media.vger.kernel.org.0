Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FFAB54BA45
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 21:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245199AbiFNTOE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 15:14:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244548AbiFNTOD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 15:14:03 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D36B28995
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 12:14:02 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240126034.bbtec.net [36.240.126.34])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CEE6E825;
        Tue, 14 Jun 2022 21:13:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655234041;
        bh=wr50jMmPTcrTYRpC1bC0bf83xxKPsRG6ZsJ7EZ3lTdQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bcexBvJWPuSJI6jlSOTSnEn0NFxh/mS1vX5nI9A2Alvn0ly3ZNE4Faoy29g9eIu2M
         OgOpiAkLKIvfYDbNn/M5I2oh7gdehEp0r/+hYKKX1Jwy31ncLVEYYmJ/tJ5xnJTZ31
         vlCmegAGPs24p9ULV/U8yUb7A6jOBlq0Y914Rayk=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 33/55] media: rkisp1: isp: Initialize some variables at declaration time
Date:   Wed, 15 Jun 2022 04:11:05 +0900
Message-Id: <20220614191127.3420492-34-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Intialize the src_fmt and sink_fmt variable when declaring them in
rkisp1_config_isp().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 4496af991c82..bf44f10200f5 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -142,12 +142,11 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
 {
 	struct rkisp1_device *rkisp1 = isp->rkisp1;
 	u32 isp_ctrl = 0, irq_mask = 0, acq_mult = 0, acq_prop = 0;
-	const struct rkisp1_mbus_info *src_fmt, *sink_fmt;
+	const struct rkisp1_mbus_info *sink_fmt = isp->sink_fmt;
+	const struct rkisp1_mbus_info *src_fmt = isp->src_fmt;
 	struct v4l2_mbus_framefmt *sink_frm;
 	struct v4l2_rect *sink_crop;
 
-	sink_fmt = isp->sink_fmt;
-	src_fmt = isp->src_fmt;
 	sink_frm = rkisp1_isp_get_pad_fmt(isp, NULL,
 					  RKISP1_ISP_PAD_SINK_VIDEO,
 					  V4L2_SUBDEV_FORMAT_ACTIVE);
-- 
2.30.2

