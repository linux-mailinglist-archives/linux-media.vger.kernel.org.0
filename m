Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B753F5E9871
	for <lists+linux-media@lfdr.de>; Mon, 26 Sep 2022 06:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231218AbiIZEbC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Sep 2022 00:31:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbiIZEbA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Sep 2022 00:31:00 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4822029C93
        for <linux-media@vger.kernel.org>; Sun, 25 Sep 2022 21:30:56 -0700 (PDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MbV9X2vNFzpVV5;
        Mon, 26 Sep 2022 12:28:00 +0800 (CST)
Received: from huawei.com (10.175.103.91) by dggpemm500022.china.huawei.com
 (7.185.36.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 26 Sep
 2022 12:30:53 +0800
From:   Zeng Heng <zengheng4@huawei.com>
To:     <prabhakar.csengg@gmail.com>, <mchehab@kernel.org>,
        <gregkh@linuxfoundation.org>
CC:     <linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>,
        <liwei391@huawei.com>, <zengheng4@huawei.com>
Subject: [PATCH -next] media: vpfe_capture: fix kconfig dependency errors
Date:   Mon, 26 Sep 2022 12:37:41 +0800
Message-ID: <20220926043741.553781-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500022.china.huawei.com (7.185.36.162)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CONFIG_VIDEO_DM6446_CCDC & CONFIG_VIDEO_DM355_CCDC
& CONFIG_VIDEO_DM365_ISIF all depend on feature
VIDEO_DAVINCI_VPBE_DISPLAY, or the compiler would
complain build errors as below:

ld: drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc.o: in function `ccdc_sbl_reset':
/home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc.c:238: undefined reference to `vpss_clear_wbl_overflow'
ld: /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc.c:238: undefined reference to `vpss_clear_wbl_overflow'
ld: /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/dm644x_ccdc.c:238: undefined reference to `vpss_clear_wbl_overflow'
ld: drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.o: in function `ccdc_restore_defaults':
/home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.c:175: undefined reference to `vpss_select_ccdc_source'
ld: /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.c:180: undefined reference to `vpss_enable_clock'
ld: drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.o: in function `ccdc_close':
/home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/dm355_ccdc.c:196: undefined reference to `vpss_enable_clock'
ld: drivers/staging/media/deprecated/vpfe_capture/isif.o: in function `isif_restore_defaults':
/home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/isif.c:252: undefined reference to `vpss_enable_clock'
ld: /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/isif.c:253: undefined reference to `vpss_enable_clock'
ld: /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/isif.c:254: undefined reference to `vpss_enable_clock'
ld: /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/isif.c:257: undefined reference to `vpss_select_ccdc_source'
ld: drivers/staging/media/deprecated/vpfe_capture/isif.o: in function `isif_config_raw':
/home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/isif.c:680: undefined reference to `dm365_vpss_set_sync_pol'
ld: /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/isif.c:683: undefined reference to `dm365_vpss_set_pg_frame_size'
ld: /home/zengheng/linux-next/drivers/staging/media/deprecated/vpfe_capture/isif.c:684: undefined reference to `vpss_select_ccdc_source'

Signed-off-by: Zeng Heng <zengheng4@huawei.com>
---
 drivers/staging/media/deprecated/vpfe_capture/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/deprecated/vpfe_capture/Kconfig b/drivers/staging/media/deprecated/vpfe_capture/Kconfig
index 10250e7e566b..557603b51b3f 100644
--- a/drivers/staging/media/deprecated/vpfe_capture/Kconfig
+++ b/drivers/staging/media/deprecated/vpfe_capture/Kconfig
@@ -5,6 +5,7 @@ config VIDEO_DM6446_CCDC
 	depends on VIDEO_DEV
 	depends on ARCH_DAVINCI || COMPILE_TEST
 	depends on I2C
+	depends on VIDEO_DAVINCI_VPBE_DISPLAY
 	select VIDEOBUF_DMA_CONTIG
 	help
 	  Enables DaVinci CCD hw module. DaVinci CCDC hw interfaces
@@ -25,6 +26,7 @@ config VIDEO_DM355_CCDC
 	depends on VIDEO_DEV
 	depends on ARCH_DAVINCI || COMPILE_TEST
 	depends on I2C
+	depends on VIDEO_DAVINCI_VPBE_DISPLAY
 	select VIDEOBUF_DMA_CONTIG
 	help
 	  Enables DM355 CCD hw module. DM355 CCDC hw interfaces
@@ -45,6 +47,7 @@ config VIDEO_DM365_ISIF
 	depends on VIDEO_DEV
 	depends on ARCH_DAVINCI || COMPILE_TEST
 	depends on I2C
+	depends on VIDEO_DAVINCI_VPBE_DISPLAY
 	select VIDEOBUF_DMA_CONTIG
 	help
 	  Enables ISIF hw module. This is the hardware module for
-- 
2.25.1

