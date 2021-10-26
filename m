Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 983C643B0BF
	for <lists+linux-media@lfdr.de>; Tue, 26 Oct 2021 13:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235399AbhJZLIQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Oct 2021 07:08:16 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:26122 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235369AbhJZLIP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Oct 2021 07:08:15 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Hdppz16rbz1DHfs;
        Tue, 26 Oct 2021 19:03:55 +0800 (CST)
Received: from kwepemm600001.china.huawei.com (7.193.23.3) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Tue, 26 Oct 2021 19:05:49 +0800
Received: from huawei.com (10.175.104.82) by kwepemm600001.china.huawei.com
 (7.193.23.3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Tue, 26 Oct
 2021 19:05:48 +0800
From:   Wang Hai <wanghai38@huawei.com>
To:     <crope@iki.fi>, <mchehab@kernel.org>, <hans.verkuil@cisco.com>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] msi001: fix possible null-ptr-deref in msi001_probe()
Date:   Tue, 26 Oct 2021 19:23:48 +0800
Message-ID: <20211026112348.2878040-1-wanghai38@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.104.82]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600001.china.huawei.com (7.193.23.3)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I got a null-ptr-deref report:

BUG: kernel NULL pointer dereference, address: 0000000000000060
...
RIP: 0010:v4l2_ctrl_auto_cluster+0x57/0x270
...
Call Trace:
 msi001_probe+0x13b/0x24b [msi001]
 spi_probe+0xeb/0x130
...
 do_syscall_64+0x35/0xb0

In msi001_probe(), if the creation of control for bandwidth_auto
fails, there will be a null-ptr-deref issue when it is used in
v4l2_ctrl_auto_cluster().

Check dev->hdl.error before v4l2_ctrl_auto_cluster() to fix this bug.

Fixes: 93203dd6c7c4 ("[media] msi001: Mirics MSi001 silicon tuner driver")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wang Hai <wanghai38@huawei.com>
---
 drivers/media/tuners/msi001.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/tuners/msi001.c b/drivers/media/tuners/msi001.c
index 78e6fd600d8e..44247049a319 100644
--- a/drivers/media/tuners/msi001.c
+++ b/drivers/media/tuners/msi001.c
@@ -442,6 +442,13 @@ static int msi001_probe(struct spi_device *spi)
 			V4L2_CID_RF_TUNER_BANDWIDTH_AUTO, 0, 1, 1, 1);
 	dev->bandwidth = v4l2_ctrl_new_std(&dev->hdl, &msi001_ctrl_ops,
 			V4L2_CID_RF_TUNER_BANDWIDTH, 200000, 8000000, 1, 200000);
+	if (dev->hdl.error) {
+		ret = dev->hdl.error;
+		dev_err(&spi->dev, "Could not initialize controls\n");
+		/* control init failed, free handler */
+		goto err_ctrl_handler_free;
+	}
+
 	v4l2_ctrl_auto_cluster(2, &dev->bandwidth_auto, 0, false);
 	dev->lna_gain = v4l2_ctrl_new_std(&dev->hdl, &msi001_ctrl_ops,
 			V4L2_CID_RF_TUNER_LNA_GAIN, 0, 1, 1, 1);
-- 
2.25.1

