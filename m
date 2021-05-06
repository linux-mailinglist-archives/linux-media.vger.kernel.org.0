Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0B133756D1
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 17:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235185AbhEFP1q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 11:27:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:40292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235408AbhEFP1V (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 11:27:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8611B61429;
        Thu,  6 May 2021 15:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620314783;
        bh=phIvrsjCST0hqKSIzsjBL4/Aigr4NLUZL7GWQhPHYlY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tdxKa5cYwEQ6T94ThNMaT3jFLY+FMH8PagoQd9awrWrUJoO/vZPhADKNuMccXTmaw
         c5MwmX31i0iju6zrR5apfeq6pzwAhYtvCBoOfcF6KmdAyFNVecARIqEWojWZhAcQGU
         aTXw6XmhynGMcN5Dd1L1K6ihbNMWzMPc3vfeLEt71P51/zhf2suCTJLLBtkDfcXp1D
         b3zynr654g63jxo0HksvHKeWbzfFvJBc64G3HVmZSSIcLFWZ0djAdMYZdzBzw37/CX
         Z3L4qiliiFMMRUIuA4syeWq1rOXcg6MyhgLE2diZxp09AAGZEGXDNamgaFKi9m7NrW
         VKus7H4xA5BeA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1left8-000SBz-4b; Thu, 06 May 2021 17:26:06 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v5 15/25] media: venus: venc: use pm_runtime_resume_and_get()
Date:   Thu,  6 May 2021 17:25:53 +0200
Message-Id: <3253ef1fdb3256642edecc0ad9e6556aa529590b.1620314616.git.mchehab+huawei@kernel.org>
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
 drivers/media/platform/qcom/venus/venc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 4a7291f934b6..8dd49d4f124c 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1205,9 +1205,9 @@ static int venc_open(struct file *file)
 
 	venus_helper_init_instance(inst);
 
-	ret = pm_runtime_get_sync(core->dev_enc);
+	ret = pm_runtime_resume_and_get(core->dev_enc);
 	if (ret < 0)
-		goto err_put_sync;
+		goto err_free;
 
 	ret = venc_ctrl_init(inst);
 	if (ret)
@@ -1252,6 +1252,7 @@ static int venc_open(struct file *file)
 	venc_ctrl_deinit(inst);
 err_put_sync:
 	pm_runtime_put_sync(core->dev_enc);
+err_free:
 	kfree(inst);
 	return ret;
 }
-- 
2.30.2

