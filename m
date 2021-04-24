Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B94C369F77
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 08:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244109AbhDXGrk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 02:47:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:35772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233614AbhDXGqT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 02:46:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A8C7F61929;
        Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619246733;
        bh=73B6Lks3AupUDrJCPSyBZhCBhq2sPf760XjzihM5LGk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TGz2XCF1NBN5v9sRqR1k/Cdld7bRC9Vf+FjW+LutJNOgASes5u5gXs8T9cDHMos6S
         E3S1wOKCu4N0yFoky6K/LoXIQzj4qV3TiqbxX0+YJsTRdaZZLuZk9WYxMSelsH0Heb
         n5H7KrmjeD+wBRj9DrdKQu/VlROMxUnhNEDbzAmXdTUz02eucF3KaktGGts3z6n9ac
         s6l7dacgoXBPyx5EgOR0gfyWvD3cTXDUoLx2sp7AGE7UbraRWRhYMUm7uWOIk+Ryke
         1aaDMBwB4rzZ85FdeeY80pNRHKvqJdUhcSlIjI3FE1AOruUpl1U7pddB4RsiVMjFTu
         DCcSs/MAsQagg==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1laC2m-004Jgu-QO; Sat, 24 Apr 2021 08:45:32 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH 66/78] media: vdec: use pm_runtime_resume_and_get()
Date:   Sat, 24 Apr 2021 08:45:16 +0200
Message-Id: <c249995bc8e2354f50ff06cab0dcb355760c5c47.1619191723.git.mchehab+huawei@kernel.org>
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

