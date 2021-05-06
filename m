Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 075843756D3
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:26:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235424AbhEFP1u (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:27:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:40272 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235286AbhEFP1V (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:27:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 78F5361629;
        Thu,  6 May 2021 15:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314783;
        bh=dPmLZXkUMmELV8jfB7++9sSwF5IaiES5o+6MkCMTBxU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hpB0Kk9121Udvt5fdaJqXL+zE/SnGiWtYZZvDtzpGw9PGfR/ociAObNQe/dPqX04T
         SJIpSfFP5w4Y6Ai61vHuoLnry5fwfaIOnBlxX6JQ+vV9amhBVXCPXJ5cRV1D4hSoX+
         tYWCz+CaKh4d2ECF9guBEEjKhc3GkeAYTy+d3YsqWRYK1L2nlo8qz42rFzyhIeJAcS
         SzhYzn31cV/D47Fhg95jVVnEgs4oebocLgXZJ8CFm6pVQPkU6dFMxKy0jYcAfTQUz5
         FaSulCwcSS4sd0Wpj9y0le9jwfUwDZ0WDQ/UjyaxCx7nhMkJUm+EXpgYY0ZE2bPFtD
         OWLhPXqqNvKNA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1left8-000SBr-2V; Thu, 06 May 2021 17:26:06 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v5 13/25] media: venus: core: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:25:51 +0200
Message-Id: <492e148ae1c7b0a8858c1670037925d3e4adb719.1620314616.git.mchehab+huawei@kernel.org>
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

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index c7e1ebec47ee..d0fddf5e9a69 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -990,9 +990,8 @@ static int core_power_v4(struct venus_core *core, int on)
 
 	if (on == POWER_ON) {
 		if (pmctrl) {
-			ret = pm_runtime_get_sync(pmctrl);
+			ret = pm_runtime_resume_and_get(pmctrl);
 			if (ret < 0) {
-				pm_runtime_put_noidle(pmctrl);
 				return ret;
 			}
 		}
-- 
2.30.2

