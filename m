Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 312F7271CF6
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 10:03:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgIUIDU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 04:03:20 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:48064 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726893AbgIUIC3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 04:02:29 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id C81C425D22564A5CA31A;
        Mon, 21 Sep 2020 16:02:26 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Mon, 21 Sep 2020
 16:02:16 +0800
From:   Liu Shixin <liushixin2@huawei.com>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Liu Shixin <liushixin2@huawei.com>
Subject: [PATCH -next] media: venus: simplify the return expression of venus_sys_set_* function
Date:   Mon, 21 Sep 2020 16:24:40 +0800
Message-ID: <20200921082440.2591617-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplify the return expression.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 28 +++----------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index 4be4a75ddcb6..05ddb68023b8 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -772,34 +772,24 @@ static int venus_sys_set_debug(struct venus_hfi_device *hdev, u32 debug)
 {
 	struct hfi_sys_set_property_pkt *pkt;
 	u8 packet[IFACEQ_VAR_SMALL_PKT_SIZE];
-	int ret;
 
 	pkt = (struct hfi_sys_set_property_pkt *)packet;
 
 	pkt_sys_debug_config(pkt, HFI_DEBUG_MODE_QUEUE, debug);
 
-	ret = venus_iface_cmdq_write(hdev, pkt);
-	if (ret)
-		return ret;
-
-	return 0;
+	return venus_iface_cmdq_write(hdev, pkt);
 }
 
 static int venus_sys_set_coverage(struct venus_hfi_device *hdev, u32 mode)
 {
 	struct hfi_sys_set_property_pkt *pkt;
 	u8 packet[IFACEQ_VAR_SMALL_PKT_SIZE];
-	int ret;
 
 	pkt = (struct hfi_sys_set_property_pkt *)packet;
 
 	pkt_sys_coverage_config(pkt, mode);
 
-	ret = venus_iface_cmdq_write(hdev, pkt);
-	if (ret)
-		return ret;
-
-	return 0;
+	return venus_iface_cmdq_write(hdev, pkt);
 }
 
 static int venus_sys_set_idle_message(struct venus_hfi_device *hdev,
@@ -807,7 +797,6 @@ static int venus_sys_set_idle_message(struct venus_hfi_device *hdev,
 {
 	struct hfi_sys_set_property_pkt *pkt;
 	u8 packet[IFACEQ_VAR_SMALL_PKT_SIZE];
-	int ret;
 
 	if (!enable)
 		return 0;
@@ -816,11 +805,7 @@ static int venus_sys_set_idle_message(struct venus_hfi_device *hdev,
 
 	pkt_sys_idle_indicator(pkt, enable);
 
-	ret = venus_iface_cmdq_write(hdev, pkt);
-	if (ret)
-		return ret;
-
-	return 0;
+	return venus_iface_cmdq_write(hdev, pkt);
 }
 
 static int venus_sys_set_power_control(struct venus_hfi_device *hdev,
@@ -828,17 +813,12 @@ static int venus_sys_set_power_control(struct venus_hfi_device *hdev,
 {
 	struct hfi_sys_set_property_pkt *pkt;
 	u8 packet[IFACEQ_VAR_SMALL_PKT_SIZE];
-	int ret;
 
 	pkt = (struct hfi_sys_set_property_pkt *)packet;
 
 	pkt_sys_power_control(pkt, enable);
 
-	ret = venus_iface_cmdq_write(hdev, pkt);
-	if (ret)
-		return ret;
-
-	return 0;
+	return venus_iface_cmdq_write(hdev, pkt);
 }
 
 static int venus_get_queue_size(struct venus_hfi_device *hdev,
-- 
2.25.1

