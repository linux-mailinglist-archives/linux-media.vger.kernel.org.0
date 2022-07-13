Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79C295739A8
	for <lists+linux-media@lfdr.de>; Wed, 13 Jul 2022 17:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236783AbiGMPFh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jul 2022 11:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236762AbiGMPF2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jul 2022 11:05:28 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C636C422F9
        for <linux-media@vger.kernel.org>; Wed, 13 Jul 2022 08:05:20 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id v16so15880943wrd.13
        for <linux-media@vger.kernel.org>; Wed, 13 Jul 2022 08:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=89nMQY6HYa205yz8a9PXVreqJnhbEp/5UjZ/0K+ojBk=;
        b=XuaI59GVVdLaY9nGGjKfAeviXgy/ApZnblUPAMvzh46fG/tmr3xTD1thS/DDCwEtuc
         GBpP29/u6JHMFSWSwwseqH5VrHazePwy0/LKvr+Kp3lDKiruCavOroFiysLzV3SYaneP
         fsu75ziErn8Qtva15PVP6DadY4A132NVDqQS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=89nMQY6HYa205yz8a9PXVreqJnhbEp/5UjZ/0K+ojBk=;
        b=0r+tHdmggyRZ3HVOxeX5qAbO1Yo/OmKisZWUxYqReCVJvUkIxRL4J9GAwv36NcJ4Jf
         9uuiULaDKiRXX80LxTpukXVM/dZMZ3/KJ8J7B8Sfo2I8RPnkhxnKDVAvs+ArXK+lTRqM
         F0bpbBA2h7902folyQmLE+n4avfRqn2MKwM75qqAnOsllQeOLZ+phUUQEETz9tn49KKV
         MXnFUlMeMxTLDog3EO1Y5XWy1wG2GQyaIx8MCxgskQLtSrh1YAWvrepYM9mVbiZF7Djr
         eRKWYCBm/rA7K6Sm8B/UiHOKkXJkM/fdOiYIQ0ETmHv7Ws6XGqty8Ii9dvQ3mnQF2/9j
         rbqw==
X-Gm-Message-State: AJIora9PnqkvnuoHJuSM+Uzx7Bv3yccgl0obxmq+zpSxjAykxbn9d2VC
        uEIbejSYx5gvB6Y8Fh7N/jabFg==
X-Google-Smtp-Source: AGRyM1t3t3ov77Q3+O1KqqHLoZA8HZXwyZ27oOlPTEg5Ae5GY3X5ipE2PQP8rWM0aKzLnNmLKd588g==
X-Received: by 2002:a5d:5143:0:b0:21d:61b6:5225 with SMTP id u3-20020a5d5143000000b0021d61b65225mr3649852wrt.164.1657724720297;
        Wed, 13 Jul 2022 08:05:20 -0700 (PDT)
Received: from tom-ThinkPad-T14s-Gen-2i.station (net-188-217-51-7.cust.vodafonedsl.it. [188.217.51.7])
        by smtp.gmail.com with ESMTPSA id f17-20020a05600c4e9100b003a2d87aea57sm1465537wmq.10.2022.07.13.08.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 08:05:20 -0700 (PDT)
From:   Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
To:     tommaso.merciai@amarulasolutions.com
Cc:     linuxfancy@googlegroups.com, linux-amarula@amarulasolutions.com,
        quentin.schulz@theobroma-systems.com,
        Jacopo Mondi <jacopo@jmondi.org>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 6/6] media: ov5693: add ov5693_of_match, dts support
Date:   Wed, 13 Jul 2022 17:05:06 +0200
Message-Id: <20220713150506.2085214-7-tommaso.merciai@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220713150506.2085214-1-tommaso.merciai@amarulasolutions.com>
References: <20220713150506.2085214-1-tommaso.merciai@amarulasolutions.com>
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

