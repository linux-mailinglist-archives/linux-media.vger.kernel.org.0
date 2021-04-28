Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5613C36DA0A
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:04:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240335AbhD1Oxk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:53:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:36036 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240273AbhD1Ox3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D64186144F;
        Wed, 28 Apr 2021 14:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621563;
        bh=/e5UeIJiSAmhayjaD9UYfjSrnpizVQ2PnDpNxKl2/+A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pMN1K3liRSwW6W6y4qzewh26smVEeslMpnN3VT0ai04gqK5tptyFlY8VanvZxS+f1
         9aSU4qMljwbCudLdlVx+EML5ufIgov5/Jy7uNJalxSsJgshwoRxnKVDcDfl1oLMh5i
         8ZcSE2EncsLqqjlpCSEMH0ASNp+2pBwX6IJ9tOWDVBWYtv0h49dTHLBUlGftp1Tyq2
         dQZ4Fqx3u25GQpBxv7Z7pbB1yMwITCKZliqjhkyhfAIyqGZ3GRAkRhTN8hK7qeAiJv
         nfS0DHF+xr4izJkZQgqx6kogF/xptm0d9UVpe9QwAQDc3eigo1F/Lj9Zp+h7c84ux8
         xxP1DTxCESvTg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYP-001Dpd-Id; Wed, 28 Apr 2021 16:52:41 +0200
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
Subject: [PATCH v4 01/79] media: venus: fix PM runtime logic at venus_sys_error_handler()
Date:   Wed, 28 Apr 2021 16:51:22 +0200
Message-Id: <6d463d21f0dd55c3d84db0458c7a5c4e0d7c5bc1.1619621413.git.mchehab+huawei@kernel.org>
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
index 54bac7ec14c5..c80c27c87ccc 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -84,7 +84,11 @@ static void venus_sys_error_handler(struct work_struct *work)
 			container_of(work, struct venus_core, work.work);
 	int ret = 0;
 
-	pm_runtime_get_sync(core->dev);
+	ret = pm_runtime_get_sync(core->dev);
+	if (WARN_ON(ret < 0)) {
+		pm_runtime_put_noidle(core->dev);
+		return;
+	}
 
 	hfi_core_deinit(core, true);
 
@@ -106,9 +110,13 @@ static void venus_sys_error_handler(struct work_struct *work)
 
 	hfi_reinit(core);
 
-	pm_runtime_get_sync(core->dev);
+	ret = pm_runtime_get_sync(core->dev);
+	if (WARN_ON(ret < 0)) {
+		pm_runtime_put_noidle(core->dev);
+		return;
+	}
 
-	ret |= venus_boot(core);
+	ret = venus_boot(core);
 	ret |= hfi_core_resume(core, true);
 
 	enable_irq(core->irq);
-- 
2.30.2

