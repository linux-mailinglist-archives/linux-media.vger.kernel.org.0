Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD3624BEA0F
	for <lists+linux-media@lfdr.de>; Mon, 21 Feb 2022 19:09:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbiBURzn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Feb 2022 12:55:43 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231424AbiBURxw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Feb 2022 12:53:52 -0500
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42C5CB1F
        for <linux-media@vger.kernel.org>; Mon, 21 Feb 2022 09:49:15 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 0E0291C0002;
        Mon, 21 Feb 2022 17:49:09 +0000 (UTC)
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
Subject: [PATCH v2] media: imx: imx8mq-mipi-csi2: Remove YUV422 2X8
Date:   Mon, 21 Feb 2022 18:49:03 +0100
Message-Id: <20220221174903.320466-1-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
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
---

v1->v2:
- Fix subject (s/mp/mq) as reported by Adam
- Add UYVY_1X16 as suggested by Laurent

 drivers/staging/media/imx/imx8mq-mipi-csi2.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx8mq-mipi-csi2.c b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
index 56ef3b3b2906..7d03cb340ed4 100644
--- a/drivers/staging/media/imx/imx8mq-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx8mq-mipi-csi2.c
@@ -200,14 +200,16 @@ static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
 		.width = 14,
-	}, {
+	},
 	/* YUV formats */
-		.code = MEDIA_BUS_FMT_YUYV8_2X8,
-		.width = 16,
-	}, {
+	{
 		.code = MEDIA_BUS_FMT_YUYV8_1X16,
 		.width = 16,
 	}
+	{
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.width = 16,
+	}
 };

 static const struct csi2_pix_format *find_csi2_format(u32 code)
--
2.35.0

