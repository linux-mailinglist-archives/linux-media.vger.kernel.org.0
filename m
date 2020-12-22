Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A34042DFAEC
	for <lists+linux-media@lfdr.de>; Mon, 21 Dec 2020 11:17:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbgLUKQf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Dec 2020 05:16:35 -0500
Received: from gofer.mess.org ([88.97.38.141]:47285 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725796AbgLUKQf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Dec 2020 05:16:35 -0500
Received: by gofer.mess.org (Postfix, from userid 1000)
        id BF8C0C6072; Mon, 21 Dec 2020 09:19:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mess.org; s=2020;
        t=1608542369; bh=HTC3kxFkMUWtdsdj515NTqKH1aEU1tnSAMGU2ptXm2M=;
        h=From:To:Subject:Date:From;
        b=p2Exu3qKoFAok69L8fNAAujMIHFUH3x68tJD7Y7uiyXAif2BrUZiZ8A6vTez7WEHz
         AFtoMLrJwpGEPlFlY2aj970chrijvgV8RMlttJfgERFf1RRaYhnmXofVE1mcgG/56t
         4ES51vEIXWfofiAy3G0bpw8dIt8HwWFJ9eZ7oM4M0uT3Pn8HMYX8E7c+yOqexRuyRL
         SngfWwqGFyvnaYOU6pa03rXmASBZeQOXkkuwSdkX0jq3QACQi8ajqaTxFkQ11H61l+
         LMahEP32zTEAG2dHMu2K4Ry4ROnipMRcsKvSBdgQVv2yMQ/4nWWcAEUZNWbLAVfH8x
         H2tR+/rzmmKvA==
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH] media: rc: ensure that uevent can be read directly after rc device register
Date:   Mon, 21 Dec 2020 09:19:29 +0000
Message-Id: <20201221091929.26504-1-sean@mess.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is a race condition where if the /sys/class/rc0/uevent file is read
before rc_dev->registered is set to true, -ENODEV will be returned.

Fixes: a2e2d73fa281 ("media: rc: do not access device via sysfs after rc_unregister_device()")

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/rc-main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
index 1d811e5ffb55..29d4d01896ff 100644
--- a/drivers/media/rc/rc-main.c
+++ b/drivers/media/rc/rc-main.c
@@ -1928,6 +1928,8 @@ int rc_register_device(struct rc_dev *dev)
 			goto out_raw;
 	}
 
+	dev->registered = true;
+
 	rc = device_add(&dev->dev);
 	if (rc)
 		goto out_rx_free;
@@ -1937,8 +1939,6 @@ int rc_register_device(struct rc_dev *dev)
 		 dev->device_name ?: "Unspecified device", path ?: "N/A");
 	kfree(path);
 
-	dev->registered = true;
-
 	/*
 	 * once the the input device is registered in rc_setup_rx_device,
 	 * userspace can open the input device and rc_open() will be called
-- 
2.29.2

