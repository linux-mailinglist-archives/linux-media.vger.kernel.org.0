Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F50436DA51
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240686AbhD1OzV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:55:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:36328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240388AbhD1Oxr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA2BC61954;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=umqdpGp1oSGyna8Ojn3AGfbapFLyE4ZVzg1c+rmxXd4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ATJHdv6X6T3tSwPTnnl4WoKWoMN03qJkSsqO8yCB+i8R/W+3eEFy7DgC16fCIT3IM
         i1WihBdnGamxdpFANjzwREwBG14573J9ykDOM9VW0GeZjsKbtti7U9DSMP3GZXD6Mc
         xhcnVJIoCBP9UvobqXiNKm93mAx4qq4D2RJdJ1ZaRk6lrNW1DzcTT+CzFaV3cFHYs1
         amTCHvVB0aVgswkH3SYs3hLPEag1lM78ov6mjT/gLFO+mL0WSzbaf1A4AyPPBjKkLE
         niHAdNaZfmh+OcZM2krvdk7cbpZiP8z99IKUpWGbHShQJW5NLRfa6iZilhEzFphCUB
         ljBXXVi3cIFEA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYQ-001Drl-S8; Wed, 28 Apr 2021 16:52:42 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Tu <shawnx.tu@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 45/79] media: i2c: ov2740: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:52:06 +0200
Message-Id: <06c54728ddcc076f1f39a7bd01bf67c52e24899b.1619621413.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov2740.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 0f3f17f3c426..54779f720f9d 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -751,9 +751,8 @@ static int ov2740_set_stream(struct v4l2_subdev *sd, int enable)
 
 	mutex_lock(&ov2740->mutex);
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
 		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
 			mutex_unlock(&ov2740->mutex);
 			return ret;
 		}
@@ -1049,9 +1048,8 @@ static int ov2740_nvmem_read(void *priv, unsigned int off, void *val,
 		goto exit;
 	}
 
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0) {
-		pm_runtime_put_noidle(dev);
 		goto exit;
 	}
 
-- 
2.30.2

