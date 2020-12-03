Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 250F72CD43A
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 12:05:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388823AbgLCLEO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 06:04:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388805AbgLCLEO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 06:04:14 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A14FC08E862
        for <linux-media@vger.kernel.org>; Thu,  3 Dec 2020 03:02:55 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kkmNt-0002L0-4c; Thu, 03 Dec 2020 12:02:53 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kkmNs-00CKi8-0r; Thu, 03 Dec 2020 12:02:48 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de, hverkuil-cisco@xs4all.nl,
        mchehab@kernel.org, Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu,  3 Dec 2020 12:01:02 +0100
Message-Id: <20201203110106.2939463-15-m.tretter@pengutronix.de>
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
Subject: [PATCH 14/18] media: allegro: add helper to get entropy mode
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver only supports CAVLC for H.264, but HEVC only uses CABAC. As
the driver has to explicitly tell the MCU to use CABAC for HEVC, add a
helper function to get the entropy mode.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/allegro-dvt/allegro-core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 004df6ea2430..016c31655467 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -944,6 +944,14 @@ static s16 get_qp_delta(int minuend, int subtrahend)
 		return minuend - subtrahend;
 }
 
+static u32 allegro_channel_get_entropy_mode(struct allegro_channel *channel)
+{
+#define ALLEGRO_ENTROPY_MODE_CAVLC 0
+#define ALLEGRO_ENTROPY_MODE_CABAC 1
+
+	return ALLEGRO_ENTROPY_MODE_CAVLC;
+}
+
 static int fill_create_channel_param(struct allegro_channel *channel,
 				     struct create_channel_param *param)
 {
@@ -974,6 +982,7 @@ static int fill_create_channel_param(struct allegro_channel *channel,
 	param->temporal_mvp_enable = channel->temporal_mvp_enable;
 
 	param->dbf_ovr_en = channel->dbf_ovr_en;
+	param->entropy_mode = allegro_channel_get_entropy_mode(channel);
 	param->rdo_cost_mode = 1;
 	param->custom_lda = 1;
 	param->lf = 1;
-- 
2.20.1

