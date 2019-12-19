Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A69F125C1C
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2019 08:38:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbfLSHic (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Dec 2019 02:38:32 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:8151 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726340AbfLSHic (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Dec 2019 02:38:32 -0500
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id CEFCE6C523E915769AE5;
        Thu, 19 Dec 2019 15:38:29 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Thu, 19 Dec 2019 15:38:24 +0800
From:   Ma Feng <mafeng.ma@huawei.com>
To:     Mike Isely <isely@pobox.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] media: pvrusb2: Remove unneeded semicolon and add newline
Date:   Thu, 19 Dec 2019 15:39:20 +0800
Message-ID: <1576741160-121471-1-git-send-email-mafeng.ma@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fixes coccicheck warning:

drivers/media/usb/pvrusb2/pvrusb2-encoder.c:288:2-3: Unneeded semicolon

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Ma Feng <mafeng.ma@huawei.com>
---
 drivers/media/usb/pvrusb2/pvrusb2-encoder.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-encoder.c b/drivers/media/usb/pvrusb2/pvrusb2-encoder.c
index fb3178d..69a62ea 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-encoder.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-encoder.c
@@ -285,7 +285,8 @@ rdData[0]);
 		ret = pvr2_encoder_write_words(hdw,MBOX_BASE,wrData,1);
 		break;

-	}; LOCK_GIVE(hdw->ctl_lock);
+	}
+	LOCK_GIVE(hdw->ctl_lock);

 	return ret;
 }
--
2.6.2

