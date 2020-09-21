Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE76E2724FD
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 15:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727287AbgIUNND (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 09:13:03 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:42862 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727333AbgIUNK3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 09:10:29 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 6D98A98597102B4C0E92;
        Mon, 21 Sep 2020 21:10:23 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Mon, 21 Sep 2020 21:10:14 +0800
From:   Qinglang Miao <miaoqinglang@huawei.com>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Qinglang Miao <miaoqinglang@huawei.com>
Subject: [PATCH -next] media: venus: simplify the return expression of session_process_buf()
Date:   Mon, 21 Sep 2020 21:10:38 +0800
Message-ID: <20200921131038.92204-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplify the return expression.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/media/platform/qcom/venus/helpers.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 50439eb1f..fb3fd3640 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -439,7 +439,6 @@ session_process_buf(struct venus_inst *inst, struct vb2_v4l2_buffer *vbuf)
 	struct vb2_buffer *vb = &vbuf->vb2_buf;
 	unsigned int type = vb->type;
 	struct hfi_frame_data fdata;
-	int ret;
 
 	memset(&fdata, 0, sizeof(fdata));
 	fdata.alloc_len = buf->size;
@@ -470,11 +469,7 @@ session_process_buf(struct venus_inst *inst, struct vb2_v4l2_buffer *vbuf)
 		fdata.offset = 0;
 	}
 
-	ret = hfi_session_process_buf(inst, &fdata);
-	if (ret)
-		return ret;
-
-	return 0;
+	return hfi_session_process_buf(inst, &fdata);
 }
 
 static bool is_dynamic_bufmode(struct venus_inst *inst)
-- 
2.23.0

