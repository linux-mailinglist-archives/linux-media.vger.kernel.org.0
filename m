Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8015336C340
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235491AbhD0K2C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:28:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:47650 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230341AbhD0K17 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:27:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E1CB0610FA;
        Tue, 27 Apr 2021 10:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519235;
        bh=YsKm6VExyywU3b8QQMpE5e+1XH7hFzOYFX2Hhhvq5XQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=S/jSXaeignl5yQptqhqn6VFiVIyxAcohR9PcwKFr49o5PfzpcVyfoZ9Dk4RIYzLrD
         +4KNqMpJJtVsxeB2hQ+SQBi2GuYYoobs6t7ofORvrvIQ6fxgFk8p/+dO2Z/T0hjkLE
         LSTBiYAk8pdIZ5D83wHg53iuZLgHEMvCA2tsCMO11lZKQTThqzqzynTDcsCh5oQsyp
         fhpqFQZhhUf4V7OTPCZIJKYH8l29Er78iUGNc7nRWQskaKA73QLFVSSRYa5qIHXt6p
         ibXygGUxh/ZxlX/GDaFQrC/J4zsymW3NEtPUJi6lIbVsfK4WdhdxLQ9cufpSMFXr6e
         doL2c+hplSkPQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvx-000o1O-Ee; Tue, 27 Apr 2021 12:27:13 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 45/79] media: i2c: ov2659: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:35 +0200
Message-Id: <8a210791fe9934553e17fa87f7dda955c6c2a03f.1619519080.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619519080.git.mchehab+huawei@kernel.org>
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
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

