Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09AE434B519
	for <lists+linux-media@lfdr.de>; Sat, 27 Mar 2021 08:43:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbhC0HnY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Mar 2021 03:43:24 -0400
Received: from mail-m17637.qiye.163.com ([59.111.176.37]:36854 "EHLO
        mail-m17637.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230203AbhC0HnD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Mar 2021 03:43:03 -0400
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
        by mail-m17637.qiye.163.com (Hmail) with ESMTPA id C0E21980122;
        Sat, 27 Mar 2021 15:43:00 +0800 (CST)
From:   Wan Jiabing <wanjiabing@vivo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wan Jiabing <wanjiabing@vivo.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kael_w@yeah.net
Subject: [PATCH] media: usb: Remove duplicate declares
Date:   Sat, 27 Mar 2021 15:42:45 +0800
Message-Id: <20210327074247.1487713-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZSk1KSU9PTUpLSR8ZVkpNSk1DSEtCQ0tCQkNVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NU06Hio6Dz8RDjMTSQkMCA4d
        LDcaCRhVSlVKTUpNQ0hLQkNKSE5OVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
        TVVKTklVSk9OVUpDSVlXWQgBWUFKQkJDNwY+
X-HM-Tid: 0a7872a2e33fd992kuwsc0e21980122
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

struct cx231xx has been declared at 146th line.
struct em28xx has been declared at 219th line.
Remove the duplicate.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/media/usb/cx231xx/cx231xx.h | 2 --
 drivers/media/usb/em28xx/em28xx.h   | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx.h b/drivers/media/usb/cx231xx/cx231xx.h
index b32eab641793..6929e4d97067 100644
--- a/drivers/media/usb/cx231xx/cx231xx.h
+++ b/drivers/media/usb/cx231xx/cx231xx.h
@@ -425,8 +425,6 @@ struct cx231xx_audio {
 	u16 end_point_addr;
 };
 
-struct cx231xx;
-
 /*****************************************************************/
 /* set/get i2c */
 /* 00--1Mb/s, 01-400kb/s, 10--100kb/s, 11--5Mb/s */
diff --git a/drivers/media/usb/em28xx/em28xx.h b/drivers/media/usb/em28xx/em28xx.h
index 6648e11f1271..43227111d410 100644
--- a/drivers/media/usb/em28xx/em28xx.h
+++ b/drivers/media/usb/em28xx/em28xx.h
@@ -628,8 +628,6 @@ struct em28xx_audio {
 	atomic_t       stream_started;	/* stream should be running if true */
 };
 
-struct em28xx;
-
 enum em28xx_i2c_algo_type {
 	EM28XX_I2C_ALGO_EM28XX = 0,
 	EM28XX_I2C_ALGO_EM2800,
-- 
2.25.1

