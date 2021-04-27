Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F30F36C3B7
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235531AbhD0K3X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:29:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:48256 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237831AbhD0K21 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8752D61419;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519237;
        bh=GlCvanyZeZRx9KVkDMbg84X3Nl/epjQxFII8vak4mR4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YRuN6RmqcFQodREOCRy+jAcix/qZjUy416To91BdxH5zMoHBcQmajEmfcEo6zn/MV
         phXYNvAGOksmNSCVaFYle9I0HA7uZN26uSislFBXRhQwtl22fl/PNT5MnL/c6IDOvg
         DRYKld857KFGysrlb5dBhBZyQ8hsFcWZwmVxc5nE2iJddSdgjGfbxAI4kQGVFQLr6H
         klaPwaqqIHm5czFctc9hMQrrfr+QmZDLzmg/2PyNR9x0qsFnEBoQuEwWsygAqTmciH
         CrkkScMkh9ds1nVM6h72+WHtIEv0DEs8v+ub9VB9d2+s7kRdWLtOIbqNaUwQtdvY0l
         C8xePLL40BXPA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvz-000o2h-Cy; Tue, 27 Apr 2021 12:27:15 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 72/79] media: s5p-mfc: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:27:02 +0200
Message-Id: <828322e0f8b06ef2962b64a6f6f1b368eaecf7a0.1619519080.git.mchehab+huawei@kernel.org>
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

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/s5p-mfc/s5p_mfc_pm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_pm.c b/drivers/media/platform/s5p-mfc/s5p_mfc_pm.c
index 62d2320a7218..88b7d33c9197 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_pm.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_pm.c
@@ -78,11 +78,9 @@ int s5p_mfc_power_on(void)
 {
 	int i, ret = 0;
 
-	ret = pm_runtime_get_sync(pm->device);
-	if (ret < 0) {
-		pm_runtime_put_noidle(pm->device);
+	ret = pm_runtime_resume_and_get(pm->device);
+	if (ret < 0)
 		return ret;
-	}
 
 	/* clock control */
 	for (i = 0; i < pm->num_clocks; i++) {
-- 
2.30.2

