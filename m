Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B10B036C38C
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238186AbhD0K2v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:28:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:48146 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235650AbhD0K2F (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D4A1613F6;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=jUMHPV3bIyEEarOloeBBF8gl6HQ5pp77fQglK6LRWcc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LAR5z3FzbCYoIgNC02/1DgukwE4KbTwF4OtCFfJibw7xgD/1nwemJxgyBbiS//RTg
         E2XV0YjIVmM8WQrdykAeRV3PmhNi9ilduC+HSs6plbYOvp1Yhwa7yNqzIc4tKBU0VW
         a/LK/nLlNf1FdnaUIJ8qpz08StjOv0vkrYcH5KHUvtmklY6dZjr1GTKHREmBuw7zUE
         yhYAtMoBLEzt6WtDgHFZrYRaG+rdZoVeRrJxpA8o5HUk4+UZTqhVSArnPsShoOwmHD
         7g/NB1ODy6+unOSCqQRSLn/oRYBm2j8lPtWiUakIzKgxAmhDbvn4D4bTjW5XuzJEaJ
         IzvoEskZkU2wg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvx-000o1m-Ty; Tue, 27 Apr 2021 12:27:13 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wenyou Yang <wenyou.yang@microchip.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 53/79] media: i2c: ov7740: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:43 +0200
Message-Id: <ae18f9cd46815ce5f24f7b01bfbea97faf3e38c6.1619519080.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov7740.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov7740.c b/drivers/media/i2c/ov7740.c
index ed6904b2e8f5..74219f67f245 100644
--- a/drivers/media/i2c/ov7740.c
+++ b/drivers/media/i2c/ov7740.c
@@ -624,11 +624,9 @@ static int ov7740_set_stream(struct v4l2_subdev *sd, int enable)
 	}
 
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
+		if (ret < 0)
 			goto err_unlock;
-		}
 
 		ret = ov7740_start_streaming(ov7740);
 		if (ret)
-- 
2.30.2

