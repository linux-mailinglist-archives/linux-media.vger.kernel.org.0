Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7746876D075
	for <lists+linux-media@lfdr.de>; Wed,  2 Aug 2023 16:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234396AbjHBOrn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Aug 2023 10:47:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234384AbjHBOrm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Aug 2023 10:47:42 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 460581BE7
        for <linux-media@vger.kernel.org>; Wed,  2 Aug 2023 07:47:41 -0700 (PDT)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 8D5CD867F0;
        Wed,  2 Aug 2023 16:47:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1690987660;
        bh=vPBE+WeFYjet/7EnzMPL6KNEyP366bOqLBPiDT+JT7o=;
        h=From:To:Cc:Subject:Date:From;
        b=sBPsvqP5ZwM52yJD92OCG/wcBEYSrv2280ucah96E7vvdgJjvXN3Kj9IqzcqrpNwJ
         Ms585/j38FIkZ4XeNxPiEqcw1QwAS0pw2sdkL4FAoLfdMaAdNZm8R17HYpEQukXh5R
         mOkEr2v9M/8ExpdjbC2o1PVD/MH2e3ePxGwR0W76K8HeQ3+bKO7YV39Y+qNvkfka05
         U5HcPKUou0WVM3/BMz9DXJVA0Yk+1jarvXone5qbvywr7/MbrjlmgWiflm9DSd+aZA
         eBMYkm7FYvwxpAYBTJzpmORD3C2/6ePILs4t567z04CPcur+XAHP/zQFUEfxzEaE42
         BI+xZWTN2f4pQ==
From:   Marek Vasut <marex@denx.de>
To:     linux-media@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Aishwarya Kothari <aishwarya.kothari@toradex.com>,
        Francesco Dolcini <francesco@dolcini.it>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Hugues FRUCHET <hugues.fruchet@foss.st.com>,
        Jai Luthra <j-luthra@ti.com>,
        Marcel Ziswiler <marcel@ziswiler.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2] media: ov5640: Enable MIPI interface in ov5640_set_power_mipi()
Date:   Wed,  2 Aug 2023 16:47:25 +0200
Message-Id: <20230802144725.34099-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Set OV5640_REG_IO_MIPI_CTRL00 bit 2 to 1 instead of 0, since 1 means
MIPI CSI2 interface, while 0 means CPI parallel interface.

In the ov5640_set_power_mipi() the interface should obviously be set
to MIPI CSI2 since this functions is used to power up the sensor when
operated in MIPI CSI2 mode. The sensor should not be in CPI mode in
that case.

This fixes a corner case where capturing the first frame on i.MX8MN
with CSI/ISI resulted in corrupted frame.

Fixes: aa4bb8b8838f ("media: ov5640: Re-work MIPI startup sequence")
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Tested-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com> # [Test on imx6q]
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Aishwarya Kothari <aishwarya.kothari@toradex.com>
Cc: Francesco Dolcini <francesco@dolcini.it>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Hugues FRUCHET <hugues.fruchet@foss.st.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Jai Luthra <j-luthra@ti.com>
Cc: Marcel Ziswiler <marcel@ziswiler.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>
Cc: linux-media@vger.kernel.org
---
V2: - Update commit message to mention this fixes the first corrupted frame
    - Collect RB/TB
    - Expand CC list
---
 drivers/media/i2c/ov5640.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index ff0aef915fca5..5fe85aa2d2ec4 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -2539,9 +2539,9 @@ static int ov5640_set_power_mipi(struct ov5640_dev *sensor, bool on)
 	 *		  "ov5640_set_stream_mipi()")
 	 * [4] = 0	: Power up MIPI HS Tx
 	 * [3] = 0	: Power up MIPI LS Rx
-	 * [2] = 0	: MIPI interface disabled
+	 * [2] = 1	: MIPI interface enabled
 	 */
-	ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x40);
+	ret = ov5640_write_reg(sensor, OV5640_REG_IO_MIPI_CTRL00, 0x44);
 	if (ret)
 		return ret;
 
-- 
2.40.1

