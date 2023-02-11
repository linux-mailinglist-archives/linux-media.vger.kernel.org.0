Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCD446931CF
	for <lists+linux-media@lfdr.de>; Sat, 11 Feb 2023 15:54:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbjBKOyu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 11 Feb 2023 09:54:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjBKOyt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 11 Feb 2023 09:54:49 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3552423C49
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 06:54:48 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id u10so5814877wmj.3
        for <linux-media@vger.kernel.org>; Sat, 11 Feb 2023 06:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jn/NwubQ+zEtFvy1opP9siq6wDAyoCUmytLcQZmL+Eo=;
        b=NZ8kJ6T8xl5urrLZo6wcYKT11JvA0qfvci/9E50o7Vi39XAA/3RZyhhBdJB0+B+4rs
         MXYm63oXKzJjftx//qsZRNmFhCYOgUfIeWMl8MSwR/WuBHQG6aLhf4gJRP8ZYvsdzV/R
         5EyXahd5ikoStT4voc7YwDtlhU+Xt4+dhH8wBRvGYinUp5fIOF5lEunOC9V2iYm5DUBd
         M35QCrZZSFGAgK2BHO2kuI7VAEZ1osL5Ax/2Fs4N2ap6TuBDwe41b7dnTijD7jOue2gU
         Yf4RmtyFDveIn+8QbRhiygfrkh8JDlyeuTl0EI17tK/ePio8saTh2kKK8eZ94YSm/3eD
         gnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jn/NwubQ+zEtFvy1opP9siq6wDAyoCUmytLcQZmL+Eo=;
        b=MousWgrQViRqoc52LTcBdDnd+ps2A/PUyUMWpAeUHTjJHukDjx+hnYE8C75xeDdDxl
         PF9QGwtK0kteLVSGJ6zZ8GiVjbq8bGGUitSq6jywlWl7Huydic2/JlYvc1TZeCFyIm4T
         AMC72/fpmo+viMMZODIMj2vKDM4GuouYYhNaXO7IaIMsao3A/SLN/swzxUr974Vd7ULP
         frXsCo3K7ksCIDrtrLB67eHyYhW67vXxzQqdRmpW3sQosLgdH4DbYtoAk4N8aqMTIDvH
         PgICF0TPj0IFmfTWXhL2kf1ikV4yYRV9aMDB26rU/CFTGy0qatwJCXGQJg7gGz60K/ZR
         GSVg==
X-Gm-Message-State: AO0yUKWqrXmQBAYR2zE1hnD2g8uXOkZjKEWInAEBMLBkN81emb8RukqK
        U4y+JQFn0oJeONrsG4vjyNdMcA==
X-Google-Smtp-Source: AK7set86peNDh/jd4JGvxSt7XJ1/En++ul0f2LOa5KP3BLJfA7FNExoRjKej2sWdXXWnXgduNZGQFg==
X-Received: by 2002:a05:600c:2e87:b0:3e0:1a9:b1f5 with SMTP id p7-20020a05600c2e8700b003e001a9b1f5mr15138849wmn.28.1676127286812;
        Sat, 11 Feb 2023 06:54:46 -0800 (PST)
Received: from sleipner.berto.se (p54ac5802.dip0.t-ipconnect.de. [84.172.88.2])
        by smtp.googlemail.com with ESMTPSA id l4-20020a7bc444000000b003d9fba3c7a4sm10771987wmi.16.2023.02.11.06.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 06:54:46 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: rcar-isp: Add support for R-Car V4H
Date:   Sat, 11 Feb 2023 15:54:36 +0100
Message-Id: <20230211145436.3820935-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for R-Car V4H. The ISP Channel Selector is used to route
channels to the different VIN modules. The ISP CS found in the V4H is
very similar to the one found on the V3U.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/renesas/rcar-isp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/renesas/rcar-isp.c b/drivers/media/platform/renesas/rcar-isp.c
index 10b3474f93a4..ed9d8ca56730 100644
--- a/drivers/media/platform/renesas/rcar-isp.c
+++ b/drivers/media/platform/renesas/rcar-isp.c
@@ -433,6 +433,7 @@ static int risp_probe_resources(struct rcar_isp *isp,
 
 static const struct of_device_id risp_of_id_table[] = {
 	{ .compatible = "renesas,r8a779a0-isp" },
+	{ .compatible = "renesas,r8a779g0-isp" },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, risp_of_id_table);
-- 
2.39.1

