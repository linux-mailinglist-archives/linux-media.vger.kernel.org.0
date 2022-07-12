Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E03E8570E87
	for <lists+linux-media@lfdr.de>; Tue, 12 Jul 2022 02:03:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbiGLADc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 20:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbiGLADa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 20:03:30 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3050B2CE1D
        for <linux-media@vger.kernel.org>; Mon, 11 Jul 2022 17:03:30 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 15F0B103F;
        Tue, 12 Jul 2022 02:03:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657584205;
        bh=VRxp+DhBaEMtIMH746bjlWV6aANq6BOR0JQ5RljlRF8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CsNwkwVWBxJiW6K1RLGGwmCG0XNbqMkB3RCgB63t+lIptehi7gMEY2lIHRB14ZY5y
         ULrXuUJE3ouRI9teOqyuiUbpCXl3vC31ChkpiEPhB/J0RZmAMgOEOkRu5CrDxOJK3+
         VyYxO+LkIgJaKzUIdhA9ac4SJ1t0AyWnAItZngbY=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de
Subject: [PATCH v2 3/7] media: vivid: Add support for the new YUVA and YUVX formats
Date:   Tue, 12 Jul 2022 03:02:47 +0300
Message-Id: <20220712000251.13607-4-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220712000251.13607-1-laurent.pinchart@ideasonboard.com>
References: <20220712000251.13607-1-laurent.pinchart@ideasonboard.com>
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

Extend vivid to support the newly added YUVA and YUVX pixel formats
through the TPG.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/test-drivers/vivid/vivid-vid-common.c   | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-vid-common.c b/drivers/media/test-drivers/vivid/vivid-vid-common.c
index 19701fe72030..38d788b5cf19 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-common.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-common.c
@@ -198,6 +198,21 @@ struct vivid_fmt vivid_formats[] = {
 		.planes   = 1,
 		.buffers = 1,
 	},
+	{
+		.fourcc   = V4L2_PIX_FMT_YUVA32,
+		.vdownsampling = { 1 },
+		.bit_depth = { 32 },
+		.planes   = 1,
+		.buffers = 1,
+		.alpha_mask = 0xff000000,
+	},
+	{
+		.fourcc   = V4L2_PIX_FMT_YUVX32,
+		.vdownsampling = { 1 },
+		.bit_depth = { 32 },
+		.planes   = 1,
+		.buffers = 1,
+	},
 	{
 		.fourcc   = V4L2_PIX_FMT_GREY,
 		.vdownsampling = { 1 },
-- 
Regards,

Laurent Pinchart

