Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13D532CD43C
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 12:05:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388848AbgLCLEQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 06:04:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388791AbgLCLEN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 06:04:13 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4C76C08E85F
        for <linux-media@vger.kernel.org>; Thu,  3 Dec 2020 03:02:54 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kkmNt-0002Kt-5I; Thu, 03 Dec 2020 12:02:52 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kkmNr-00CKhn-TF; Thu, 03 Dec 2020 12:02:47 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de, hverkuil-cisco@xs4all.nl,
        mchehab@kernel.org, Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu,  3 Dec 2020 12:00:55 +0100
Message-Id: <20201203110106.2939463-8-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201203110106.2939463-1-m.tretter@pengutronix.de>
References: <20201203110106.2939463-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
        metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=4.0 tests=AWL,BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_SOFTFAIL,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.2
Subject: [PATCH 07/18] media: allegro: fix log2_max_poc in firmware 2019.1
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The log2_max_poc field is used to set log2_max_pic_order_cnt_lsb_minus4
for the coded stream. It has an allowed range of 0 to 12.

param contains the value without the minus4, but since firmware
version 2019.1, the value has to be log2_max_pic_order_cnt_lsb - 1,
presumably to fit the maximum value of 16 into a 4 bit field.

The driver does not support firmware version 2019.1. Thus, change the
behaviour starting from firmware version 2019.2.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/allegro-dvt/allegro-mail.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.c b/drivers/media/platform/allegro-dvt/allegro-mail.c
index 993e16f06305..5dbc1c029020 100644
--- a/drivers/media/platform/allegro-dvt/allegro-mail.c
+++ b/drivers/media/platform/allegro-dvt/allegro-mail.c
@@ -109,8 +109,11 @@ allegro_encode_config_blob(u32 *dst, struct create_channel_param *param)
 
 	val = 0;
 	val |= param->temporal_mvp_enable ? BIT(20) : 0;
-	val |= FIELD_PREP(GENMASK(7, 4), param->log2_max_frame_num) |
-	       FIELD_PREP(GENMASK(3, 0), param->log2_max_poc);
+	val |= FIELD_PREP(GENMASK(7, 4), param->log2_max_frame_num);
+	if (version >= MCU_MSG_VERSION_2019_2)
+		val |= FIELD_PREP(GENMASK(3, 0), param->log2_max_poc - 1);
+	else
+		val |= FIELD_PREP(GENMASK(3, 0), param->log2_max_poc);
 	dst[i++] = val;
 
 	val = 0;
-- 
2.20.1

