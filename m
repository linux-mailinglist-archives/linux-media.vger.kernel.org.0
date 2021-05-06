Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3478375697
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:23:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235300AbhEFPYx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:24:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:38208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235201AbhEFPYa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:24:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 646A1613E4;
        Thu,  6 May 2021 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314610;
        bh=oKyS61glPZn5sXxnrboa/AtTlnD1fG/1xuau3yVfL78=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u3COkbEQio84liZvUPD/J3sUZsnfuPrbg5MZknOresXKFtUmxMuZxFvoI/kS6yy6Z
         a6nGESFr4PMEFiV9zu1onxngOe/kuoyvJGX1COR+hIC3s+mWrsGQeThD/uy8ENUdCR
         adk1WUekooG8SbWcZ49+AcUZjo4o3DZ6XPdy+KWTGw1lLQsOtG86KQNcchRRqfIbYC
         AFcioGeR02XmDJrdM2o+NJCs0FgZjafED8Am/bzE/AOMDzltaSUbeQ4yefJHRXkf7f
         enWuikh/i3jFea7Psx5mtItnTwckemveGfu3j+2AUvd3HRaqgCUKDUCdWSlCFpzUw3
         Fe9OpzU7UxL/w==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lefqa-000Rva-G9; Thu, 06 May 2021 17:23:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v5 16/30] media: i2c: ov2659: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:23:12 +0200
Message-Id: <6c19955672011ff88748e3314e984a39504d1622.1620314098.git.mchehab+huawei@kernel.org>
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

Acked-by: Lad Prabhakar <prabhakar.csengg@gmail.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/i2c/ov2659.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
index 42f64175a6df..a3c8eae68486 100644
--- a/drivers/media/i2c/ov2659.c
+++ b/drivers/media/i2c/ov2659.c
@@ -1186,11 +1186,9 @@ static int ov2659_s_stream(struct v4l2_subdev *sd, int on)
 		goto unlock;
 	}
 
-	ret = pm_runtime_get_sync(&client->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(&client->dev);
+	ret = pm_runtime_resume_and_get(&client->dev);
+	if (ret < 0)
 		goto unlock;
-	}
 
 	ret = ov2659_init(sd, 0);
 	if (!ret)
-- 
2.30.2

