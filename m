Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF526354F31
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 10:57:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232683AbhDFI6A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 04:58:00 -0400
Received: from mail-m17637.qiye.163.com ([59.111.176.37]:36450 "EHLO
        mail-m17637.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232495AbhDFI6A (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Apr 2021 04:58:00 -0400
Received: from wanjb-virtual-machine.localdomain (unknown [36.152.145.182])
        by mail-m17637.qiye.163.com (Hmail) with ESMTPA id 582D39801A9;
        Tue,  6 Apr 2021 16:57:51 +0800 (CST)
From:   Wan Jiabing <wanjiabing@vivo.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     kael_w@yeah.net, Wan Jiabing <wanjiabing@vivo.com>
Subject: [PATCH] em28xx/em28xx.h: Remove duplicate struct declaration
Date:   Tue,  6 Apr 2021 16:57:37 +0800
Message-Id: <20210406085737.646015-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZSUtLSRgeSE8dS0lIVkpNSkxNQkJPTEpNSEJVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NBg6Eww6LD8XSy00VisjDy4B
        LFFPFE1VSlVKTUpMTUJCT0xKQklMVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlI
        TVVKTklVSk9OVUpDSVlXWQgBWUFKT0JPNwY+
X-HM-Tid: 0a78a66700a4d992kuws582d39801a9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

struct em28xx is declared at 219th line.
The declaration here is unnecessary. Remove it.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/media/usb/em28xx/em28xx.h | 2 --
 1 file changed, 2 deletions(-)

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

