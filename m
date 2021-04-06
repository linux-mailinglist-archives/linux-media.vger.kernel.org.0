Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0761B355545
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 15:35:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237177AbhDFNgA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 09:36:00 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:15615 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233339AbhDFNf7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Apr 2021 09:35:59 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FF7lR2Hvdz19Kp5;
        Tue,  6 Apr 2021 21:33:39 +0800 (CST)
Received: from huawei.com (10.175.103.91) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.498.0; Tue, 6 Apr 2021
 21:35:45 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <mchehab@kernel.org>, <matrandg@cisco.com>
Subject: [PATCH -next] media: tc358743: fix possible use-after-free in tc358743_remove()
Date:   Tue, 6 Apr 2021 21:39:29 +0800
Message-ID: <20210406133929.2143249-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This driver's remove path calls cancel_delayed_work(). However, that
function does not wait until the work function finishes. This means
that the callback function may still be running after the driver's
remove function has finished, which would result in a use-after-free.

Fix by calling cancel_delayed_work_sync(), which ensures that
the work is properly cancelled, no longer running, and unable
to re-schedule itself.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/media/i2c/tc358743.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
index 831b5b54fd78..1b309bb743c7 100644
--- a/drivers/media/i2c/tc358743.c
+++ b/drivers/media/i2c/tc358743.c
@@ -2193,7 +2193,7 @@ static int tc358743_remove(struct i2c_client *client)
 		del_timer_sync(&state->timer);
 		flush_work(&state->work_i2c_poll);
 	}
-	cancel_delayed_work(&state->delayed_work_enable_hotplug);
+	cancel_delayed_work_sync(&state->delayed_work_enable_hotplug);
 	cec_unregister_adapter(state->cec_adap);
 	v4l2_async_unregister_subdev(sd);
 	v4l2_device_unregister_subdev(sd);
-- 
2.25.1

