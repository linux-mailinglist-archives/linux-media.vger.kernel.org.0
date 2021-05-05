Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 267B7374AE2
	for <lists+linux-media@lfdr.de>; Wed,  5 May 2021 23:57:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbhEEV6S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 May 2021 17:58:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbhEEV6Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 5 May 2021 17:58:16 -0400
Received: from gofer.mess.org (gofer.mess.org [IPv6:2a02:8011:d000:212::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CD51C061574;
        Wed,  5 May 2021 14:57:19 -0700 (PDT)
Received: by gofer.mess.org (Postfix, from userid 1000)
        id ABADDC642C; Wed,  5 May 2021 22:57:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1620251835; bh=dnLOTiH25jCuthHc9DY99FTg6mAPJkOrFbWAhiC/+jo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Md0yJDDJ4FPa0fAOMjean30fTAs6wgc0g0CzTLuHYrmISAnK4RXxNWKcVlG+z0aKd
         RCCTiI5qsAyyoOW42O3IQxy1xffYQHUl+q0+Kx+LkLS+Zc7deYO9BvR4RI6KYOSIoc
         WgQIZojEw/4r02EuCi9H97/zFGRSuJ+MorVEutRI/jlT0QNF82xgTVscwcG2DxqsjO
         l2ix1YE2NcAeqMJb34zcXIs/OaeosUJitHMerdQV1fxs9FH8qpAbUvl43jWqKS8cJb
         tP67baQ1zI+e+nxsfTtDx7/w+mTSwR+uHVpEj7TN0PtATfQ8l9oUr5q9gZlHlc47fT
         EPr8MWCaBHkOQ==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org, linux-usb@vger.kernel.org,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jon Rhees <support@usbuirt.com>,
        Oliver Neukum <oneukum@suse.com>
Subject: [PATCH v2 1/3] USB: serial: move ftdi_sio.h into include directories
Date:   Wed,  5 May 2021 22:57:13 +0100
Message-Id: <2bc01aa7942bc135234abd3d7d4b9a738778de56.1620251141.git.sean@mess.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1620251141.git.sean@mess.org>
References: <cover.1620251141.git.sean@mess.org>
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

