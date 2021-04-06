Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6A51355597
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 15:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244135AbhDFNqP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 09:46:15 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:15140 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233242AbhDFNqP (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Apr 2021 09:46:15 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FF7yd2RS8zpVMg;
        Tue,  6 Apr 2021 21:43:21 +0800 (CST)
Received: from huawei.com (10.175.103.91) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.498.0; Tue, 6 Apr 2021
 21:46:02 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
CC:     <mchehab@kernel.org>, <hverkuil-cisco@xs4all.nl>
Subject: [PATCH -next] media: i2c: tda1997: Fix possible use-after-free in tda1997x_remove()
Date:   Tue, 6 Apr 2021 21:49:45 +0800
Message-ID: <20210406134945.2149969-1-yangyingliang@huawei.com>
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
 drivers/media/i2c/tda1997x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
index a09bf0a39d05..89bb7e6dc7a4 100644
--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -2804,7 +2804,7 @@ static int tda1997x_remove(struct i2c_client *client)
 	media_entity_cleanup(&sd->entity);
 	v4l2_ctrl_handler_free(&state->hdl);
 	regulator_bulk_disable(TDA1997X_NUM_SUPPLIES, state->supplies);
-	cancel_delayed_work(&state->delayed_work_enable_hpd);
+	cancel_delayed_work_sync(&state->delayed_work_enable_hpd);
 	mutex_destroy(&state->page_lock);
 	mutex_destroy(&state->lock);
 
-- 
2.25.1

