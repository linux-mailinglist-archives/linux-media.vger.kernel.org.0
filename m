Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8534E36C2E4
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236805AbhD0KQk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:16:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:34862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235567AbhD0KPM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:15:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EB84861949;
        Tue, 27 Apr 2021 10:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518434;
        bh=oAi5YzlfFlQMfzPh3wYGQ2xjGcqBCgu57W3dE0PjRzI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WlzE8JFKZcEaqtCedGI64mSq7Zxn6b2RQGKEV1UcH8M57TwJqZZJq0ZaTdnJG9Ynf
         jbsu9fJuzDy7LLMnudgB5ChhqU99RMJratdZ3sLb/vKih+elx5ZK4LtgmJ+0E1+vE9
         4XoiCXqQNU9WZUDQjAC8lcjbW/MU/Vv4mXhHhW3MAOzwrxsk3U+vaGBtwEEzAFnEeN
         4vVZdUMbCXxwc68I2eoJAf+CQ8NBsqg8ZcPUPhQA9XxpaWD13ojwryu/nW571MJrTz
         Iqta/mHUbeQ6+P/Pw/1dfH8jFNZnr36SQrwyFWl1R8fOXzk5QAWxTuQlj7g5fYqkvp
         Y/0Vh1CTFMWOw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKj1-000j7F-0M; Tue, 27 Apr 2021 12:13:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Colin Ian King <colin.king@canonical.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 55/79] media: i2c: ov8865: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:13:22 +0200
Message-Id: <ce3ead701c232be8d8a8c001a4217581ee5cc2d2.1619518193.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov8865.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov8865.c b/drivers/media/i2c/ov8865.c
index 9ecf180635ee..3bf6ee4898a9 100644
--- a/drivers/media/i2c/ov8865.c
+++ b/drivers/media/i2c/ov8865.c
@@ -2497,11 +2497,9 @@ static int ov8865_s_stream(struct v4l2_subdev *subdev, int enable)
 	int ret;
 
 	if (enable) {
-		ret = pm_runtime_get_sync(sensor->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(sensor->dev);
+		ret = pm_runtime_resume_and_get(sensor->dev);
+		if (ret < 0)
 			return ret;
-		}
 	}
 
 	mutex_lock(&sensor->mutex);
-- 
2.30.2

