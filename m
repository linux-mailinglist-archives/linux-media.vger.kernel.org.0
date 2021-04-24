Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22AC8369F7D
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244194AbhDXGrx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:47:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:35726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233997AbhDXGqV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA30C6193E;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=rXQEV5ur3+5U6VOB8wAB6dlcXqNLqRBsrKFm5rfs1io=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KIbr3SiiTvQRZ7RkL4yt6P99Y/WGlTlPtlFwzWn/sGZQlyMHrutQqWVIWqJr2dEP8
         0V06/jXowg+wgkvxygqmwDdez7KLiiksMqEA6sY3Riz+oycEB/EwlWPT9YRhNZ5bBv
         2mk80Pjh9i++OnQ1UQLSg6P5jAElktGg9E0qh24H+r9C97BDTPzHoMtvMFP98DP1A3
         sUtawt6/73xO7B6ob8Iv9r9LlT5L2fea1JjUK7cg4/dl6Q6nPkfYGefr2srakB1UNt
         QYUZEXroVZYR3ue8Y52rjTFEfupscnxGPV1BWQeUGOiZip6dKR2hVp+zunLN/zZvgd
         jTkhuwGei51/A==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2m-004Jfb-0N; Sat, 24 Apr 2021 08:45:32 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 39/78] media: i2c: ov02a10: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:44:49 +0200
Message-Id: <bc86e3047d9e09c3e2ca0f889a322c108a0a1d9f.1619191723.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619191723.git.mchehab+huawei@kernel.org>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov02a10.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
index c47b1d45d8fd..a1d7314b20a9 100644
--- a/drivers/media/i2c/ov02a10.c
+++ b/drivers/media/i2c/ov02a10.c
@@ -540,11 +540,9 @@ static int ov02a10_s_stream(struct v4l2_subdev *sd, int on)
 	}
 
 	if (on) {
-		ret = pm_runtime_get_sync(&client->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
+		if (ret < 0)
 			goto unlock_and_return;
-		}
 
 		ret = __ov02a10_start_stream(ov02a10);
 		if (ret) {
-- 
2.30.2

