Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 675BC42ECF5
	for <lists+linux-media@lfdr.de>; Fri, 15 Oct 2021 10:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235359AbhJOJAo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Oct 2021 05:00:44 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:24321 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbhJOJAn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Oct 2021 05:00:43 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HW0SF2s2Czbd24;
        Fri, 15 Oct 2021 16:54:05 +0800 (CST)
Received: from kwepemm600001.china.huawei.com (7.193.23.3) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Fri, 15 Oct 2021 16:58:35 +0800
Received: from huawei.com (10.175.104.82) by kwepemm600001.china.huawei.com
 (7.193.23.3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Fri, 15 Oct
 2021 16:58:34 +0800
From:   Wang Hai <wanghai38@huawei.com>
To:     <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: dmxdev: fix UAF when dvb_register_device() fails
Date:   Fri, 15 Oct 2021 16:57:41 +0800
Message-ID: <20211015085741.1203283-1-wanghai38@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.104.82]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600001.china.huawei.com (7.193.23.3)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I got a use-after-free report:

dvbdev: dvb_register_device: failed to create device dvb1.dvr0 (-12)
...
==================================================================
BUG: KASAN: use-after-free in dvb_dmxdev_release+0xce/0x2f0
...
Call Trace:
 dump_stack_lvl+0x6c/0x8b
 print_address_description.constprop.0+0x48/0x70
 kasan_report.cold+0x82/0xdb
 __asan_load4+0x6b/0x90
 dvb_dmxdev_release+0xce/0x2f0
...
Allocated by task 7666:
 kasan_save_stack+0x23/0x50
 __kasan_kmalloc+0x83/0xa0
 kmem_cache_alloc_trace+0x22e/0x470
 dvb_register_device+0x12f/0x980
 dvb_dmxdev_init+0x1f3/0x230
...
Freed by task 7666:
 kasan_save_stack+0x23/0x50
 kasan_set_track+0x20/0x30
 kasan_set_free_info+0x24/0x40
 __kasan_slab_free+0xf2/0x130
 kfree+0xd1/0x5c0
 dvb_register_device.cold+0x1ac/0x1fa
 dvb_dmxdev_init+0x1f3/0x230
...

When dvb_register_device() in dvb_dmxdev_init() fails, dvb_dmxdev_init()
does not return a failure, and the memory pointed to by dvbdev or
dvr_dvbdev is invalid at this point. If they are used subsequently, it
will result in UFA or null-ptr-deref.

If dvb_register_device() in dvb_dmxdev_init() fails, fix the bug by making
dvb_dmxdev_init() return an error as well.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wang Hai <wanghai38@huawei.com>
---
 drivers/media/dvb-core/dmxdev.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxdev.c
index 5d5a48475a54..01f288fa37e0 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -1413,7 +1413,7 @@ static const struct dvb_device dvbdev_dvr = {
 };
 int dvb_dmxdev_init(struct dmxdev *dmxdev, struct dvb_adapter *dvb_adapter)
 {
-	int i;
+	int i, ret;
 
 	if (dmxdev->demux->open(dmxdev->demux) < 0)
 		return -EUSERS;
@@ -1432,14 +1432,26 @@ int dvb_dmxdev_init(struct dmxdev *dmxdev, struct dvb_adapter *dvb_adapter)
 					    DMXDEV_STATE_FREE);
 	}
 
-	dvb_register_device(dvb_adapter, &dmxdev->dvbdev, &dvbdev_demux, dmxdev,
+	ret = dvb_register_device(dvb_adapter, &dmxdev->dvbdev, &dvbdev_demux, dmxdev,
 			    DVB_DEVICE_DEMUX, dmxdev->filternum);
-	dvb_register_device(dvb_adapter, &dmxdev->dvr_dvbdev, &dvbdev_dvr,
+	if (ret < 0)
+		goto err_register_dvbdev;
+
+	ret = dvb_register_device(dvb_adapter, &dmxdev->dvr_dvbdev, &dvbdev_dvr,
 			    dmxdev, DVB_DEVICE_DVR, dmxdev->filternum);
+	if (ret < 0)
+		goto err_register_dvr_dvbdev;
 
 	dvb_ringbuffer_init(&dmxdev->dvr_buffer, NULL, 8192);
 
 	return 0;
+
+err_register_dvr_dvbdev:
+	dvb_unregister_device(dmxdev->dvbdev);
+err_register_dvbdev:
+	vfree(dmxdev->filter);
+	dmxdev->filter = NULL;
+	return ret;
 }
 
 EXPORT_SYMBOL(dvb_dmxdev_init);
-- 
2.25.1

