Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A6FF36C3A5
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238308AbhD0K3H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:29:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:48172 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235372AbhD0K2P (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A00306142D;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=73B6Lks3AupUDrJCPSyBZhCBhq2sPf760XjzihM5LGk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Fl9q1iE8eD01tbsHYEKRBJrPiuYXt3bYQA/8ySdxl389pDMPY+XfkkLCJNyMakTUH
         FVzL1mkUOipL3CgBo7DkEmqCzVlCvI4OB/2+6w1u9G3tvr21JGUMESS1Fy6mY6f1Rn
         GXHb16PBtHIUhiAuhasXCta12WJhvDME4nv0tz2yieLoiQn8sjhz8QVlIdBlmMfmFu
         JV3l23Ef3l7DEYI2CcWn5JjMGnWoIJ5/FvYOP2M78BPSZDtnCbGDGI4l1RvCVQO9LY
         vk22S0ah1EQCxe48r+LzsM8s+sKlaCAHWDTDuATsys9Pd54R7BlEhkeHUP92vESLXP
         2MB+psIGAqjtw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvy-000o2S-TO; Tue, 27 Apr 2021 12:27:14 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v3 67/79] media: venus: vdec: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:57 +0200
Message-Id: <ebd340da5076b63f7a1792cc5a8f37f8a82280ce.1619519080.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619519080.git.mchehab+huawei@kernel.org>
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
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

