Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08A1254BA49
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 21:14:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357493AbiFNTOL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 15:14:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344724AbiFNTOH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 15:14:07 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B17A4764E
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 12:14:06 -0700 (PDT)
Received: from pyrite.rasen.tech (softbank036240126034.bbtec.net [36.240.126.34])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 068969E5;
        Tue, 14 Jun 2022 21:14:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655234045;
        bh=5TfCdx16tPdAtupupd+gmBosQHk0m9Yd9ndPuGyPEkI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UCrSYj3NIAmr5o9VVjM4d/62ZJybY8xsIOy535cbAB2yGiVhaPbZATsNxPdh9exAf
         EGcoWTMLSA+svexpD70wTH9F3vYL0/exw1KzitB6ohCz7eHCZQ2fOcZiIMHJ5VPwBu
         lrX0lmfQAoDDr9EAQVy2Pt8+kysa4GPkU0z4jcJ8=
From:   Paul Elder <paul.elder@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 34/55] media: rkisp1: isp: Fix whitespace issues
Date:   Wed, 15 Jun 2022 04:11:06 +0900
Message-Id: <20220614191127.3420492-35-paul.elder@ideasonboard.com>
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

Add missing blank lines after variable declaration blocks, and fix
indentation issues.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index bf44f10200f5..86d496855374 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -79,7 +79,8 @@ rkisp1_isp_get_pad_fmt(struct rkisp1_isp *isp,
 {
 	struct v4l2_subdev_state state = {
 		.pads = isp->pad_cfg
-		};
+	};
+
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
 		return v4l2_subdev_get_try_format(&isp->sd, sd_state, pad);
 	else
@@ -93,7 +94,8 @@ rkisp1_isp_get_pad_crop(struct rkisp1_isp *isp,
 {
 	struct v4l2_subdev_state state = {
 		.pads = isp->pad_cfg
-		};
+	};
+
 	if (which == V4L2_SUBDEV_FORMAT_TRY)
 		return v4l2_subdev_get_try_crop(&isp->sd, sd_state, pad);
 	else
@@ -893,8 +895,8 @@ static void rkisp1_isp_queue_event_sof(struct rkisp1_isp *isp)
 	struct v4l2_event event = {
 		.type = V4L2_EVENT_FRAME_SYNC,
 	};
-	event.u.frame_sync.frame_sequence = isp->frame_sequence;
 
+	event.u.frame_sync.frame_sequence = isp->frame_sequence;
 	v4l2_event_queue(isp->sd.devnode, &event);
 }
 
-- 
2.30.2

