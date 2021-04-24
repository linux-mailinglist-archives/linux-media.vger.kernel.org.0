Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09F44369F58
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237353AbhDXGqz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:46:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:35850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233114AbhDXGqO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D4336162E;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=m64ImWemcDvzoxNs/RTwo1kfQAMDPhZ/gqUqkdvzLdQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=stcu5bVIYFAopogZn2iuHhrvCzbn/FwqKsmEN5LeAF8k5TEaleUZc0QBlBCkRDq/s
         CXsIOUSc7iSCUp0HN4wx6YYFjzGGmjpy4Cfiw0MVBSYaDbCaMcWDaLynlFihQEwfhp
         98OGauaQaYZX3+wHXZJXw5p6kBLj47T0xMpNLbPCZ/nOZlmU2OI3L1MbFft0ZZz0nQ
         kE+fpFkNSTryUthc8vkf9buV0fIAzyB7U/KHNH1y3lcppI/wSMmBM7RHJwK0CUanHh
         K0FKOT2sC+Sy9gIeQoxBPmAXNoNJMmWKeH7U+lPXRVll47zLZL+fdw7vH/5KCfNPvo
         K8T4dPPicO4kg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2l-004Jem-Gq; Sat, 24 Apr 2021 08:45:31 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 22/78] media: delta-v4l2: fix pm_runtime_get_sync() usage count
Date:   Sat, 24 Apr 2021 08:44:32 +0200
Message-Id: <daf1905dd8afe2b098ac2155c8ddf456c0fb53a7.1619191723.git.mchehab+huawei@kernel.org>
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

The pm_runtime_get_sync() internally increments the
dev->power.usage_count without decrementing it, even on errors.
replace it by the new pm_runtime_resume_and_get(), introduced by:
commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
in order to properly decrement the usage counter and avoid memory
leaks.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/sti/delta/delta-v4l2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/sti/delta/delta-v4l2.c b/drivers/media/platform/sti/delta/delta-v4l2.c
index c691b3d81549..9928b7c46a41 100644
--- a/drivers/media/platform/sti/delta/delta-v4l2.c
+++ b/drivers/media/platform/sti/delta/delta-v4l2.c
@@ -1277,9 +1277,9 @@ int delta_get_sync(struct delta_ctx *ctx)
 	int ret = 0;
 
 	/* enable the hardware */
-	ret = pm_runtime_get_sync(delta->dev);
+	ret = pm_runtime_resume_and_get(delta->dev);
 	if (ret < 0) {
-		dev_err(delta->dev, "%s pm_runtime_get_sync failed (%d)\n",
+		dev_err(delta->dev, "%s pm_runtime_resume_and_get failed (%d)\n",
 			__func__, ret);
 		return ret;
 	}
-- 
2.30.2

