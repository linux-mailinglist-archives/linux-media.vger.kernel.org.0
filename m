Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADAAE3737E5
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 11:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232827AbhEEJne (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 05:43:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:48620 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232397AbhEEJnQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 May 2021 05:43:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B01E6140F;
        Wed,  5 May 2021 09:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620207739;
        bh=JcIZp6yZMv3qHRfQxdJ/W6eZtpcx5F6VpH0Ap9ywfpI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Li6W/6B6PEyOTmCfqBIvlgMUcPvGhr788mD8SPztiXVf7B0g1vijAlk9+cF3j4nyX
         YvVsbQWQu8TObhK0NJtCkPgpkI9LYUl/PXdizLvv4e/rYxXA/QSxXzjp66vwAkxXc4
         n/ccMwFogr2m8WZgameQQZIYKudzQgfP3RkGE239f48cqZlx3kG7pMWSkRL1m47HE4
         LFIXkA6aLre5AiNdNAjZpoOp8zih4WA4DTNXaXmqRRK1F9gmnprrrEHuxZd/+XqSCi
         pwMakB/BUmI5Q8Gd2RaYindlsy+fSZJ5CDxQqRmf4qeecEbgQ5F4eYKctUcBJGyNcS
         Qm8kstE46/xog==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1leE2q-00AHw6-RN; Wed, 05 May 2021 11:42:16 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 06/25] media: i2c: imx334: fix the pm runtime get logic
Date:   Wed,  5 May 2021 11:41:56 +0200
Message-Id: <9552f3daece8bec6869b518410b2998c3fc0a1fc.1620207353.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620207353.git.mchehab+huawei@kernel.org>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
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
dev->power.usage_count decrement on errors. As a bonus, such function
always return zero on success.

It should also be noticed that a fail of pm_runtime_get_sync() would
potentially result in a spurious runtime_suspend(), instead of
using pm_runtime_put_noidle().

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

