Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 128E8403A45
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 15:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348701AbhIHNFO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 09:05:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240738AbhIHNFH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Sep 2021 09:05:07 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BE4DC0613D9
        for <linux-media@vger.kernel.org>; Wed,  8 Sep 2021 06:03:57 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxF6-00053u-3n; Wed, 08 Sep 2021 15:03:56 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxF5-0004T6-JP; Wed, 08 Sep 2021 15:03:55 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxF5-00DpIV-Id; Wed, 08 Sep 2021 15:03:55 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     kernel@pengutronix.de, m.tretter@pengutronix.de
Subject: [PATCH 2/7] media: allegro: remove external QP table
Date:   Wed,  8 Sep 2021 15:03:50 +0200
Message-Id: <20210908130355.3295403-3-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210908130355.3295403-1-m.tretter@pengutronix.de>
References: <20210908130355.3295403-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The VCU allows to specify the QP per frame and coding unit. A buffer
that specifies the QP is passed via the ep2 field in the ENCODE_FRAME
message.

The driver currently does not support the external QP table. Simplify
the driver by not setting the ep2 fields at all.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/allegro-dvt/allegro-core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 887b492e4ad1..8bcb40637c93 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -1326,8 +1326,6 @@ static int allegro_mcu_send_encode_frame(struct allegro_dev *dev,
 	msg.src_y = to_codec_addr(dev, src_y);
 	msg.src_uv = to_codec_addr(dev, src_uv);
 	msg.stride = channel->stride;
-	msg.ep2 = 0x0;
-	msg.ep2_v = to_mcu_addr(dev, msg.ep2);
 
 	allegro_mbox_send(dev->mbox_command, &msg);
 
-- 
2.30.2

