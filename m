Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D7146E3F0F
	for <lists+linux-media@lfdr.de>; Mon, 17 Apr 2023 07:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjDQFjp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Apr 2023 01:39:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjDQFjo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Apr 2023 01:39:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 560152716
        for <linux-media@vger.kernel.org>; Sun, 16 Apr 2023 22:39:43 -0700 (PDT)
Received: from pendragon.ideasonboard.com (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4993475B;
        Mon, 17 Apr 2023 07:39:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1681709977;
        bh=XDa7VJ3I/inyle7/5V5aXyj+O+kztYuYY7X9SndG96A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=owMEQh+XSRi3WORIhttd24OUOPAYDEU6rJlt6tj0vXrYa2dwtesMddXjDiLWQzNsL
         moeFBKadwvSczuXMvLuKA1jtZpijlzuH3hX1sxxzNmerAieo9MbsxnKU9tJcdCDnEs
         soGz6u8Gq+64hTlMYKYwSymaGw6tlcsazBg64LT8=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-imx@nxp.com, kernel@pengutronix.de
Subject: [PATCH v1 1/2] media: nxp: imx8-isi: Mark PM functions as __maybe_unused
Date:   Mon, 17 Apr 2023 08:39:48 +0300
Message-Id: <20230417053949.7395-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417053949.7395-1-laurent.pinchart@ideasonboard.com>
References: <20230417053949.7395-1-laurent.pinchart@ideasonboard.com>
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

The system and runtime PM handler may be unused, depending on the kernel
configuration. Mark them as such.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 238521622b75..a99c5fee6773 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -311,7 +311,7 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
  * Power management
  */
 
-static int mxc_isi_pm_suspend(struct device *dev)
+static int __maybe_unused mxc_isi_pm_suspend(struct device *dev)
 {
 	struct mxc_isi_dev *isi = dev_get_drvdata(dev);
 	unsigned int i;
@@ -325,7 +325,7 @@ static int mxc_isi_pm_suspend(struct device *dev)
 	return pm_runtime_force_suspend(dev);
 }
 
-static int mxc_isi_pm_resume(struct device *dev)
+static int __maybe_unused mxc_isi_pm_resume(struct device *dev)
 {
 	struct mxc_isi_dev *isi = dev_get_drvdata(dev);
 	unsigned int i;
@@ -354,7 +354,7 @@ static int mxc_isi_pm_resume(struct device *dev)
 	return err;
 }
 
-static int mxc_isi_runtime_suspend(struct device *dev)
+static int __maybe_unused mxc_isi_runtime_suspend(struct device *dev)
 {
 	struct mxc_isi_dev *isi = dev_get_drvdata(dev);
 
@@ -363,7 +363,7 @@ static int mxc_isi_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int mxc_isi_runtime_resume(struct device *dev)
+static int __maybe_unused mxc_isi_runtime_resume(struct device *dev)
 {
 	struct mxc_isi_dev *isi = dev_get_drvdata(dev);
 	int ret;
-- 
Regards,

Laurent Pinchart

