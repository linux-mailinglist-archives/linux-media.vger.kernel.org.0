Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCBBD36C3AA
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 12:29:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238358AbhD0K3M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 06:29:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:48288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237270AbhD0K2T (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 06:28:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A2676142A;
        Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619519236;
        bh=phIvrsjCST0hqKSIzsjBL4/Aigr4NLUZL7GWQhPHYlY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pAB0gi60sdZ9uYUw3agDuR9ReaHY+Z7UzbIXDbL2xV9MXGbg6lcJzDK7yQbtRT8tz
         AETzY51R4DOm2qb5wHrqf8qTnDen3mBfPHoGPhdQSe7VfRtwOZpDi9H1n3MdKyHC0F
         lbqsFUmuFWmR5oDnRXXCyRQswjJp08X4HB/p/cnMZwSSqHCofsfd6+OnP1zNAf2zhR
         g3xZtqfOXc61u2q6KL47/h0POI8SR/CgbvDoC+SRiCwg9MPBPlB8fDmYK5ZWA3LdJi
         h8hiYOLRPEZ97SaBJdy2UfeaqJfbE6vdPxBuVvwvsIQ6v4qN+EOQghS2gNQ+Iy5UjV
         dkmQC2Utz3bMw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lbKvy-000o2V-WA; Tue, 27 Apr 2021 12:27:15 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH v3 68/79] media: venus: venc: use pm_runtime_resume_and_get()
Date:   Tue, 27 Apr 2021 12:26:58 +0200
Message-Id: <ba311b79afe835f10f22e16587fdcf5df9c4ff61.1619519080.git.mchehab+huawei@kernel.org>
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

