Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADFEB1FAD4F
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 12:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728175AbgFPKAn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 06:00:43 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:36126 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726052AbgFPKAi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 06:00:38 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 38AF43C0579;
        Tue, 16 Jun 2020 12:00:36 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id wZY7WntlG0fp; Tue, 16 Jun 2020 12:00:31 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 029253C00BA;
        Tue, 16 Jun 2020 12:00:31 +0200 (CEST)
Received: from vmlxhi-110.adit-jv.com (10.72.93.196) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 16 Jun
 2020 12:00:30 +0200
From:   Ramzi BEN MEFTAH <rbmeftah@de.adit-jv.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <steve_longerbeam@mentor.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Arnd Bergmann <arnd@arndb.de>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Michael Rodin <mrodin@de.adit-jv.com>, <efriedrich@de.adit-jv.com>,
        <erosca@de.adit-jv.com>
Subject: [PATCH 2/3] media: i2c: adv748x-afe: Implement enum/get/set input
Date:   Tue, 16 Jun 2020 12:00:16 +0200
Message-ID: <1592301619-17631-2-git-send-email-rbmeftah@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592301619-17631-1-git-send-email-rbmeftah@de.adit-jv.com>
References: <1592301619-17631-1-git-send-email-rbmeftah@de.adit-jv.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.72.93.196]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Steve Longerbeam <steve_longerbeam@mentor.com>

The adv748x-afe sub-device driver does not support changing the
analog input, so enuminput returns only the status of a single
input at index=0. Likewise g_input returns only index 0, and s_input
returns -EINVAL if index is not 0, and otherwise does nothing.

Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
(cherry picked from ADIT v4.14 commit 8aadc35d3ae252a1eaed8506fbd1675911465bbd)
---
 drivers/media/i2c/adv748x/adv748x-afe.c | 42 ++++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-afe.c b/drivers/media/i2c/adv748x/adv748x-afe.c
index dbbb1e4..6b090f4 100644
--- a/drivers/media/i2c/adv748x/adv748x-afe.c
+++ b/drivers/media/i2c/adv748x/adv748x-afe.c
@@ -154,7 +154,7 @@ static void adv748x_afe_set_video_standard(struct adv748x_state *state,
 		   (sdpstd & 0xf) << ADV748X_SDP_VID_SEL_SHIFT);
 }
 
-static int adv748x_afe_s_input(struct adv748x_afe *afe, unsigned int input)
+static int adv748x_afe_set_input(struct adv748x_afe *afe, unsigned int input)
 {
 	struct adv748x_state *state = adv748x_afe_to_state(afe);
 
@@ -267,6 +267,39 @@ static int adv748x_afe_g_input_status(struct v4l2_subdev *sd, u32 *status)
 	return ret;
 }
 
+static int adv748x_afe_enuminput(struct v4l2_subdev *sd,
+				 struct v4l2_input *input)
+{
+	struct adv748x_afe *afe = adv748x_sd_to_afe(sd);
+
+	if (input->index != 0)
+		return -EINVAL;
+
+	input->type = V4L2_INPUT_TYPE_CAMERA;
+	input->capabilities = V4L2_IN_CAP_STD;
+	input->status = V4L2_IN_ST_NO_SIGNAL;
+	/* API says we must return all supported standards */
+	input->std = V4L2_STD_ALL;
+
+	snprintf(input->name, sizeof(input->name), "%s AIN%u",
+		 sd->name, afe->input);
+
+	return adv748x_afe_g_input_status(sd, &input->status);
+}
+
+static int adv748x_afe_g_input(struct v4l2_subdev *sd, u32 *index)
+{
+	*index = 0;
+	return 0;
+}
+
+static int adv748x_afe_s_input(struct v4l2_subdev *sd, u32 index)
+{
+	if (index != 0)
+		return -EINVAL;
+	return 0;
+}
+
 static int adv748x_afe_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct adv748x_afe *afe = adv748x_sd_to_afe(sd);
@@ -277,7 +310,7 @@ static int adv748x_afe_s_stream(struct v4l2_subdev *sd, int enable)
 	mutex_lock(&state->mutex);
 
 	if (enable) {
-		ret = adv748x_afe_s_input(afe, afe->input);
+		ret = adv748x_afe_set_input(afe, afe->input);
 		if (ret)
 			goto unlock;
 	}
@@ -306,6 +339,9 @@ static const struct v4l2_subdev_video_ops adv748x_afe_video_ops = {
 	.querystd = adv748x_afe_querystd,
 	.g_tvnorms = adv748x_afe_g_tvnorms,
 	.g_input_status = adv748x_afe_g_input_status,
+	.enuminput = adv748x_afe_enuminput,
+	.g_input = adv748x_afe_g_input,
+	.s_input = adv748x_afe_s_input,
 	.s_stream = adv748x_afe_s_stream,
 	.g_pixelaspect = adv748x_afe_g_pixelaspect,
 };
@@ -520,7 +556,7 @@ int adv748x_afe_init(struct adv748x_afe *afe)
 		}
 	}
 
-	adv748x_afe_s_input(afe, afe->input);
+	adv748x_afe_set_input(afe, afe->input);
 
 	adv_dbg(state, "AFE Default input set to %d\n", afe->input);
 
-- 
2.7.4

