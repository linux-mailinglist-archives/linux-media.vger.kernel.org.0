Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C95E73756DE
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235188AbhEFP16 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:27:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:40890 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235345AbhEFP1m (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:27:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id ACD2761945;
        Thu,  6 May 2021 15:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314783;
        bh=XiSP3/24jja7D1fvW27PSrj42vwBN2cevKcytsQfGlM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lNAHtTBtk4Sxw5wcJw0KYTXERMqgLFWoQE0hpgLMXdT3EtYgj6LWxpeJLJvnqBcGv
         yg5y2HWZbYQqXp/Dj75A6iASbsC3xqwJdaIl+VBxHZBcCOaD4tdvBp86S1JtVKEy3Q
         YWhKGbrxCwtLMvTfyp6IeZmlFGxITTE8MGEVNG/T5bVStq/gEh/Eh8D2cLdwcBAJ8E
         WcRqXcGmPmbkg5J1plO0SpiD0Fv1loZMhqgoO6m7R3IyRoblmWfP5ATLtEPqg7XaHq
         x3g9tYt0y6G99Qvr7oNPbmGvl/dSfLdehNY31aVorwsPBhJ38pSA/2MLZHOWVUP1QN
         uD1uchs5h2/nw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1left8-000SBv-3b; Thu, 06 May 2021 17:26:06 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v5 14/25] media: venus: vdec: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:25:52 +0200
Message-Id: <76b4daa74ae49576d37235916d687c36991351eb.1620314616.git.mchehab+huawei@kernel.org>
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

As a bonus, there's no need to check if ret == 1, as
pm_runtime_resume_and_get() always return 0 on success.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index ddb7cd39424e..198e47eb63f4 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -568,10 +568,10 @@ static int vdec_pm_get(struct venus_inst *inst)
 	int ret;
 
 	mutex_lock(&core->pm_lock);
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	mutex_unlock(&core->pm_lock);
 
-	return ret < 0 ? ret : 0;
+	return ret;
 }
 
 static int vdec_pm_put(struct venus_inst *inst, bool autosuspend)
@@ -601,7 +601,7 @@ static int vdec_pm_get_put(struct venus_inst *inst)
 	mutex_lock(&core->pm_lock);
 
 	if (pm_runtime_suspended(dev)) {
-		ret = pm_runtime_get_sync(dev);
+		ret = pm_runtime_resume_and_get(dev);
 		if (ret < 0)
 			goto error;
 
-- 
2.30.2

