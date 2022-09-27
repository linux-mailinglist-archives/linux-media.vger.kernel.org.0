Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9114C5EC4B5
	for <lists+linux-media@lfdr.de>; Tue, 27 Sep 2022 15:41:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232793AbiI0NlK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Sep 2022 09:41:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230517AbiI0NlJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Sep 2022 09:41:09 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B23EFDF38D
        for <linux-media@vger.kernel.org>; Tue, 27 Sep 2022 06:41:07 -0700 (PDT)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4McLKt00jwzpT0m;
        Tue, 27 Sep 2022 21:38:09 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 27 Sep
 2022 21:41:05 +0800
From:   Yuan Can <yuancan@huawei.com>
To:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>
CC:     <yuancan@huawei.com>
Subject: [PATCH] media: dvb-usb: dib0700_devices: Remove unused struct dibx090p_adc
Date:   Tue, 27 Sep 2022 13:38:27 +0000
Message-ID: <20220927133827.99097-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

After commit 5e9c85d98337("[media] dib8096: enhancement"), no one use struct
dibx090p_adc, so remove it.

Signed-off-by: Yuan Can <yuancan@huawei.com>
---
 drivers/media/usb/dvb-usb/dib0700_devices.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/dib0700_devices.c b/drivers/media/usb/dvb-usb/dib0700_devices.c
index 7f8bebfa3e8e..3af594134a6d 100644
--- a/drivers/media/usb/dvb-usb/dib0700_devices.c
+++ b/drivers/media/usb/dvb-usb/dib0700_devices.c
@@ -2024,13 +2024,6 @@ static struct dib0090_config tfe8096p_dib0090_config = {
 	.force_cband_input		= 0,
 };
 
-struct dibx090p_adc {
-	u32 freq;			/* RF freq MHz */
-	u32 timf;			/* New Timf */
-	u32 pll_loopdiv;	/* New prediv */
-	u32 pll_prediv;		/* New loopdiv */
-};
-
 struct dibx090p_best_adc {
 	u32 timf;
 	u32 pll_loopdiv;
-- 
2.17.1

