Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DE3F2F5CAE
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 09:55:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727567AbhANIzK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 03:55:10 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:11098 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727274AbhANIzK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 03:55:10 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DGdPX5GDBzMKJn;
        Thu, 14 Jan 2021 16:53:04 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Thu, 14 Jan 2021 16:54:14 +0800
From:   Zou Wei <zou_wei@huawei.com>
To:     <stanimir.varbanov@linaro.org>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Zou Wei <zou_wei@huawei.com>
Subject: [PATCH -next] media: venus: Mark bufreq_enc with static keyword
Date:   Thu, 14 Jan 2021 17:05:21 +0800
Message-ID: <1610615121-15340-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix the following sparse warning:

drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c:1242:5: warning: symbol 'bufreq_enc' was not declared. Should it be static?

Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
index 072e349..d43d1a5 100644
--- a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
+++ b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
@@ -1239,8 +1239,8 @@ static int bufreq_dec(struct hfi_plat_buffers_params *params, u32 buftype,
 	return 0;
 }
 
-int bufreq_enc(struct hfi_plat_buffers_params *params, u32 buftype,
-	       struct hfi_buffer_requirements *bufreq)
+static int bufreq_enc(struct hfi_plat_buffers_params *params, u32 buftype,
+		      struct hfi_buffer_requirements *bufreq)
 {
 	enum hfi_version version = params->version;
 	struct enc_bufsize_ops *enc_ops;
-- 
2.6.2

