Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2A4036C38F
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237347AbhD0K2w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:28:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:48148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235723AbhD0K2I (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 48B8C613F1;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=M+G2FGvpxz8oVs70Hd7XJ+D2QZDVSmESzfk8hhosPRM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CKlqZvDyaB/aKwcH9tqr8QITL4MgPggJM1eUv2VKJ3gZA3kkO+mqyZEIrhRAT6hAK
         rvcZp5gxNbgD/eFSDcpX69018veu3jKHqkB/T/gme6jDJjNtJ2PC0tuVzdhnsHawLf
         9KNivWDboLSJxeYkKjmDkq7VPlgFhaNs+se3nBaXADExWcWcnmqYQeyvkev+LlZMf3
         QZckEG6YcEc4wzGo0+LXLNPkg6oZhWVFX4HlIhUUNVDRjhOXH2ZnwihXEIUgbMXy1B
         A47BrsWp7pHHUfTC6T+sUPPB4tFZL3HBBL3xRZfPsekoSoMUtH2VX87Pbw7OkfOnTB
         1Co/44yF7/vrA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvx-000o1C-79; Tue, 27 Apr 2021 12:27:13 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 41/79] media: i2c: imx355: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:31 +0200
Message-Id: <afb979241d5d2dddce27b24c28db3843f51b83cc.1619519080.git.mchehab+huawei@kernel.org>
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

