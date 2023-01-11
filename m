Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00D4A6663F7
	for <lists+linux-media@lfdr.de>; Wed, 11 Jan 2023 20:47:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235370AbjAKTr4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 11 Jan 2023 14:47:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235553AbjAKTrd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 11 Jan 2023 14:47:33 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0D3612A95
        for <linux-media@vger.kernel.org>; Wed, 11 Jan 2023 11:46:41 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id i17-20020a05600c355100b003d99434b1cfso13541549wmq.1
        for <linux-media@vger.kernel.org>; Wed, 11 Jan 2023 11:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ssS9bEczGBeGgtRnwI2CLiBvW5H4zMfp9Iz9i+Zxso0=;
        b=q6lcownq9MVKTyhQI7t57PrcNHXrMi4NugVkb+UNO8+t+MfxvJMYsASS9bt0kQLt40
         6RiT04cdHVkI/NM1pKtDOo8bpfahd4DqCwhD5y4b2h9hkzBsum++plwaRxTYIHqFW+7d
         mjsakjGTMLdIGb/JqSiC/5M4KmpxIhDLpymYoIutsUZ0hY4Bb2eO/3AcQwDDRROugJXn
         ijGwnFTu9EE404qjSCfc0R3AhTu+7Wiut+fWpJoGBTbiDkN24l2CMv1kSrd5e3G0O68d
         Z4pfpjrRe3Kaijw3axSKq1ec+3e7/x2C49+HIRgkcURWhMIl4iWcKfGWSGQrDXnbYJSn
         Vi4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ssS9bEczGBeGgtRnwI2CLiBvW5H4zMfp9Iz9i+Zxso0=;
        b=u+EhPBeX0S+Ci5Va0VP0Ip8BnDCkfNJyuNwSDeHKDrBFiq7tZW3RtfjwNZLT3TfQ9e
         r6XP2BopI+jmGYOkeqVt+yFzY2aEOLSLhClAvUG31PkBJdkG48zRjZxALoiAUEZk/mKt
         4lRyfSqg04J6vXctRCpZqk/YtkH6RXJSoqMRAHyFV6G9vW9MN8J+jG57gvFXr/dVqPbE
         xGXH5i68GEROUT3IdJ+dYBgAB1JUk9XBsFdhhrcVZjeO6nup72GHUdTsSE8EsMlirgBy
         oDUEIEdJLsWfLIBGTD2XRuZSNZdbVH+jW/erZ8Shjs/WV9cj1L+qoW3emZcnsRzT/hcN
         86Rg==
X-Gm-Message-State: AFqh2kph+bXLHmh/Pby2eeR3T1/POvGXhRNpbM6z/lBhbVZ5zpAR/94Z
        wgLTNCvRI1c3IL4GA0Zybdhv2qR2dBPy
X-Google-Smtp-Source: AMrXdXvhggEpYQploRcm050bbe/TdJczhMFAYySp71yn5vReVw6yUBrxFO/ghe4n314HpMMAigRjKw==
X-Received: by 2002:a05:600c:1ca5:b0:3d1:d746:7bca with SMTP id k37-20020a05600c1ca500b003d1d7467bcamr53626843wms.4.1673466399617;
        Wed, 11 Jan 2023 11:46:39 -0800 (PST)
Received: from images.net ([2001:41d0:2:c72a::])
        by smtp.gmail.com with ESMTPSA id s7-20020a1cf207000000b003d98438a43asm18276501wmc.34.2023.01.11.11.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 11:46:39 -0800 (PST)
From:   Athanasios Oikonomou <athoik@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Athanasios Oikonomou <athoik@gmail.com>,
        Robert Schlabbach <robert_s@gmx.net>,
        Tom Richardson <trichardson@availink.com>
Subject: [PATCH] media: dvb: add missing DVB-S2X FEC parameter values
Date:   Wed, 11 Jan 2023 21:46:08 +0200
Message-Id: <20230111194608.1853-1-athoik@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This commit is adding the missing short FEC
Missed on commit 6508a50fe84f9858e8b59b53dce3847aaeeab744

More info: https://dvb.org/wp-content/uploads/2021/02/A083-2r2_DVB-S2X_Draft-EN-302-307-2-v131_Feb_2021.pdf
Table 1: S2X System configurations and application areas

Please note that 128APSK, 256APSK and 256APSK-L
and FEC 29/45, 31/45 are still missing from enums.

Cc: Robert Schlabbach <robert_s@gmx.net>
Cc: Tom Richardson <trichardson@availink.com>
Signed-off-by: Athanasios Oikonomou <athoik@gmail.com>
---
 include/uapi/linux/dvb/frontend.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/uapi/linux/dvb/frontend.h b/include/uapi/linux/dvb/frontend.h
index 326f6a53f1f2..7e0983b987c2 100644
--- a/include/uapi/linux/dvb/frontend.h
+++ b/include/uapi/linux/dvb/frontend.h
@@ -296,6 +296,10 @@ enum fe_spectral_inversion {
  * @FEC_28_45: Forward Error Correction Code 28/45
  * @FEC_32_45: Forward Error Correction Code 32/45
  * @FEC_77_90: Forward Error Correction Code 77/90
+ * @FEC_11_45: Forward Error Correction Code 11/45
+ * @FEC_4_15: Forward Error Correction Code 4/15
+ * @FEC_14_45: Forward Error Correction Code 14/45
+ * @FEC_7_15: Forward Error Correction Code 7/15
  *
  * Please note that not all FEC types are supported by a given standard.
  */
@@ -329,6 +333,10 @@ enum fe_code_rate {
 	FEC_28_45,
 	FEC_32_45,
 	FEC_77_90,
+	FEC_11_45,
+	FEC_4_15,
+	FEC_14_45,
+	FEC_7_15,
 };
 
 /**
-- 
2.20.1

