Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 627E736C2A9
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:15:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236778AbhD0KPT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:15:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:34780 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235454AbhD0KOi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7990261482;
        Tue, 27 Apr 2021 10:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518432;
        bh=YsKm6VExyywU3b8QQMpE5e+1XH7hFzOYFX2Hhhvq5XQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tSoUJDmsTrGb+T8mfrx2VUqcb1ou+9GqZOOXAbYPal8QbZkmR43POLxwWgt5ZeQuE
         Femlt3ehOb+/FrPN8/dUjObRit9uBF+23OukhEZqwXvkFjBBw1IViLZ7lDfzRAiMi/
         bJNcFjYQKXj4Mj0WyFWelhNq7a6HwWM+znvOnCT3LDYOtr+UyOpuP1gtpz0qWPlBKF
         kXK5nxBU7UfeQnhcxnxLZFb4ouOu4iC6H8cvQOhQQxot9V4h+P4n7HrbAzFekoEvOK
         IYZtrfI206oJPuqvkQdcTil7mlVC64KN3HwdD6Ped9GX2xlWH7nnu+CVizW9YWb4wK
         TBNXObg71S0Pg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKj0-000j6l-EL; Tue, 27 Apr 2021 12:13:50 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 45/79] media: i2c: ov2659: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:13:12 +0200
Message-Id: <4f2f239cf1b91b3598d1379d7c270bce3ba27169.1619518193.git.mchehab+huawei@kernel.org>
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

