Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8BFC369F7C
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237123AbhDXGru (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:47:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:36098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233881AbhDXGqV (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AE9596192C;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=phIvrsjCST0hqKSIzsjBL4/Aigr4NLUZL7GWQhPHYlY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cxSFgyYt65X6dvnIBfiw6H7qS2vlKGvcmw4KHyHoUyxWnqX8L9c+gfIXD3Y3m8dbS
         dq3aHWIJJKPyjS/0EPKp/khRcxjQeUxk/p8zK+oVFhiyovvh2SWpWxjkX2nR5CpDwu
         T/0XhtG5aKGyjgo5GsfFENKinn+482sPhk4zhUL91BWV1GmT04j4Ny59LMAEhqy6+V
         CRDBiXpbTc8TPJa9Tq/P+pPrbi/dd4GCBVQg4kPFvY0oE0U2I/3hs2GRn0QkE6HAbW
         Vy55DDXf/pc8LP9gyW7iOVYetsYndvPgXRBxeU5CJdb/k56ofmI75MWWoSSyLrcSvf
         T/hHbv1tgWt3A==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2m-004Jgx-RJ; Sat, 24 Apr 2021 08:45:32 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH 67/78] media: venc: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:45:17 +0200
Message-Id: <382afe29b3e860182d9c09579d11b8884a07414b.1619191723.git.mchehab+huawei@kernel.org>
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

