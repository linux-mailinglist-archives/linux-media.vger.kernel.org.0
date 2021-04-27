Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 295EA36C2DE
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237845AbhD0KQg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:16:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:34866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235756AbhD0KPK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:15:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B99CA61950;
        Tue, 27 Apr 2021 10:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518433;
        bh=GlCvanyZeZRx9KVkDMbg84X3Nl/epjQxFII8vak4mR4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=P7VHtJ1uz+zwh3J3M1NM5EyiiQiU7ulWuh6jsYSo4+uOq3SQPWkq6fTPen1pJxPic
         XZge+aium9DyPjVn3aej1TacFAGCKB/FO9CcYC07k++TYdVTQh7KU6eQQ4d+PhW93B
         5gMrFDssm24BeJuEEqie/LZvrpP7n6EXOeLMYhA8Fx9fsL3BdtbjA2IIIFpQwTgbgh
         oKvL7XFQagk8hlDPOtpjI9DKVFvWT8oo/TTcrRJb+PF3xxhCEGiARki4QhTm6ZH3b3
         5cMKb/weT7SG3Z6pUFWZdavFIDTTmn8GD5u3QsTVfWHV2bjnpwCt/5vhKstSwtWr1e
         4Jx9w0iYp2OZQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKj1-000j84-W0; Tue, 27 Apr 2021 12:13:52 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 72/79] media: s5p-mfc: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:13:39 +0200
Message-Id: <1b06b8e70c547f8bba0c154488f9f8a8013a0ea4.1619518193.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619518193.git.mchehab+huawei@kernel.org>
References: <cover.1619518193.git.mchehab+huawei@kernel.org>
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

