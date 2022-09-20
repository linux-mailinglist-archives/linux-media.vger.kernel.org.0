Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B27F05BD9BB
	for <lists+linux-media@lfdr.de>; Tue, 20 Sep 2022 03:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230054AbiITB7G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Sep 2022 21:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbiITB7F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Sep 2022 21:59:05 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 126305509D
        for <linux-media@vger.kernel.org>; Mon, 19 Sep 2022 18:59:05 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MWl3k0nZ3zlVk4;
        Tue, 20 Sep 2022 09:54:58 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 09:59:03 +0800
From:   Gaosheng Cui <cuigaosheng1@huawei.com>
To:     <mchehab@kernel.org>, <cuigaosheng1@huawei.com>
CC:     <linux-media@vger.kernel.org>
Subject: [PATCH] media: dib0700: remove orphan dvb_usb_dib0700_ir_proto declaration
Date:   Tue, 20 Sep 2022 09:59:02 +0800
Message-ID: <20220920015902.785337-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The dvb_usb_dib0700_ir_proto has been removed by
commit 0ffd1ab34a00 ("V4L/DVB: dib0700: properly implement IR
change_protocol"), so remove the orphan declaration.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/media/usb/dvb-usb/dib0700.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/dib0700.h b/drivers/media/usb/dvb-usb/dib0700.h
index 2defbd8b6fc1..ac06a9ab2641 100644
--- a/drivers/media/usb/dvb-usb/dib0700.h
+++ b/drivers/media/usb/dvb-usb/dib0700.h
@@ -72,7 +72,6 @@ int dib0700_set_i2c_speed(struct dvb_usb_device *d, u16 scl_kHz);
 
 extern struct i2c_algorithm dib0700_i2c_algo;
 extern int dib0700_device_count;
-extern int dvb_usb_dib0700_ir_proto;
 extern struct dvb_usb_device_properties dib0700_devices[];
 extern struct usb_device_id dib0700_usb_id_table[];
 
-- 
2.25.1

