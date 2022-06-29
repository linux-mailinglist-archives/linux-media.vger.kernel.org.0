Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4A65604A3
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 17:31:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233924AbiF2P3q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 11:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232340AbiF2P3p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 11:29:45 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E3E62E9FB
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 08:29:44 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id ge10so33340541ejb.7
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 08:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rpdfidpXpaazosoDOCbj0RBJV66iHVFwcJEcEN756BA=;
        b=IUS/tQRV9Xs0sgYfGzsGhha70gjVBz73nkez+m28P78MxPJ1VnIrffUNwQHOD1NfT+
         ApcTOwQaguPZMCwXAqs7FLzkEWj5L3+8to103g1o2rAmze8MxSROnytO0DzP7F/XyhKy
         IF0Kp8RgZkV+gLPO8ejmugKNnzK/fdxR412Gk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rpdfidpXpaazosoDOCbj0RBJV66iHVFwcJEcEN756BA=;
        b=gK4925oOSsOeivWQiWHZFJXJJwxNdeZNm94DgN4CRBbK0YCHtOwuV8DKuXErlTifdb
         +ZoPuGPqSfiG5FgSki5SWnBjdy11uBx+a+tftxe2rRAh2rK+iBxm8JnkgkDr0fk4zgK9
         FDSvigtlJKOyr7AyQgR1zZdneb82n/gJpzy5f+33xSNPp5NCSFJr4lD+oiT908qCZNQO
         eRmGRG1Ej7Xt+CrvTrlrEr7VkMNvpHjF4NHtgjc8uaFkSpCHBWK6nNWTh1HwQgjMODmp
         03GHlzZZFwA69KzVzR8IrvelgDnfmGJdodhf09wKI2PgIfla7b95NVqIVw185fKRyDUn
         4Zsg==
X-Gm-Message-State: AJIora9A4o8XHXRhU6gFxdekM6TJC0egL2WLCjeGUZ0nfxHT8G3kc0ue
        bIR6N9GJ3ePBQoBBgg+QFGgbuA==
X-Google-Smtp-Source: AGRyM1u4hDEDe8vTP5yvMrLYpGxV5O1fWsGZEEbyIItQ7ZfOMuq+gWVjiushepTKDboGCuaJ6DmYaA==
X-Received: by 2002:a17:906:3f51:b0:712:3945:8c0d with SMTP id f17-20020a1709063f5100b0071239458c0dmr3823631ejj.302.1656516583001;
        Wed, 29 Jun 2022 08:29:43 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i.station (net-188-217-58-216.cust.vodafonedsl.it. [188.217.58.216])
        by smtp.gmail.com with ESMTPSA id h1-20020a1709063c0100b006feec47dae9sm7821853ejg.157.2022.06.29.08.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 08:29:42 -0700 (PDT)
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     tommaso.merciai@amarulasolutions.com
Cc:     linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        quentin.schulz@theobroma-systems.com,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] media: ov5693: count num_supplies using array_size
Date:   Wed, 29 Jun 2022 17:29:28 +0200
Message-Id: <20220629152933.422990-2-tommaso.merciai@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220629152933.422990-1-tommaso.merciai@amarulasolutions.com>
References: <20220629152933.422990-1-tommaso.merciai@amarulasolutions.com>
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
---
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

