Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C252453791
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 17:34:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233555AbhKPQf3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 11:35:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233591AbhKPQfW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 11:35:22 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6658EC061766;
        Tue, 16 Nov 2021 08:32:25 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id gb13-20020a17090b060d00b001a674e2c4a8so3381158pjb.4;
        Tue, 16 Nov 2021 08:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Eigl8CTV30vfs4Rr0oPOqqDh9MUrAqo4TKdoVAZUF0=;
        b=YzKQzDcU9DInxjehS8CG8qaPQDIELyJFrFWG+NmFmq88NTuQnIaczkwz+eL0BdDdNC
         aCoAWv0b21le7llPc8SzxMNUkyRVQo1F8BmPStfxzaLq978T2YE2yMesTktilO8wQfkL
         W0HdFJi5ct/18rs/7AWvE85i+vG2qAuM/ubILfvIO30oYbivoT4z4OVmXknefMQwKybE
         VQJtEdsJhuIg5Xt0dKLlswcZ4sOxm/quMYiHSBgl1gQdDeo8zK4ITyzNPUujFgacYKp4
         iTC0EXQi33Mu6Vyjr+rQK5rD5/1WW6Q/ed+B1rTRYuIdbgJke4kd9r+j/1uGbLCFD1bZ
         82Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Eigl8CTV30vfs4Rr0oPOqqDh9MUrAqo4TKdoVAZUF0=;
        b=ZgXI5ueaqepiUtapg4MQ4zTM3iuoqaS11bF2Zjm/ES9nMyFB8j9leDGQog1F81B11d
         RcpvH2qghrLTbA4b7dTiRw1z+ao6nSM1KJW28tYkuE2yjpKFV77ZrbV7D5e6IdPjje9t
         whk6Bail2t2e9vhicBdR8rLIBBP3p7FHQyyKJuq9oqMuz8Igebbw9+2QZdBq9uZVyvTx
         6hVxJSoQ/x38eWmfLeDDv85u8qyyGS1v3YUvtH5T4Eq9G0ljF68UqtkniFfTMwmPdVJA
         W7EhY85DQcF9qnuBQxI2NQDTO7LImyFLRqJEFPNbNT3XnZ2b1Y88RPasAbVm7SSgSM6Z
         1bJQ==
X-Gm-Message-State: AOAM5338ARgZXQ+wnTL6GRE8Hpq4KDRdu5dLV8rgRpfGvMA+FNgsy+oS
        pHxe5YZIcbRcyFJE7O/pl1g=
X-Google-Smtp-Source: ABdhPJwx52GLHFwv+SV0f1RqF7IJR455BfEa3vKehcsUFExKQqlvwJt7iApJ/AZnpYGD+FUqVIquFw==
X-Received: by 2002:a17:90b:4d09:: with SMTP id mw9mr354976pjb.238.1637080344757;
        Tue, 16 Nov 2021 08:32:24 -0800 (PST)
Received: from localhost.localdomain ([94.177.118.102])
        by smtp.gmail.com with ESMTPSA id x17sm18424345pfa.209.2021.11.16.08.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 08:32:24 -0800 (PST)
From:   Dongliang Mu <mudongliangabcd@gmail.com>
To:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Dongliang Mu <mudongliangabcd@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: msi2500: fix UAF in the msi2500_disconnect
Date:   Wed, 17 Nov 2021 00:32:07 +0800
Message-Id: <20211116163208.75879-1-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In msi2500_probe, it invokes spi_alloc_master to allocate master
controller and spi_register_master to register master controller.
Then in msi2500_disconnect, it calls spi_unregister_master to unregister
the master controller. And in spi_unregister_master, it calls put_device
to decrease the refcount and the device object will be freed then. As a
result, the dereference of dev->lock will cause a use-after-free bug.

Fix it by changing spi_alloc_master to devm_spi_alloc_master, and
removing spi_master_put in the error handling code.

Note that this patch can prevent UAF occurring any more

Fixes: fd8b5f502929 ("msi2500: move msi3101 out of staging and rename")
Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
 drivers/media/usb/msi2500/msi2500.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/usb/msi2500/msi2500.c b/drivers/media/usb/msi2500/msi2500.c
index 71de6b4c4e4c..64c3ec9f1d0c 100644
--- a/drivers/media/usb/msi2500/msi2500.c
+++ b/drivers/media/usb/msi2500/msi2500.c
@@ -1220,7 +1220,7 @@ static int msi2500_probe(struct usb_interface *intf,
 	}
 
 	/* SPI master adapter */
-	master = spi_alloc_master(dev->dev, 0);
+	master = devm_spi_alloc_master(dev->dev, 0);
 	if (master == NULL) {
 		ret = -ENOMEM;
 		goto err_unregister_v4l2_dev;
@@ -1233,7 +1233,6 @@ static int msi2500_probe(struct usb_interface *intf,
 	spi_master_set_devdata(master, dev);
 	ret = spi_register_master(master);
 	if (ret) {
-		spi_master_put(master);
 		goto err_unregister_v4l2_dev;
 	}
 
-- 
2.25.1

