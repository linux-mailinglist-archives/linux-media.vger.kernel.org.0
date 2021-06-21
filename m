Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1893AE298
	for <lists+linux-media@lfdr.de>; Mon, 21 Jun 2021 07:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbhFUFKT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Jun 2021 01:10:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbhFUFKS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Jun 2021 01:10:18 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 341AAC061574;
        Sun, 20 Jun 2021 22:08:04 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id y13so1755418plc.8;
        Sun, 20 Jun 2021 22:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TnpsAxmufh915BSD9fnBr85SfXQ0FTkySU1azKoLJlo=;
        b=G2bPAbjmU3rXSXhvS97FCY0yIZiOUkuubdnMIeZHLWwlfiL5tkL5DOyRQT48LBpSUF
         cDpsZOBF9kAM/FGEMeOAbdLxpZn3FW9pCU5vi9YOEZ9ljA2zpIAeAv2KFUa3M1DHtnkU
         HtBktxHxpXImqJLlXD08X1bJQNHW543XZ/gAPJmLC+JkNtLGkjmcg9qXdzzKgX1/D55j
         6g26B2sbedDx0ispZXwjcW6hHACVgDcI/t6OldRXjTq98AuOP+W6Eu2cF37jZxuTpZgv
         T5r9pe6D4o5QNWOsKjbolVrO7YP4Ye1mQpiPQmmLSjMno8E/DZ9hBynl7HVp+RUcdous
         GIlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TnpsAxmufh915BSD9fnBr85SfXQ0FTkySU1azKoLJlo=;
        b=cbdobD+PI7Kwl08Pa5OUM8q8tayGGer7cbTM22HiTi5LgoepesRBKkxDGPrG3HMrfE
         Nls69IHC14Fkoe6IO41X+DSqInnliY7vs8kk/1/5T1Bk5y8x9iV+42vEKOEnlLCOmVUK
         Yfh0bK6Wpf9nBQQZbY+nEP2MdkY6J4voAf6IlcvuRw5ywDeSBfcKgEPNe8KMr3YW7LaM
         hzCFo5YLcecN4khBWQHh+ILdnHHpeshnNg2T8WfZIk2Tne/lgH6x/5+Smep9cStI3Wvb
         yxKF+PC108CHOQT6+mxBSIKyIMe37eQz2sEBqYFI28PWwR8zdZsT/Iiejj23PiszmAyy
         OZ5g==
X-Gm-Message-State: AOAM532jad83KRsb5wnFn/Nted1HiFA/Fmmv3X/7mk7kgszKiBaS+y4B
        GCPAom1ecA8Z7g1mWyB8yCq2yl7rACQdV0Vd
X-Google-Smtp-Source: ABdhPJwaXjO2k8WYN8MsXwpUlP/BEAapBKBNEjVPC48zRlO1JvXUDro2RDj0ZqlnfR1hG1GZ191CYQ==
X-Received: by 2002:a17:902:6902:b029:106:50e3:b2db with SMTP id j2-20020a1709026902b029010650e3b2dbmr16114286plk.35.1624252083630;
        Sun, 20 Jun 2021 22:08:03 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.71])
        by smtp.gmail.com with ESMTPSA id b5sm11808783pgh.41.2021.06.20.22.08.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jun 2021 22:08:03 -0700 (PDT)
From:   Dongliang Mu <mudongliangabcd@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Dongliang Mu <mudongliangabcd@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] media: dvb-usb: break long strings in dvb_usb_device_init
Date:   Mon, 21 Jun 2021 13:07:26 +0800
Message-Id: <20210621050729.3898275-1-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
+		deb_err("something went very wrong,
+			 device was not found in current device list.\n");
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

