Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CAD1378E72
	for <lists+linux-media@lfdr.de>; Mon, 10 May 2021 15:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240573AbhEJNS0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 May 2021 09:18:26 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:2616 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244589AbhEJL7c (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 May 2021 07:59:32 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FdzzM1jNgzmVHH;
        Mon, 10 May 2021 19:56:15 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Mon, 10 May 2021 19:58:19 +0800
From:   Zhen Lei <thunder.leizhen@huawei.com>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
CC:     Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] media: venus: helpers: Delete an unneeded bool conversion
Date:   Mon, 10 May 2021 19:57:52 +0800
Message-ID: <20210510115752.3580-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The result of an expression consisting of a single relational operator is
already of the bool type and does not need to be evaluated explicitly.

No functional change.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/media/platform/qcom/venus/helpers.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index b813d6dba481794..46ae1faf63ed4cb 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -595,8 +595,7 @@ static int platform_get_bufreq(struct venus_inst *inst, u32 buftype,
 		params.dec.is_secondary_output =
 			inst->opb_buftype == HFI_BUFFER_OUTPUT2;
 		params.dec.is_interlaced =
-			inst->pic_struct != HFI_INTERLACE_FRAME_PROGRESSIVE ?
-				true : false;
+			inst->pic_struct != HFI_INTERLACE_FRAME_PROGRESSIVE;
 	} else {
 		params.width = inst->out_width;
 		params.height = inst->out_height;
-- 
2.26.0.106.g9fadedd


