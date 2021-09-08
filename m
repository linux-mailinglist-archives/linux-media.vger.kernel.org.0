Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 437C1403A43
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 15:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238237AbhIHNFK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 09:05:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243317AbhIHNFG (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Sep 2021 09:05:06 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BD4EC061757
        for <linux-media@vger.kernel.org>; Wed,  8 Sep 2021 06:03:57 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxF6-00053t-3U; Wed, 08 Sep 2021 15:03:56 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxF5-0004T3-Iv; Wed, 08 Sep 2021 15:03:55 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxF5-00DpIS-IA; Wed, 08 Sep 2021 15:03:55 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     kernel@pengutronix.de, m.tretter@pengutronix.de
Subject: [PATCH 1/7] media: allegro: fix row and column in response message
Date:   Wed,  8 Sep 2021 15:03:49 +0200
Message-Id: <20210908130355.3295403-2-m.tretter@pengutronix.de>
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

The fields for the number of rows and columns in the encode frame
response message are switched. This causes broken PPS, if the encoder
uses tiles for encoding and the number of rows and columns differ.

Write the fields of the response message into the correct fields of the
the internal data structure when parsing the response message.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/allegro-dvt/allegro-mail.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-mail.c b/drivers/media/platform/allegro-dvt/allegro-mail.c
index 7e08c5050f2e..fd26176598d3 100644
--- a/drivers/media/platform/allegro-dvt/allegro-mail.c
+++ b/drivers/media/platform/allegro-dvt/allegro-mail.c
@@ -429,8 +429,8 @@ allegro_dec_encode_frame(struct mcu_msg_encode_frame_response *msg, u32 *src)
 	msg->frame_tag_size = src[i++];
 	msg->stuffing = src[i++];
 	msg->filler = src[i++];
-	msg->num_column = FIELD_GET(GENMASK(31, 16), src[i]);
-	msg->num_row = FIELD_GET(GENMASK(15, 0), src[i++]);
+	msg->num_row = FIELD_GET(GENMASK(31, 16), src[i]);
+	msg->num_column = FIELD_GET(GENMASK(15, 0), src[i++]);
 	msg->num_ref_idx_l1 = FIELD_GET(GENMASK(31, 24), src[i]);
 	msg->num_ref_idx_l0 = FIELD_GET(GENMASK(23, 16), src[i]);
 	msg->qp = FIELD_GET(GENMASK(15, 0), src[i++]);
-- 
2.30.2

