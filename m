Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4F7A369F79
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbhDXGrq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:47:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:36102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233650AbhDXGqU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2A3461935;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=M+G2FGvpxz8oVs70Hd7XJ+D2QZDVSmESzfk8hhosPRM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=u/m+jloocRIKaKXTIgPc9naK2wgNlylQii+wt63IJvs2m41jbRSr1vBQ159paMdyi
         3f19mvyEKypML0z13ve4HnLa26SkAEMDsbbehr7x7r2FgKVM6nodaY/PnkqzFdsIGQ
         UcQj85r5nrN6G2zM/5VNRd2yEWXD3ctWfcDK/8nCRHCQF+T9DHglRp/RhGOTeuR9LB
         KRHT1tuviUoKxzfQCCQY2SKlH9GjH6T4NXsS+DUExfK0i3XOwWVEUFVtbut5mCD1wE
         SX4eWOe4M9pgdHFuczEnqtXwb/xvVqECND+d+w4RQg/3gpzBR3WJhWKf51vLdpxQEp
         15jHegZcsIlZA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2l-004JfV-Uo; Sat, 24 Apr 2021 08:45:31 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 37/78] media: i2c: imx355: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:44:47 +0200
Message-Id: <d1ccd321a2aa3c8d4334f548c2a3846c464b6ca4.1619191723.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/imx355.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/imx355.c b/drivers/media/i2c/imx355.c
index ccedcd4c520a..93f13a04439a 100644
--- a/drivers/media/i2c/imx355.c
+++ b/drivers/media/i2c/imx355.c
@@ -1442,11 +1442,9 @@ static int imx355_set_stream(struct v4l2_subdev *sd, int enable)
 	}
 
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
+		if (ret < 0)
 			goto err_unlock;
-		}
 
 		/*
 		 * Apply default & customized values
-- 
2.30.2

