Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 252853756AB
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:24:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235254AbhEFPZP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:25:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:38140 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235161AbhEFPYj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:24:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF6D061426;
        Thu,  6 May 2021 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314610;
        bh=HyEc9UNwq5f+9HkjZrtYJol03xr9+57BThXZkb1RvbU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Zr4XORA0UIja5TGWNYfypJu8ac+wIlsz1ZhleHAIroEDx25+SY/hySKaAXyHTmZrb
         WtRJnUl/j69SsgG2gq4qfTHSqarIUzUcvDAHZzXl5lF1THl6QWDl1Pa4puxr9N4eRf
         fNZ2nJCK53Ja6eNsWR/D17im9ZFDxso4BmVaywlWRdeN5xVe0a40wIazu4ROm57NuS
         ynMRM2oLufrzMQhgmZaEZcUjF+HEop/veNcCZnv2mo4vP7w/e8mcehkFPBy1yUwXpB
         2NjaHfMjfeem03LOthYrlIt4MXBdC7iILpt7zachvADpQsmOfLsuEiXNXPNvw2YZRU
         fd1QOpY6efmJA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lefqb-000RwQ-28; Thu, 06 May 2021 17:23:29 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v5 29/30] media: i2c: video-i2c: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:23:25 +0200
Message-Id: <f6efc87d96826e3d2067b874e034b5edf73bb593.1620314098.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620314098.git.mchehab+huawei@kernel.org>
References: <cover.1620314098.git.mchehab+huawei@kernel.org>
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
index 0465832a4090..de12f38f347c 100644
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

