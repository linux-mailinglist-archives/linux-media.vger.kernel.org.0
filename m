Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B15AA369F85
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:48:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241260AbhDXGsE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:48:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:35766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233104AbhDXGq2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF7DB6194B;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246734;
        bh=YsKm6VExyywU3b8QQMpE5e+1XH7hFzOYFX2Hhhvq5XQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=T1f/X/dzm1aP9FVJ43879hc6VL7T+NYzMIr7eVEUXS1K8F47MM+RGDczz/ljvIUuA
         RXBawYM7ZNkoch4/1COMCUmTNOdanLJYzkldpfHUUbER+M37dws9EWL8sRz+4/1tja
         xWGpwWvEzYwka8Uzu1z20O/xZtWdMmUJzwFvMkf0+NeBSNxsmnn1TWxxaCGGSgisJn
         n2e5ls46vOcNB7R3Lv/opJTF408tgwdqeMvDJitCaudSQvpzKzyetnwIGAwQZ+a/+e
         kcNisChQKI4J3lPWu7Y+wIk9t6ZdRKWaXYMHay6hz9JP1HnxyxsXHAY2RPGFIK3D+2
         /rEeAErEGrBJw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2m-004Jfh-2G; Sat, 24 Apr 2021 08:45:32 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 41/78] media: i2c: ov2659: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:44:51 +0200
Message-Id: <d2b497d0c9818338250d29ba52f51e480aa8a616.1619191723.git.mchehab+huawei@kernel.org>
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

