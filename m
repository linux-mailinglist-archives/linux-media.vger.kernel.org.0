Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0566E56049C
	for <lists+linux-media@lfdr.de>; Wed, 29 Jun 2022 17:31:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234205AbiF2P3q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jun 2022 11:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234198AbiF2P3p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jun 2022 11:29:45 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6E4531900
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 08:29:44 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id fw3so5681248ejc.10
        for <linux-media@vger.kernel.org>; Wed, 29 Jun 2022 08:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pGYlZSXrL+oaB0Q/zXs3LZ4NFxxmWuNHZP0D34FWGxY=;
        b=KV+8dHaeHdOunXfe4zJndAKpkwl/svXXQfG0zQhaNXvUHKInvnYm0R2Q3egVLSxPCq
         wBgAYk8N/i+XTlBZXNu/4dvM2YUk4DflupZnt2Kn7BfVxmyYE+0y/JIYDGrhQl5V4jUv
         tBka2iTn9SsmjOAQ8PI+Nv/nVjIWmEJORxbzw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pGYlZSXrL+oaB0Q/zXs3LZ4NFxxmWuNHZP0D34FWGxY=;
        b=6r57uqvl1I9rGOf7J9HQGITut/OWWt+ftK2HJZ5z8n2IGGsT100xhFLi4CgQ6DA07G
         bpaAVVAyhh+yDJO28YE0pgL9rKre2bgLpD8IwybpX7MaiiJYb5UdasQY/pbP4L6jowpP
         /ZOElDxqhJMOWu86dAU18iG+V2Bf2qIX9JzbIxNeplLm0oOLS1m81Pqo6KLHKsjZIWmX
         uJCFHstKLi6jvIwT0IcpmBP2AzS/hsvjxajf7kxR/6qLk/ngAWFNSb6G12vxcBIw5MNU
         3O+6osiZmeSmixiPdemGpuX7LZEDrspefBMmGW+nv/cLNu3OYAlK9ARf7L6u8JJWc6Ug
         1AXQ==
X-Gm-Message-State: AJIora9QPd3h20oNdb4JTUqFxpHZOvbhvNEdT757qm3YBFvtY6LMY+NR
        lVApXV6NlkcqaT/FGRzzq+FnEw==
X-Google-Smtp-Source: AGRyM1sBdXh3kcMM8zAhmTeuhRb1hhdkiB6AGPUfX7hV1kGhzl4x8Q72xG6q7Z1/6wZJgjgAde72hA==
X-Received: by 2002:a17:907:6da2:b0:726:3ebd:9c9a with SMTP id sb34-20020a1709076da200b007263ebd9c9amr3935753ejc.628.1656516584426;
        Wed, 29 Jun 2022 08:29:44 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i.station (net-188-217-58-216.cust.vodafonedsl.it. [188.217.58.216])
        by smtp.gmail.com with ESMTPSA id h1-20020a1709063c0100b006feec47dae9sm7821853ejg.157.2022.06.29.08.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 08:29:44 -0700 (PDT)
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     tommaso.merciai@amarulasolutions.com
Cc:     linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        quentin.schulz@theobroma-systems.com,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/6] media: ov5693: add dvdd into ov5693_supply_names array
Date:   Wed, 29 Jun 2022 17:29:29 +0200
Message-Id: <20220629152933.422990-3-tommaso.merciai@amarulasolutions.com>
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

