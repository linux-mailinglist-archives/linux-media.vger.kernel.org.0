Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADC624282D5
	for <lists+linux-media@lfdr.de>; Sun, 10 Oct 2021 19:55:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbhJJR5G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Oct 2021 13:57:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230271AbhJJR5F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Oct 2021 13:57:05 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB2A4C061570;
        Sun, 10 Oct 2021 10:55:06 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id m3so63650234lfu.2;
        Sun, 10 Oct 2021 10:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3ydAC66omwb1n8JzeihR606o2VoQwnojRyDJQl+M5oM=;
        b=UJ93bh4pdIRSVY7Hax/KViCfkdhDkcsNNlpzVwYW9CQIPNLd/UawcgYsU72qsqkFtY
         zgT34v77cDenF/Hmb2JFJ2EyKv9qk/4+14jIJgy8Mng2cXrUSX0J4AxaIOcV6LKdgn0b
         qsgOJrI14CMQyRVJ+5XXR0uWCRwxjtOW3L+7d/Q1BafBCV7ZzWuzz2NxPIXCoJEW5NZN
         xz7C5ya3cA09rLbCtq9dJpHSMBMjVvYy6DNIj8g5hEBpLkcbs0G9OLLChh1vjOA5BwAI
         RLlChiP4duKlszzdEKnQw3CphjhKia952+Jrn8YjbshQTk5zvTZ6e8imgAkjXhBf6AnC
         exHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3ydAC66omwb1n8JzeihR606o2VoQwnojRyDJQl+M5oM=;
        b=AOWz8LH/nrRNj6XQajdP7kyrVxZ/lQpSvhVC33usEsVKMHbmU+GZWQODt8zBa5xKFf
         Z8iPQGa2Kdf8NlgyVN5+AH4stGOxUsNEhMZ5VRvwasfV2XF5hvIBv15PzLhbnN9RBl9W
         D6FvKqcbfu5PO/sOlGtAAMTWKxHp6P2A7FZFQyC64Yw/C9iRxMk2TRHLIcxhwSYdKp7R
         CaSiSV28uH62qoNdTqtCheSUiX/K6gIBuWVZfNDL/SoSj//FpZAMz0Bc2wgIBIO1MiyC
         trC0ujn5zRY40bTKX5GyyLHnszcpUdqEcMjWKtEF0RvXJs2f8ymToCKSmyGQNb1FMfio
         uDSg==
X-Gm-Message-State: AOAM532IopSxFjCq8CxqTVO14KHBQYDhfmdjAgOTfZ+zTdnxsFvwOBNz
        1I1vedxbKUSU6hCCWBjU2iB6EnbuqVV9Eg==
X-Google-Smtp-Source: ABdhPJytIFiRW7vug7rXrjFy2fWR+VAQPQZHZxnJgAxhmQ4pktSZp3NIk3wzeKCdSWr7zhP9mqKMJw==
X-Received: by 2002:a05:6512:33c9:: with SMTP id d9mr22726278lfg.18.1633888504907;
        Sun, 10 Oct 2021 10:55:04 -0700 (PDT)
Received: from localhost (37-145-209-168.broadband.corbina.ru. [37.145.209.168])
        by smtp.gmail.com with ESMTPSA id u3sm550824lfr.130.2021.10.10.10.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Oct 2021 10:55:04 -0700 (PDT)
From:   Mikhail Rudenko <mike.rudenko@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Mikhail Rudenko <mike.rudenko@gmail.com>,
        Helen Koike <helen.koike@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: rockchip: rkisp1: use device name for debugfs subdir name
Date:   Sun, 10 Oct 2021 20:54:57 +0300
Message-Id: <20211010175457.438627-1-mike.rudenko@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While testing Rockchip RK3399 with both ISPs enabled, a dmesg error
was observed:
```
[   15.559141] debugfs: Directory 'rkisp1' with parent '/' already present!
```

Fix it by using the device name for the debugfs subdirectory name
instead of the driver name, thus preventing name collision.

Signed-off-by: Mikhail Rudenko <mike.rudenko@gmail.com>
---
 drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
index 7474150b94ed..560f928c3752 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
@@ -426,7 +426,7 @@ static void rkisp1_debug_init(struct rkisp1_device *rkisp1)
 {
 	struct rkisp1_debug *debug = &rkisp1->debug;
 
-	debug->debugfs_dir = debugfs_create_dir(RKISP1_DRIVER_NAME, NULL);
+	debug->debugfs_dir = debugfs_create_dir(dev_name(rkisp1->dev), NULL);
 	debugfs_create_ulong("data_loss", 0444, debug->debugfs_dir,
 			     &debug->data_loss);
 	debugfs_create_ulong("outform_size_err", 0444,  debug->debugfs_dir,
-- 
2.33.0

