Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25C253C7EF1
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 09:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238257AbhGNHEm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 03:04:42 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:28488 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238227AbhGNHEj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 03:04:39 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 14 Jul 2021 00:01:46 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 14 Jul 2021 00:01:44 -0700
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 14 Jul 2021 12:31:29 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id D874921B6B; Wed, 14 Jul 2021 12:31:27 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v3 4/7] media: venus: hfi: Skip AON register programming for V6 1pipe
Date:   Wed, 14 Jul 2021 12:31:05 +0530
Message-Id: <1626246068-21023-5-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626246068-21023-1-git-send-email-dikshita@codeaurora.org>
References: <1626246068-21023-1-git-send-email-dikshita@codeaurora.org>
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

