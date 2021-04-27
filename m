Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25D2036C2B6
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237490AbhD0KPh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:15:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:35230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235504AbhD0KOm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9329061554;
        Tue, 27 Apr 2021 10:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518432;
        bh=umqdpGp1oSGyna8Ojn3AGfbapFLyE4ZVzg1c+rmxXd4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=V/QaYm0kr8vX9BgjUd02/cY1pWxgrNsO+MXcd0JupGjgj77iwV8BkWJvCpqmAIruQ
         hmDJFLHdTdk7QD5iroeoNefI8pi3RTTjDK0ZG34edBFTNItxX8YFbfnix2Yc9ASZjN
         oMYGiYyq4zOofDXNb7UtbEt+NFZG4xNtvDA6VTwvpg8Goo83f7AbHPDUFbUTCnzdxW
         8P81dTjNzts0IdtAN99ft8QLWJT3ipr0YC0/n/Bur3SRIQHvkR7ICjhkYRZc2XrQcc
         JJoSJwejv5GWzILATevpGnDfmiwT2d+Kctd0EKP+qw9FSjT/M8kfcCXSq+KV7GNp/R
         c0eZ2XCjiQYMQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKj0-000j6r-Hu; Tue, 27 Apr 2021 12:13:50 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shawn Tu <shawnx.tu@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 47/79] media: i2c: ov2740: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:13:14 +0200
Message-Id: <a9a37f8df6ffe0ade7342d306ae1a378382f74fd.1619518193.git.mchehab+huawei@kernel.org>
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

