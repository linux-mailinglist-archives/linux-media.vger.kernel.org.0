Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B51563AE841
	for <lists+linux-media@lfdr.de>; Mon, 21 Jun 2021 13:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbhFULm3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Jun 2021 07:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbhFULm3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Jun 2021 07:42:29 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B014C061574;
        Mon, 21 Jun 2021 04:40:14 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id p4-20020a17090a9304b029016f3020d867so8027949pjo.3;
        Mon, 21 Jun 2021 04:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F2eKqSECFAY8q0TBCFG826bPfPe33O5HyLkCeFf89Eo=;
        b=cvp25krpHybbdNlb6IYiDFwntck13NRmlOcTYD2X8aseXFgzgYl05ZjhRFuzz7BF7r
         1enINjRV4q/9f9BSeaH9AkeyYJ+huECSqXebhGbQsw3bIU+1ZNvKhVu1shZ7Lx/o58dR
         vQMWtUFscbjZgcUYK625yzBE9z2fs9EWZEMFT3nNhtWiSeMvULh1H7BG23Jvycu7UEUK
         oNdXv/EQw2zaNrVfTVCgKn5p/gUBVWa7Rpt5ANvNl2uVlNSVuhRUv1iT0b/8RRimotIz
         h0jygBPcidX+Heyb9Ivd2t2Q/eOzHZHpVjpSTfUkmBRnoJP4eEfOVM3R/kP+DkoQCQQq
         t+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=F2eKqSECFAY8q0TBCFG826bPfPe33O5HyLkCeFf89Eo=;
        b=ptl5PWaFGCoyZVZj2nm3Mvv0LniNvbjnx0Lwr8pifN2TivL+y2TI2XaUp48GhQiLbm
         nzPiL+SATiQlzGBrQrMzUau0HE/IOOJW5nrCQYxA71YjbSWekBxJOJP59b7DIU8tgYcU
         ZQB5au3QxpZtcaHolvEWXIsDf5liSHqF4SX7TSZTkj9C2zIwAAxiebCKMyu3O9onFw7S
         mH6ph+3ftbrdwe3t/zTKYN1scD1g9NWDxMEqRdd8goBU5fwqmjvee84RDJltVT1iz9QP
         izRtgdFIpfUyi9L65GBLvAmU4JMY1ZurY0hMCrn8wMZvFkJTMSYhq8cnVO1sGLXoUaB3
         QkwQ==
X-Gm-Message-State: AOAM530PAmIZ8ngIBEcPm4H+aoBndRak9V8X/Gpp5bKkmGvTRLC+1r1b
        2OkEI5ZDqSKjWhwFcfJ7p4A=
X-Google-Smtp-Source: ABdhPJwKPAfDLvhGCMiUOZrmV2/IrhUEpo4fpLHKcZRRMWwb5BVtZNxrUsz/UgGG84n/PreRGQ8vQQ==
X-Received: by 2002:a17:90a:1b68:: with SMTP id q95mr19346209pjq.4.1624275613855;
        Mon, 21 Jun 2021 04:40:13 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.71])
        by smtp.gmail.com with ESMTPSA id b6sm16372237pgw.67.2021.06.21.04.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 04:40:13 -0700 (PDT)
From:   Dongliang Mu <mudongliangabcd@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Dongliang Mu <mudongliangabcd@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3 v2] media: dvb-usb: break long strings in dvb_usb_device_init
Date:   Mon, 21 Jun 2021 19:39:59 +0800
Message-Id: <20210621113959.53320-1-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Break long strings into multiple lines.

Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
 drivers/media/usb/dvb-usb/dvb-usb-init.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/dvb-usb-init.c b/drivers/media/usb/dvb-usb/dvb-usb-init.c
index 28e1fd64dd3c..edc477cedaa9 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-init.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-init.c
@@ -286,13 +286,15 @@ int dvb_usb_device_init(struct usb_interface *intf,
 
 	desc = dvb_usb_find_device(udev, &d->props, &cold);
 	if (!desc) {
-		deb_err("something went very wrong, device was not found in current device list - let's see what comes next.\n");
+		deb_err("something went very wrong, "
+			"device was not found in current device list.\n");
 		ret = -ENODEV;
 		goto error;
 	}
 
 	if (cold) {
-		info("found a '%s' in cold state, will try to load a firmware", desc->name);
+		info("found a %s in cold state, will try to load a firmware",
+		     desc->name);
 		ret = dvb_usb_download_firmware(udev, props);
 		if (!props->no_reconnect || ret != 0)
 			goto error;
@@ -314,7 +316,7 @@ int dvb_usb_device_init(struct usb_interface *intf,
 	if (du)
 		*du = d;
 
-	info("%s successfully initialized and connected.", desc->name);
+	info("%s is successfully initialized and connected.", desc->name);
 	return 0;
 
  error:
-- 
2.25.1

