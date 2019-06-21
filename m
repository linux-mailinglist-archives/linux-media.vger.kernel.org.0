Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECBAA4EDD8
	for <lists+linux-media@lfdr.de>; Fri, 21 Jun 2019 19:30:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726043AbfFURaH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Jun 2019 13:30:07 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:37388 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725992AbfFURaG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Jun 2019 13:30:06 -0400
X-Greylist: delayed 499 seconds by postgrey-1.27 at vger.kernel.org; Fri, 21 Jun 2019 13:30:05 EDT
Received: from localhost.localdomain (80-110-121-20.cgn.dynamic.surfer.at [80.110.121.20])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 57BE8C6647;
        Fri, 21 Jun 2019 17:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1561137705; bh=LUu3Vfg+EG2c+fNXyI1ZyzCVTnhx29KZ2Jnx2l94c8U=;
        h=From:To:Cc:Subject:Date;
        b=xYV18237cJrWCIP991uu7xsMyj9RWWWLg8yt8kn68sxYjPLi31dHGjxLh3ZuceQ2o
         h4arblbV4QFWVKDXu41Q1oJTO7VwBYb3uXZXjKGs9HCo6/DF9PsbrRk+0cgS+HQlSU
         xV9Z/Sx7D1Iyhw2wMUBphMWUelkXyykrbnlp3QHo=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-media@vger.kernel.org
Cc:     ~martijnbraam/pmos-upstream@lists.sr.ht,
        Luca Weiss <luca@z3ntu.xyz>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: ov5640: Add support for flash and lens devices
Date:   Fri, 21 Jun 2019 19:20:25 +0200
Message-Id: <20190621172025.27881-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Parse async sub-devices related to the sensor by switching the async
sub-device registration function.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 drivers/media/i2c/ov5640.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 82d4ce93312c..0c6f890bc708 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -3054,7 +3054,7 @@ static int ov5640_probe(struct i2c_client *client,
 	if (ret)
 		goto entity_cleanup;
 
-	ret = v4l2_async_register_subdev(&sensor->sd);
+	ret = v4l2_async_register_subdev_sensor_common(&sensor->sd);
 	if (ret)
 		goto free_ctrls;
 
-- 
2.22.0

