Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66B5D36DA72
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239793AbhD1O4C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:56:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:36328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240333AbhD1Oxj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D42C6187E;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=phIvrsjCST0hqKSIzsjBL4/Aigr4NLUZL7GWQhPHYlY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gdvwprrGmCeX9kXQHXvOYGnQnavbOW0PZHC7KMOpnoIdLP5ffoTlbrLJ4BOeyVVMj
         43GLtTobvOTqdozdMdkiFkRO0f9u+JohosgHjk3l++HmaOgC3/LI5ccAAxh0vDoqOp
         eZtl3YzZvAakK01oYeSMbYPdjss/dSXWPYTuMqHJdazTTdoj9vSMf8GD68RlRPblZY
         T5rrKQHEptbf4ZGUBprxOy8uCSC873TaR04rHWN9AAiXqTz7myGqu8oLpU1sp+xpFx
         ikiUJUAv9i4VF1BtIn9t7TcrcfMeDkcb7GukVnKxeGQ+9CYUKhIEF3xPJhKT0zmuUd
         rlQGEAqyuuCww==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYR-001Dss-I8; Wed, 28 Apr 2021 16:52:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v4 68/79] media: venus: venc: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:52:29 +0200
Message-Id: <9113ea74fe1cfcdd7c83eaee4c327690ca3744c7.1619621413.git.mchehab+huawei@kernel.org>
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

