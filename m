Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36FAC369F92
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233701AbhDXGsY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:48:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:35848 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237056AbhDXGqg (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C60556193B;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246734;
        bh=2uz7aSLoagaiwsviWYHDbC8DuUarXl/FOpoWTSwsrxw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sfBrwrmBfYoeC9NADSynMCkyG98jkY98bdc7U4ZsBiJMBL/l3I7AXj05SG+lFaNeb
         N3HHg0UA3MzNjy9NihDfITuIcllJEQSuexWw4M/GzulVt9kDVxgfg+2IBOKoA9MZeZ
         0WSFQ6zYWjracMUCPYZi3RyH5VCmOnIW7vVMouweoXMITHFt/F/PHN4gvkgshbn4NO
         Pdmcdzyzy3rtCajmb6GxA+v2QdqHudW2YjLbNtJfLiAZsOwhTHomK2MulB9fX2GV1P
         SHVp5OB6/ZIHXs5xi1tEOLduoMl1u8Un5b+D8AZwvQ9CEbjaOYhk/wqMxUdufAevKz
         8XSCGkTXL5Hdg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2m-004Jgr-PS; Sat, 24 Apr 2021 08:45:32 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH 65/78] media: pm_helpers: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:45:15 +0200
Message-Id: <32f56f8ad0a25a075be28e129eac02bd2424b5ec.1619191723.git.mchehab+huawei@kernel.org>
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
 drivers/media/platform/qcom/venus/pm_helpers.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index c7e1ebec47ee..9e32ec866af7 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -486,7 +486,7 @@ static int poweron_coreid(struct venus_core *core, unsigned int coreid_mask)
 	int ret;
 
 	if (coreid_mask & VIDC_CORE_ID_1) {
-		ret = pm_runtime_get_sync(core->pmdomains[1]);
+		ret = pm_runtime_resume_and_get(core->pmdomains[1]);
 		if (ret < 0)
 			return ret;
 
@@ -504,7 +504,7 @@ static int poweron_coreid(struct venus_core *core, unsigned int coreid_mask)
 	}
 
 	if (coreid_mask & VIDC_CORE_ID_2) {
-		ret = pm_runtime_get_sync(core->pmdomains[2]);
+		ret = pm_runtime_resume_and_get(core->pmdomains[2]);
 		if (ret < 0)
 			return ret;
 
@@ -990,11 +990,9 @@ static int core_power_v4(struct venus_core *core, int on)
 
 	if (on == POWER_ON) {
 		if (pmctrl) {
-			ret = pm_runtime_get_sync(pmctrl);
-			if (ret < 0) {
-				pm_runtime_put_noidle(pmctrl);
+			ret = pm_runtime_resume_and_get(pmctrl);
+			if (ret < 0)
 				return ret;
-			}
 		}
 
 		ret = core_resets_reset(core);
-- 
2.30.2

