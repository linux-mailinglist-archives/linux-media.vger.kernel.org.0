Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE4F32272A
	for <lists+linux-media@lfdr.de>; Tue, 23 Feb 2021 09:38:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232250AbhBWIie (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Feb 2021 03:38:34 -0500
Received: from m12-11.163.com ([220.181.12.11]:37545 "EHLO m12-11.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232182AbhBWIia (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Feb 2021 03:38:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=r1VtT
        MgRXw910fLzLP+WP4o1RT/KBuzqM8iqdPWNXeE=; b=aJIHOsh7MyncH5bG3oqX0
        mLd5G7Cd9/PIo28elHBApBSMy4O0Qxem9p3NqD79ygoUX7rppK7d2Bg2NvFG08d/
        BrHHYRtB4jvF2Q84QbRznnTyfqdW89sPYMWBdMACVN09Vx58YKiJcW3KV42PEdDP
        866w9bvyF9ir6XIn24rPgg=
Received: from COOL-20201222LC.ccdomain.com (unknown [218.94.48.178])
        by smtp7 (Coremail) with SMTP id C8CowACnopqfvjRgW50DPA--.3574S2;
        Tue, 23 Feb 2021 16:36:48 +0800 (CST)
From:   dingsenjie@163.com
To:     mchehab@kernel.org, allen.lkml@gmail.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        dingsenjie <dingsenjie@yulong.com>
Subject: [PATCH] media/usb:Remove superfluous "breaks" in the ttusb_dec.c
Date:   Tue, 23 Feb 2021 16:36:54 +0800
Message-Id: <20210223083654.43468-1-dingsenjie@163.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8CowACnopqfvjRgW50DPA--.3574S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF4rtr18Jry5Gw18Ww18Grg_yoWkWwc_GF
        92qw4DCw1qvrs8tFWxtrZ3Xry2vF4xZF1UXFyrK34fGF4akr4rXr4DG39xJr18ZF1xZF1r
        uryxKrZayrZ3WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0niSJUUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5glqw25hqmxvi6rwjhhfrp/1tbiZQBCyF8ZM2mD0wAAsj
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: dingsenjie <dingsenjie@yulong.com>

Remove superfluous "breaks", as there is a "return" before them.

Signed-off-by: dingsenjie <dingsenjie@yulong.com>
---
 drivers/media/usb/ttusb-dec/ttusb_dec.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/usb/ttusb-dec/ttusb_dec.c b/drivers/media/usb/ttusb-dec/ttusb_dec.c
index df6c5e4..a852ee5 100644
--- a/drivers/media/usb/ttusb-dec/ttusb_dec.c
+++ b/drivers/media/usb/ttusb-dec/ttusb_dec.c
@@ -1102,11 +1102,9 @@ static int ttusb_dec_start_feed(struct dvb_demux_feed *dvbdmxfeed)
 
 	case DMX_TYPE_TS:
 		return ttusb_dec_start_ts_feed(dvbdmxfeed);
-		break;
 
 	case DMX_TYPE_SEC:
 		return ttusb_dec_start_sec_feed(dvbdmxfeed);
-		break;
 
 	default:
 		dprintk("  type: unknown (%d)\n", dvbdmxfeed->type);
@@ -1157,11 +1155,9 @@ static int ttusb_dec_stop_feed(struct dvb_demux_feed *dvbdmxfeed)
 	switch (dvbdmxfeed->type) {
 	case DMX_TYPE_TS:
 		return ttusb_dec_stop_ts_feed(dvbdmxfeed);
-		break;
 
 	case DMX_TYPE_SEC:
 		return ttusb_dec_stop_sec_feed(dvbdmxfeed);
-		break;
 	}
 
 	return 0;
-- 
1.9.1

