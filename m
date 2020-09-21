Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D80A272BAB
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 18:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728127AbgIUQUy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 12:20:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:47850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727816AbgIUQUv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 12:20:51 -0400
Received: from localhost.localdomain (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D24142076B;
        Mon, 21 Sep 2020 16:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600705250;
        bh=/vA1RFNyp2hsUO0LFOziMlYtSCqY9ooZb/CdjtXn6X0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=LZ78T2lpYh10u8u+3FeyXhjE1ob9RJwjVj1oCMOrq4AfPkQjejAlImzHAFE74n3IU
         6SWf+X9+HHMWTp59vE6oaui1b8mcXsCzgcw3PB43uGhchFSpb7C/JIOb7A1t+W+IxK
         ODViLKCQm2e+nzXhMp5Y9k5+HhOMdD+m0vPCP24w=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] media: i2c: imx258: simplify getting state container
Date:   Mon, 21 Sep 2020 18:20:19 +0200
Message-Id: <20200921162020.2748-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921162020.2748-1-krzk@kernel.org>
References: <20200921162020.2748-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The pointer to 'struct v4l2_subdev' is stored in drvdata via
v4l2_i2c_subdev_init() so there is no point of a dance like:

struct i2c_client *client = to_i2c_client(struct device *dev)
struct v4l2_subdev *sd = i2c_get_clientdata(client);

This allows to remove local variable 'client' and few pointer
dereferences.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v2:
1. New patch
---
 drivers/media/i2c/imx258.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index ed79bfb4c991..ae183b0dbba9 100644
--- a/drivers/media/i2c/imx258.c
+++ b/drivers/media/i2c/imx258.c
@@ -1018,8 +1018,7 @@ static int imx258_set_stream(struct v4l2_subdev *sd, int enable)
 
 static int __maybe_unused imx258_suspend(struct device *dev)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct imx258 *imx258 = to_imx258(sd);
 
 	if (imx258->streaming)
@@ -1030,8 +1029,7 @@ static int __maybe_unused imx258_suspend(struct device *dev)
 
 static int __maybe_unused imx258_resume(struct device *dev)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct imx258 *imx258 = to_imx258(sd);
 	int ret;
 
-- 
2.17.1

