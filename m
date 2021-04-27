Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9611736C2D7
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:16:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235453AbhD0KQ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:16:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:35230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235648AbhD0KO5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:14:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 783856193E;
        Tue, 27 Apr 2021 10:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619518433;
        bh=73B6Lks3AupUDrJCPSyBZhCBhq2sPf760XjzihM5LGk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LNaehuD9JL4nqBubNhvLrPbf5J1CSN6dWfCnz1EQzrzNAA0Tx0IROSrYfl+slfsop
         enTk1twl3CduQlgCpYUvrdPfnca3pFdlOo50REg5O0ONgKDIuWnUYOVKQPmD7IvrFc
         ksGL/TgoNbcEgChXyXxi7i0inXCEomz5wTogxgj279hB1ZOH/YT9Hdj7qR0d7E1Wg+
         9FVUW5pgTww6tpbf/qCZr0DpgT+Ry5TFchNwpDOvNuWBZ1azjnHKFj9acOPfiL1GUo
         w42tWSfQYsz+ccnpqH2N0x3bUXXMMlBOXQ90ire7MiqkKT73+CUj8HAJLgEQaIvjgE
         z4jYExZg8rsew==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKj1-000j7p-NZ; Tue, 27 Apr 2021 12:13:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v2 67/79] media: venus: vdec: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:13:34 +0200
Message-Id: <dd5a24fa7357e69f671a8c8bc719ef98122c85c7.1619518193.git.mchehab+huawei@kernel.org>
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

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/qcom/venus/vdec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index ddb7cd39424e..347e533ea673 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -568,7 +568,7 @@ static int vdec_pm_get(struct venus_inst *inst)
 	int ret;
 
 	mutex_lock(&core->pm_lock);
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	mutex_unlock(&core->pm_lock);
 
 	return ret < 0 ? ret : 0;
@@ -601,7 +601,7 @@ static int vdec_pm_get_put(struct venus_inst *inst)
 	mutex_lock(&core->pm_lock);
 
 	if (pm_runtime_suspended(dev)) {
-		ret = pm_runtime_get_sync(dev);
+		ret = pm_runtime_resume_and_get(dev);
 		if (ret < 0)
 			goto error;
 
-- 
2.30.2

