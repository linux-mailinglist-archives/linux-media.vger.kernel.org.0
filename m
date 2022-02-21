Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A0B94BEA0A
	for <lists+linux-media@lfdr.de>; Mon, 21 Feb 2022 19:09:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbiBURze (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Feb 2022 12:55:34 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229951AbiBURwi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Feb 2022 12:52:38 -0500
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BC1C654A
        for <linux-media@vger.kernel.org>; Mon, 21 Feb 2022 09:48:01 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 7ECFD1C0003;
        Mon, 21 Feb 2022 17:47:56 +0000 (UTC)
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
Subject: [PATCH v4 5/7] media: imx: imx-mipi-csis: Add RGB565_1X16
Date:   Mon, 21 Feb 2022 18:47:25 +0100
Message-Id: <20220221174727.320320-6-jacopo@jmondi.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220221174727.320320-1-jacopo@jmondi.org>
References: <20220221174727.320320-1-jacopo@jmondi.org>
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

Add RGB565_1X16 to the enumeration of supported image formats.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/imx/imx-mipi-csis.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/imx/imx-mipi-csis.c b/drivers/media/platform/imx/imx-mipi-csis.c
index 9d5034759987..46055b5f8412 100644
--- a/drivers/media/platform/imx/imx-mipi-csis.c
+++ b/drivers/media/platform/imx/imx-mipi-csis.c
@@ -360,6 +360,12 @@ static const struct csis_pix_format mipi_csis_formats[] = {
 		.data_type = MIPI_CSI2_DATA_TYPE_YUV422_8,
 		.width = 16,
 	},
+	/* RGB formats. */
+	{
+		.code = MEDIA_BUS_FMT_RGB565_1X16,
+		.data_type = MIPI_CSI2_DATA_TYPE_RGB565,
+		.width = 16,
+	},
 	/* RAW (Bayer and greyscale) formats. */
 	{
 		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
-- 
2.35.0

