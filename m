Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2ABD5720FC
	for <lists+linux-media@lfdr.de>; Tue, 12 Jul 2022 18:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233366AbiGLQe3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jul 2022 12:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234015AbiGLQeL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jul 2022 12:34:11 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7037729C8F
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 09:34:09 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id q9so11942418wrd.8
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 09:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jE26kz8uLkTSQmG0BFSrQuTDJo25o/aqMTxY60BA87o=;
        b=QIfK3LMHQAAiBrxqfYZoLMYn/I5LnR167Bvk75Kzzm7glu3CnnWflBthGnVxpPXsvH
         FFfLtZAyQwe2pG5VFkQpCwcSxURi5nBhsT8qDQLaf6eMIB/7/VzHvmrdIjRzanLAdbvf
         rt3yuhRvb3ftn70UVam1VUAFAyr8Kus6HFgko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jE26kz8uLkTSQmG0BFSrQuTDJo25o/aqMTxY60BA87o=;
        b=WOnAxUemSM/ivUsjtj30m1G5Lt1FB0vuAVkH+LOS7xLZ9g+y2DPvwyLBhn1HIwm3cy
         WwW0h+rb47b1DvHjR2ctWpKa5OlmsQjW8CiyWL1sZsACuVZpXNGsZnSFEiogOeVN8S47
         UMDdz2kfEQJriqZcFrjrKj4np7NwgGcpP6BTF06qmDCwbtu+WlH+vcpLkkzsOk55EH7X
         jXsT9eLF490fG02sOM6GszZAMbUlqtBpOloRkB7sMQkBss1oxFWrLtpqwAz5whMDCJWs
         kJGZmMZzBwsaWHd1IJNJkwCrRblSj2T2K10qMXGMMGqtm+wgMt06GlOqy+kH4EgqsO8m
         elqQ==
X-Gm-Message-State: AJIora8jFlhSZHHFvriCXuc5fcpwYC3oO03KtzJdAiAY/4+YMBKzdmp+
        pBCc1v1sBF5uaKfoZI3/zTkLKA==
X-Google-Smtp-Source: AGRyM1sX8eiouGb/oS1nfMSYyiXaIM3ieUoYGxmHF38hDy0MP1i/e/1eQdLeCX05rJW2O55lFT8ICg==
X-Received: by 2002:a5d:6149:0:b0:21d:6ba7:6095 with SMTP id y9-20020a5d6149000000b0021d6ba76095mr22466762wrt.680.1657643647530;
        Tue, 12 Jul 2022 09:34:07 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i.station (net-188-217-53-214.cust.vodafonedsl.it. [188.217.53.214])
        by smtp.gmail.com with ESMTPSA id j16-20020a5d6050000000b0021db2dcd0aasm2321052wrt.108.2022.07.12.09.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 09:34:07 -0700 (PDT)
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     tommaso.merciai@amarulasolutions.com
Cc:     linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        quentin.schulz@theobroma-systems.com,
        Jacopo Mondi <jacopo@jmondi.org>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/6] media: ov5693: count num_supplies using array_size
Date:   Tue, 12 Jul 2022 18:33:44 +0200
Message-Id: <20220712163349.1308540-2-tommaso.merciai@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220712163349.1308540-1-tommaso.merciai@amarulasolutions.com>
References: <20220712163349.1308540-1-tommaso.merciai@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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

