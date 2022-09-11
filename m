Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 339BA5B4CE7
	for <lists+linux-media@lfdr.de>; Sun, 11 Sep 2022 11:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230112AbiIKJPc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Sep 2022 05:15:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbiIKJP0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Sep 2022 05:15:26 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AA2726540
        for <linux-media@vger.kernel.org>; Sun, 11 Sep 2022 02:15:25 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MQP9Y25KSzlVpF;
        Sun, 11 Sep 2022 17:11:29 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sun, 11 Sep 2022 17:15:22 +0800
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
Subject: [PATCH 4/8] media: saa7134: remove unused declarations in saa7134.h
Date:   Sun, 11 Sep 2022 17:15:15 +0800
Message-ID: <20220911091519.3212868-5-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220911091519.3212868-1-cuigaosheng1@huawei.com>
References: <20220911091519.3212868-1-cuigaosheng1@huawei.com>
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

saa7134_mixer_fops and saa7134_dsp_fops have been removed
in media/video since commit 166fb6b4721f ("V4L/DVB (6623):
remove saa7134-oss").

Then the media/video has beed renamed to media/pci since
commit b285192a43f0 ("[media] rename most media/video pci
drivers to media/pci").

saa7134_vbi_template has been removed since
commit a9622391acbc ("V4L/DVB (6792): Fix VBI support").

so saa7134_mixer_fops, saa7134_dsp_fops and saa7134_vbi_template
are unused declarations, remove them.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 drivers/media/pci/saa7134/saa7134.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/pci/saa7134/saa7134.h b/drivers/media/pci/saa7134/saa7134.h
index 49fe0f6bacba..5c9b2912a9d1 100644
--- a/drivers/media/pci/saa7134/saa7134.h
+++ b/drivers/media/pci/saa7134/saa7134.h
@@ -866,7 +866,6 @@ int saa7134_ts_stop(struct saa7134_dev *dev);
 /* saa7134-vbi.c                                               */
 
 extern const struct vb2_ops saa7134_vbi_qops;
-extern struct video_device saa7134_vbi_template;
 
 int saa7134_vbi_init1(struct saa7134_dev *dev);
 int saa7134_vbi_fini(struct saa7134_dev *dev);
@@ -897,9 +896,6 @@ void saa7134_enable_i2s(struct saa7134_dev *dev);
 /* ----------------------------------------------------------- */
 /* saa7134-oss.c                                               */
 
-extern const struct file_operations saa7134_dsp_fops;
-extern const struct file_operations saa7134_mixer_fops;
-
 int saa7134_oss_init1(struct saa7134_dev *dev);
 int saa7134_oss_fini(struct saa7134_dev *dev);
 void saa7134_irq_oss_done(struct saa7134_dev *dev, unsigned long status);
-- 
2.25.1

