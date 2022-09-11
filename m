Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFF345B4CE3
	for <lists+linux-media@lfdr.de>; Sun, 11 Sep 2022 11:15:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbiIKJP0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Sep 2022 05:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbiIKJPY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Sep 2022 05:15:24 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C225125297
        for <linux-media@vger.kernel.org>; Sun, 11 Sep 2022 02:15:22 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MQP8l48LGzNm9k;
        Sun, 11 Sep 2022 17:10:47 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sun, 11 Sep 2022 17:15:20 +0800
From:   Gaosheng Cui <cuigaosheng1@huawei.com>
To:     <crope@iki.fi>, <mchehab@kernel.org>,
        <laurent.pinchart@ideasonboard.com>,
        <kieran.bingham+renesas@ideasonboard.com>, <logans@cottsay.net>,
        <hverkuil-cisco@xs4all.nl>, <clabbe@baylibre.com>,
        <m.chehab@samsung.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <bunk@kernel.org>,
        <elezegarcia@gmail.com>, <hans.verkuil@cisco.com>,
        <linux@rainbow-software.org>, <cuigaosheng1@huawei.com>
CC:     <linux-media@vger.kernel.org>
Subject: [PATCH 0/8] Remove unused declarations for media
Date:   Sun, 11 Sep 2022 17:15:11 +0800
Message-ID: <20220911091519.3212868-1-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This series contains a few cleanup patches, to remove unused
declarations which have been removed. Thanks!

Gaosheng Cui (8):
  media: dvb-frontends: remove unused drx_dap_fasi_funct_g declaration
  media: platform: remove unused vsp1_subdev_internal_ops declaration
  media: cxd2820r: remove unused cxd2820r_debug declaration
  media: saa7134: remove unused declarations in saa7134.h
  [media] saa7164: remove unused saa7164_call_i2c_clients declaration
  [media] cx25821: remove unused cx25821_video_wakeup() declaration
  [media] bttv: remove unused tea5757_set_freq declaration
  media: zoran: remove unused declarations in zoran_device.h

 drivers/media/dvb-frontends/cxd2820r_priv.h         | 2 --
 drivers/media/dvb-frontends/drx39xyj/drx_dap_fasi.h | 2 --
 drivers/media/pci/bt8xx/bttv.h                      | 1 -
 drivers/media/pci/cx25821/cx25821-video.h           | 3 ---
 drivers/media/pci/saa7134/saa7134.h                 | 4 ----
 drivers/media/pci/saa7164/saa7164.h                 | 2 --
 drivers/media/pci/zoran/zoran_device.h              | 2 --
 drivers/media/platform/renesas/vsp1/vsp1_entity.h   | 2 --
 8 files changed, 18 deletions(-)

-- 
2.25.1

