Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2F35144EB
	for <lists+linux-media@lfdr.de>; Mon,  6 May 2019 09:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbfEFHDb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 May 2019 03:03:31 -0400
Received: from mxhk.zte.com.cn ([63.217.80.70]:40984 "EHLO mxhk.zte.com.cn"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725710AbfEFHDb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 6 May 2019 03:03:31 -0400
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
        by Forcepoint Email with ESMTPS id 678822367F41339C650A;
        Mon,  6 May 2019 15:03:29 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
        by mse-fl1.zte.com.cn with ESMTP id x4673Pko021643;
        Mon, 6 May 2019 15:03:25 +0800 (GMT-8)
        (envelope-from wen.yang99@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
          by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
          with ESMTP id 2019050615032919-10027948 ;
          Mon, 6 May 2019 15:03:29 +0800 
From:   Wen Yang <wen.yang99@zte.com.cn>
To:     linux-kernel@vger.kernel.org
Cc:     wang.yi59@zte.com.cn, Wen Yang <wen.yang99@zte.com.cn>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/4] media: venus: firmware: fix leaked of_node references
Date:   Mon, 6 May 2019 15:05:15 +0800
Message-Id: <1557126318-21487-2-git-send-email-wen.yang99@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1557126318-21487-1-git-send-email-wen.yang99@zte.com.cn>
References: <1557126318-21487-1-git-send-email-wen.yang99@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release 8.5.3FP6|November
 21, 2013) at 2019-05-06 15:03:29,
        Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-05-06 15:03:23,
        Serialize complete at 2019-05-06 15:03:23
X-MAIL: mse-fl1.zte.com.cn x4673Pko021643
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The call to of_parse_phandle returns a node pointer with refcount
incremented thus it must be explicitly decremented after the last
usage.

Detected by coccinelle with the following warnings:
drivers/media/platform/qcom/venus/firmware.c:90:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 82, but without a corresponding object release within this function.
drivers/media/platform/qcom/venus/firmware.c:94:2-8: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 82, but without a corresponding object release within this function.
drivers/media/platform/qcom/venus/firmware.c:128:1-7: ERROR: missing of_node_put; acquired a node pointer with refcount incremented on line 82, but without a corresponding object release within this function.

Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: Andy Gross <agross@kernel.org>
Cc: David Brown <david.brown@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/media/platform/qcom/venus/firmware.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 6cfa802..f81449b 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -87,11 +87,11 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
 
 	ret = of_address_to_resource(node, 0, &r);
 	if (ret)
-		return ret;
+		goto err_put_node;
 
 	ret = request_firmware(&mdt, fwname, dev);
 	if (ret < 0)
-		return ret;
+		goto err_put_node;
 
 	fw_size = qcom_mdt_get_size(mdt);
 	if (fw_size < 0) {
@@ -125,6 +125,8 @@ static int venus_load_fw(struct venus_core *core, const char *fwname,
 	memunmap(mem_va);
 err_release_fw:
 	release_firmware(mdt);
+err_put_node:
+	of_node_put(node);
 	return ret;
 }
 
-- 
2.9.5

