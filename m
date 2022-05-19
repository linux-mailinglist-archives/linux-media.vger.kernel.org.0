Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26F5852DF6B
	for <lists+linux-media@lfdr.de>; Thu, 19 May 2022 23:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235218AbiESVlQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 May 2022 17:41:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229862AbiESVlN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 May 2022 17:41:13 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D831540A26
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 14:41:11 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id h29so11312212lfj.2
        for <linux-media@vger.kernel.org>; Thu, 19 May 2022 14:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o94h8sLCLt40fqauZuVGoEfwWwXX9O/1g0eQp3K1XUw=;
        b=kebtpC8lhyx9L95G2pbKL9Dy4EqGRttIr7lOZVYXlvLJ0Q8UfY5foo63C/c07VCZcs
         00LLcyMi5UveJLyl7o5U+EBshPXOH1fYcZXFGwQAyRLqIyvBy+94f8O40S03kw7Ze9zb
         B305nvt521pfYAmuIHfhkE1zvkl7RHKVHkDo0/QVJv59WBu+OvsgeEYdTrFzglpiTXbH
         jZwXZB2Jvg3FKiGVUQOASstP04okX9eBrsHJB3iQPv2BMo5VchNUnajm9ZQnsXoPnKTR
         YC9JKJWXwZKGOWqa9GD/k/6hD3uZcnCc1IUl7P+ZqhcSKyNBb6xtWuQGkZdWXmH2/lU3
         cM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o94h8sLCLt40fqauZuVGoEfwWwXX9O/1g0eQp3K1XUw=;
        b=0ZkCPPhibd6wu8EhfKor80L0GH4vzkH93c7cd6sN4eFmUCqoJa61+tRxVRB2kqs2wp
         TVcdsQ1PJl81arydy2WzNIBhZSWMM1Z2xH5hUGjuO8i+fUwejpbYHR1VFn/NfoeU6PoS
         Qth2+mYbOL1Gf7RLzCmlXueGzZffaj5lP9H6NIHVFvDiGIAeZzdR4cmrLfVjDt9iNMNG
         YSz2m7fhsK0qK0orrHOM42IlutX8K69Sz5ZLDlK7Wa9O0Y+FSLB6mHCh/lpb2Ls/7KyL
         6dxtzJBandIO1iO3gEZjknWwrLX0w+vijUBYoLbnsTq1ZFnNQfGJvzBwWdmXJ6eXWoaq
         eclQ==
X-Gm-Message-State: AOAM533Mrim8cpHLwflQ8Seft6uEs4IlZ4mGPW6c6uG/YSHlEO+UmEVI
        1Hjtt18NpB5Y5MfdWh05mRARdg==
X-Google-Smtp-Source: ABdhPJw2eHBzh3n6N23GZYh5QcYsY/4DEr80bXBXSwAP91zY4xnwBvqdagfKGM9ggIn56UpmkpQ0TQ==
X-Received: by 2002:a05:6512:1509:b0:443:e7fa:1c68 with SMTP id bq9-20020a056512150900b00443e7fa1c68mr4560368lfb.58.1652996470272;
        Thu, 19 May 2022 14:41:10 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id o6-20020ac24346000000b00477a8c6b08dsm410221lfl.100.2022.05.19.14.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 14:41:09 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
        Archit Taneja <architt@codeaurora.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH] media: platform: omap: Pass a pointer to virt_to_page()
Date:   Thu, 19 May 2022 23:39:06 +0200
Message-Id: <20220519213906.779610-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A pointer into virtual memory is represented by a (void *)
not an u32, so the compiler warns:

drivers/media/platform/ti/omap/omap_voutlib.c:317:54: warning:
  passing argument 1 of 'virt_to_pfn' makes pointer from integer
  without a cast [-Wint-conversion]

Fix this with an explicit cast.

Cc: Vaibhav Hiremath <hvaibhav.linux@gmail.com>
Cc: Archit Taneja <architt@codeaurora.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/media/platform/ti/omap/omap_voutlib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/ti/omap/omap_voutlib.c b/drivers/media/platform/ti/omap/omap_voutlib.c
index 480a7e95533d..fdea2309ee37 100644
--- a/drivers/media/platform/ti/omap/omap_voutlib.c
+++ b/drivers/media/platform/ti/omap/omap_voutlib.c
@@ -314,7 +314,7 @@ unsigned long omap_vout_alloc_buffer(u32 buf_size, u32 *phys_addr)
 
 	if (virt_addr) {
 		while (size > 0) {
-			SetPageReserved(virt_to_page(addr));
+			SetPageReserved(virt_to_page((void *)addr));
 			addr += PAGE_SIZE;
 			size -= PAGE_SIZE;
 		}
@@ -335,7 +335,7 @@ void omap_vout_free_buffer(unsigned long virtaddr, u32 buf_size)
 	order = get_order(size);
 
 	while (size > 0) {
-		ClearPageReserved(virt_to_page(addr));
+		ClearPageReserved(virt_to_page((void *)addr));
 		addr += PAGE_SIZE;
 		size -= PAGE_SIZE;
 	}
-- 
2.35.1

