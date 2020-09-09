Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 393A22630C3
	for <lists+linux-media@lfdr.de>; Wed,  9 Sep 2020 17:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728442AbgIIPmG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Sep 2020 11:42:06 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:50114 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730338AbgIIPlS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Sep 2020 11:41:18 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id C12855395AE5A1A21A3C;
        Wed,  9 Sep 2020 21:39:38 +0800 (CST)
Received: from localhost (10.174.179.108) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Wed, 9 Sep 2020
 21:39:30 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] media: av7110_v4l: Fix build error
Date:   Wed, 9 Sep 2020 21:38:44 +0800
Message-ID: <20200909133844.6812-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.108]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

drivers/media/pci/ttpci/av7110_v4l.c: In function ‘vidioc_s_frequency’:
drivers/media/pci/ttpci/av7110_v4l.c:163:11: error: SSE register return with SSE disabled
  if (freq < 16U * 168.25)
      ~~~~~^~~~~~~~~~~~~~
Get rid of float pointing math to fix this.

Fixes: 13c129066845 ("media: av7110_v4l: avoid a typecast")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/media/pci/ttpci/av7110_v4l.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/ttpci/av7110_v4l.c b/drivers/media/pci/ttpci/av7110_v4l.c
index 6d9c908be713..ba745b161cba 100644
--- a/drivers/media/pci/ttpci/av7110_v4l.c
+++ b/drivers/media/pci/ttpci/av7110_v4l.c
@@ -160,9 +160,9 @@ static int ves1820_set_tv_freq(struct saa7146_dev *dev, u32 freq)
 	buf[1] = div & 0xff;
 	buf[2] = 0x8e;
 
-	if (freq < 16U * 168.25)
+	if (freq < (16 * 16825) / 100)
 		config = 0xa0;
-	else if (freq < 16U * 447.25)
+	else if (freq < (16 * 44725) / 100)
 		config = 0x90;
 	else
 		config = 0x30;
-- 
2.17.1


