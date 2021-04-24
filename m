Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D139369F86
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244226AbhDXGsF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:48:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:35962 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236278AbhDXGqc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E38686194F;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246734;
        bh=cJU/MoL9RhqbU2INYkiDGdONljhoe6cy+RDqPfC2nLY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i6qCu8gRIIPTjBMFkmr+ZPHrywGeBFXC7aKpVvEK5WJAMAuyu/bYVg4vIAorvTG0i
         mBL0BNx9k5PXRfIxI2jRFqoAi8eN5SgsAj5UQqtgA1RD4rK31kVU5wSoV7Kl6cXory
         FldU9QLeU9vKPuLWtXX6zn8JrXGEnXbqbKLjKtUWjMwQo6yieZewvAJedFGvcAzirA
         /FCdrCJKNpGXgSSeg792CEU4QeqW8cWOpGT2xl9mhLbwfb5kldxjhb5CpTOpI6mUUJ
         1eSYywIbfPn/XYNv1RB0oiBnCz+M0Yz6v1kkNO7Xq8uMfowGzySC73+aLUg4mO9I0b
         8L4DdUIbiuyVw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2m-004Jfe-1I; Sat, 24 Apr 2021 08:45:32 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 40/78] media: i2c: ov13858: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:44:50 +0200
Message-Id: <74288855f2b42ce83b27d3897a505470aae59ac1.1619191723.git.mchehab+huawei@kernel.org>
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
 drivers/media/i2c/ov13858.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov13858.c b/drivers/media/i2c/ov13858.c
index 4a2885ff0cbe..9598c0b19603 100644
--- a/drivers/media/i2c/ov13858.c
+++ b/drivers/media/i2c/ov13858.c
@@ -1472,11 +1472,9 @@ static int ov13858_set_stream(struct v4l2_subdev *sd, int enable)
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

