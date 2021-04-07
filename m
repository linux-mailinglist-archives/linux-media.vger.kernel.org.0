Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51EB4356E30
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 16:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352785AbhDGOKV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 10:10:21 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:42993 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235710AbhDGOKS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Apr 2021 10:10:18 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lU8se-00029E-Ox; Wed, 07 Apr 2021 14:10:04 +0000
From:   Colin King <colin.king@canonical.com>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: venus: hfi,pm,firmware: Fix dereference before null check on hdev
Date:   Wed,  7 Apr 2021 15:10:04 +0100
Message-Id: <20210407141004.495093-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer hdev is being dereferenced twice on the assignment of
pointers cpu_cs_base and wrapper_base before hdev is being null
checked.  Fix the potential null pointer dereference issues by
performing the null check of hdev before dereferencing it when
assigning cpu_cs_base and wrapper_base.

Addresses-Coverity: ("Dereference before null check")
Fixes: ff2a7013b3e6 ("media: venus: hfi,pm,firmware: Convert to block relative addressing")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index cebb20cf371f..3eabb2646572 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1094,12 +1094,14 @@ static irqreturn_t venus_isr(struct venus_core *core)
 {
 	struct venus_hfi_device *hdev = to_hfi_priv(core);
 	u32 status;
-	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
-	void __iomem *wrapper_base = hdev->core->wrapper_base;
+	void __iomem *cpu_cs_base, *wrapper_base;
 
 	if (!hdev)
 		return IRQ_NONE;
 
+	cpu_cs_base = hdev->core->cpu_cs_base;
+	wrapper_base = hdev->core->wrapper_base;
+
 	status = readl(wrapper_base + WRAPPER_INTR_STATUS);
 	if (IS_V6(core)) {
 		if (status & WRAPPER_INTR_STATUS_A2H_MASK ||
-- 
2.30.2

