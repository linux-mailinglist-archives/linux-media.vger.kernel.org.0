Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 447983E576F
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 11:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239303AbhHJJtJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 05:49:09 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:22844 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238814AbhHJJsw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 05:48:52 -0400
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 10 Aug 2021 02:48:29 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 10 Aug 2021 02:48:27 -0700
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg02-blr.qualcomm.com with ESMTP; 10 Aug 2021 15:18:13 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id D5F3921CA3; Tue, 10 Aug 2021 15:18:12 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v4 4/7] media: venus: hfi: Skip AON register programming for V6 1pipe
Date:   Tue, 10 Aug 2021 15:17:52 +0530
Message-Id: <1628588875-23790-5-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1628588875-23790-1-git-send-email-dikshita@codeaurora.org>
References: <1628588875-23790-1-git-send-email-dikshita@codeaurora.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

AON register programming is used to set NOC to low
power mode during V6 power off sequence. However
AON register memory map is not applicable to 1pipe,
hence skipping AON register programming.

Co-developed-by: Mansur Alisha Shaik <mansur@codeaurora.org>
Co-developed-by: Vikash Garodia <vgarodia@codeaurora.org>
Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index ce98c52..3a75a27 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -551,6 +551,9 @@ static int venus_halt_axi(struct venus_hfi_device *hdev)
 	if (IS_V6(hdev->core)) {
 		writel(0x3, cpu_cs_base + CPU_CS_X2RPMH_V6);
 
+		if (hdev->core->res->num_vpp_pipes == 1)
+			goto skip_aon_mvp_noc;
+
 		writel(0x1, aon_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
 		ret = readl_poll_timeout(aon_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
 					 val,
@@ -560,6 +563,7 @@ static int venus_halt_axi(struct venus_hfi_device *hdev)
 		if (ret)
 			return -ETIMEDOUT;
 
+skip_aon_mvp_noc:
 		mask_val = (BIT(2) | BIT(1) | BIT(0));
 		writel(mask_val, wrapper_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL_V6);
 
-- 
2.7.4

