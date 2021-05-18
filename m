Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA801387827
	for <lists+linux-media@lfdr.de>; Tue, 18 May 2021 13:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242715AbhERL5q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 May 2021 07:57:46 -0400
Received: from mail-m121142.qiye.163.com ([115.236.121.142]:19896 "EHLO
        mail-m121142.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240075AbhERL5p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 May 2021 07:57:45 -0400
X-Greylist: delayed 449 seconds by postgrey-1.27 at vger.kernel.org; Tue, 18 May 2021 07:57:44 EDT
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.250.176.229])
        by mail-m121142.qiye.163.com (Hmail) with ESMTPA id 4069B809CC;
        Tue, 18 May 2021 19:49:13 +0800 (CST)
From:   Wang Qing <wangqing@vivo.com>
To:     Corentin Labbe <clabbe@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        mjpeg-users@lists.sourceforge.net, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Cc:     Wang Qing <wangqing@vivo.com>
Subject: [PATCH] staging: media: zoran: fix some formatting issues
Date:   Tue, 18 May 2021 19:49:08 +0800
Message-Id: <1621338548-12077-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZGhoaHlZOQk1DQkkaQ0tCGhlVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
        9ISFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PRA6MSo6SD8VSis6DjQRGjUw
        URYwCjVVSlVKTUlKSEhDTk5IQklKVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
        SU5LVUpMTVVJSUJZV1kIAVlBSUlOSTcG
X-HM-Tid: 0a797f4efcf1b037kuuu4069b809cc
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

fixing WARNING: Possible repeated word: 'in' as "in in a VIDIOCSFBUF ioctl",
limit the number of words per line.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/staging/media/zoran/zoran_card.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index dfc60e2..f259585
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -37,9 +37,10 @@ module_param_array(card, int, NULL, 0444);
 MODULE_PARM_DESC(card, "Card type");
 
 /*
- * The video mem address of the video card. The driver has a little database for some videocards
- * to determine it from there. If your video card is not in there you have either to give it to
- * the driver as a parameter or set in in a VIDIOCSFBUF ioctl
+ * The video mem address of the video card. The driver has a little database
+ * for some videocards to determine it from there. If your video card is not
+ * in there you have either to give it to the driver as a parameter or set
+ * in a VIDIOCSFBUF ioctl
  */
 
 static unsigned long vidmem;	/* default = 0 - Video memory base address */
-- 
2.7.4

