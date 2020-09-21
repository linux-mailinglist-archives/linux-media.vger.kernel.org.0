Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B06D8272C0D
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 18:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728466AbgIUQ06 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 12:26:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:53526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728463AbgIUQ04 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 12:26:56 -0400
Received: from localhost.localdomain (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7D6082395C;
        Mon, 21 Sep 2020 16:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600705616;
        bh=LRrGQUjl6w3K+fkBWfMFiWcP2rlhtBHPPBo1aF4/R3k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZY1cKWBAUKJUjRDo54Bkrzh1Hmv8Q4X29JCagbu6Z0tq2mcb2vvMx5MPNmSH9pUi+
         TTwN+BpfuRo7e4twGdoWSW7FIWkJVs6JCcSMJ/t1Dzb76NP1pxzD5JJq+V4E+TqKFE
         p57FsWM2BSf8LNkqtJnMWVh9NH/pfG1nS8PzTfDQ=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Shawn Tu <shawnx.tu@intel.com>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Wenyou Yang <wenyou.yang@microchip.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Marco Felsch <m.felsch@pengutronix.de>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 22/25] media: i2c: ov7740: simplify getting state container
Date:   Mon, 21 Sep 2020 18:23:39 +0200
Message-Id: <20200921162342.7348-22-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921162342.7348-1-krzk@kernel.org>
References: <20200921162342.7348-1-krzk@kernel.org>
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
 drivers/media/i2c/ov7740.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
index 5832461c032d..47a9003d29d6 100644
--- a/drivers/media/i2c/ov7740.c
+++ b/drivers/media/i2c/ov7740.c
@@ -1176,8 +1176,7 @@ static int ov7740_remove(struct i2c_client *client)
 
 static int __maybe_unused ov7740_runtime_suspend(struct device *dev)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov7740 *ov7740 = container_of(sd, struct ov7740, subdev);
 
 	ov7740_set_power(ov7740, 0);
@@ -1187,8 +1186,7 @@ static int __maybe_unused ov7740_runtime_suspend(struct device *dev)
 
 static int __maybe_unused ov7740_runtime_resume(struct device *dev)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov7740 *ov7740 = container_of(sd, struct ov7740, subdev);
 
 	return ov7740_set_power(ov7740, 1);
-- 
2.17.1

