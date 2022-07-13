Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13AA257399F
	for <lists+linux-media@lfdr.de>; Wed, 13 Jul 2022 17:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236786AbiGMPF3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jul 2022 11:05:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236759AbiGMPFN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jul 2022 11:05:13 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA55141D38
        for <linux-media@vger.kernel.org>; Wed, 13 Jul 2022 08:05:12 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id l68so6683935wml.3
        for <linux-media@vger.kernel.org>; Wed, 13 Jul 2022 08:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jE26kz8uLkTSQmG0BFSrQuTDJo25o/aqMTxY60BA87o=;
        b=gUbx5q33LywiMvhPgpaKOwbSPMBdwh4DwBxzRhs75JniMIr93Dn1/4Ci9jaQsEfgER
         PeMyJBJk+WS4Ogyr5bMn4TpjguNtzgtVXfB6Zt37HvLtSwphQt4naefxFhby1dedvW8L
         5uIx8qPLZauFeY3yc3dyJ3aAGKv7o1E+SDHcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jE26kz8uLkTSQmG0BFSrQuTDJo25o/aqMTxY60BA87o=;
        b=WUkj723jF+5R3wM8U0N2Ls36aHVbtTt/af4jsl2yL8wNrdmaOEtAVi1Ob+h8PmOGHv
         tF72M3KxAWYDgjWPS1q6nFA13JpsNZqbQlERzZvnxK1U+NjNfNRW/HgK3uTMQ+rsyJvI
         EwdO51XXA3dfLzySKhQzQvKPue/GSvNzOu4PAqHBr+NRbJDgrwpxb8swMd7lGFR4BMBG
         Hmy9TlDIl4Pwr17WWMnsO1I5Hak+uda5XSWQP1UDXOKgaYLuQzI59zsO7Wrq8BlAw0zD
         Y1Qt0+U11QodjJqFJKIePNnz00eYxRjQHPjeumMMDf0XQy/hCF68KRORJETjOXaJhdGK
         2zFw==
X-Gm-Message-State: AJIora83K21Zma7f0tzXsHMvVELzAgP2NFZc4za6fvJWqYZ7FSoGNozg
        2c7H6KzDqSb4ot3LDgZ1eg9B6Q==
X-Google-Smtp-Source: AGRyM1uKWukIoMsKGox2XaO6iG6qJ0Oa0WKKnKK2MgGEiClVKXd64DuIW0iEQ4YutRAbRbtODMSzMg==
X-Received: by 2002:a05:600c:25ce:b0:3a2:dd48:9b33 with SMTP id 14-20020a05600c25ce00b003a2dd489b33mr4202758wml.134.1657724711316;
        Wed, 13 Jul 2022 08:05:11 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i.station (net-188-217-51-7.cust.vodafonedsl.it. [188.217.51.7])
        by smtp.gmail.com with ESMTPSA id f17-20020a05600c4e9100b003a2d87aea57sm1465537wmq.10.2022.07.13.08.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 08:05:11 -0700 (PDT)
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     tommaso.merciai@amarulasolutions.com
Cc:     linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        quentin.schulz@theobroma-systems.com,
        Jacopo Mondi <jacopo@jmondi.org>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/6] media: ov5693: count num_supplies using array_size
Date:   Wed, 13 Jul 2022 17:05:01 +0200
Message-Id: <20220713150506.2085214-2-tommaso.merciai@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220713150506.2085214-1-tommaso.merciai@amarulasolutions.com>
References: <20220713150506.2085214-1-tommaso.merciai@amarulasolutions.com>
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

