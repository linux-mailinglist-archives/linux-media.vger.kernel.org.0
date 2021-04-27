Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DB9D36C3D5
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:30:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238342AbhD0K3L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:29:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:48142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237122AbhD0K2S (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6FFDF6140B;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=3LPMYGviydz+wxD+uX1CWPHMq2PRxZGRtXrIww4fEeI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=JfYMlpLkTE+a+U7DACSe3kqv79r4hpskaJ8xWggG5CTE731TOPRasVs5/XqeSjNuq
         6pYjqA1qoaNCY8KCYavQsd5lDEJWqfkq63Nnd8wERXWS6oupupuIp4lhLZUBQpdE6r
         N3jbGIJMAmN1nKIUNWQS6WVvhhFtNp2aZTpjJgEl5XPoT0KT5Tjze8mlOZYz6YPCUf
         aVrS5hqV/Dp3+eL/zi56LrCA1CyRpRsKUlaHlZR2ScGgmxXtf+EmBPgK5ey8Kh8wnK
         CHqS3wnp9XnXF7vPTWtS9rIgULno9+59Bh+TPTJ0zTcTQuvo3qt1oXC695RrkQP+3a
         89rBlsrR6RR/g==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvx-000o1F-97; Tue, 27 Apr 2021 12:27:13 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 42/79] media: i2c: mt9m001: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:32 +0200
Message-Id: <f7d2f9fe3e0314a7054ad9f2869017db8ab2caf7.1619519080.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/mt9m001.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mt9m001.c b/drivers/media/i2c/mt9m001.c
index ac1b380e6c03..2867f64e357d 100644
--- a/drivers/media/i2c/mt9m001.c
+++ b/drivers/media/i2c/mt9m001.c
@@ -217,9 +217,9 @@ static int mt9m001_s_stream(struct v4l2_subdev *sd, int enable)
 		goto done;
 
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
 		if (ret < 0)
-			goto put_unlock;
+			goto unlock;
 
 		ret = mt9m001_apply_selection(sd);
 		if (ret)
@@ -247,6 +247,7 @@ static int mt9m001_s_stream(struct v4l2_subdev *sd, int enable)
 
 put_unlock:
 	pm_runtime_put(&client->dev);
+unlock:
 	mutex_unlock(&mt9m001->mutex);
 
 	return ret;
-- 
2.30.2

