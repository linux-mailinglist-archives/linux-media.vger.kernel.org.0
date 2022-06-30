Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27DF9561BC3
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 15:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235573AbiF3Nts (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 09:49:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235448AbiF3NtJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 09:49:09 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D54D631377
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 06:48:42 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id z19so26594113edb.11
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 06:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jE26kz8uLkTSQmG0BFSrQuTDJo25o/aqMTxY60BA87o=;
        b=TjBJe4l27BlUK69/w9aTMBarDu8Hu5rsMI3YPuojTUPjti+DtWbeez4JTqjDFoBeCC
         4CZtxGHVq2VnWJD5DvM38qcux3B8HyI9Xg8OrP2idCpv7Mwz/L87esvTQcbeW5IV5aEh
         kXb0aqoVsHj1slf6mWtRUMYv8iIKOck2Jf5sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jE26kz8uLkTSQmG0BFSrQuTDJo25o/aqMTxY60BA87o=;
        b=3aDLdIIVQIzupg39fE9Rb0N9svFuh95REk5SF5J7yas4P79BQ78u6HEfF0klb81B9J
         bP/KX67gT9khkxSl3UkBreOt2vSQDWkMmXf4zXljxr+TlAiaKeEbU8PixFrNYvpk6eOO
         l6ilXBvkqcpkU/cVai9vpi/o8mRT1TVSFedyRbZdT/ZJuMg6OLGYk/kSkARZA4/wLnMD
         BDbTSDb/nsttWdm7zfoOxem468yiVhHHRLXnY8AOvkm9Y/BQlepANAcLVs3s5c3t+c1S
         C09Z3SqP/m7tYrdpV5vNVMg4fX2AcwL2iOlJ1M92FuW7W/hGQKMqEi7At9OCzglWCV1V
         hkwA==
X-Gm-Message-State: AJIora/GuDhbIZDf1ur2qNksYFB5bR31IDroiErsIM3+n97xA1GS0IE0
        /sSYoR/C/aV0gcYuABkYa7sPsw==
X-Google-Smtp-Source: AGRyM1vAypfxHpAD8WCEQkT4NzUt3sIuZbwI6E+sDAaDx0HZ1xtmOpSsPyY7FmDUDbKMZmjj//OAtQ==
X-Received: by 2002:a05:6402:40cc:b0:435:912b:257a with SMTP id z12-20020a05640240cc00b00435912b257amr11702414edb.380.1656596921341;
        Thu, 30 Jun 2022 06:48:41 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i.station (net-188-217-58-216.cust.vodafonedsl.it. [188.217.58.216])
        by smtp.gmail.com with ESMTPSA id k5-20020a1709067ac500b006fee526ed72sm9130288ejo.217.2022.06.30.06.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 06:48:41 -0700 (PDT)
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     tommaso.merciai@amarulasolutions.com
Cc:     linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        quentin.schulz@theobroma-systems.com,
        Jacopo Mondi <jacopo@jmondi.org>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/6] media: ov5693: count num_supplies using array_size
Date:   Thu, 30 Jun 2022 15:48:30 +0200
Message-Id: <20220630134835.592521-2-tommaso.merciai@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630134835.592521-1-tommaso.merciai@amarulasolutions.com>
References: <20220630134835.592521-1-tommaso.merciai@amarulasolutions.com>
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

Instead of hardcode OV5693_NUM_SUPPLIES in a define is better use
ARRAY_SIZE function to count the number of supplies from
ov5693_supply_names array

Signed-off-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Daniel Scally <djrscally@gmail.com>
---
Changes since v3:
 - Add reviewed-by tag, suggested by Jacopo, Krzysztof

Changes since v4:
 - Add Daniel reviewed-by tag

 drivers/media/i2c/ov5693.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 117ff5403312..f410333c4c67 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -127,11 +127,15 @@
 #define OV5693_LINK_FREQ_419_2MHZ		419200000
 #define OV5693_PIXEL_RATE			167680000
 
-/* Miscellaneous */
-#define OV5693_NUM_SUPPLIES			2
-
 #define to_ov5693_sensor(x) container_of(x, struct ov5693_device, sd)
 
+static const char * const ov5693_supply_names[] = {
+	"avdd",		/* Analog power */
+	"dovdd",	/* Digital I/O power */
+};
+
+#define OV5693_NUM_SUPPLIES	ARRAY_SIZE(ov5693_supply_names)
+
 struct ov5693_reg {
 	u32 reg;
 	u8 val;
@@ -352,11 +356,6 @@ static const s64 link_freq_menu_items[] = {
 	OV5693_LINK_FREQ_419_2MHZ
 };
 
-static const char * const ov5693_supply_names[] = {
-	"avdd",
-	"dovdd",
-};
-
 static const char * const ov5693_test_pattern_menu[] = {
 	"Disabled",
 	"Random Data",
-- 
2.25.1

