Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F0A736C3B5
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238475AbhD0K3V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:29:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:48138 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237809AbhD0K21 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C1BF261444;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=CBbCf8lLczURo0R8ANC6iiJbxWCN1ESFz/X/hIdzJFg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ISvs+irbu3anVB6CGaQQsRIg16yW3x5K1rNr0PczprNrPRU7QV0izPVxX2k8qXpZ6
         yNRYvw9v9YfeCoh1GVRFakwZTg1pHZ8Vo9JvBaVHGgRa2V0NjtN9hKKCzX2lZK1nMh
         cIBDJBwYSaajFJd5t5H9uBb8wIK+Gf0StLeunhB300YveQA6xv+RJ9wlQEKA3rs+mP
         uEcKznvxOj07f+UOQDO6wg4STqqEyADRqr/xlSrQ2fMoLjsVGMqyaV04PpMoTko3fF
         Wl4g/ZB2Cev+w1Wk+39HGfh98/ZioMIuxau7Ty4EsGZuK6q+uSrB+av8D5qXYuDggJ
         2utOEjSgz6ZEQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvy-000o1v-3T; Tue, 27 Apr 2021 12:27:14 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v3 56/79] media: i2c: ov9734: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:46 +0200
Message-Id: <7b8db39c23ac04405a790ea6af4f0224928f9bba.1619519080.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov9734.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/i2c/ov9734.c b/drivers/media/i2c/ov9734.c
index b7309a551cae..ba156683c533 100644
--- a/drivers/media/i2c/ov9734.c
+++ b/drivers/media/i2c/ov9734.c
@@ -644,9 +644,8 @@ static int ov9734_set_stream(struct v4l2_subdev *sd, int enable)
 	}
 
 	if (enable) {
-		ret = pm_runtime_get_sync(&client->dev);
+		ret = pm_runtime_resume_and_get(&client->dev);
 		if (ret < 0) {
-			pm_runtime_put_noidle(&client->dev);
 			mutex_unlock(&ov9734->mutex);
 			return ret;
 		}
-- 
2.30.2

