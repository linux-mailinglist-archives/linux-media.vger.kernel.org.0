Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2509A3BE3DA
	for <lists+linux-media@lfdr.de>; Wed,  7 Jul 2021 09:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231162AbhGGHs0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Jul 2021 03:48:26 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:10283 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230356AbhGGHsZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Jul 2021 03:48:25 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4GKWYB0WKYz1CGDj;
        Wed,  7 Jul 2021 15:40:14 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 7 Jul 2021 15:45:36 +0800
Received: from thunder-town.china.huawei.com (10.174.179.0) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 7 Jul 2021 15:45:35 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH 1/1] media: venus: hfi: fix return value check in sys_get_prop_image_version()
Date:   Wed, 7 Jul 2021 15:45:17 +0800
Message-ID: <20210707074517.2775-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.179.0]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In case of error, the function qcom_smem_get() returns ERR_PTR()
and never returns NULL. The NULL test in the return value check
should be replaced with IS_ERR().

Fixes: d566e78dd6af ("media: venus : hfi: add venus image info into smem")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/media/platform/qcom/venus/hfi_msgs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.c b/drivers/media/platform/qcom/venus/hfi_msgs.c
index d9fde66f6fa8..9a2bdb002edc 100644
--- a/drivers/media/platform/qcom/venus/hfi_msgs.c
+++ b/drivers/media/platform/qcom/venus/hfi_msgs.c
@@ -261,7 +261,7 @@ sys_get_prop_image_version(struct device *dev,
 
 	smem_tbl_ptr = qcom_smem_get(QCOM_SMEM_HOST_ANY,
 		SMEM_IMG_VER_TBL, &smem_blk_sz);
-	if (smem_tbl_ptr && smem_blk_sz >= SMEM_IMG_OFFSET_VENUS + VER_STR_SZ)
+	if (!IS_ERR(smem_tbl_ptr) && smem_blk_sz >= SMEM_IMG_OFFSET_VENUS + VER_STR_SZ)
 		memcpy(smem_tbl_ptr + SMEM_IMG_OFFSET_VENUS,
 		       img_ver, VER_STR_SZ);
 }
-- 
2.25.1


