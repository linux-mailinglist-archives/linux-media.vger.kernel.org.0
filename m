Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 604C6375370
	for <lists+linux-media@lfdr.de>; Thu,  6 May 2021 14:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230381AbhEFMNd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 May 2021 08:13:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbhEFMNb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 May 2021 08:13:31 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38C44C061574;
        Thu,  6 May 2021 05:12:32 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id j10so7405484lfb.12;
        Thu, 06 May 2021 05:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fZu2pbACv1pjiePADfO8gBHAoJuthgIq1ShMV5M39W8=;
        b=d1gK+nyCabCN6MgYPaUnPqnVnFCTnrweOvWBKyfk3M+iv8dsVGai11pJrwhQtvcdsU
         jnk7YrvyT5QEJp+R8FxVwZXHSzuC9Y9sPCDse3yd++vkEgILOQEks4r2DCYNhY0pNpiE
         VUTjpxLA0SdA1EpRxrlfzSN6t0tYg32BjUCITVNySloQ3D/UoI11rh+iXGQBT286s8WU
         MDHJqRj24S4TBqYlKtNt7sdbWVjWxEo9TVHC34G6G2Si8zfCc7z6+1U6akbjCZ+0MhJS
         VIJ+QLma4fYSsqQDO7RaGoScw7cEfZl+elEhnnvxIATJVf0po5BTAJTW8RiSvtBhEs/j
         us4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fZu2pbACv1pjiePADfO8gBHAoJuthgIq1ShMV5M39W8=;
        b=InXCZ3lHh43Gx3Fjx/jn/V8JaVhe/0yLsQLSigD4QrKIqtaGlI7KGhbqwIiq3wx4Ah
         J9YRLm79Ye+izBEO19yDUoowqkuv8a1Yr6RShB/GMqg8Tyv8I/KqB2TeEQr1Q7O2+Y1O
         gCIvvVo86ADI3ScQRifreWzgg7FSlCDjoM6TlTQFqLqvekFxIXZrcXr96OE0hcB5tdeb
         UF1nWovKxg7hfkEG7sd4ieC/LMD++aplO69pIaMV8Ie4JeTbEqAwZEozmRguXPLrmjo1
         FmTG+MHRizp/ijO2oSphcReNzTDEC4/YNPfycx2zw0wsfgIpLoh4d6/sjuwzcYlENoIw
         24nw==
X-Gm-Message-State: AOAM530UokhQFFuPNnkiUifSZwk/0AQFWdE4fmroVgxICTD4rk2fkz54
        i0Ei3ZDBtCfqN9fR9Hy3LceGwCNixdBauw==
X-Google-Smtp-Source: ABdhPJzGET6GJ1dUtBo/4G3xycq3vQf2BHCJJXhYgMRUdsQoeELqJ9iKcNowAHqXBlnGi92WhAN0Eg==
X-Received: by 2002:a05:6512:3888:: with SMTP id n8mr2702820lft.407.1620303150604;
        Thu, 06 May 2021 05:12:30 -0700 (PDT)
Received: from localhost.localdomain ([94.103.226.84])
        by smtp.gmail.com with ESMTPSA id z23sm630791lfu.32.2021.05.06.05.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 05:12:30 -0700 (PDT)
From:   Pavel Skripkin <paskripkin@gmail.com>
To:     mkrufky@linuxtv.org, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Pavel Skripkin <paskripkin@gmail.com>,
        syzbot+7336195c02c1bd2f64e1@syzkaller.appspotmail.com
Subject: [PATCH] media: dvb-usb: fix wrong definition
Date:   Thu,  6 May 2021 15:12:11 +0300
Message-Id: <20210506121211.8556-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

syzbot reported WARNING in vmalloc. The problem
was in sizo size passed to vmalloc.

The root case was in wrong cxusb_bluebird_lgz201_properties
defenition. adapter array has only 1 entry, but num_adapters was
2.

Call Trace:
 __vmalloc_node mm/vmalloc.c:2963 [inline]
 vmalloc+0x67/0x80 mm/vmalloc.c:2996
 dvb_dmx_init+0xe4/0xb90 drivers/media/dvb-core/dvb_demux.c:1251
 dvb_usb_adapter_dvb_init+0x564/0x860 drivers/media/usb/dvb-usb/dvb-usb-dvb.c:184
 dvb_usb_adapter_init drivers/media/usb/dvb-usb/dvb-usb-init.c:86 [inline]
 dvb_usb_init drivers/media/usb/dvb-usb/dvb-usb-init.c:184 [inline]
 dvb_usb_device_init.cold+0xc94/0x146e drivers/media/usb/dvb-usb/dvb-usb-init.c:308
 cxusb_probe+0x159/0x5e0 drivers/media/usb/dvb-usb/cxusb.c:1634

Reported-and-tested-by: syzbot+7336195c02c1bd2f64e1@syzkaller.appspotmail.com
Signed-off-by: Pavel Skripkin <paskripkin@gmail.com>
---
 drivers/media/usb/dvb-usb/cxusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/usb/dvb-usb/cxusb.c b/drivers/media/usb/dvb-usb/cxusb.c
index 761992ad05e2..7707de7bae7c 100644
--- a/drivers/media/usb/dvb-usb/cxusb.c
+++ b/drivers/media/usb/dvb-usb/cxusb.c
@@ -1947,7 +1947,7 @@ static struct dvb_usb_device_properties cxusb_bluebird_lgz201_properties = {
 
 	.size_of_priv     = sizeof(struct cxusb_state),
 
-	.num_adapters = 2,
+	.num_adapters = 1,
 	.adapter = {
 		{
 		.num_frontends = 1,
-- 
2.31.1

