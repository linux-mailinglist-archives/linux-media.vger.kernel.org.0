Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA1374ADE04
	for <lists+linux-media@lfdr.de>; Tue,  8 Feb 2022 17:12:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382771AbiBHQM0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Feb 2022 11:12:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343745AbiBHQM0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Feb 2022 11:12:26 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86168C061578
        for <linux-media@vger.kernel.org>; Tue,  8 Feb 2022 08:12:25 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id s10so29089454wra.5
        for <linux-media@vger.kernel.org>; Tue, 08 Feb 2022 08:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M7eqmAr/yv9HSEWfsV2muDLV5RODRUJTGN4lEaJGoqU=;
        b=MoLJsiNEBEjf79n3HigcZXaCyfhM5aagKnvJI/rLRYNF664RT9MVmXSuV75OFs8r2V
         MCCe6pN6xaXLMJ9GaXr4g+mPuiwab425bh6gYzM8M8z7nzs3s/rRoh2cA+KZWPiyfT5T
         BV1Crft/5iQdu1HlulCb/YsajjsR+xhAbV/cw3cbIefYttpYHU2EYPDORsVugZOVvhh6
         KBEygtllmCC76i5yLrBpHOxIv6Y22TWCmy2m/ScofAda2uuzX/1c+5UxaYFneQMMfzss
         Rgma/lCq1atOSmXO+mtyMu1iS6r/6U3NWabrT+ZWRBspKgDXgjIBeA5MNG3qHXhof65c
         l8KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M7eqmAr/yv9HSEWfsV2muDLV5RODRUJTGN4lEaJGoqU=;
        b=AkfljmI5pSwgDduP3gWNZSqfX4hjkxqpGoXHNq+zPMwmJINy+LsQWlTQ28b/DddLWg
         4Thn2j757GWeuN7gaEja6IpDVPS4y3DPq4dzLR0fSgKFKspYq8fJ/Pk5DDDBHeqyP+2R
         0cUvfemULVSdIePyZYjAxayVUPXaFN//Ozy5iax6g15QFmBLtpP0xpYrMWOTV90/TBQs
         YeJjVe3cqxReAPo+/m3ETe7S1KetAuJ0ypDGlxF5N7m2zhSOsdcwx9MwnIq9QuEo5Yxr
         0FCRTWTS7M7CLC4INS0iCiLffd9sxbl0IJRW3o65QTVnuaAl6VNbu750BiP1c5qh2UKS
         v/sg==
X-Gm-Message-State: AOAM5314I9A6xtUgiV/tOFo7WtY7OGGTyaCAPMW0KegXZ9v6pI+jop0H
        85FWNMz9TxAKuAcShr1Upw==
X-Google-Smtp-Source: ABdhPJzCTdAlZ3E654xktKmVVaWugUvI8Rw8s8uK512AK2y7SzfWRJJN10FZlkKrmhAcBCc4oZy+VQ==
X-Received: by 2002:a05:6000:12cc:: with SMTP id l12mr4256191wrx.468.1644336743944;
        Tue, 08 Feb 2022 08:12:23 -0800 (PST)
Received: from localhost ([90.160.137.52])
        by smtp.gmail.com with ESMTPSA id l14sm8943416wrs.55.2022.02.08.08.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 08:12:23 -0800 (PST)
From:   Xose Vazquez Perez <xose.vazquez@gmail.com>
Cc:     Xose Vazquez Perez <xose.vazquez@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        MEDIA ML <linux-media@vger.kernel.org>
Subject: [PATCH] stkwebcam: add new Asus laptop to upside_down table
Date:   Tue,  8 Feb 2022 17:12:22 +0100
Message-Id: <20220208161222.13757-1-xose.vazquez@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Handle 0x0001, DMI type 1, 27 bytes
System Information
    Manufacturer: ASUSTeK Computer Inc. 
    Product Name: A6JC                
    Version: 1.0       
    Serial Number: XXXXXXXXXXXXXXXXX
    UUID: XXXXXXXXXXXXXXXXX
    Wake-up Type: Power Switch
    SKU Number: To Be Filled By O.E.M.
    Family: To Be Filled By O.E.M.

Handle 0x0002, DMI type 2, 15 bytes
Base Board Information
    Manufacturer: ASUSTeK Computer Inc.        
    Product Name: A6JC      
    Version: 1.0       
    Serial Number: XXXXXXXXXXXXXXXXX
    Asset Tag: To Be Filled By O.E.M.
    Features:
        Board is a hosting board
        Board is replaceable
    Location In Chassis: To Be Filled By O.E.M.
    Chassis Handle: 0x0003
    Type: Motherboard
    Contained Object Handles: 0

Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: MEDIA ML <linux-media@vger.kernel.org>
Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
---
 drivers/media/usb/stkwebcam/stk-webcam.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/usb/stkwebcam/stk-webcam.c b/drivers/media/usb/stkwebcam/stk-webcam.c
index 9f445e6ab5fa..5b822214ccc5 100644
--- a/drivers/media/usb/stkwebcam/stk-webcam.c
+++ b/drivers/media/usb/stkwebcam/stk-webcam.c
@@ -114,6 +114,13 @@ static const struct dmi_system_id stk_upside_down_dmi_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "A6VM")
 		}
 	},
+	{
+		.ident = "ASUS A6JC",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK Computer Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "A6JC")
+		}
+	},
 	{}
 };
 
-- 
2.35.1

