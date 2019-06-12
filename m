Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C476421F3
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 12:06:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437889AbfFLKFt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 06:05:49 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:18560 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2437872AbfFLKFs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 06:05:48 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 0E89658FAC1B0B6FE244;
        Wed, 12 Jun 2019 18:05:46 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Wed, 12 Jun 2019
 18:05:39 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <mjourdan@baylibre.com>, <mchehab@kernel.org>,
        <gregkh@linuxfoundation.org>, <khilman@baylibre.com>
CC:     <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-media@lists.freedesktop.org>,
        <linux-amlogic@lists.infradead.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] media: meson: vdec: Add missing kthread.h
Date:   Wed, 12 Jun 2019 18:05:36 +0800
Message-ID: <20190612100536.22368-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix building error:

drivers/staging/media/meson/vdec/vdec.c: In function vdec_recycle_thread:
drivers/staging/media/meson/vdec/vdec.c:59:10: error: implicit declaration
 of function kthread_should_stop;
 did you mean thread_saved_sp? [-Werror=implicit-function-declaration]

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 4e4f9d6..0a1a04f 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -12,6 +12,7 @@
 #include <linux/mfd/syscon.h>
 #include <linux/slab.h>
 #include <linux/interrupt.h>
+#include <linux/kthread.h>
 #include <media/v4l2-ioctl.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-ctrls.h>
-- 
2.7.4


