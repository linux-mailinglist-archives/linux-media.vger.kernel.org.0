Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8E3550751
	for <lists+linux-media@lfdr.de>; Sun, 19 Jun 2022 00:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234204AbiFRWXn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 18 Jun 2022 18:23:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234187AbiFRWXX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 18 Jun 2022 18:23:23 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D993510FFD
        for <linux-media@vger.kernel.org>; Sat, 18 Jun 2022 15:23:22 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 5D4EE802F2;
        Sun, 19 Jun 2022 00:23:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1655591001;
        bh=kJt70BUTl+NEUpAdMwZZ+/3O2PeukyKpB52c+lZ7PUs=;
        h=From:To:Cc:Subject:Date:From;
        b=zXoH7uNR9fBpASqiabYjxoDoFxrq7HPEvWQh3OH3TjsiGAifn79tretKJGJmZfV4X
         126k/PcwiCMDcEJLAzcDr2hKtDUg7M1F2ul29rx6BHPKHWPCjht9EDz6Bxi3nQ69qC
         uPjEC7basp6DFEIO1OglV/GWZTrX8+4Ap+S8oO7JAIONfh5i84SMJ445T6kd7F3X1r
         j38qqUBMYwrXTj7nJ9o+nimKHAWkZQV6easCWdmkQYjPiVM64pwdEa93kuQplKAuP5
         5KJn3+fziRRm2KhDH8H3jSxgiZo+jNgPSodnpLuJmcIiuxFwsusUeRW567N94oywKZ
         smgWD09zPpsIw==
From:   Marek Vasut <marex@denx.de>
To:     linux-media@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Amelie DELAUNAY <amelie.delaunay@foss.st.com>,
        Hugues FRUCHET <hugues.fruchet@foss.st.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philippe CORNU <philippe.cornu@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: stm32: dcmi: Fill in remaining Bayer formats
Date:   Sun, 19 Jun 2022 00:23:17 +0200
Message-Id: <20220618222317.478187-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fill in 10, 12, 14 bit Bayer formats into the DCMI driver.
Those are useful e.g. when MT9P006 sensor is connected.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Amelie DELAUNAY <amelie.delaunay@foss.st.com>
Cc: Hugues FRUCHET <hugues.fruchet@foss.st.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Philippe CORNU <philippe.cornu@foss.st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 48 ++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 09a743cd70040..5f08ba47ea96b 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -1631,6 +1631,54 @@ static const struct dcmi_format dcmi_formats[] = {
 		.fourcc = V4L2_PIX_FMT_SRGGB8,
 		.mbus_code = MEDIA_BUS_FMT_SRGGB8_1X8,
 		.bpp = 1,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR10,
+		.mbus_code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG10,
+		.mbus_code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG10,
+		.mbus_code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB10,
+		.mbus_code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR12,
+		.mbus_code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG12,
+		.mbus_code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG12,
+		.mbus_code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB12,
+		.mbus_code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR14,
+		.mbus_code = MEDIA_BUS_FMT_SBGGR14_1X14,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG14,
+		.mbus_code = MEDIA_BUS_FMT_SGBRG14_1X14,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG14,
+		.mbus_code = MEDIA_BUS_FMT_SGRBG14_1X14,
+		.bpp = 2,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB14,
+		.mbus_code = MEDIA_BUS_FMT_SRGGB14_1X14,
+		.bpp = 2,
 	},
 };
 
-- 
2.35.1

