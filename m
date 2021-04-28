Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4879236DA77
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 17:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240082AbhD1O4I (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 10:56:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:36738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240342AbhD1Oxm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 10:53:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6398A61874;
        Wed, 28 Apr 2021 14:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619621564;
        bh=73B6Lks3AupUDrJCPSyBZhCBhq2sPf760XjzihM5LGk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jR8X8jJ90tmqUxV1SJiEb4/2UHHiX9/BFfpdXi5zQEHdMMjjKxVJbKdOuMeyrJ52h
         Vxg/Ak0JBYv8kWe/MUdTboD0kM17uVxSKCbPgql+wlkDNiG+L1HxnZ78SIfvUanGo4
         Ba8/tW6zwVRdruCUr8jSJWFxQVhRgEVr0wR62Nk0uPalTUU3QFRQaJ4z/uxLpnc2fg
         4WyIZaxyZS63BL69ofaPX9Sy8sidL1kpwwvaQ31jVnu4xtFMBQaxdtRZCaG+Nfsiwy
         6TUjLx+OGh4EOkSNVuS9w/rIhLnOHtuhp0p3VPyDAZbbi8yVwsvoFmTo5orAlAlk21
         k29FNyRsvUysQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lblYR-001Dsp-H9; Wed, 28 Apr 2021 16:52:43 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v4 67/79] media: venus: vdec: use pm_runtime_resume_and_get()
Date:   Wed, 28 Apr 2021 16:52:28 +0200
Message-Id: <8541040c4b0830bb2c2f015b8c26c890baa5918a.1619621413.git.mchehab+huawei@kernel.org>
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

