Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 523A74BEB1D
	for <lists+linux-media@lfdr.de>; Mon, 21 Feb 2022 20:37:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231165AbiBUS1K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Feb 2022 13:27:10 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232464AbiBUSYg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Feb 2022 13:24:36 -0500
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7317E7669
        for <linux-media@vger.kernel.org>; Mon, 21 Feb 2022 10:17:22 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id BF3561BF206;
        Mon, 21 Feb 2022 18:17:16 +0000 (UTC)
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     aford173@gmail.com, slongerbeam@gmail.com, p.zabel@pengutronix.de,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, martin.kepplinger@puri.sm,
        rmfrfs@gmail.com, xavier.roumegue@oss.nxp.com,
        alexander.stein@ew.tq-group.com, dorota.czaplejewicz@puri.sm
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: [PATCH v3] media: imx: imx8mq-mipi-csi2: Remove YUV422 2X8
Date:   Mon, 21 Feb 2022 19:17:08 +0100
Message-Id: <20220221181708.378032-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The 2X8 variants of MEDIA_BUS_FMT_YUYV8_2X8 does not apply to serial
busses.

Drop it and while at it also add the canonical UYVY wire format for
packed YUV422 when transmitted on the CSI-2 serial bus.

Also beautify a little the formats declaration list by putting the
opening curly brace after the comment.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v1->v2:
- Fix subject (s/mp/mq) as reported by Adam
- Add UYVY_1X16 as suggested by Laurent

v2->v3:
- Add a missing comma
- Align the entries declaration style to the rest of the list

 drivers/staging/media/imx/imx8mq-mipi-csi2.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx8mq-mipi-csi2.c b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
index 56ef3b3b2906..449796a0b942 100644
--- a/drivers/staging/media/imx/imx8mq-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
@@ -200,12 +200,13 @@ static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
 		.width = 14,
-	}, {
+	},
 	/* YUV formats */
-		.code = MEDIA_BUS_FMT_YUYV8_2X8,
+	{
+		.code = MEDIA_BUS_FMT_YUYV8_1X16,
 		.width = 16,
 	}, {
-		.code = MEDIA_BUS_FMT_YUYV8_1X16,
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
 		.width = 16,
 	}
 };
--
2.35.0

