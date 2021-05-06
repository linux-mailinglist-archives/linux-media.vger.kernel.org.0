Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E517B375403
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 14:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232375AbhEFMp4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 08:45:56 -0400
Received: from gofer.mess.org ([88.97.38.141]:58521 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231848AbhEFMp4 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 May 2021 08:45:56 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id E1A48C6502; Thu,  6 May 2021 13:44:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1620305095; bh=dnLOTiH25jCuthHc9DY99FTg6mAPJkOrFbWAhiC/+jo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=tyspWYf4BOeTlfC8n3JaoHXYivdc7cbtTkrDjem2/+eWI3Sa20Ws/kquaVtmVLWtz
         vkjh4HfPS914NmXakKVetfLPK/lM2yRuFNtPuxVgK+InWtpSQ0N8N+pSKj22+BhUMF
         3iWU9VPYOpuBTJT/DoeH3BCziDcagsYMIQp7FE4JjKPdj/tnEbWO41/vSt/g15F3Yp
         KQ3AfF8xgvHT/NVm1qRSlfCOF2AazoMoc9eG3+jjvqJfj02j0WTiXzc9mw9Wzf4eWi
         cPVLeclJoH0pRQLmRKyQl0ayjTqWpNHbdivm+Xg7VgnzLuGGqP5hWFT/nbCF+Va208
         pjO/w2539eP5g==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: [PATCH v3 1/3] USB: serial: move ftdi_sio.h into include directories
Date:   Thu,  6 May 2021 13:44:53 +0100
Message-Id: <2bc01aa7942bc135234abd3d7d4b9a738778de56.1620304986.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1620304986.git.sean@mess.org>
References: <cover.1620304986.git.sean@mess.org>
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

