Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C8D557210A
	for <lists+linux-media@lfdr.de>; Tue, 12 Jul 2022 18:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233328AbiGLQel (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jul 2022 12:34:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234458AbiGLQeY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jul 2022 12:34:24 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AFFE25289
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 09:34:23 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id f2so11931379wrr.6
        for <linux-media@vger.kernel.org>; Tue, 12 Jul 2022 09:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=89nMQY6HYa205yz8a9PXVreqJnhbEp/5UjZ/0K+ojBk=;
        b=Sbj3OenGDNgca8fxaKSwwSFWyjuRmCOQNHQsUJmiQ5hzLNGBtB5VD5qu3THqAUtZ9Y
         WyOtO/ZU2yIesrCXN6g6Fa5e6Sgdqt/KoXgplKkXuLGt63KAraOSxBk6hQm2HGUQe3hx
         jbfzYNUMS4IodFAzhJKmwS/eqtnmvsjUpRmXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=89nMQY6HYa205yz8a9PXVreqJnhbEp/5UjZ/0K+ojBk=;
        b=g/C00esHEBHdGPge/MDZGtV7nD5qM2m40rR2GBIsCCJTAq/gY7Sv7r6br6W2OBwgCa
         vyAhMQGTQaQMBwmNiHeDckuBQTb6EvAPXqXzo31uLdFTSKNodQt6HT/9rvGjtF91BfTz
         IwYfaH6gi2r2gtgr0s93gig0THv+WF3QFS/Vgd9mSqAAf07kP6M7LGZ7/YA0xSASl1p6
         0bMMipM80qnb/hc794BgQ2szu8QRLYx7ULe3e8EA5LNTSF6bJFODHxZsqUZfFXIGqK/e
         9N6BvP2MomIG5LOrPmfYDuZSsL4X2XjpcwcOpKlm2xuPNL8hcCD+yR/BbYiGW7Vf706d
         Ux2Q==
X-Gm-Message-State: AJIora++rebwSS9Lqz2DfTb+vOtQYJuFwYIPxSnwVauecoxgQEOoKFwb
        umvTa6SfM3GS0eIpLId26uao1Q==
X-Google-Smtp-Source: AGRyM1vpE0g2EPdx1v6ZXFwl0FZwWK05OYeD6gB+mPU8ZvzyMwQc1WUVBry6G63zOCENCNZijoHsoQ==
X-Received: by 2002:a5d:4c49:0:b0:21d:6df5:beb7 with SMTP id n9-20020a5d4c49000000b0021d6df5beb7mr23158622wrt.286.1657643661957;
        Tue, 12 Jul 2022 09:34:21 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i.station (net-188-217-53-214.cust.vodafonedsl.it. [188.217.53.214])
        by smtp.gmail.com with ESMTPSA id j16-20020a5d6050000000b0021db2dcd0aasm2321052wrt.108.2022.07.12.09.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 09:34:21 -0700 (PDT)
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     tommaso.merciai@amarulasolutions.com
Cc:     linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        quentin.schulz@theobroma-systems.com,
        Jacopo Mondi <jacopo@jmondi.org>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 6/6] media: ov5693: add ov5693_of_match, dts support
Date:   Tue, 12 Jul 2022 18:33:49 +0200
Message-Id: <20220712163349.1308540-7-tommaso.merciai@amarulasolutions.com>
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

Add ov5693_of_match. Device tree support

Signed-off-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
Reviewed-by: Daniel Scally <djrscally@gmail.com>
---
Changes since v2:
 - Change patch order 7 -> 6 as suggested by Sakari
 - Add missing signed-off as suggested by Jacopo

Changes since v3:
 - Add reviewed-by tags, suggested by Jacopo, Krzysztof

Changes since v4:
 - Remove wrong Sakari reviewed-by tag, suggested by Krzysztof, Sakari
 - Add Daniel reviewed-by tag

 drivers/media/i2c/ov5693.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 701468267f20..82a9b2de7735 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -1533,10 +1533,17 @@ static const struct acpi_device_id ov5693_acpi_match[] = {
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

