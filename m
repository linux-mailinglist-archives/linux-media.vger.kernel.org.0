Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C165B3756EA
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235565AbhEFP2J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:28:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:40886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235564AbhEFP1x (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:27:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E9CEC61963;
        Thu,  6 May 2021 15:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314784;
        bh=nw7lb3Ybiu0APRxeY/ZSpBCUtyJ2J2dcLU9KernES+8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lgi9K68SDn+l1XXT3uJr8bn2sis6shsWTsIWyZZMvO69Z8Nf6rTx8WkNNX7JO7v07
         ord89xOJiK4oYWRrH5Ji7YLTNHH6MSQwaX6v8Z9Idu30G+9HHcggaPSLtXr1ulhhwl
         GV33ULYMx1I8mhp3GQ5rKV6ZuP/tW5BsfqmvZgWjDE+zAVIEx/7JY4vWwxptlay+UA
         TxpqMr+s6lXq3O6LRMmRLHn/TTSVpNcum3XqR502LDLwhrlPtQIZGkJ6ey3bRpLXNu
         d2AW9ixx2/eVNnDa3xJksSilld9BTF8nRjqfbZ3kZL+W1DJbPq1e2KlMbAhogWeplj
         XGwXdufLKXk4g==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1left8-000SCV-DB; Thu, 06 May 2021 17:26:06 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 23/25] media: vsp1: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:26:01 +0200
Message-Id: <8e8ca03fd0dfa1b3245c0ff0201f3cf9a522ede2.1620314616.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620314616.git.mchehab+huawei@kernel.org>
References: <cover.1620314616.git.mchehab+huawei@kernel.org>
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

As a bonus, pm_runtime_resume_and_get() always return 0 on success.
So, the code can be simplified.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/vsp1/vsp1_drv.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/media/platform/vsp1/vsp1_drv.c b/drivers/media/platform/vsp1/vsp1_drv.c
index aa66e4f5f3f3..de442d6c9926 100644
--- a/drivers/media/platform/vsp1/vsp1_drv.c
+++ b/drivers/media/platform/vsp1/vsp1_drv.c
@@ -559,15 +559,7 @@ static int vsp1_device_init(struct vsp1_device *vsp1)
  */
 int vsp1_device_get(struct vsp1_device *vsp1)
 {
-	int ret;
-
-	ret = pm_runtime_get_sync(vsp1->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(vsp1->dev);
-		return ret;
-	}
-
-	return 0;
+	return pm_runtime_resume_and_get(vsp1->dev);
 }
 
 /*
-- 
2.30.2

