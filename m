Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB322403A4B
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 15:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244963AbhIHNFL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 09:05:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238232AbhIHNFH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Sep 2021 09:05:07 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C3F7C061796
        for <linux-media@vger.kernel.org>; Wed,  8 Sep 2021 06:03:57 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxF6-00053v-5r; Wed, 08 Sep 2021 15:03:56 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxF5-0004T9-Jp; Wed, 08 Sep 2021 15:03:55 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxF5-00DpIY-J7; Wed, 08 Sep 2021 15:03:55 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     kernel@pengutronix.de, m.tretter@pengutronix.de
Subject: [PATCH 3/7] media: allegro: correctly scale the bit rate in SPS
Date:   Wed,  8 Sep 2021 15:03:51 +0200
Message-Id: <20210908130355.3295403-4-m.tretter@pengutronix.de>
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

The bit rate in the SPS can be scaled by an exponent, which allows to
reduce the number of bits in the SPS in case of high bit rates.

The driver did not scale the bitrate, but used a scaling exponent of 0.
Fix this by properly calculating the scaling factor and writing the bit
rate as value and scaling factor into the SPS.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/allegro-dvt/allegro-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 8bcb40637c93..9cd903bab0ca 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -1558,8 +1558,9 @@ static ssize_t allegro_h264_write_sps(struct allegro_channel *channel,
 	sps->vui.nal_hrd_parameters_present_flag = 0;
 	sps->vui.vcl_hrd_parameters_present_flag = 1;
 	sps->vui.vcl_hrd_parameters.cpb_cnt_minus1 = 0;
-	sps->vui.vcl_hrd_parameters.bit_rate_scale = 0;
 	/* See Rec. ITU-T H.264 (04/2017) p. 410 E-53 */
+	sps->vui.vcl_hrd_parameters.bit_rate_scale =
+		ffs(channel->bitrate_peak) - 6;
 	sps->vui.vcl_hrd_parameters.bit_rate_value_minus1[0] =
 		channel->bitrate_peak / (1 << (6 + sps->vui.vcl_hrd_parameters.bit_rate_scale)) - 1;
 	/* See Rec. ITU-T H.264 (04/2017) p. 410 E-54 */
-- 
2.30.2

