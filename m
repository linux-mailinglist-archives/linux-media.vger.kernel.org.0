Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A64754D18D
	for <lists+linux-media@lfdr.de>; Wed, 15 Jun 2022 21:26:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346446AbiFOT01 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jun 2022 15:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346274AbiFOT00 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jun 2022 15:26:26 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7D704C42E
        for <linux-media@vger.kernel.org>; Wed, 15 Jun 2022 12:26:25 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 415F36BE;
        Wed, 15 Jun 2022 21:26:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1655321182;
        bh=X6Bpa83mlbM05Ahsn9pbAKy7J8VGVgVBir46V1Ef+S0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OW6XAVWj1WSqfHwKC68ip1N/zVnim2U/Q0IHTqfxpcqNPchx206lAFBgFn4D9HFlB
         6MP8Wdsxn66Aeo9x8ESmcOV0VrcJ7fAHZybS+ZE4i84ujESfnCQ7QjReBztge9lkWd
         LEqNrrP0xglbsXAHcopSX7OIzxtTsZ3fm4GS9Ol4=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: [PATCH 2/4] media: imx: imx-mipi-csis: Add version register
Date:   Wed, 15 Jun 2022 22:26:00 +0300
Message-Id: <20220615192602.25472-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615192602.25472-1-laurent.pinchart@ideasonboard.com>
References: <20220615192602.25472-1-laurent.pinchart@ideasonboard.com>
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

Register at offset 0x00 isn't documented, but the NXP BSP
imx8-mipi-csi2-sam driver defines it as a version register. Tests on
i.MX7D and i.MX8MP have confirmed this, with values matching the version
of the IP core specified in the respective reference manuals.

This commit doesn't make use of the version register at runtime as the
compatible strings are enough to identify the IP core version.
Nonetheless, capturing the information in register definitions that
don't affect the code negatively is useful for future development.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 09a220c1bfe8..8674aaad5fa0 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -46,6 +46,11 @@
 
 /* Register map definition */
 
+/* CSIS version */
+#define MIPI_CSIS_VERSION			0x00
+#define MIPI_CSIS_VERSION_IMX7D			0x03030505
+#define MIPI_CSIS_VERSION_IMX8MP		0x03060301
+
 /* CSIS common control */
 #define MIPI_CSIS_CMN_CTRL			0x04
 #define MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW	BIT(16)
-- 
Regards,

Laurent Pinchart

