Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69ABE369F78
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244133AbhDXGrn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:47:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:35848 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233643AbhDXGqU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AEB556192D;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=4l0wYnfzYi1h956EsgOdlzJmS/W0qfvo5eSm9fSkn9o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=USUuCZOBa3BJM0Rlnm0VuiglaAPc8nX63S/cp93xtiRUyZS8vKXLAMz1vHGIsPy0m
         wGP38SWGEHcXyByTd5zK5ff1weM/x3diUraesk9W+V6LgfDtZyqSNquS9qMQShmL97
         5ZOlMR7+l0i/X7s7a6YvKZXASNjpN0gCqjwufMGLBxq39ZX8rnD6k3gnPd0cxnWBZy
         sBMtlDTNd0qPEyWnPRe/VBWo1cz9JAdXLSbhnzqIyIycbIlcWSuThmogcTx23s+Kjf
         YFCOhMC5wIB5U4/Ua+PpkzChZfdXsqsSnM8d8Agu0Avm9lvNdy0EIVXcTp2GqK4wQy
         tBgf8lkHkqRXw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2m-004Jh0-SC; Sat, 24 Apr 2021 08:45:32 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 68/78] media: rcar-fcp: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:45:18 +0200
Message-Id: <f5029a01fcf202e5d5be3f33410e50c8f314d031.1619191723.git.mchehab+huawei@kernel.org>
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

