Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4D7624686B
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 16:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729048AbgHQOcK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 10:32:10 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:39663 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728989AbgHQOcJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 10:32:09 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 530EDC000A;
        Mon, 17 Aug 2020 14:32:06 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        sakari.ailus@iki.fi, hverkuil@xs4all.nl, hyunk@xilinx.com,
        manivannan.sadhasivam@linaro.org
Subject: [PATCH 1/4] media: i2c: max9286: Initialize try formats
Date:   Mon, 17 Aug 2020 16:35:37 +0200
Message-Id: <20200817143540.247340-2-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200817143540.247340-1-jacopo+renesas@jmondi.org>
References: <20200817143540.247340-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Initialize try formats at device node open time by querying the
format from the remote subdevices instead of hard-coding it.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/media/i2c/max9286.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 47f280518fdb..7c292f2e2704 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -794,12 +794,29 @@ static void max9286_init_format(struct v4l2_mbus_framefmt *fmt)

 static int max9286_open(struct v4l2_subdev *subdev, struct v4l2_subdev_fh *fh)
 {
+	struct max9286_priv *priv = sd_to_max9286(subdev);
+	struct device *dev = &priv->client->dev;
 	struct v4l2_mbus_framefmt *format;
-	unsigned int i;
+	struct max9286_source *source;
+
+	for_each_source(priv, source) {
+		struct v4l2_subdev_pad_config remote_config = {};
+		unsigned int i = to_index(priv, source);
+		struct v4l2_subdev_format remote_fmt = {
+			.which = V4L2_SUBDEV_FORMAT_TRY,
+			.pad = 0,
+		};
+		int ret;

-	for (i = 0; i < MAX9286_N_SINKS; i++) {
 		format = v4l2_subdev_get_try_format(subdev, fh->pad, i);
-		max9286_init_format(format);
+		ret = v4l2_subdev_call(source->sd, pad, get_fmt, &remote_config,
+				       &remote_fmt);
+		if (ret) {
+			dev_err(dev, "Unable get format on source %u\n", i);
+			return ret;
+		}
+
+		*format = remote_fmt.format;
 	}

 	return 0;
--
2.27.0

