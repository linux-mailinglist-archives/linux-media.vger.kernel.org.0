Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFA805247A4
	for <lists+linux-media@lfdr.de>; Thu, 12 May 2022 10:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233612AbiELIJQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 12 May 2022 04:09:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbiELIJP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 12 May 2022 04:09:15 -0400
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50D0E6B086
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 01:09:13 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id k126-20020a1ca184000000b003943fd07180so2510414wme.3
        for <linux-media@vger.kernel.org>; Thu, 12 May 2022 01:09:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h0SOY4SK/fX0R/bWyQCkYZVboGTqoYMzEOZZpYyuhHc=;
        b=WKaQ78wBQVtGV6USZ7oQ7+Jj77r+NQ7mdx1crOz5JjEURyi2TAjxoskzDHvXEOnTbU
         bbHGsDRzCIwB9fMDQdncPF8fI9HGhuvMG7Atsga7lPeRVBuPamtzsCll5eCmiKOZ72B1
         vTrl0qKn1jHR+dWAukSalVQWrSU6+L2hYGQjow8RpFnz3tijzvLu+JlSzU8RRqgvBFHA
         njiTdr2J2cPAAwnXOnq0ArJZQPaC8nAXJn8OXFxA3xUNzY2mzl6G3FjNaH41LexD7jqj
         7xSlt0x5v6dk/6C5Emu8V4O93nH0nCOy23WKe3iV/flo1STWT9upNQuL0E0GvOoQKblx
         GvYA==
X-Gm-Message-State: AOAM530d5KHOYdjx2Z2vHlR87aqQqZtu0ec2QsPo1xYRh6Je8YyIY1pu
        eACGF2paBpSutg2T6tuxaov6OOTrfrg=
X-Google-Smtp-Source: ABdhPJzTcb6RJrMRMe9NPV/UBKZ+Y9dNrkwCjJnH6VRoGCoAnmQhZsXYk5TBycqggDJ3rUeWKJuOEQ==
X-Received: by 2002:a05:600c:21c8:b0:394:7796:49c0 with SMTP id x8-20020a05600c21c800b00394779649c0mr8970696wmj.191.1652342951905;
        Thu, 12 May 2022 01:09:11 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:26:14d:2383:a80b:b4b0:e183])
        by smtp.gmail.com with ESMTPSA id 4-20020a05600c02c400b003942a244edasm1842474wmn.31.2022.05.12.01.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 01:09:11 -0700 (PDT)
From:   Benjamin Marty <info@benjaminmarty.ch>
To:     linux-media@vger.kernel.org
Cc:     Benjamin Marty <info@benjaminmarty.ch>
Subject: [PATCH] media: i2c: adv7180: fix reserved bit in Video Selection 2
Date:   Thu, 12 May 2022 10:08:59 +0200
Message-Id: <20220512080859.9923-1-info@benjaminmarty.ch>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This bit is marked as reserved in the ADV Hardware Reference Manual.

Resetting this bit seems to cause increased video noise. Setting this bit according to the Hardware Reference Manual reduces the video noise immediately.

Signed-off-by: Benjamin Marty <info@benjaminmarty.ch>
---
 drivers/media/i2c/adv7180.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index 4f5db195e66d..d99b22286b74 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -1014,7 +1014,8 @@ static int adv7182_init(struct adv7180_state *state)
 
 static int adv7182_set_std(struct adv7180_state *state, unsigned int std)
 {
-	return adv7180_write(state, ADV7182_REG_INPUT_VIDSEL, std << 4);
+	return adv7180_write(state, ADV7182_REG_INPUT_VIDSEL,
+			     (std << 4) | (0x01 << 2));
 }
 
 enum adv7182_input_type {
-- 
2.36.1

