Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49EEB36DA67
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240757AbhD1Ozr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:55:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:36328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240478AbhD1OyL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:54:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D456D6195A;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621565;
        bh=Z0USvyTZ3fXu9UhxRT5FD354jvvwjeNjqwFRY+Zs3l8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XxL/AaNDyVuYE7fzQ4J3HtyFzMUo6T5tdOxXuy+vg/Qt4Nj1t4OB240qosr3OkGvN
         5fS6/M8Ww8OpbtrgxFVm3eSFqHsWqpBAfm2X2lqpW/4GAqEdBS7v/WddRw61E51pmF
         zJy5VBQmSeF4/HMCmZBsocSAIH7a9Rbvj5itgDYaQTKHvZ4Nh7tiBcVylUkBQse9Tj
         155iEUTZRKkh6sCqWlyv2M5aOm0oozoUvxgtUZtiJ9ElEuu9rLLkT77AT0k7CNjPYZ
         l3ddgT2i6wNHVKkwLBpGw6H0JP/zgfh30hbawxoifq1j7IT1lwaFgTpcY4AniSlSZ5
         2xlFO0D27f+rg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYR-001Ds6-2b; Wed, 28 Apr 2021 16:52:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 52/79] media: i2c: ov8856: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:52:13 +0200
Message-Id: <9db815dbc8848fe15cf22d3a28634a746cc04532.1619621413.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov8856.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
index e3af3ea277af..2875f8e4ddcb 100644
--- a/drivers/media/i2c/ov8856.c
+++ b/drivers/media/i2c/ov8856.c
@@ -1340,9 +1340,8 @@ static int ov8856_set_stream(struct v4l2_subdev *sd, int enable)
 
 	mutex_lock(&ov8856->mutex);
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
 		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
 			mutex_unlock(&ov8856->mutex);
 			return ret;
 		}
-- 
2.30.2

