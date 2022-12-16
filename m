Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7783564E988
	for <lists+linux-media@lfdr.de>; Fri, 16 Dec 2022 11:36:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbiLPKgE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Dec 2022 05:36:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230057AbiLPKf6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Dec 2022 05:35:58 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61BCD2E9C8
        for <linux-media@vger.kernel.org>; Fri, 16 Dec 2022 02:35:57 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1p684D-0005Wi-6Y; Fri, 16 Dec 2022 11:35:49 +0100
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mfe@pengutronix.de>)
        id 1p684B-004tvU-DQ; Fri, 16 Dec 2022 11:35:48 +0100
Received: from mfe by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mfe@pengutronix.de>)
        id 1p684A-00FGHC-WE; Fri, 16 Dec 2022 11:35:47 +0100
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        hverkuil-cisco@xs4all.nl, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 2/3] media: i2c: tc358746: fix ignoring read error in g_register callback
Date:   Fri, 16 Dec 2022 11:35:44 +0100
Message-Id: <20221216103545.3620670-3-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221216103545.3620670-1-m.felsch@pengutronix.de>
References: <20221216103545.3620670-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently we ignore the return value of tc358746_read() and return
alawys return 0 which is wrong. Fix this by returning the actual return
value of the read operation which is either 0 on success or an error
value.

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1527254 ("Error handling issues")
Fixes: 80a21da36051 ("media: tc358746: add Toshiba TC358746 Parallel to CSI-2 bridge driver")
Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/media/i2c/tc358746.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
index e7f27cbb5790..c5a0df300a06 100644
--- a/drivers/media/i2c/tc358746.c
+++ b/drivers/media/i2c/tc358746.c
@@ -988,6 +988,7 @@ static int __maybe_unused
 tc358746_g_register(struct v4l2_subdev *sd, struct v4l2_dbg_register *reg)
 {
 	struct tc358746 *tc358746 = to_tc358746(sd);
+	int err;
 
 	/* 32-bit registers starting from CLW_DPHYCONTTX */
 	reg->size = reg->reg < CLW_DPHYCONTTX_REG ? 2 : 4;
@@ -995,12 +996,12 @@ tc358746_g_register(struct v4l2_subdev *sd, struct v4l2_dbg_register *reg)
 	if (!pm_runtime_get_if_in_use(sd->dev))
 		return 0;
 
-	tc358746_read(tc358746, reg->reg, (u32 *)&reg->val);
+	err = tc358746_read(tc358746, reg->reg, (u32 *)&reg->val);
 
 	pm_runtime_mark_last_busy(sd->dev);
 	pm_runtime_put_sync_autosuspend(sd->dev);
 
-	return 0;
+	return err;
 }
 
 static int __maybe_unused
-- 
2.30.2

