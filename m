Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E81B36DA7E
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240839AbhD1O4M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:56:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:36312 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240353AbhD1Oxn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D9BA6192F;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=uVFbSBsOFTlNeqpthO6c96NJAUfPhbV6UvOttxV6+5A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mu+tde8G/4WoEXfdwsfiZJenrIbGxa2RK+cL+PP853tf6K0IGZ0TEsyuonMyp2UG6
         PWg1d0DiyFF1ogBKmfeWueF25ZsQ1b5+z2BkXYrNfdreqQ4bEsTmupWEZ8I+gYnGdF
         da1Jq5ZlJ/qlfA/+bzEgCFX0weSrKgd7ZVlGD8g4fL0OmrN+PPDDLbxvL1iwlHQ4OQ
         L2jOWVXLL8CL3pvg5RkzoSHMfIMEIWVv2vqCkuXeFRIul+JeNQnJr8c5PT2XQlqU+u
         TpPYQW+l8s7/cmeXdzh3aUZXrgFjGhWxOGvYGEWjgbnbDjODKX21UkwwLXrTVMSzw1
         v6Zl5XLyAjDUg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYQ-001DrN-KM; Wed, 28 Apr 2021 16:52:42 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 37/79] media: i2c: imx290: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:51:58 +0200
Message-Id: <beb091f0b517a2f6d3c839f21481af5f8e752167.1619621413.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/imx290.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index 6319a42057d2..06020e648a97 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -764,11 +764,9 @@ static int imx290_set_stream(struct v4l2_subdev *sd, int enable)
 	int ret = 0;
 
 	if (enable) {
-		ret = pm_runtime_get_sync(imx290->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(imx290->dev);
+		ret = pm_runtime_resume_and_get(imx290->dev);
+		if (ret < 0)
 			goto unlock_and_return;
-		}
 
 		ret = imx290_start_streaming(imx290);
 		if (ret) {
-- 
2.30.2

