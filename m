Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E90E55A48E
	for <lists+linux-media@lfdr.de>; Sat, 25 Jun 2022 01:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231526AbiFXXDc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jun 2022 19:03:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiFXXDa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jun 2022 19:03:30 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 249DE51E5D
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 16:03:29 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id pk21so7575799ejb.2
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 16:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rpdfidpXpaazosoDOCbj0RBJV66iHVFwcJEcEN756BA=;
        b=cdPlkqVcoWoSFU8LRn4IpAsmIYKReNGfIdPxoZMdkRPq2WFoQ9nr5dwMnG5+weD/sD
         J02wws+Qe4SgAoovSNOpaoRrnein1CmTagwuoj5Hqn6R/rFLDJRmczsefN1Sr14YtW4Q
         IUJD4oJeb/wtkA8EmCsv/ei3y3hrvU0TUrwDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rpdfidpXpaazosoDOCbj0RBJV66iHVFwcJEcEN756BA=;
        b=HMSHZHFs7hHeGdizyaMu39tCPIftTxQe8QXRPSKnzdexeZbM7TRKzMOgVHaNJEGIz/
         0DwOyqMmKeMZuTc8+SlQ5z94fbz+dnFyRXuSE5NX4VdEVclhFpjwSZabx0Dv8H1VHFFo
         Wo8kQ1uWgcyq1A0mvyhQO6P1Ln/LfGCQ1DhyVWKxti2pU/1iMqEj5+jJ3WAAEp4l45Q0
         O1+Vr74L2UC3jSJ3gxmfQVjo0f3aRZYU49rIU4Db9+ujncOiEexnkeBPQ7TlpyRXugIJ
         IBbuEUPUE673DBd7jugZOYE3tpcXRIOMPMhzQrrNwNUsHCHg3IGqLBKDBBvR67aw1R+m
         MM9g==
X-Gm-Message-State: AJIora9OAH/hRLDN/WxDDEWpr4EFyZ3QKZl3PchYjqg77KN29ESSe9S+
        pZgTtewyHfNzZjQ3v7XFEZtfBtCYuXHZYg==
X-Google-Smtp-Source: AGRyM1vhqjiGM7xH32xE7QgCpESMy0PxzCwGDtTt0aC5PvWyn9gqo5qu7GB847/gpS4mM9tg+ABWHA==
X-Received: by 2002:a17:907:2d2a:b0:726:3527:60ac with SMTP id gs42-20020a1709072d2a00b00726352760acmr1262045ejc.661.1656111807720;
        Fri, 24 Jun 2022 16:03:27 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i.station (net-188-217-58-216.cust.vodafonedsl.it. [188.217.58.216])
        by smtp.gmail.com with ESMTPSA id w1-20020aa7da41000000b004356a647d08sm2880291eds.94.2022.06.24.16.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 16:03:27 -0700 (PDT)
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Cc:     linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        quentin.schulz@theobroma-systems.com,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] media: ov5693: count num_supplies using array_size
Date:   Sat, 25 Jun 2022 01:03:01 +0200
Message-Id: <20220624230307.3066530-2-tommaso.merciai@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220624230307.3066530-1-tommaso.merciai@amarulasolutions.com>
References: <20220624230307.3066530-1-tommaso.merciai@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
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

