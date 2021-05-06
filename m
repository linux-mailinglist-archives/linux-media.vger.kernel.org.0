Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04EE83756D2
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235486AbhEFP1s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:27:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:40264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235389AbhEFP1V (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:27:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 762A96186A;
        Thu,  6 May 2021 15:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314783;
        bh=sxC12P0hnHwRHaQLQ482WLbW7rqubC4RWbxVsfXWuSs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eHTLUPtDDE2mD+6hY1J/wgIMGtSZIi5NYxe3bb8HK/RXzClD1ouknwGUcCZpbHAg5
         RIgwlXQTNYJ+7I6DKozm52oAqRyvcOKaoEMSOatXYnSZk5ZHHacP5KencyNmyZxT/c
         O1EPuNvNKJMNs3vb3lnh8NoKQPGj1W64rxdHoWAspWI7tBoPOlzPirJ0aoDq//e5Fh
         s9xGCIdvLPHCiWhHy3idxxSU8WFWlk89IHM7p6rlQ00FlMmKs0P7eIWo3Hel1fFfjh
         I3dHlMFdg8yBUxn6arWCOgR6Gqsmb7GSQaxeMKNnK9ffd4P+sJQipXLRiWJjzeJ/rr
         3XVYbfqUlDZiw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1left8-000SC3-5e; Thu, 06 May 2021 17:26:06 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 16/25] media: rcar-fcp: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:25:54 +0200
Message-Id: <256365d690c780e9e89cba369ebaac805f0ec256.1620314616.git.mchehab+huawei@kernel.org>
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
 drivers/media/platform/rcar-fcp.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/media/platform/rcar-fcp.c b/drivers/media/platform/rcar-fcp.c
index 5c03318ae07b..a3a7afc03d7b 100644
--- a/drivers/media/platform/rcar-fcp.c
+++ b/drivers/media/platform/rcar-fcp.c
@@ -101,13 +101,7 @@ int rcar_fcp_enable(struct rcar_fcp_device *fcp)
 	if (!fcp)
 		return 0;
 
-	ret = pm_runtime_get_sync(fcp->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(fcp->dev);
-		return ret;
-	}
-
-	return 0;
+	return pm_runtime_resume_and_get(fcp->dev);
 }
 EXPORT_SYMBOL_GPL(rcar_fcp_enable);
 
-- 
2.30.2

