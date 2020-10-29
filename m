Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B03E729F1E4
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 17:44:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727363AbgJ2Qno (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 12:43:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:52230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727293AbgJ2Qnm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 12:43:42 -0400
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D296B206F4;
        Thu, 29 Oct 2020 16:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603989821;
        bh=GSDOjTR7peYfwSlpauy3HGAZKOaKNwfpUcNoAOlkj1I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SLWaCB4DlMjUuHn0jZSdm8YgVo6GXkfT/3mZ7STvnJd670wZPkeCoDesbsk3lE9vn
         gcuorfquBMhdOag0phYBHiQkz49EiPPLUvdBTvFZs3UrsqrkEt6YLb6Ot2/GLiX3ch
         FwdkHdDLk7mMiVx8gas1pBYtqL2Vh9MF6bnbs+3o=
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
Subject: [RESEND PATCH 13/25] media: i2c: et8ek8: simplify getting state container
Date:   Thu, 29 Oct 2020 17:42:27 +0100
Message-Id: <20201029164239.84240-13-krzk@kernel.org>
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
 drivers/media/i2c/et8ek8/et8ek8_driver.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2c/et8ek8/et8ek8_driver.c
index 256acf73d5ea..122af761c8e3 100644
--- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
+++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
@@ -1237,7 +1237,7 @@ static ssize_t
 et8ek8_priv_mem_read(struct device *dev, struct device_attribute *attr,
 		     char *buf)
 {
-	struct v4l2_subdev *subdev = i2c_get_clientdata(to_i2c_client(dev));
+	struct v4l2_subdev *subdev = dev_get_drvdata(dev);
 	struct et8ek8_sensor *sensor = to_et8ek8_sensor(subdev);
 
 #if PAGE_SIZE < ET8EK8_PRIV_MEM_SIZE
@@ -1374,8 +1374,7 @@ static const struct v4l2_subdev_internal_ops et8ek8_internal_ops = {
  */
 static int __maybe_unused et8ek8_suspend(struct device *dev)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
+	struct v4l2_subdev *subdev = dev_get_drvdata(dev);
 	struct et8ek8_sensor *sensor = to_et8ek8_sensor(subdev);
 
 	if (!sensor->power_count)
@@ -1386,8 +1385,7 @@ static int __maybe_unused et8ek8_suspend(struct device *dev)
 
 static int __maybe_unused et8ek8_resume(struct device *dev)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
+	struct v4l2_subdev *subdev = dev_get_drvdata(dev);
 	struct et8ek8_sensor *sensor = to_et8ek8_sensor(subdev);
 
 	if (!sensor->power_count)
-- 
2.25.1

