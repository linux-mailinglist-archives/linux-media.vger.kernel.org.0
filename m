Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9585736DA40
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240328AbhD1OzK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:55:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:37052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240389AbhD1Oxr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BAA6A61946;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=hgVIRXIaDP3qryP6Ow1GN4bGxSo94x3BXa49gnOI5oU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=f3h0eGdXeU42FbQX5nXsu8h3s9APwtyEpXw3+LibpCG6kLrIt6BDyl+FtHQRSKps4
         Xhc7aPhob8HM6cDJI/26PfL4pGqBkbBGn5DRD3AEyYJ1Gs8OlglLJGBpNQ8tszHOfg
         uKV5jGBMbk9GHqLZUwR5AefUY3Um86Xr9+SBCA+CSf5nLaaBwhgPfBIyCTfzUhp611
         DUBoXfgBZPlzlkMUNqBGlc+Yo+VBU+H+2TS2HbWQ+8JuFmL8DgOGMQzE0Xffh3cPEx
         iOHXAiIVXE0oM7MZChxs+x27CwUnWajos/IIxVzKEKHQ2H38KzEN1mjHEvg7PUGkg0
         77dxm2LOWJnYQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYR-001DsI-6N; Wed, 28 Apr 2021 16:52:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 56/79] media: i2c: video-i2c: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:52:17 +0200
Message-Id: <9798637a8003329b10992d1d983041387b2c6677.1619621413.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/video-i2c.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
index c9a774f4c8d2..910a139c5e14 100644
--- a/drivers/media/i2c/video-i2c.c
+++ b/drivers/media/i2c/video-i2c.c
@@ -286,11 +286,9 @@ static int amg88xx_read(struct device *dev, enum hwmon_sensor_types type,
 	__le16 buf;
 	int tmp;
 
-	tmp = pm_runtime_get_sync(regmap_get_device(data->regmap));
-	if (tmp < 0) {
-		pm_runtime_put_noidle(regmap_get_device(data->regmap));
+	tmp = pm_runtime_resume_and_get(regmap_get_device(data->regmap));
+	if (tmp < 0)
 		return tmp;
-	}
 
 	tmp = regmap_bulk_read(data->regmap, AMG88XX_REG_TTHL, &buf, 2);
 	pm_runtime_mark_last_busy(regmap_get_device(data->regmap));
@@ -512,11 +510,9 @@ static int start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (data->kthread_vid_cap)
 		return 0;
 
-	ret = pm_runtime_get_sync(dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0)
 		goto error_del_list;
-	}
 
 	ret = data->chip->setup(data);
 	if (ret)
-- 
2.30.2

