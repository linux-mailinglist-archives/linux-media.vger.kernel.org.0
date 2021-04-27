Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83A2F36C2C8
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237759AbhD0KQE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:16:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:35522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235577AbhD0KOr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0FC1F61883;
        Tue, 27 Apr 2021 10:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518433;
        bh=hgVIRXIaDP3qryP6Ow1GN4bGxSo94x3BXa49gnOI5oU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cLqoAGCfIL2OxVF4O1wFYsX4vv+YDrtXpUlPSG89NjnuWXuWVfchPC9BvNe1g4nW0
         d2WMATiDQbGC51S+BV1vqBiBKSkssy/SwRZge9UDOl7Lh9m3dn/8zZycicXvMCSh1K
         baePTv9eIiGJE5e16PRSv+b7SYKcQFJ7RFj7q6Zs8kc5Ze42Steiztc6kXJS7ujIbS
         USJYcXCqXjNCZBXuDDwTvz88yjMYUMJuRQ4KQYnA/Mx7U4NH4342I802FtBupvP3WQ
         6rx9zSlKmgc7UEhA7nDLPoiG31ZgNqu7nMGFhbwGH7F+EX2QaPlhuAGpX7OnU/2R7P
         MVqMUU9c42uVw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKj1-000j7O-7G; Tue, 27 Apr 2021 12:13:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 58/79] media: i2c: video-i2c: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:13:25 +0200
Message-Id: <b914c89d8bd05fbf29411eedfe4c1a85f2eb66bc.1619518193.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619518193.git.mchehab+huawei@kernel.org>
References: <cover.1619518193.git.mchehab+huawei@kernel.org>
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

