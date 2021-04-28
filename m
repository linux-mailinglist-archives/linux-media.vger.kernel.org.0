Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF3036DA13
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240398AbhD1Oxr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:53:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:36300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240278AbhD1Oxa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D643A61453;
        Wed, 28 Apr 2021 14:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=5nHsKpVEGzLJBEHDZodScTHIbcgjTCmDYHm0aezhxsE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lmMOTK68uTVce6FmJb5G0TPy5vctAr6DS7PxkCja8wOyztbJ4nb8slYu26WGvd7CK
         ubQykByF9tNnb9PDEMJGiNt8uVFN2l26qFXqzGvEXZZ8YoqIZIY9oOygiipAf98HDP
         uIcM675f4f+qqaSXBY59FEPMAdiyLnqtYRfYd+5M558S81WvNjR789dbLp/GZ3iZYa
         zo6/KoOcjyBBlld4U+N+8Xzr0q5ZYB8RYNcbBC/hq1e2wOEYIRQEwdAIYfHO8aaoar
         Dw2Xtfly855Cq9fyzSuhYOkr1Pxxk0ufgYTc1jw44jjN6hZYv/eN48FmFjCr04iw6k
         EZvoIl9eOXMoA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYP-001Dps-Na; Wed, 28 Apr 2021 16:52:41 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v4 06/79] media: i2c: imx334: fix the pm runtime get logic
Date:   Wed, 28 Apr 2021 16:51:27 +0200
Message-Id: <10ec24ee3e3a33a4ca5c431fc19d3441d59136c3.1619621413.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The PM runtime get logic is currently broken, as it checks if
ret is zero instead of checking if it is an error code,
as reported by Dan Carpenter.

While here, use the pm_runtime_resume_and_get() as added by:
commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/i2c/imx334.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index 047aa7658d21..23f28606e570 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -717,9 +717,9 @@ static int imx334_set_stream(struct v4l2_subdev *sd, int enable)
 	}
 
 	if (enable) {
-		ret = pm_runtime_get_sync(imx334->dev);
-		if (ret)
-			goto error_power_off;
+		ret = pm_runtime_resume_and_get(imx334->dev);
+		if (ret < 0)
+			goto error_unlock;
 
 		ret = imx334_start_streaming(imx334);
 		if (ret)
@@ -737,6 +737,7 @@ static int imx334_set_stream(struct v4l2_subdev *sd, int enable)
 
 error_power_off:
 	pm_runtime_put(imx334->dev);
+error_unlock:
 	mutex_unlock(&imx334->mutex);
 
 	return ret;
-- 
2.30.2

