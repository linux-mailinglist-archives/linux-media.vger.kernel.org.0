Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B978272C07
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 18:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728442AbgIUQ0m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 12:26:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:53234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726795AbgIUQ0l (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 12:26:41 -0400
Received: from localhost.localdomain (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A2ABA238D6;
        Mon, 21 Sep 2020 16:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600705601;
        bh=gC+DNSToyQJ3fKm3T67rR1nazhYlUpk4FDv6x9LB+zU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RkNeHKUyPU6Me0yH8Oukc9vEK2k+aoehoZnss5N3C0NVQNlR3XfJnVQGHo1q8VMVu
         mw02kmaiBrD7pAPiihB55J8KsVNooG7DHtz8BuHqZHX2ZkP4IaUQZdB3MyksyeWDcA
         y4Zbq2RVVomQghvjooZVH/dW+GGcFj+oJqUcYF+4=
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
Subject: [PATCH 20/25] media: i2c: ov5675: simplify getting state container
Date:   Mon, 21 Sep 2020 18:23:37 +0200
Message-Id: <20200921162342.7348-20-krzk@kernel.org>
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
 drivers/media/i2c/ov5675.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
index 9540ce8918f0..5e35808037ad 100644
--- a/drivers/media/i2c/ov5675.c
+++ b/drivers/media/i2c/ov5675.c
@@ -889,8 +889,7 @@ static int ov5675_set_stream(struct v4l2_subdev *sd, int enable)
 
 static int __maybe_unused ov5675_suspend(struct device *dev)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov5675 *ov5675 = to_ov5675(sd);
 
 	mutex_lock(&ov5675->mutex);
@@ -904,8 +903,7 @@ static int __maybe_unused ov5675_suspend(struct device *dev)
 
 static int __maybe_unused ov5675_resume(struct device *dev)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct ov5675 *ov5675 = to_ov5675(sd);
 	int ret;
 
-- 
2.17.1

