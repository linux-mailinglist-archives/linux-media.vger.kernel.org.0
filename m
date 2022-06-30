Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECBC0561BF7
	for <lists+linux-media@lfdr.de>; Thu, 30 Jun 2022 15:51:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235639AbiF3Nuc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jun 2022 09:50:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235551AbiF3Nth (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jun 2022 09:49:37 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 524C937AB2
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 06:48:51 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id q6so39053074eji.13
        for <linux-media@vger.kernel.org>; Thu, 30 Jun 2022 06:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UyZCaF6+qRS4Tv5koTh8Q5qQEkydwOcaODvMQ6qR/MQ=;
        b=e+d4Orc3w9dk00wlozE8gVY3xNuuARW9q+cHmyLq1PSkXNMae9wkooVTYoNLTXyQf+
         PC5ps9jB7YSMaSjBP3tnC6OmiAxYPjQbQPwm2GcsyseAqHFWVDsAs09i8thDK07HfgvF
         SqvzNpmKn4LX3fGYDP9dO0mrKQzGWA+M0t8dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UyZCaF6+qRS4Tv5koTh8Q5qQEkydwOcaODvMQ6qR/MQ=;
        b=lta6EVnw4emz6OG5uLv3Z+NsrRF42AUZUlAKJ5PcQ+eYbiXtULUrl4OW5pdY7tmdEB
         507nNfAp33kH1l06DJLWQSwblqJgMsdYaBSAxB42jx4h4g70siMV6KyYGg0sc0LLJGSI
         jpV97NPPbkEHvKD11/VXVSa+BUnkAYbjrDh0aUqksMH6UXsivKij6SfVVfmYNSOIxvCz
         FayuoVavkWDrFZ3NWb5gmv6+TNg7/bWwabnvcqwsfgKLHfKENR86iZWk2mXGVdYRPbD1
         XiurPw/0TccBdxi9PAnjD0+G4CchCwhhmTdBrEfEw0xbUDhokOuh2VPIsELabRaBrZ5O
         A30Q==
X-Gm-Message-State: AJIora/doaS3qAZdxIc4dZbw2buUITX0DmVKEWMPRn90xhJwSbIjsEmc
        AGHLu29Dg5kZj2aFHq+ALbnR3A==
X-Google-Smtp-Source: AGRyM1vfwOsKJqKBaA9zfwKUYoEU7G0JNUoJlfJ976EVKpA6FQR446obllP4hc3kQcE34zIsmcvIdA==
X-Received: by 2002:a17:907:2d9e:b0:726:a03a:16c4 with SMTP id gt30-20020a1709072d9e00b00726a03a16c4mr8483121ejc.742.1656596929413;
        Thu, 30 Jun 2022 06:48:49 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i.station (net-188-217-58-216.cust.vodafonedsl.it. [188.217.58.216])
        by smtp.gmail.com with ESMTPSA id k5-20020a1709067ac500b006fee526ed72sm9130288ejo.217.2022.06.30.06.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 06:48:49 -0700 (PDT)
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     tommaso.merciai@amarulasolutions.com
Cc:     linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        quentin.schulz@theobroma-systems.com,
        Jacopo Mondi <jacopo@jmondi.org>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/6] media: ov5693: add ov5693_of_match, dts support
Date:   Thu, 30 Jun 2022 15:48:35 +0200
Message-Id: <20220630134835.592521-7-tommaso.merciai@amarulasolutions.com>
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
index 3c805a5a5181..5930207193c7 100644
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

