Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0C2436C261
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:13:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235382AbhD0KOf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:14:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:34442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235181AbhD0KOe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D60B9611ED;
        Tue, 27 Apr 2021 10:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518430;
        bh=rRI8k7N4z41xHzK06mi5M7fZFMz4ECEDrJIiREDOdF8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pkiEDdcc+9ZVgINwq7qDhHRDU/jL4TCvY9fmQ5shUJiZGzD3rZxgYoCapv0MIs63/
         +4JjmIbUcQ9bIMj5aIeXeB7z3xF3N6UpPaByjHXXSgha7rTDeBBVMUOLhJfPdbbFRS
         frp0UNVCsZYqiihSJDN0xa9pIAC5OGNKynVqkCV5Ce5W8YDlvyese7RJGuCGpaH0dd
         QC735y/92zi21OcsK2+qVErOT8D1jiKS14QUi0vxAHFs/3eDgAMnxQiqkDuzr/8sIE
         QvZ8WoPM+i96ESapBAzFVvSRkQf3G8ICWXo2IfmyfGo2yrUannRRK3Iy3bQhA4bVdr
         cqR4QZhZMd3Uw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKiy-000j4d-8D; Tue, 27 Apr 2021 12:13:48 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v2 01/79] media: venus: fix PM runtime logic at venus_sys_error_handler()
Date:   Tue, 27 Apr 2021 12:12:28 +0200
Message-Id: <d20ddc17711e66db4b7c30ee3ccb27c7d90a9f43.1619518193.git.mchehab+huawei@kernel.org>
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

The venus_sys_error_handler() assumes that pm_runtime was
able to resume, as it does things like:

	while (pm_runtime_active(core->dev_dec) || pm_runtime_active(core->dev_enc))
		msleep(10);

Well, if, for whatever reason, this won't happen, the routine
won't do what's expected. So, check for the returned error
condition, warning if it returns an error.

Fixes: af2c3834c8ca ("[media] media: venus: adding core part and helper functions")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/qcom/venus/core.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 54bac7ec14c5..fe63b9ab5b20 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -84,7 +84,11 @@ static void venus_sys_error_handler(struct work_struct *work)
 			container_of(work, struct venus_core, work.work);
 	int ret = 0;
 
-	pm_runtime_get_sync(core->dev);
+	ret = pm_runtime_get_sync(core->dev);
+	if (WARN_ON(ret < 0)) {
+		pm_runtime_put_noidle(core->dev);
+		return ret;
+	}
 
 	hfi_core_deinit(core, true);
 
@@ -106,9 +110,13 @@ static void venus_sys_error_handler(struct work_struct *work)
 
 	hfi_reinit(core);
 
-	pm_runtime_get_sync(core->dev);
+	ret = pm_runtime_get_sync(core->dev);
+	if (WARN_ON(ret < 0)) {
+		pm_runtime_put_noidle(core->dev);
+		return ret;
+	}
 
-	ret |= venus_boot(core);
+	ret = venus_boot(core);
 	ret |= hfi_core_resume(core, true);
 
 	enable_irq(core->irq);
-- 
2.30.2

