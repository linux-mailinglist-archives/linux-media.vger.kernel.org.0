Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 369872CD438
	for <lists+linux-media@lfdr.de>; Thu,  3 Dec 2020 12:05:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388818AbgLCLEO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Dec 2020 06:04:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388809AbgLCLEO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Dec 2020 06:04:14 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6041AC08E863
        for <linux-media@vger.kernel.org>; Thu,  3 Dec 2020 03:02:55 -0800 (PST)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kkmNt-0002L2-6y; Thu, 03 Dec 2020 12:02:53 +0100
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
        id 1kkmNs-00CKiE-1s; Thu, 03 Dec 2020 12:02:48 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     kernel@pengutronix.de, hverkuil-cisco@xs4all.nl,
        mchehab@kernel.org, Michael Tretter <m.tretter@pengutronix.de>
Date:   Thu,  3 Dec 2020 12:01:04 +0100
Message-Id: <20201203110106.2939463-17-m.tretter@pengutronix.de>
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
Subject: [PATCH 16/18] media: allegro: increase offset in CAPTURE buffer
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The HEVC Non-VCL NAL units require more space than the H.264 Non-VCL NAL
units. Therefore, the driver needs to reserve more space in front of the
actual coded data that is written by the hardware codec.

Increase the offset that shall be used by the hardware codec from 64
bytes to 128 bytes which is as arbitrary as before.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/allegro-dvt/allegro-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 6a8196735eaf..4eacad3d53cb 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -90,7 +90,7 @@
  * because it needs to write SPS/PPS NAL units. The encoder writes the actual
  * frame data after the offset.
  */
-#define ENCODER_STREAM_OFFSET SZ_64
+#define ENCODER_STREAM_OFFSET SZ_128
 
 #define SIZE_MACROBLOCK 16
 
-- 
2.20.1

