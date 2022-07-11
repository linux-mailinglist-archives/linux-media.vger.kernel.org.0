Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4750057032A
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 14:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232011AbiGKMpn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 08:45:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231993AbiGKMpI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 08:45:08 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C4CDDECB
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 05:44:41 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3EED7289D;
        Mon, 11 Jul 2022 14:43:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657543421;
        bh=XD6clsK9KPXg3dG8jB/BN5HedvdeIhuKVgeBfjCIkOc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mDdAVmZLShU/o13gdtFcm2JplXPxKzMy7Z6yQukoT+Tx7CQwAWIBqMsLL1pR9CM0j
         f+T5extbi3+JXHLpO8m1pKRrpOxu8Jf6Zt4H1PTiHTuUj7FeYq8G0xlFR8r5/phQQa
         RzHynfWYw6RjWa60fTHP32OCTP6oHU+ezsSJ+9z8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-rockchip@lists.infradead.org,
        Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Helen Koike <helen.koike@collabora.com>,
        Paul Elder <paul.elder@ideasonboard.com>
Subject: [PATCH v3 36/46] media: rkisp1: isp: Constify various local variables
Date:   Mon, 11 Jul 2022 15:42:38 +0300
Message-Id: <20220711124248.2683-37-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
References: <20220711124248.2683-1-laurent.pinchart@ideasonboard.com>
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

A set of local variables point to structure that are not meant to be
modified. Constify them.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
index 944d7bfa9b41..2ba227b2f6a1 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
@@ -113,7 +113,7 @@ rkisp1_isp_get_pad_crop(struct rkisp1_isp *isp,
  */
 static void rkisp1_config_ism(struct rkisp1_isp *isp)
 {
-	struct v4l2_rect *src_crop =
+	const struct v4l2_rect *src_crop =
 		rkisp1_isp_get_pad_crop(isp, NULL,
 					RKISP1_ISP_PAD_SOURCE_VIDEO,
 					V4L2_SUBDEV_FORMAT_ACTIVE);
@@ -146,8 +146,8 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
 	u32 isp_ctrl = 0, irq_mask = 0, acq_mult = 0, acq_prop = 0;
 	const struct rkisp1_mbus_info *sink_fmt = isp->sink_fmt;
 	const struct rkisp1_mbus_info *src_fmt = isp->src_fmt;
-	struct v4l2_mbus_framefmt *sink_frm;
-	struct v4l2_rect *sink_crop;
+	const struct v4l2_mbus_framefmt *sink_frm;
+	const struct v4l2_rect *sink_crop;
 
 	sink_frm = rkisp1_isp_get_pad_fmt(isp, NULL,
 					  RKISP1_ISP_PAD_SINK_VIDEO,
@@ -557,7 +557,7 @@ static void rkisp1_isp_set_sink_crop(struct rkisp1_isp *isp,
 				     struct v4l2_rect *r, unsigned int which)
 {
 	struct v4l2_rect *sink_crop, *src_crop;
-	struct v4l2_mbus_framefmt *sink_fmt;
+	const struct v4l2_mbus_framefmt *sink_fmt;
 
 	sink_crop = rkisp1_isp_get_pad_crop(isp, sd_state,
 					    RKISP1_ISP_PAD_SINK_VIDEO,
@@ -742,7 +742,7 @@ static int rkisp1_isp_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct rkisp1_isp *isp = to_rkisp1_isp(sd);
 	struct rkisp1_device *rkisp1 = isp->rkisp1;
-	struct rkisp1_sensor_async *asd;
+	const struct rkisp1_sensor_async *asd;
 	int ret;
 
 	if (!enable) {
-- 
Regards,

Laurent Pinchart

