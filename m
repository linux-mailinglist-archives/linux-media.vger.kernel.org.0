Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 234839AFBF
	for <lists+linux-media@lfdr.de>; Fri, 23 Aug 2019 14:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394816AbfHWMiJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 23 Aug 2019 08:38:09 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:40794 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394791AbfHWMhv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 23 Aug 2019 08:37:51 -0400
Received: by mail-ed1-f65.google.com with SMTP id h8so13260446edv.7;
        Fri, 23 Aug 2019 05:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G8GHc1gsebr19dOVRPy+WGuFpKv95AVuhTZoYxXuGp4=;
        b=N8Mw3bcE6Uz9tdbA+i9zC40nYruDHrRGaqv8SOa1ygE+nCesxhTotS7tSuBGgwIXSD
         nnl8la43zyHyb9J2zfULJYJHazU2Y1nHJht0r2QzveEEXquzjkuwi57WXeqGo6IUjiaq
         XQIXw2WeqgunQZxsQru5cI+R78dHIcfB36MGlJIM6kBd/ZzID6ena0aBLSsBWJ4WJX3y
         POvHrs6Q3s94wHS5w/AjMZuT8Ax9IlV1o+Oa49hlAQKbpix16u7727hOCVT56LFkh1K7
         Xnkyzwrw2kN8Sg3C/3K+/PJGst94i9Sk7Td2I6CIuje3H1CwhShcGUDO92cWrZBrZeI0
         q5Kg==
X-Gm-Message-State: APjAAAVttimHxzZ1KBo9EhDTMQMSkMm7ykww/8Dqph9SJ7459L0jthVQ
        vEMzDhPBPprYY7QPKaGZeKg=
X-Google-Smtp-Source: APXvYqxJl9WqCxbu3k+xan6VXrMOyl0gKP0Kc5twQ2SoQfORvdIdUGEqxjk2XVWSKGEj1FV6aimmQQ==
X-Received: by 2002:a50:e68d:: with SMTP id z13mr4182976edm.142.1566563869950;
        Fri, 23 Aug 2019 05:37:49 -0700 (PDT)
Received: from neopili.qtec.com (cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id 9sm389687ejw.63.2019.08.23.05.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2019 05:37:48 -0700 (PDT)
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     Ricardo Ribalda Delgado <ribalda@kernel.org>
Subject: [PATCH v3 7/7] imx214: Use v4l2_ctrl_new_area helper
Date:   Fri, 23 Aug 2019 14:37:37 +0200
Message-Id: <20190823123737.7774-7-ribalda@kernel.org>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190823123737.7774-1-ribalda@kernel.org>
References: <20190823123737.7774-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Instead of creating manually the V4L2_CID_UNIT_CELL_SIZE control, lets
use the helper.

Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
---
 drivers/media/i2c/imx214.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
index cc0a013ba7da..625617d4c81a 100644
--- a/drivers/media/i2c/imx214.c
+++ b/drivers/media/i2c/imx214.c
@@ -942,26 +942,6 @@ static int __maybe_unused imx214_resume(struct device *dev)
 	return ret;
 }
 
-static void unit_size_init(const struct v4l2_ctrl *ctrl, u32 idx,
-		     union v4l2_ctrl_ptr ptr)
-{
-	ptr.p_area->width = 1120;
-	ptr.p_area->height = 1120;
-}
-
-static const struct v4l2_ctrl_type_ops unit_size_ops = {
-	.init = unit_size_init,
-};
-
-static struct v4l2_ctrl *new_unit_size_ctrl(struct v4l2_ctrl_handler *handler)
-{
-	static struct v4l2_ctrl_config ctrl = {
-		.id = V4L2_CID_UNIT_CELL_SIZE,
-		.type_ops = &unit_size_ops,
-	};
-
-	return v4l2_ctrl_new_custom(handler, &ctrl, NULL);
-}
 static int imx214_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
@@ -969,6 +949,10 @@ static int imx214_probe(struct i2c_client *client)
 	static const s64 link_freq[] = {
 		IMX214_DEFAULT_LINK_FREQ,
 	};
+	struct v4l2_area unit_size = {
+		.width = 1120,
+		.height = 1120,
+	};
 	int ret;
 
 	ret = imx214_parse_fwnode(dev);
@@ -1050,7 +1034,10 @@ static int imx214_probe(struct i2c_client *client)
 					     V4L2_CID_EXPOSURE,
 					     0, 3184, 1, 0x0c70);
 
-	imx214->unit_size = new_unit_size_ctrl(&imx214->ctrls);
+	imx214->unit_size = v4l2_ctrl_new_area(&imx214->ctrls,
+					       &imx214_ctrl_ops,
+					       V4L2_CID_UNIT_CELL_SIZE,
+					       &unit_size);
 
 	ret = imx214->ctrls.error;
 	if (ret) {
-- 
2.23.0.rc1

