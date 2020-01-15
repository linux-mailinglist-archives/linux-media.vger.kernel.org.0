Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB88213CD10
	for <lists+linux-media@lfdr.de>; Wed, 15 Jan 2020 20:27:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729027AbgAOT1g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jan 2020 14:27:36 -0500
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:31946 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725999AbgAOT1g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jan 2020 14:27:36 -0500
X-Halon-ID: 128a8464-37cd-11ea-a00b-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p54ac5d7b.dip0.t-ipconnect.de [84.172.93.123])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 128a8464-37cd-11ea-a00b-005056917a89;
        Wed, 15 Jan 2020 20:27:34 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Lars-Peter Clausen <lars@metafoo.de>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] adv7180: Add init_cfg pad operation
Date:   Wed, 15 Jan 2020 20:27:19 +0100
Message-Id: <20200115192719.3276138-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a init_cfg pad operation so that configurations allocated with
v4l2_subdev_alloc_pad_config() are initialized.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/i2c/adv7180.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 6528e2343fc89f43..00159daa6fcd6516 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -749,6 +749,17 @@ static int adv7180_set_pad_format(struct v4l2_subdev *sd,
 	return ret;
 }
 
+static int adv7180_init_cfg(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_pad_config *cfg)
+{
+	struct v4l2_subdev_format fmt = {
+		.which = cfg ? V4L2_SUBDEV_FORMAT_TRY
+			: V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+
+	return adv7180_set_pad_format(sd, cfg, &fmt);
+}
+
 static int adv7180_g_mbus_config(struct v4l2_subdev *sd,
 				 struct v4l2_mbus_config *cfg)
 {
@@ -854,6 +865,7 @@ static const struct v4l2_subdev_core_ops adv7180_core_ops = {
 };
 
 static const struct v4l2_subdev_pad_ops adv7180_pad_ops = {
+	.init_cfg = adv7180_init_cfg,
 	.enum_mbus_code = adv7180_enum_mbus_code,
 	.set_fmt = adv7180_set_pad_format,
 	.get_fmt = adv7180_get_pad_format,
-- 
2.24.1

