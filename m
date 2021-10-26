Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41A4C43BAE9
	for <lists+linux-media@lfdr.de>; Tue, 26 Oct 2021 21:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238853AbhJZTg4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Oct 2021 15:36:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238826AbhJZTgs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Oct 2021 15:36:48 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 372C6C061767
        for <linux-media@vger.kernel.org>; Tue, 26 Oct 2021 12:34:24 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id m22so225045wrb.0
        for <linux-media@vger.kernel.org>; Tue, 26 Oct 2021 12:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZX+m9eRP3G6qa3o26UuCwjfzdvb0rxacvbcUwg9LjVM=;
        b=yTCQeaUgyQ77dr9b2Tas/r0wJ3HPcbupOrQjRBkua/PfAuEuXTXMwtxto/o3HU79is
         NmLl9oDzcOdghZbtMlbaHabKQ2UB3EAC63EGGX7nzfEttHH8JIuyEuu1m6pwU4Yxoy1S
         Tmqf/6fYkmrZXx2GePhaTP5vCWlzSUiTUKPOLVf+xkxmpXoqZSiyxfMcjG2kA8mQZr5W
         MDSLSvsLjpGFVthu/fU3iAmVWgXtm2cAmvGL/pGsZuS+9T3gCuAk9E5HaTJ8yYwZVbXv
         IU4NDVhcnr8XD+eekoSB5qnM4rOpYTcHQbfw1/mzq6kCVMQeXBNMWh0zWc7Nrqw5LaX+
         petQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZX+m9eRP3G6qa3o26UuCwjfzdvb0rxacvbcUwg9LjVM=;
        b=ZbRM9jD0EwqsNugzeaa5AptbVL/3d+OalvI0YiSRevOJ9vSy9wmiuGMGiSbO8NCPJ+
         VtQImxFi9OnQLcXYZnQvbv1tUbfKtcsOrnIEltxKzMc5HeiOXj7sp7smkh06vqlUKTUS
         X5UBfUmaxYQh8w7hjX5H5eS1JoJ+CF07xt1xeRC9dp99vnTG8eRuQycdUd9nqmeE4Mf9
         i0lvV6d4+TbjCwzpb9Z3XIjknstdlZbfApJo/XBzznNpslAobiOFzC3Hs5tmc4lwIuhw
         szGTDQ+gTtZV4u7ELKEJJkabJm8URTYeRd7ur5sW1p/UdDdUZxuCL4mX15leVjWOdIji
         ObjQ==
X-Gm-Message-State: AOAM531TSvSDAoXaFm5OF0flyTi2ls46pDvmCtdEXAbMUvcVwkE4G7m8
        gLjjgM9EHkxYG442ohE39JyTBg==
X-Google-Smtp-Source: ABdhPJw3HDmUSQ8StzDpfTOvfI979TWeAuUk5h+MXHiF/2I1HBt1rTdwIYUJA+bXbYnM2R8M3B5XsA==
X-Received: by 2002:a5d:4b51:: with SMTP id w17mr35244771wrs.47.1635276862764;
        Tue, 26 Oct 2021 12:34:22 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id s18sm17676123wrb.95.2021.10.26.12.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 12:34:22 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v3 02/14] staging: media: zoran: use module_pci_driver
Date:   Tue, 26 Oct 2021 19:34:04 +0000
Message-Id: <20211026193416.1176797-3-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026193416.1176797-1-clabbe@baylibre.com>
References: <20211026193416.1176797-1-clabbe@baylibre.com>
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

