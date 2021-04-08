Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5ECB357D79
	for <lists+linux-media@lfdr.de>; Thu,  8 Apr 2021 09:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230302AbhDHHk0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Apr 2021 03:40:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:53600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229566AbhDHHkT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Apr 2021 03:40:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 589A461155;
        Thu,  8 Apr 2021 07:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617867608;
        bh=K40uSsuCJ5wtmzix6+AZWZGkHxgr6P49paxJVnSNP8E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LzSMqZbJsrAmXiB+7CKXvwOFpqF4CVz6an0EEj36Ih0xR2jiYTaojdaU+/Aue4MmP
         ZDhIH3CV2U1lx1GxNCdfNDq5xHeSydqeZFF9gHACf6D2/NBZZoTN4lL2HQHursLwzF
         2gAM3GR38yiTcJscrsXzIZK0FEWPWz55pqsnP86depi/5jL1/pLoAZCqo8ZrQJVDBK
         4EmKNozUE8+KX1kCEwvKDmiiFHJCPht0VUUwzPZQo7A2+tIXf6zL3RLxMnMHTow+Pl
         W4zOBo0XwwwE9amJ5udA9p/+Ooen+obokCNtdypjlFscmm+gQ0XIxJ406FGj5dHIrU
         XYziezcGuPivQ==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lUPGo-000jU2-0N; Thu, 08 Apr 2021 09:40:06 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: [PATCH 3/3] media: venus: don't de-reference NULL pointers at IRQ time
Date:   Thu,  8 Apr 2021 09:40:04 +0200
Message-Id: <73570a5dfe7b3411d256367d4a2a02169aa9b900.1617867599.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <b6f139947e93fec1ade5faf3517dfb2b3b9bcd41.1617867599.git.mchehab+huawei@kernel.org>
References: <b6f139947e93fec1ade5faf3517dfb2b3b9bcd41.1617867599.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Smatch is warning that:
	drivers/media/platform/qcom/venus/hfi_venus.c:1100 venus_isr() warn: variable dereferenced before check 'hdev' (see line 1097)

The logic basically does:
	hdev = to_hfi_priv(core);

with is translated to:
	hdev = core->priv;

If the IRQ code can receive a NULL pointer for hdev, there's
a bug there, as it will first try to de-reference the pointer,
and then check if it is null.

After looking at the code, it seems that this indeed can happen:
Basically, the venus IRQ thread is started with:
	devm_request_threaded_irq()
So, it will only be freed after the driver unbinds.

In order to prevent the IRQ code to work with freed data,
the logic at venus_hfi_destroy() sets core->priv to NULL,
which would make the IRQ code to ignore any pending IRQs.

There is, however a race condition, as core->priv is set
to NULL only after being freed. So, we need also to move the
core->priv = NULL to happen earlier.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index cebb20cf371f..ce98c523b3c6 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1094,12 +1094,15 @@ static irqreturn_t venus_isr(struct venus_core *core)
 {
 	struct venus_hfi_device *hdev = to_hfi_priv(core);
 	u32 status;
-	void __iomem *cpu_cs_base = hdev->core->cpu_cs_base;
-	void __iomem *wrapper_base = hdev->core->wrapper_base;
+	void __iomem *cpu_cs_base;
+	void __iomem *wrapper_base;
 
 	if (!hdev)
 		return IRQ_NONE;
 
+	cpu_cs_base = hdev->core->cpu_cs_base;
+	wrapper_base = hdev->core->wrapper_base;
+
 	status = readl(wrapper_base + WRAPPER_INTR_STATUS);
 	if (IS_V6(core)) {
 		if (status & WRAPPER_INTR_STATUS_A2H_MASK ||
@@ -1650,10 +1653,10 @@ void venus_hfi_destroy(struct venus_core *core)
 {
 	struct venus_hfi_device *hdev = to_hfi_priv(core);
 
+	core->priv = NULL;
 	venus_interface_queues_release(hdev);
 	mutex_destroy(&hdev->lock);
 	kfree(hdev);
-	core->priv = NULL;
 	core->ops = NULL;
 }
 
-- 
2.30.2

