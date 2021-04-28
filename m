Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD3A236DA7B
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240832AbhD1O4L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:56:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:36302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240337AbhD1Oxk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7733D6190A;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=4l0wYnfzYi1h956EsgOdlzJmS/W0qfvo5eSm9fSkn9o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LS7lJazoXxsIKyL+I6TS6vwLsLg+OzZMVSxxrR43e+Q08hbI5Cuxr3LF/P+eaNkYe
         25e/6trmYAvtspxriXHlbHCbG3l6DVe63jgYpL9Yw37ZgWIWf10m76oSwsVF46aTum
         1mClhV8bf3gi2T76HkTlzMRpSj7zgYko73txGGO3GGuVK5J5jc7k+VjCF5wA72B6BJ
         j8phuIfy0JPABIe5lNaBtrBaH2berxlb1HlE3K5iawCC3NA0qXMozU9rBiNMER3ZeN
         By+7YZsFtO0Xabn9eFz7ewsWWQB/2u6lXjYuKeZ4cqXV64pRBrryJHvYUiS5S27+gv
         EgfbZZ0qfWLdw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYR-001Dsv-JE; Wed, 28 Apr 2021 16:52:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 69/79] media: rcar-fcp: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:52:30 +0200
Message-Id: <770d9e4587c3b9dbb8b2e34f9a4a5ca5ee4209bc.1619621413.git.mchehab+huawei@kernel.org>
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

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/rcar-fcp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/rcar-fcp.c b/drivers/media/platform/rcar-fcp.c
index 5c03318ae07b..de76af58013c 100644
--- a/drivers/media/platform/rcar-fcp.c
+++ b/drivers/media/platform/rcar-fcp.c
@@ -101,11 +101,9 @@ int rcar_fcp_enable(struct rcar_fcp_device *fcp)
 	if (!fcp)
 		return 0;
 
-	ret = pm_runtime_get_sync(fcp->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(fcp->dev);
+	ret = pm_runtime_resume_and_get(fcp->dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	return 0;
 }
-- 
2.30.2

