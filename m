Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A2E7369F8A
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236266AbhDXGsH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:48:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:35994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233264AbhDXGqe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 078B161966;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246734;
        bh=+bMYEFAZck14Vic1PZ1bJP6TzBqp6k1hQmPMO6H4/hs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tHNd+aCF6XQaqwH4V9uuvBjYT/fS9fiF4g6pnT2TQwDGRqd9Km3J/uTRdcXDJr49X
         VPTyu5b0KE058kVBYFQ+QqGKbQ9cS+PybwlH7yAe6ysYhrGu1hbcnzgMw/Nbb9zAXO
         ZnlcpjW+AO2hC/flbFIwO6cXOcYqQTxCfzgBCCtTb6KuPXNto33DNtYTqyWzl51kGM
         APtvNiBKK8SwHStwBt1WqoTMj649aO0WASX/q9PC43UUFOMH6+nFqUpSDcA0h1H2Nf
         1GJfwf/Ydpvh4ibW/qBoUbCbmiU9+52tlgIFIVSI8kjN9W6ci5pBZcAAVRldrIUDoG
         eKSxqreVIs7xg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2m-004Jfq-57; Sat, 24 Apr 2021 08:45:32 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 44/78] media: i2c: ov5647: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:44:54 +0200
Message-Id: <9713ae015dd9c8b8d65fa5baaaa2cd02ceb89a27.1619191723.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov5647.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 1cefa15729ce..38faa74755e3 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -882,20 +882,20 @@ static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
 	}
 
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
 		if (ret < 0)
 			goto error_unlock;
 
 		ret = ov5647_stream_on(sd);
 		if (ret < 0) {
 			dev_err(&client->dev, "stream start failed: %d\n", ret);
-			goto error_unlock;
+			goto error_pm;
 		}
 	} else {
 		ret = ov5647_stream_off(sd);
 		if (ret < 0) {
 			dev_err(&client->dev, "stream stop failed: %d\n", ret);
-			goto error_unlock;
+			goto error_pm;
 		}
 		pm_runtime_put(&client->dev);
 	}
@@ -905,8 +905,9 @@ static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
 
 	return 0;
 
+error_pm:
+	pm_runtime_put(&client->dev);
 error_unlock:
-	pm_runtime_put(&client->dev);
 	mutex_unlock(&sensor->lock);
 
 	return ret;
-- 
2.30.2

