Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EB6D5EADF7
	for <lists+linux-media@lfdr.de>; Mon, 26 Sep 2022 19:18:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbiIZRSm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Sep 2022 13:18:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbiIZRSQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Sep 2022 13:18:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EBCDCD1F7;
        Mon, 26 Sep 2022 09:32:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C78B5415;
        Mon, 26 Sep 2022 18:32:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664209927;
        bh=2kRiO/sCYzNGHggQyqfmHEhtsjrIpbG7RGJFkOtBZlI=;
        h=From:To:Cc:Subject:Date:From;
        b=Hp3Z9u0y3jq6Eig4Unlkc18qzEU9WZnhxzCzoVx5R/i56sF4s1PBMX3iNVqVaq1KA
         vA0002Q+MV77ky9+GlcJEJdMt/8wELmYnRxoDrX4+aHdrP3Z2TGSOdtT+Sy7mdRfkX
         HGIhs6/N6P21zwWFSJuUg+rF/WB8Wp9kEnjRBU4A=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH] media: v4l2-ctrls: Fix off-by-one error in integer menu control check
Date:   Mon, 26 Sep 2022 19:31:51 +0300
Message-Id: <20220926163151.21445-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

The V4L2 API defines the maximum value for an integer menu control as
the number of elements minus one. The v4l2_ctrl_new_std_menu() validates
this constraint with an off-by-one error. Fix it.

Fixes: d1e9b7c12b74 ("[media] V4L: Add support for integer menu controls with standard menu items")
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 1f85828d6694..322f9f715b65 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -1762,7 +1762,7 @@ struct v4l2_ctrl *v4l2_ctrl_new_std_menu(struct v4l2_ctrl_handler *hdl,
 	else if (type == V4L2_CTRL_TYPE_INTEGER_MENU)
 		qmenu_int = v4l2_ctrl_get_int_menu(id, &qmenu_int_len);
 
-	if ((!qmenu && !qmenu_int) || (qmenu_int && max > qmenu_int_len)) {
+	if ((!qmenu && !qmenu_int) || (qmenu_int && max >= qmenu_int_len)) {
 		handler_set_err(hdl, -EINVAL);
 		return NULL;
 	}
-- 
Regards,

Laurent Pinchart

