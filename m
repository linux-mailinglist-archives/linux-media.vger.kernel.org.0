Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 020F636DA6E
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240678AbhD1Oz5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:55:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:36314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240495AbhD1OyN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:54:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9CC7A61C1D;
        Wed, 28 Apr 2021 14:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621565;
        bh=YsKm6VExyywU3b8QQMpE5e+1XH7hFzOYFX2Hhhvq5XQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P1X5Qr2nNL/NwdH2YnhBWrN9ZzmTUHoOeaQ0yo2eocVsO1e5x6zG2JaRYC7Ic58v/
         GefycBKPmF3rR3WZ3t1eEtQ/TZ3FGWXTz+k83hy70+t4ayDm2z5PkuvZyMz0ZBbGm6
         LxaLm3sm/gjh+HhTrpaT4f67bbP3YlD090cZFxzn4SVoN14E9sPiP+UTaARejhDLta
         z5xmE67wkAWDsx4+UBlpVVwCjO5zXL2BVorEAEWJTh6J4XtUmV3P1oLG6VNQorts8M
         GeUD+tscEsYhXTDLuTJlc4TGY1STek/CSp/2PS28pTObra90/daF//d6wv/v5W+kdl
         qa92yWCdl2f1g==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYQ-001Drf-QM; Wed, 28 Apr 2021 16:52:42 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v4 43/79] media: i2c: ov2659: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:52:04 +0200
Message-Id: <05a26c6f0f7798e9bc7a04845b3e3f32d9fcb659.1619621413.git.mchehab+huawei@kernel.org>
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

