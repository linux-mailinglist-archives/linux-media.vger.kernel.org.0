Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AE34343D79
	for <lists+linux-media@lfdr.de>; Mon, 22 Mar 2021 11:08:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbhCVKIF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Mar 2021 06:08:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:48328 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229829AbhCVKHt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Mar 2021 06:07:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5762F61927;
        Mon, 22 Mar 2021 10:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616407668;
        bh=dBJFdoNziB9DDUF+HhGIBEOeGt35UbKFOybGBjedZZM=;
        h=From:To:Cc:Subject:Date:From;
        b=cw9wmolvpbimbAoDm/q7dJJU0emcIDDNCMqUa6DHKf+84Ox0z1A8+pLkXkBQF2HU0
         D3UIetbaQy5rnsj+fuBKNdLxcNPcpBJsSHjSr5V6rTorUCqL+mbzmQHFx8GQ9rlPI4
         9x9MBlBxGvevOzMm2PuqaMPuz/+emVaOx2DWHcfL4+BVCbc5bmdgitFybQeyazRd1w
         wtbG5zxTDX4OjI6DsTV/UjCARmaYdBtFGRKtuGQzSslz+Zjpyuo5u77QyAIYL6Ndfx
         HOvlm8begnvwl1OnpmVzHf9oQ51pIhPEFpae286AxqEBThQLREVX1sciYOEWC5e5rQ
         RXc5sdfKwq1LA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Sean Young <sean@mess.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Qinglang Miao <miaoqinglang@huawei.com>,
        Oliver Neukum <oneukum@suse.com>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] media: flexcop: avoid -Wempty-body warning
Date:   Mon, 22 Mar 2021 11:07:24 +0100
Message-Id: <20210322100743.3880256-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Building with 'make W=1' shows many warnings -Wempty-body warnings like

drivers/media/common/b2c2/flexcop-misc.c: In function 'flexcop_determine_revision':
drivers/media/common/b2c2/flexcop-misc.c:35:85: error: suggest braces around empty body in an 'else' statement [-Werror=empty-body]
   35 |                 deb_info("this FlexCop has the 6 basic main hardware pid filter.\n");

drivers/media/usb/b2c2/flexcop-usb.c: In function 'flexcop_usb_process_frame':
drivers/media/usb/b2c2/flexcop-usb.c:357:79: error: suggest braces around empty body in an 'else' statement [-Werror=empty-body]
  357 |                                         deb_ts("not ts packet %*ph\n", 4, b+2);
      |                                                                               ^
drivers/media/common/b2c2/flexcop-misc.c: In function 'flexcop_determine_revision':
drivers/media/common/b2c2/flexcop-misc.c:35:85: error: suggest braces around empty body in an 'else' statement [-Werror=empty-body]
   35 |                 deb_info("this FlexCop has the 6 basic main hardware pid filter.\n");
      |                                                                                     ^

Change the empty dprintk() macros to no_printk(), which avoids this
warning and adds format string checking.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/common/b2c2/flexcop.h  | 2 +-
 drivers/media/pci/b2c2/flexcop-pci.c | 2 +-
 drivers/media/usb/b2c2/flexcop-usb.c | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/common/b2c2/flexcop.h b/drivers/media/common/b2c2/flexcop.h
index 486fe2380b92..632d7bb9631a 100644
--- a/drivers/media/common/b2c2/flexcop.h
+++ b/drivers/media/common/b2c2/flexcop.h
@@ -17,7 +17,7 @@ extern int b2c2_flexcop_debug;
 #define dprintk(level,args...) \
 	do { if ((b2c2_flexcop_debug & level)) printk(args); } while (0)
 #else
-#define dprintk(level,args...)
+#define dprintk(level,args...) no_printk(args)
 #endif
 
 #define deb_info(args...) dprintk(0x01, args)
diff --git a/drivers/media/pci/b2c2/flexcop-pci.c b/drivers/media/pci/b2c2/flexcop-pci.c
index a9d9520a94c6..83d0ce7fc80e 100644
--- a/drivers/media/pci/b2c2/flexcop-pci.c
+++ b/drivers/media/pci/b2c2/flexcop-pci.c
@@ -22,7 +22,7 @@ MODULE_PARM_DESC(irq_chk_intv, "set the interval for IRQ streaming watchdog.");
 	do { if ((debug & level)) printk(args); } while (0)
 #define DEBSTATUS ""
 #else
-#define dprintk(level,args...)
+#define dprintk(level,args...) no_printk(args)
 #define DEBSTATUS " (debugging is not enabled)"
 #endif
 
diff --git a/drivers/media/usb/b2c2/flexcop-usb.c b/drivers/media/usb/b2c2/flexcop-usb.c
index e731243267e4..6f8dc96adc08 100644
--- a/drivers/media/usb/b2c2/flexcop-usb.c
+++ b/drivers/media/usb/b2c2/flexcop-usb.c
@@ -27,8 +27,8 @@
 
 #define DEBSTATUS ""
 #else
-#define dprintk(level, args...)
-#define debug_dump(b, l, method)
+#define dprintk(level, args...) no_printk(args)
+#define debug_dump(b, l, method) do { } while (0)
 #define DEBSTATUS " (debugging is not enabled)"
 #endif
 
-- 
2.29.2

