Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 792045B91C9
	for <lists+linux-media@lfdr.de>; Thu, 15 Sep 2022 02:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230132AbiIOAgP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Sep 2022 20:36:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229921AbiIOAfw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Sep 2022 20:35:52 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F406111C
        for <linux-media@vger.kernel.org>; Wed, 14 Sep 2022 17:35:37 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id e16so28290320wrx.7
        for <linux-media@vger.kernel.org>; Wed, 14 Sep 2022 17:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=f6Npvi8/NWrXQxCIyqdaN4rjBSJKqkkMMS7LnmDZ6C8=;
        b=xMHEfMXy8WVE5nDg+dxgoGFgvT288BB3rGGq9loBC+rMr2crROLswUAbWEUVHaF5np
         X9k7pwuEQWiensbarUNFzCv8ee2Ql7z9iTYwbjybV9A4L40NzKv2gze+FEOMfhzIxQwv
         VjrZyVDEqQc/s3H8FCLRuTnymv6y+SLSnnbGp5Zpy9ze/x8zAKH/ojYgX79DjwdINIBV
         +IVKcS8Y4xcj2RXNXaNhYs8fRsogpcradOBrDWNBW7UbZpwb9/pcLCcrsCvgViaX8YQm
         upMkJ0iLjUWP1o1SVy2E2CD+Be5PlWDDL/nDlXidw8itRYJA4u7yVmQy3kER8rGvpcrz
         WCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=f6Npvi8/NWrXQxCIyqdaN4rjBSJKqkkMMS7LnmDZ6C8=;
        b=EPTUR+wv8YWS5n6MGxbUxdpgXg6PyQ6wnUohKxI4EkOs7NhlcWssABKus4RDnkB8rI
         RBMb+kt6426E5vFUtYGjchJsiyDc61WnJUCtsrWywZpzFFKdiJsPuj4WGeDY5uAdEcHm
         UcvTdMw7MHeB0pIapd9OYnz0hPWwgZIAX+A5/wn1IIIB0PUzbQNTsdAiP2YdNj1ep6IB
         Kn6hFqb0oFo3ZafHmlCzcCBB6LKqezWLErt6h7cWxZ5YQiEiRselnk6ByPMbkI2HJYcy
         oeyQ60cge3Q7Ds0ODm5/Dn/SB3o4fvU1beO/FInU7YPPtrvWJCdgc4e/A+7bSSFgY6SC
         OOaA==
X-Gm-Message-State: ACgBeo0IvBlJ0bdlXvzGsaISPhbhtrvPuCtSGWpy2f7vuyECja8Smucj
        zMcz4Won6cGhqAH0wf3P6fpsiw==
X-Google-Smtp-Source: AA6agR7nesGFT2pLde1k1MIc0501S/t2tM8bE5e/9HV3JY79yknNlLKqPQ8VZaVNXYf4ArUh69+i9w==
X-Received: by 2002:a05:6000:552:b0:228:6296:3b33 with SMTP id b18-20020a056000055200b0022862963b33mr24363423wrf.615.1663202136548;
        Wed, 14 Sep 2022 17:35:36 -0700 (PDT)
Received: from planet9.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d8-20020adff848000000b002253af82fa7sm905235wrq.9.2022.09.14.17.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 17:35:36 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH v3 2/5] media: dt-bindings: imx412: Add imx577 compatible string
Date:   Thu, 15 Sep 2022 01:35:19 +0100
Message-Id: <20220915003522.1227073-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220915003522.1227073-1-bryan.odonoghue@linaro.org>
References: <20220915003522.1227073-1-bryan.odonoghue@linaro.org>
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

The Sony imx577 uses the same silicon enabling reference code from Sony in
the available examples provided.

Add an imx577 compatible string to allow for chip differentiation and
accurate description of hardware in dts.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
index a0da469995db..ebb649c5e4c5 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
@@ -23,6 +23,7 @@ properties:
       - enum:
           - sony,imx412
           - sony,imx477
+          - sony,imx577
   reg:
     description: I2C address
     maxItems: 1
-- 
2.34.1

