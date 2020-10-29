Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68B7429F1D4
	for <lists+linux-media@lfdr.de>; Thu, 29 Oct 2020 17:43:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726848AbgJ2QnN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Oct 2020 12:43:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:51624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726449AbgJ2QnM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Oct 2020 12:43:12 -0400
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch [84.226.167.205])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 04B772151B;
        Thu, 29 Oct 2020 16:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603989791;
        bh=pinI95xWUP99dzSPLLOMtjZAp20HyaSQuf5bSlgypKs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=0gJbmqFXkrSakg8xtkvd6xch7tPo/UdXcAvlnOkbsW0vzS89ZcHRByv4xJzwQk5vV
         GXOIKvjceSZ6fBquCWF/Ee2vD32YSV6ModkPas9QVV4wfQCihPmMo7hqaQ0pa0+uzL
         uKG36oioclt1Yy7G7mtBBA0+YoI5sTK0Ia1iZNBw=
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
Subject: [RESEND PATCH 06/25] media: i2c: imx355: simplify getting state container
Date:   Thu, 29 Oct 2020 17:42:20 +0100
Message-Id: <20201029164239.84240-6-krzk@kernel.org>
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
 drivers/media/i2c/imx355.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index bed293b60e50..51245e71b411 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1480,8 +1480,7 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 
 static int __maybe_unused imx355_suspend(struct device *dev)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct imx355 *imx355 = to_imx355(sd);
 
 	if (imx355->streaming)
@@ -1492,8 +1491,7 @@ static int __maybe_unused imx355_suspend(struct device *dev)
 
 static int __maybe_unused imx355_resume(struct device *dev)
 {
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *sd = i2c_get_clientdata(client);
+	struct v4l2_subdev *sd = dev_get_drvdata(dev);
 	struct imx355 *imx355 = to_imx355(sd);
 	int ret;
 
-- 
2.25.1

