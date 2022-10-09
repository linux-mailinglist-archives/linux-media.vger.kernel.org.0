Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A53335F8BD0
	for <lists+linux-media@lfdr.de>; Sun,  9 Oct 2022 16:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbiJIOl5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 9 Oct 2022 10:41:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229742AbiJIOl4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 9 Oct 2022 10:41:56 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DA2B275EE
        for <linux-media@vger.kernel.org>; Sun,  9 Oct 2022 07:41:54 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id b2so20262537eja.6
        for <linux-media@vger.kernel.org>; Sun, 09 Oct 2022 07:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nzmGhBv/mglq2Jsw5ri5m1E7F6+xZNMF70buae79EXg=;
        b=F5yROMQ4o9JU/s09Z7/WhTOQdGeO7kEnVbryrtcT9/dOYKSiMmvZVHZvXn1mTBmA6O
         JuH/7GBx4m36gTJo9Kr7pxjXkgIxk6aJqg0ivjZbqflPM3XpN4wkjUULta/n64NHObj1
         jk0haCTSpXR6nCQ+IecUkQltRgv6G8obhaxYTtiybxz0CYST4StTP8mrRqpu72AJ3kXJ
         0DYJD46TplcxMo2wWxQENqmeu+O9neiBXijCF7qjIVaHEfcehCyzMNNl5IG1vIH4ekk4
         3MaIKLrDYB43bfzqAGJ7jdVTWHuT12wmT9gdslmSw0fYuf4aZeAtCPek0Fd8T05oA1Zr
         POXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nzmGhBv/mglq2Jsw5ri5m1E7F6+xZNMF70buae79EXg=;
        b=eHQ8ugSejRI56HDNjBompzeVzDP2/bMnp3HScbRroeKwS3rYDXTOd5Fullboxf3Bo+
         8fUhbJsCjMXU7L/d6icezOK4+cAhaQ5p70AnMzumouVULbKv5tY+swaVLnlGyhxS6OpG
         snh74LhvY5Dfy0Xh60Q9uEy+qW/uIo5UQS16njxeT8Y9MjoltQDALPtZdPs/ZjC9zD6o
         w+KcG+Gx55N0ODrdqlLCjCOjsuQlu+9bjHtT1P3Ya2w6wasTwZiVNTarAHh6nitSSO8R
         9ak4KYwYJ+JYXyW5RI/iJTePMYreaKWFggPAnrqoe7ni8UWJAYYhIf+rNjRxEm5LwtqA
         Mr0g==
X-Gm-Message-State: ACrzQf3luSIKCBf1FuINw3yp3iKgTU/1vYx6gwv9t36b6C9D1CwGse+s
        RMWRcl2sYbpa0j4w5MwIaLQuWQ==
X-Google-Smtp-Source: AMsMyM4qHIORqlKrohYjDkX//dP7Hw2oEF39JLBpLeivCS4d/YPG/w/0SuzXtnMmtAD2McU7if6p/Q==
X-Received: by 2002:a17:907:a40f:b0:78d:10fc:6ef5 with SMTP id sg15-20020a170907a40f00b0078d10fc6ef5mr11301493ejc.212.1665326513117;
        Sun, 09 Oct 2022 07:41:53 -0700 (PDT)
Received: from sleipner.berto.se (p54ac5370.dip0.t-ipconnect.de. [84.172.83.112])
        by smtp.googlemail.com with ESMTPSA id b1-20020a1709063ca100b0078175601630sm3941109ejh.79.2022.10.09.07.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Oct 2022 07:41:52 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: adv748x: afe: Select input port when initializing AFE
Date:   Sun,  9 Oct 2022 16:41:46 +0200
Message-Id: <20221009144146.1199437-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When moving the input selection to adv748x_reset() it was missed that
during probe the device is reset _before_ the initialization and parsing
of DT by the AFE subdevice. This can lead to the wrong input port (in
case it's not port 0) being selected until the device is reset for the
first time.

Fix this by restoring the call to adv748x_afe_s_input() in the AFE
initialization while also keeping it in the adv748x_reset().

Fixes: c30ed81afe89 ("media: adv748x: afe: Select input port when device is reset")
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/i2c/adv748x/adv748x-afe.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/i2c/adv748x/adv748x-afe.c b/drivers/media/i2c/adv748x/adv748x-afe.c
index 02eabe10ab97..00095c7762c2 100644
--- a/drivers/media/i2c/adv748x/adv748x-afe.c
+++ b/drivers/media/i2c/adv748x/adv748x-afe.c
@@ -521,6 +521,10 @@ int adv748x_afe_init(struct adv748x_afe *afe)
 		}
 	}
 
+	adv748x_afe_s_input(afe, afe->input);
+
+	adv_dbg(state, "AFE Default input set to %d\n", afe->input);
+
 	/* Entity pads and sinks are 0-indexed to match the pads */
 	for (i = ADV748X_AFE_SINK_AIN0; i <= ADV748X_AFE_SINK_AIN7; i++)
 		afe->pads[i].flags = MEDIA_PAD_FL_SINK;
-- 
2.37.3

