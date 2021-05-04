Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65A1D372F40
	for <lists+linux-media@lfdr.de>; Tue,  4 May 2021 19:52:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232151AbhEDRxm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 May 2021 13:53:42 -0400
Received: from gofer.mess.org ([88.97.38.141]:36267 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231610AbhEDRxm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 4 May 2021 13:53:42 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 507A8C642C; Tue,  4 May 2021 18:52:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1620150765; bh=dnLOTiH25jCuthHc9DY99FTg6mAPJkOrFbWAhiC/+jo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=iqz1jhpTHKpnrHzkVPkn3duBu/FwRUffrpzWzVMVvqTUZD3woDLcNdzJfbDvLad+G
         LtwpVfbNT4weCXvfXKPWx7jC2RevT6B0ioF2EbRnUMyAc0rDPv+JmIupsN2XM4oCAO
         ByU+M/X6iD5+dZPSP5+jJRD/n1Sinzp9sJ4XPaJDENo8u+g3800R/0KXw9SJUBwACh
         cXUjY1tW7nAQcd5pomAWQmEXzdYrkvTMBJluYteoiJ4yHhhzb5OePZFQe5Xxobo8av
         9QSH/6GrEtbUC4/+kequylaegGP51Ub7UUjycCnnp2nDkiUYz4AQiGK89Yd0tkn1er
         D9CN1W9zxyxow==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>
Subject: [PATCH 1/3] USB: serial: move ftdi_sio.h into include directories
Date:   Tue,  4 May 2021 18:52:43 +0100
Message-Id: <0177adcd7bc66c1e9147191ea5419ddc3da0ea83.1620149665.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1620149665.git.sean@mess.org>
References: <cover.1620149665.git.sean@mess.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A following commit adds a new IR driver uirt which needs the ftdi defines;
the hardware uses an fdti usb serial port.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/usb/serial/ftdi_sio.c                        | 2 +-
 {drivers/usb/serial => include/linux/usb}/ftdi_sio.h | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename {drivers/usb/serial => include/linux/usb}/ftdi_sio.h (100%)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index c867592477c9..542073d2f0dd 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -41,7 +41,7 @@
 #include <linux/serial.h>
 #include <linux/gpio/driver.h>
 #include <linux/usb/serial.h>
-#include "ftdi_sio.h"
+#include <linux/usb/ftdi_sio.h>
 #include "ftdi_sio_ids.h"
 
 #define DRIVER_AUTHOR "Greg Kroah-Hartman <greg@kroah.com>, Bill Ryder <bryder@sgi.com>, Kuba Ober <kuba@mareimbrium.org>, Andreas Mohr, Johan Hovold <jhovold@gmail.com>"
diff --git a/drivers/usb/serial/ftdi_sio.h b/include/linux/usb/ftdi_sio.h
similarity index 100%
rename from drivers/usb/serial/ftdi_sio.h
rename to include/linux/usb/ftdi_sio.h
-- 
2.31.1

