Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84CD255D19F
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237563AbiF0PFR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Jun 2022 11:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237651AbiF0PFJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Jun 2022 11:05:09 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49B6D175A6
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 08:05:07 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id o16-20020a05600c379000b003a02eaea815so5021328wmr.0
        for <linux-media@vger.kernel.org>; Mon, 27 Jun 2022 08:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xYWlc/wQ018OwOnNA+AyeCt3Ba+fxR9sI/D7eVEieKk=;
        b=oIMyRqLbbNcQeDmGyzit2hoWXaACc6GAE/IMnjYVAbnHJQ6q5o/Gj7o+kOwoAz/Ach
         dv+JkhuPgsPBPfduG/ElG1gb9r+ZuBWDtWmTXEq86+g722shXGWd9j1CyWKgOKiNALOu
         JcMrRwJykwsRu9UtQGriXChqD34mkNQtWZ8Gk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xYWlc/wQ018OwOnNA+AyeCt3Ba+fxR9sI/D7eVEieKk=;
        b=0o8Ucwe+wTqmWeMN1/QZLdju3TP69TzzHdJABVMD2Jx3TjP8Eoydw+k1r58q7ZjRpT
         yMxvFkrBPS0GZQBkdYzvpVXVJsIe/zl0z7e2nDaq8EZoNibShXPM5u1qLcIGv7/Yy2Wd
         U5F47fU17kPlsPeM1yIJFqnNedcgZo1qK+mJ0ud88Fj3ymGqlNY2+JUmQ9W/EsPjsuOr
         gNABNQcqvigoeUYkaa/8u3yvcePbJxt2QkmYWk3btByIHfMcpUntWsCy4Ldt6mVFtl97
         TeyhdbXYBwDaGmK1HLfKawBbLzC0kL9LBW7gW7x1wnOA29W7eEwi1WZj8fFKqC1Jak8N
         p/tw==
X-Gm-Message-State: AJIora9gjRX1Z0ltf62VvxRrgOi+bFvdyRab6IEq7+26xBLPM9kK8GHO
        LxLtgsammyEhLWCKe25z3PpFnQ==
X-Google-Smtp-Source: AGRyM1uZH3Ii4ouIoGJ/bAPB0LRMvYK4GIAO6xqMH2pvQRoACmD/dsL1R4X08FqzAFFRop6qXGT8kw==
X-Received: by 2002:a05:600c:a18a:b0:3a0:2978:30d2 with SMTP id id10-20020a05600ca18a00b003a0297830d2mr15765046wmb.173.1656342305771;
        Mon, 27 Jun 2022 08:05:05 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i.station (net-188-217-58-216.cust.vodafonedsl.it. [188.217.58.216])
        by smtp.gmail.com with ESMTPSA id d18-20020adfe852000000b0021ba3d1f2a0sm10581250wrn.48.2022.06.27.08.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 08:05:05 -0700 (PDT)
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Cc:     linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        quentin.schulz@theobroma-systems.com,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] media: ov5693: add ov5693_of_match, dts support
Date:   Mon, 27 Jun 2022 17:04:52 +0200
Message-Id: <20220627150453.220292-7-tommaso.merciai@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627150453.220292-1-tommaso.merciai@amarulasolutions.com>
References: <20220627150453.220292-1-tommaso.merciai@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add ov5693_of_match. Device tree support

Reviewed-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 drivers/media/i2c/ov5693.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 273caef467fe..0854226dc140 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -1532,10 +1532,17 @@ static const struct acpi_device_id ov5693_acpi_match[] = {
 };
 MODULE_DEVICE_TABLE(acpi, ov5693_acpi_match);
 
+static const struct of_device_id ov5693_of_match[] = {
+	{ .compatible = "ovti,ov5693", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, ov5693_of_match);
+
 static struct i2c_driver ov5693_driver = {
 	.driver = {
 		.name = "ov5693",
 		.acpi_match_table = ov5693_acpi_match,
+		.of_match_table = ov5693_of_match,
 		.pm = &ov5693_pm_ops,
 	},
 	.probe_new = ov5693_probe,
-- 
2.25.1

