Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C08D62B858A
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 21:27:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727011AbgKRU11 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 15:27:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:48272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726397AbgKRU10 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 15:27:26 -0500
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A8CCB21D1A;
        Wed, 18 Nov 2020 20:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605731245;
        bh=zWUF7gy1Qf1dX62rn0FAOk2xbwwQdbfUgsxvI5Sklh4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KRcBF5IXReP3/8RuXXB2P1nmbuncdDahslf9q3PtUMZvVyuaGyBPH3++du6sEDCig
         FcLjaDA1LhvZWQAToMkV6ML4ahBHnI2zSrG5KIRTfv2br3sXrfavcZ+3H7l2mZ+rC+
         M9UGOh26klSuwqIgQ+HtcWU6ijd6XYan7RTdlUIc=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v6 3/4] media: i2c: imx258: simplify getting state container
Date:   Wed, 18 Nov 2020 21:27:14 +0100
Message-Id: <20201118202715.6692-3-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201118202715.6692-1-krzk@kernel.org>
References: <20201118202715.6692-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Changes since v3:
1. None

Changes since v2:
1. New patch
---
 drivers/media/i2c/imx258.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
index ba7f29622974..505981e02cff 100644
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
2.25.1

