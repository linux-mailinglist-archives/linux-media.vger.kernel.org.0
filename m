Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98B6C321BE1
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 16:53:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbhBVPxP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 10:53:15 -0500
Received: from m12-14.163.com ([220.181.12.14]:60532 "EHLO m12-14.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230021AbhBVPxM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 10:53:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=7aAw3
        bhAwA44/S+acKCMTVXGqeCCRmDOFmyR7ez7aHQ=; b=HtM8FlOuUbc0KLltZUAD2
        HI6DZ9Zt0cp53c/yCMcScduo9RqtrlDr9LP+eHAbcTajTaZmlps2xm8y4db4QY7O
        4qR0JCgHwnXXdkOPV+//+IZj3Q50k43wGsKQPhce569QpGnAU87lgtzecKqxp4NP
        8jXh+rFR/vXYfKJIavg7eg=
Received: from COOL-20201210PM.ccdomain.com (unknown [218.94.48.178])
        by smtp10 (Coremail) with SMTP id DsCowABn_rTyrTNgmkw_mA--.30684S2;
        Mon, 22 Feb 2021 21:13:26 +0800 (CST)
From:   zuoqilin1@163.com
To:     rashanmu@gmail.com, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        zuoqilin <zuoqilin@yulong.com>
Subject: [PATCH] media/i2c: remove unneeded variable: "ret"
Date:   Mon, 22 Feb 2021 21:13:17 +0800
Message-Id: <20210222131317.1124-1-zuoqilin1@163.com>
X-Mailer: git-send-email 2.28.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsCowABn_rTyrTNgmkw_mA--.30684S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw1rGFy3KFy5AF1UtFyftFb_yoWfJFg_Cw
        sYgr97WFyqqF1Ykw1UCr1Fvryjvan7WF4kWFyY9FW3Kr1kuw1DZrs0yr17JF4kCr1vyFs0
        kwsY934furykGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU04GQDUUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 52xr1xpolqiqqrwthudrp/xtbBRRdBiVPAKIiY0wAAsi
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: zuoqilin <zuoqilin@yulong.com>

remove unneeded variable: "ret"

Signed-off-by: zuoqilin <zuoqilin@yulong.com>
---
 drivers/media/i2c/max2175.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/max2175.c b/drivers/media/i2c/max2175.c
index 661208c..bc46a09 100644
--- a/drivers/media/i2c/max2175.c
+++ b/drivers/media/i2c/max2175.c
@@ -1125,7 +1125,6 @@ static int max2175_g_frequency(struct v4l2_subdev *sd,
 			       struct v4l2_frequency *vf)
 {
 	struct max2175 *ctx = max2175_from_sd(sd);
-	int ret = 0;
 
 	if (vf->tuner != 0)
 		return -EINVAL;
@@ -1134,7 +1133,7 @@ static int max2175_g_frequency(struct v4l2_subdev *sd,
 	vf->type = V4L2_TUNER_RF;
 	vf->frequency = ctx->freq;
 
-	return ret;
+	return 0;
 }
 
 static int max2175_enum_freq_bands(struct v4l2_subdev *sd,
-- 
1.9.1


