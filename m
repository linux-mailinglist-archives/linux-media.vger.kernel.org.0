Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A16963B456
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 22:45:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233214AbiK1VpN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 16:45:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232801AbiK1VpM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 16:45:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A77411DF25
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 13:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669671858;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HYgpL2606mVfO+98npo7eaosHXY5I8deinLTWhiViEE=;
        b=SozgTE4t+V2EvkMHIkAe+Nu6s/pDrW+MJ5WoSWW4GQOACsmp8PX4tQZzufBOeSKAmwVsSX
        lmS9rmXYJ6gP6L3gsAJTu5upA1BqCSREw60krIBSFQq5ZeqPV/k60JCVCYMaFKQV11BRFa
        fsg3gXgGGPc3CAVZwMTUeI/G+F+U0ak=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-XIfB4YCLNIye0mUOA4KgEA-1; Mon, 28 Nov 2022 16:44:15 -0500
X-MC-Unique: XIfB4YCLNIye0mUOA4KgEA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD33286C177;
        Mon, 28 Nov 2022 21:44:14 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.115])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 23AFD40C6EC2;
        Mon, 28 Nov 2022 21:44:13 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Subject: [PATCH 1/5] gpio: tps68470: Fix tps68470_gpio_get() reading from the wrong register
Date:   Mon, 28 Nov 2022 22:44:04 +0100
Message-Id: <20221128214408.165726-2-hdegoede@redhat.com>
In-Reply-To: <20221128214408.165726-1-hdegoede@redhat.com>
References: <20221128214408.165726-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For the regular GPIO pins the value should be read from TPS68470_REG_GPDI,
so that the actual value of the pin is read, rather then the value the pin
would output when put in output mode.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpio/gpio-tps68470.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-tps68470.c b/drivers/gpio/gpio-tps68470.c
index aaddcabe9b35..778a72cf800c 100644
--- a/drivers/gpio/gpio-tps68470.c
+++ b/drivers/gpio/gpio-tps68470.c
@@ -30,7 +30,7 @@ static int tps68470_gpio_get(struct gpio_chip *gc, unsigned int offset)
 {
 	struct tps68470_gpio_data *tps68470_gpio = gpiochip_get_data(gc);
 	struct regmap *regmap = tps68470_gpio->tps68470_regmap;
-	unsigned int reg = TPS68470_REG_GPDO;
+	unsigned int reg = TPS68470_REG_GPDI;
 	int val, ret;
 
 	if (offset >= TPS68470_N_REGULAR_GPIO) {
-- 
2.38.1

