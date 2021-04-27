Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E90A936C3A1
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:29:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238285AbhD0K3F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:29:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:48152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235777AbhD0K2M (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B0DA6141D;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=4l0wYnfzYi1h956EsgOdlzJmS/W0qfvo5eSm9fSkn9o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OgcqVxZPSgZY7w2zf8AmOvN23IiVtNmHB0YnDlrUO11w4OUcFW7xpl14zNN3ExSWK
         dLxQgyBtbZ79yz8XwJt1UHId/8CNpQPc3urkAieF/tMtUo8BgyrnCDvYJY5QuFr3pM
         WGiO6sU7NfgoLkkYw4gwdlXLfz8ym4BB+GJBQWdZLmepKvlveH+YED92kXRrZhWvHG
         YuDZlkb4QoDymTVgSrY1YYQTk6DsoXSIySWrO7/JdBjxsdnld9sOztceHLI0mzwgqg
         hyO4fRQhg1f98yyMXxN9yxy4r2Jd2ky0zZu2Ktedyz0acVbS8i41MnnBIS/0pCCUD/
         1u6AdDcgUsrTA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvz-000o2Y-5O; Tue, 27 Apr 2021 12:27:15 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 69/79] media: rcar-fcp: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:59 +0200
Message-Id: <912eebdb622ebcf20c7c8887ee68b9e5a5201cce.1619519080.git.mchehab+huawei@kernel.org>
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

