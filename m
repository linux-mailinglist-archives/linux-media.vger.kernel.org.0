Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A5BD5B9DD6
	for <lists+linux-media@lfdr.de>; Thu, 15 Sep 2022 16:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbiIOO4U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Sep 2022 10:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229674AbiIOO4Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Sep 2022 10:56:16 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBBA6861D5
        for <linux-media@vger.kernel.org>; Thu, 15 Sep 2022 07:56:13 -0700 (PDT)
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MT0Xr2fbLz14QMZ;
        Thu, 15 Sep 2022 22:52:12 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 15 Sep 2022 22:56:11 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 15 Sep
 2022 22:56:10 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-media@vger.kernel.org>
CC:     <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>, <pavel@ucw.cz>,
        <sakari.ailus@linux.intel.com>, <sean@mess.org>,
        <laurent.pinchart@ideasonboard.com>
Subject: [PATCH -next 00/13] media: Switch to use dev_err_probe() helper
Date:   Thu, 15 Sep 2022 23:03:11 +0800
Message-ID: <20220915150324.688062-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the probe path, dev_err() can be replace with dev_err_probe()
which will check if error code is -EPROBE_DEFER. It will print
error code in a human readable way and simplify the code.

Yang Yingliang (13):
  media: platform: stm32-cec: Switch to use dev_err_probe() helper
  media: i2c: ad5820: Switch to use dev_err_probe() helper
  media: i2c: imx274: Switch to use dev_err_probe() helper
  media: i2c: tc358743: Switch to use dev_err_probe() helper
  media: platform: mtk_mdp_comp: Switch to use dev_err_probe() helper
  media: platform: exynos4-is: Switch to use dev_err_probe() helper
  media: stm32-dcmi: Switch to use dev_err_probe() helper
  media: omap3isp: Switch to use dev_err_probe() helper
  media: xilinx: csi2rxss: Switch to use dev_err_probe() helper
  media: rc: gpio-ir-recv: Switch to use dev_err_probe() helper
  media: rc: gpio-ir-tx: Switch to use dev_err_probe() helper
  media: rc: ir-rx51: Switch to use dev_err_probe() helper
  media: uvcvideo: Switch to use dev_err_probe() helper

 drivers/media/cec/platform/stm32/stm32-cec.c  |  9 +++----
 drivers/media/i2c/ad5820.c                    | 18 +++++--------
 drivers/media/i2c/imx274.c                    |  5 ++--
 drivers/media/i2c/tc358743.c                  |  9 +++----
 .../platform/mediatek/mdp/mtk_mdp_comp.c      |  5 ++--
 .../platform/samsung/exynos4-is/media-dev.c   |  4 +--
 drivers/media/platform/st/stm32/stm32-dcmi.c  | 27 +++++++------------
 drivers/media/platform/ti/omap3isp/isp.c      |  3 +--
 .../media/platform/xilinx/xilinx-csi2rxss.c   |  8 +++---
 drivers/media/rc/gpio-ir-recv.c               | 10 +++----
 drivers/media/rc/gpio-ir-tx.c                 |  9 +++----
 drivers/media/rc/ir-rx51.c                    |  9 ++-----
 drivers/media/usb/uvc/uvc_driver.c            |  9 +++----
 13 files changed, 41 insertions(+), 84 deletions(-)

-- 
2.25.1

