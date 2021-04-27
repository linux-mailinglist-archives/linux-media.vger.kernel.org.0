Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 900BF36C3AF
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238417AbhD0K3R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:29:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:48192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237565AbhD0K2Y (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF13D61439;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=nHZL/8LfEY59F+jSTZXbI5IsJhAvjS0xN6pbKcv/Zf0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=K42/u+DsYc+oSSWW35cPcwyLr4uf8gaxJ/ZMErBo18r/4knuXkBmHz1yww2kFTKfA
         ig8N4evRJ4fKth3CydMKLxQ+hBAX3Klfs8agEXbChpHp74qnPxR14dA8ZjtyJC6NPl
         joVfiqiRXV/vPk8nQg/6UCKLMn96n+SQpuxnsnY5phJXWCR+SZaWH0OI1d7G5SlGDW
         IpmZ2gJbMGqbO4RxQhxqOYBR3iK8jWEaCfo0FLbeQtNRMuoXXYUR21pd39JCZx0/Tq
         TSnlHjnh8heEO+ie6BbUsrqfrlKzz2jzBsrgZQyPWHi1Kinvoc7rwZ8EBiO3F/arOJ
         3RMuoC45+JMrA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvy-000o1y-5Q; Tue, 27 Apr 2021 12:27:14 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Chuhong Yuan <hslester96@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Zhang Xiaoxu <zhangxiaoxu5@huawei.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 57/79] media: i2c: tvp5150: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:47 +0200
Message-Id: <9e2fb36b577c9693f3c980cb26949c60cc3b8be8.1619519080.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619519080.git.mchehab+huawei@kernel.org>
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/i2c/tvp5150.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/tvp5150.c b/drivers/media/i2c/tvp5150.c
index e26e3f544054..374a9da75e4d 100644
--- a/drivers/media/i2c/tvp5150.c
+++ b/drivers/media/i2c/tvp5150.c
@@ -1448,11 +1448,9 @@ static int tvp5150_s_stream(struct v4l2_subdev *sd, int enable)
 	       TVP5150_MISC_CTL_CLOCK_OE;
 
 	if (enable) {
-		ret = pm_runtime_get_sync(sd->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(sd->dev);
+		ret = pm_runtime_resume_and_get(sd->dev);
+		if (ret < 0)
 			return ret;
-		}
 
 		tvp5150_enable(sd);
 
@@ -1675,15 +1673,7 @@ static int tvp5150_registered(struct v4l2_subdev *sd)
 
 static int tvp5150_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
 {
-	int ret;
-
-	ret = pm_runtime_get_sync(sd->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(sd->dev);
-		return ret;
-	}
-
-	return 0;
+	return pm_runtime_resume_and_get(sd->dev);
 }
 
 static int tvp5150_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
-- 
2.30.2

