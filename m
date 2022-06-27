Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA2D255C654
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 14:52:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237626AbiF0PFG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 11:05:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236422AbiF0PFC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 11:05:02 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C3E917592
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 08:05:01 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id k22so13489369wrd.6
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 08:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pGYlZSXrL+oaB0Q/zXs3LZ4NFxxmWuNHZP0D34FWGxY=;
        b=aVcPlY/e/m99y/qGbVvDjDSjv/2ydjwyEBwpEtzTxs+DDF8/2tInE4vWkkQs47wIkw
         Bp+GvBBrcJx8/tQaaHMaUaJpsQSQHNffH45vGnobt7SlC0tAfLVXCtmEUahLfiSTl91l
         ZnKd2OMdOSYA0L5ZWwedTNeQvtlZrkxFhz9Xc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pGYlZSXrL+oaB0Q/zXs3LZ4NFxxmWuNHZP0D34FWGxY=;
        b=RcrCSHpwNBNuCjMXGGymxqhB8+VKbDORONBYdjdoCpwmJlrypqOqO/+WoTHv1b+moz
         hYRkRyxZwcWAyR7VIPFbfhe4Yv17mbW5dB8Y+gb0eFdOr/A0nK00IQ+092cgcmVPRfGL
         /N8vIOtlkGBc+ayiAkcXrw2AZgRbkYR3OMhFyemzsynWkE/oSuEdYPBocvJhQb/v9GEd
         T+jya0HATQG7ydA0R8LoMDr51H/HUQK5uHpkR14chSW2l4KzUdVDvxm0M0WlHNvVRr/j
         4EKv5Xy3xPnRL/fAyDgJ2he6EtUNsx7Dx0z4En1fS96+aCeF6sOSXvnQS96Ue1LgBGb8
         Wmcg==
X-Gm-Message-State: AJIora9k07WPceai4Fe24I7hODEfzdj7/6zhIeKP5KBreifZUM5HW7Kb
        ZX6u9ZZ21XUAV0k6hQLV05fWew==
X-Google-Smtp-Source: AGRyM1td5t3N3MSQv0AhcCYUAv+rIMiCvLzazaY2pmGLkqXdPiWEzt+KjuCMWt7OvTaWIsVO1dteLg==
X-Received: by 2002:a05:6000:186e:b0:21b:c44a:7ab9 with SMTP id d14-20020a056000186e00b0021bc44a7ab9mr9873638wri.336.1656342299749;
        Mon, 27 Jun 2022 08:04:59 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i.station (net-188-217-58-216.cust.vodafonedsl.it. [188.217.58.216])
        by smtp.gmail.com with ESMTPSA id d18-20020adfe852000000b0021ba3d1f2a0sm10581250wrn.48.2022.06.27.08.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 08:04:59 -0700 (PDT)
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Cc:     linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        quentin.schulz@theobroma-systems.com,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/7] media: ov5693: add dvdd into ov5693_supply_names array
Date:   Mon, 27 Jun 2022 17:04:48 +0200
Message-Id: <20220627150453.220292-3-tommaso.merciai@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627150453.220292-1-tommaso.merciai@amarulasolutions.com>
References: <20220627150453.220292-1-tommaso.merciai@amarulasolutions.com>
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

Add missing "dvdd" (Digital circuit power) entry into ov5693_supply_names
array

Signed-off-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
---
 drivers/media/i2c/ov5693.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index f410333c4c67..9e84468d920e 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -132,6 +132,7 @@
 static const char * const ov5693_supply_names[] = {
 	"avdd",		/* Analog power */
 	"dovdd",	/* Digital I/O power */
+	"dvdd",		/* Digital circuit power */
 };
 
 #define OV5693_NUM_SUPPLIES	ARRAY_SIZE(ov5693_supply_names)
-- 
2.25.1

