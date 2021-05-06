Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC5FC37569E
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235332AbhEFPY5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:24:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:38114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235207AbhEFPYd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:24:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 73151613ED;
        Thu,  6 May 2021 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314610;
        bh=zHjujpboN+Iu7V2XpqIB+1lLAb+rrUx5c1q69NYA2sw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tnB+O4letHgY5bxfTxCUe0bswQI7Pl67U9osdY94TDrknu+ifQ2KlKz7XjTswp+BK
         Y6Lsw4ZMOcsfX3hT0bGLRv/q5385GbGfzr14B9u5+abvkNgnoDNbhZ5yTG+0C2GSL9
         dx5ACXxuHV4LsSMUI1cSVf882t1TBiN15+loKkaSHBUrxIT4cyZFInplqxQnYkNSE4
         u85nJUAOeuSpGFyVWjBuzGg/a1TvBcFSmP6lEfitF8VkYPjL9An1gV/wDIx/en8sdp
         XXCsDAy/AWfEuyxccQ3gz85pvEACkFVqdHYt+et8mVLQCmkCSy004vl5dtiv4uwbaH
         sgXPQbVj+8Jgg==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lefqa-000Rve-Hy; Thu, 06 May 2021 17:23:28 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v5 17/30] media: i2c: ov2685: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:23:13 +0200
Message-Id: <fbf0e208c2673dcb39d77a7e5b64f0c8b5085a4d.1620314098.git.mchehab+huawei@kernel.org>
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

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/i2c/ov2685.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov2685.c b/drivers/media/i2c/ov2685.c
index 49a2dcedb347..2f3836dd8eed 100644
--- a/drivers/media/i2c/ov2685.c
+++ b/drivers/media/i2c/ov2685.c
@@ -456,11 +456,10 @@ static int ov2685_s_stream(struct v4l2_subdev *sd, int on)
 		goto unlock_and_return;
 
 	if (on) {
-		ret = pm_runtime_get_sync(&ov2685->client->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
+		ret = pm_runtime_resume_and_get(&ov2685->client->dev);
+		if (ret < 0)
 			goto unlock_and_return;
-		}
+
 		ret = __v4l2_ctrl_handler_setup(&ov2685->ctrl_handler);
 		if (ret) {
 			pm_runtime_put(&client->dev);
-- 
2.30.2

