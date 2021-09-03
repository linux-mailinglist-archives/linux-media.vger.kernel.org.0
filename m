Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E07B74005A0
	for <lists+linux-media@lfdr.de>; Fri,  3 Sep 2021 21:16:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350640AbhICTRH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Sep 2021 15:17:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350622AbhICTQ4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Sep 2021 15:16:56 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76952C0613C1
        for <linux-media@vger.kernel.org>; Fri,  3 Sep 2021 12:15:56 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id k5-20020a05600c1c8500b002f76c42214bso215756wms.3
        for <linux-media@vger.kernel.org>; Fri, 03 Sep 2021 12:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZX+m9eRP3G6qa3o26UuCwjfzdvb0rxacvbcUwg9LjVM=;
        b=Ns2hVXrhoznNB3oQH1t3+j6ATt0VKG0o6PldIrMPznDbonpNc1JD3nxHMg2SOs8UB8
         BEJjTrpy4wiOEyUr11OotV8A6rA4sifBneYuht28Gc5LpQI9C+bPdJBSE6ikH5bmDNGw
         cqzxmpIGpbK7/VhLW70smCjFmbueWXY/fc7MfM+Yo1sG39GmR9+QMyasxlMaKklG5Fa9
         YKT09M1sYE4rW2rJLeVh/AkKNItUQk636prFyQ7ozincLTr+iQbEo9cuWtfCqbFvC++B
         trzuWRKuU4MdJ04uS0RxcaGjecHNZL6OGlx33M5+rYVeDG0ngluExiFl0ZClBTh/zNXG
         0hMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZX+m9eRP3G6qa3o26UuCwjfzdvb0rxacvbcUwg9LjVM=;
        b=lJQt4/y6+PCeSVt+pcpO+wX2x/S4wy/SOYaYJHInUKtikbue2m1CLZpbVc5UuZKUE9
         5GhmVm7SqY6Sr+Mwu7F5S2QknEl2Qy9fs6eaLB/JRd5JNCqXIM8tWvHtC0H9EP4cVaVT
         RfQy8F9EUSxhiz3vjp+YqEg54W7osWxnNBOw5NQ/1962EdvvrXz5mdpVLYH83Y68Bwpy
         9Co14R2mswfdZJJkfB/1beCaSJIdW6zhVFRz/y7ua7OLrE/OnIGLCxXTqQo1hYaYiIOA
         7YaXv6YpPQw0OOcirOwswhBMOZL5PwN4dMVWKuEk/KWeDniPQjYzeThNzfPyE4S5PaJC
         g/Zw==
X-Gm-Message-State: AOAM53184Y7dFdH3ozzNeS0aIsuNH4oiMzhug0TP0eEDNQwr3KMgfQPz
        S5cABEyxIwQvqz3777ei6Qbqmg==
X-Google-Smtp-Source: ABdhPJxE0dUX5u4RNf/Wx18X+2EXKv90xIdKm7MsrBaO5GUKwN6yqejEQKaf0pkgyJ7eVksRjDUa2Q==
X-Received: by 2002:a05:600c:acd:: with SMTP id c13mr327456wmr.28.1630696555125;
        Fri, 03 Sep 2021 12:15:55 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a133sm253397wme.5.2021.09.03.12.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 12:15:54 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 2/8] staging: media: zoran: use module_pci_driver
Date:   Fri,  3 Sep 2021 19:15:34 +0000
Message-Id: <20210903191540.3052775-3-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903191540.3052775-1-clabbe@baylibre.com>
References: <20210903191540.3052775-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Simplify code by using module_pci_driver()

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c | 21 +--------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index 3bc0e64f1007..f1465fbf98af 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -1314,23 +1314,4 @@ static struct pci_driver zoran_driver = {
 	.remove = zoran_remove,
 };
 
-static int __init zoran_init(void)
-{
-	int res;
-
-	res = pci_register_driver(&zoran_driver);
-	if (res) {
-		pr_err("Unable to register ZR36057 driver\n");
-		return res;
-	}
-
-	return 0;
-}
-
-static void __exit zoran_exit(void)
-{
-	pci_unregister_driver(&zoran_driver);
-}
-
-module_init(zoran_init);
-module_exit(zoran_exit);
+module_pci_driver(zoran_driver);
-- 
2.32.0

