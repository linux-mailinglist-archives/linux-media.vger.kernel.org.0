Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F73F55A494
	for <lists+linux-media@lfdr.de>; Sat, 25 Jun 2022 01:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbiFXXDk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jun 2022 19:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231713AbiFXXDi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jun 2022 19:03:38 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC580828B4
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 16:03:37 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id z11so5388452edp.9
        for <linux-media@vger.kernel.org>; Fri, 24 Jun 2022 16:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oj4upZHCp3jgvvltD1qbGy+vaQmuJfrulVaI6ymBNWA=;
        b=CANYcJDLEMAvkkSJzGjJ5i4Or7H+i4cAqYsHgubfePpnNilvBBbUtSa/bvKEpt7G0s
         6ui13IbdkntInhPQDYm5nPPg1XkjBhHGw+vzEas13LOfaGe/IupyU2jV1gII3TtWJbMo
         X1C6hdT+Itfr2MXQDsIC18VwNaDK4MNiE97G8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oj4upZHCp3jgvvltD1qbGy+vaQmuJfrulVaI6ymBNWA=;
        b=OtMMFs+vOn70i0RayfFTx2Z8gccJNH92dXwXFjIKQNWWEVcD6TOvPms12Gmc3vEi1O
         EvSe76rRYCG+kv9I6BUw/QHlyjdK3bt5CyqBU9Y4OGfDYnC9mH0NHMA68NX3w48hgw2C
         /NFKQ4y9GbfnI9Y9FDpha9NWmgTNkPrtZSG8HDDn3qI8vyr8+7W5nsZEQ0fB5jRXZUwu
         /T0bLQFyl1YVQT0dVY5Ma+aWPWlY6dpXQgAXSX8b9x7ZDsvmBYlVluFfVKPobxOeZGmg
         kSrDMlqWVgfdwDXQzzHGIEq+zSHL3UlwTZLunzJii9XzGXJTU3wXGnQeGEkFpPIMq6zy
         1kWg==
X-Gm-Message-State: AJIora8SK4O8jD9LvJ0+tfWqvNDH0Ll5q4b2Bu4auJ1rXRzhE1nmUgVp
        ZlBVea3TuhJL61JnqUWdfZc6ow==
X-Google-Smtp-Source: AGRyM1sp3U0cy5ITjeNoalU6rxPTZugvJj4o7nifc+gaGqrY9rfIZ15IHJh/Mx8hLFdGHpoxS7tDfA==
X-Received: by 2002:a05:6402:2402:b0:435:3418:61b5 with SMTP id t2-20020a056402240200b00435341861b5mr1770090eda.82.1656111816540;
        Fri, 24 Jun 2022 16:03:36 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i.station (net-188-217-58-216.cust.vodafonedsl.it. [188.217.58.216])
        by smtp.gmail.com with ESMTPSA id w1-20020aa7da41000000b004356a647d08sm2880291eds.94.2022.06.24.16.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 16:03:36 -0700 (PDT)
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Cc:     linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        quentin.schulz@theobroma-systems.com,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] media: ov5693: add ov5693_of_match, dts support
Date:   Sat, 25 Jun 2022 01:03:06 +0200
Message-Id: <20220624230307.3066530-7-tommaso.merciai@amarulasolutions.com>
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

Add ov5693_of_match. Device tree support

Signed-off-by: Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
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

