Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 638491F9862
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 15:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730313AbgFON0y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 09:26:54 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:56480 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730058AbgFON0y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 09:26:54 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 2DE613C04C1;
        Mon, 15 Jun 2020 15:26:52 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 09bRN0gTcdFX; Mon, 15 Jun 2020 15:26:47 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 408223C00BA;
        Mon, 15 Jun 2020 15:26:47 +0200 (CEST)
Received: from vmlxhi-110.adit-jv.com (10.72.93.196) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 15 Jun
 2020 15:26:46 +0200
From:   Ramzi BEN MEFTAH <rbmeftah@de.adit-jv.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Michael Rodin <mrodin@de.adit-jv.com>, <efriedrich@de.adit-jv.com>,
        <erosca@de.adit-jv.com>
Subject: [PATCH] media: i2c: adv748x: add enuminput control to adv748x hdmi subdev
Date:   Mon, 15 Jun 2020 15:26:39 +0200
Message-ID: <1592227599-88545-1-git-send-email-rbmeftah@de.adit-jv.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.72.93.196]
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds support for enuminput control to the adv748x hdmi subdev.
This will allow userspace for example to query input hdmi signal status.


Signed-off-by: Ramzi BEN MEFTAH <rbmeftah@de.adit-jv.com>
---
 drivers/media/i2c/adv748x/adv748x-hdmi.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-hdmi.c b/drivers/media/i2c/adv748x/adv748x-hdmi.c
index c557f8f..2d748b2 100644
--- a/drivers/media/i2c/adv748x/adv748x-hdmi.c
+++ b/drivers/media/i2c/adv748x/adv748x-hdmi.c
@@ -350,6 +350,22 @@ static int adv748x_hdmi_g_input_status(struct v4l2_subdev *sd, u32 *status)
 	return 0;
 }
 
+static int adv748x_hdmi_enuminput(struct v4l2_subdev *sd,
+				 struct v4l2_input *input)
+{
+	if (input->index != 0)
+		return -EINVAL;
+
+	input->type = V4L2_INPUT_TYPE_CAMERA;
+	input->capabilities = V4L2_IN_CAP_DV_TIMINGS;
+	input->status = V4L2_IN_ST_NO_SIGNAL;
+	input->std = V4L2_STD_UNKNOWN;
+
+	snprintf(input->name, sizeof(input->name), "%s", sd->name);
+
+	return adv748x_hdmi_g_input_status(sd, &input->status);
+}
+
 static int adv748x_hdmi_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct adv748x_hdmi *hdmi = adv748x_sd_to_hdmi(sd);
@@ -386,6 +402,7 @@ static const struct v4l2_subdev_video_ops adv748x_video_ops_hdmi = {
 	.g_dv_timings = adv748x_hdmi_g_dv_timings,
 	.query_dv_timings = adv748x_hdmi_query_dv_timings,
 	.g_input_status = adv748x_hdmi_g_input_status,
+	.enuminput = adv748x_hdmi_enuminput,
 	.s_stream = adv748x_hdmi_s_stream,
 	.g_pixelaspect = adv748x_hdmi_g_pixelaspect,
 };
-- 
2.7.4

