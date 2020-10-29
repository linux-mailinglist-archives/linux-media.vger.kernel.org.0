Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C09329F1D8
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 17:43:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726790AbgJ2QnW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 12:43:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:51824 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725805AbgJ2QnU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 12:43:20 -0400
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3DC0321548;
        Thu, 29 Oct 2020 16:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603989799;
        bh=5bLbINpg3KaAkH1MQB5b16lyTj6CxApVEoBZlrf1etw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O5lr8OfrssYk8MvUkl77C8xecQGo+J9jLCmny0QKZwbesuTwhGkocnHTQTZJmwDMg
         1M7LG4IeggVKG+5KvjJNwbG7AymwchDA6/DfL3E1S9PBosuv81QW7YUAZFb+1Uc9H2
         pL1L6a282t6CLVbIPFGpjrxMDAfv+K6nW53eQQiY=
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
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RESEND PATCH 08/25] media: i2c: ad5820: simplify getting state container
Date:   Thu, 29 Oct 2020 17:42:22 +0100
Message-Id: <20201029164239.84240-8-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201029164239.84240-1-krzk@kernel.org>
References: <20201029164239.84240-1-krzk@kernel.org>
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
 drivers/media/i2c/ad5820.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ad5820.c b/drivers/media/i2c/ad5820.c
index 19c74db0649f..2958a4694461 100644
--- a/drivers/media/i2c/ad5820.c
+++ b/drivers/media/i2c/ad5820.c
@@ -270,8 +270,7 @@ static const struct v4l2_subdev_internal_ops ad5820_internal_ops = {
  */
 static int __maybe_unused ad5820_suspend(struct device *dev)
 {
-	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
-	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
+	struct v4l2_subdev *subdev = dev_get_drvdata(dev);
 	struct ad5820_device *coil = to_ad5820_device(subdev);
 
 	if (!coil->power_count)
@@ -282,8 +281,7 @@ static int __maybe_unused ad5820_suspend(struct device *dev)
 
 static int __maybe_unused ad5820_resume(struct device *dev)
 {
-	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
-	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
+	struct v4l2_subdev *subdev = dev_get_drvdata(dev);
 	struct ad5820_device *coil = to_ad5820_device(subdev);
 
 	if (!coil->power_count)
-- 
2.25.1

