Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA8A5FF361
	for <lists+linux-media@lfdr.de>; Fri, 14 Oct 2022 20:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbiJNSEh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Oct 2022 14:04:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230218AbiJNSEe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Oct 2022 14:04:34 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 004BE1C2F16
        for <linux-media@vger.kernel.org>; Fri, 14 Oct 2022 11:04:31 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id bp11so8748272wrb.9
        for <linux-media@vger.kernel.org>; Fri, 14 Oct 2022 11:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmFvlWd5wkxXCWS8yBplcliFQK7XhSRLw1ieHsZC+LI=;
        b=CSyhZ+5JCN/61p/50tFRoBhu5WfChTnMUATV1F0VT4ZGSgcvBb+zqDpdEEe/H4hNQA
         SJ0AA5XMnBm/SpigvOks3wEJzv5O3wJjpkXi9LjOtLB6QupEXDDP+2uM2MOtRwhO8OAD
         DXgnFXM/Blq1+0N1LTAXrco0E5UPOdIrj1JY7tqw6RZvCDrsVG/1UBq4ltBnahv8va+I
         UsZWsTK0fljF/tW4JmMcFVcRhOGco6ypFvEB/5RGe+st9d1wHtF/hhTkuvzRFqZhCo+u
         A4kDqbrsfumySjlLa8z2DipE/AV0I12s2nykHiqEMg88n8q+lbieQDrPY/fuH+HKS+r3
         Wf1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PmFvlWd5wkxXCWS8yBplcliFQK7XhSRLw1ieHsZC+LI=;
        b=7RyKkU6I8ipbTAWEijJDRKsMaCpD2edit3AMMkl8IDD8h2t205B39dBZMh55riQJFn
         cktyo0UAF/1DdxWu0j4xmh28tkHTp6mBhg5VlGlvtECJIEEkA9cziW3WuXOQpWAeMh0U
         yqriku+bhqxKzmilH+e9Dq4ycajt2mqT2xwVa2zyMHRpYPDb2cntMnuURKDcO88YC/Fr
         zDSrREqIpXdo8nvlMECDWzRciYGFuUq31nfPIruo2kg/qUqGoktU5yslPNFO1D22rkwA
         oFBjZTQkboH+Dtl1ksNCGfcXRTGHIql4QYrDjECrpZKr9LPmUz6YYiFFXSU1BQgxcFyG
         rG2Q==
X-Gm-Message-State: ACrzQf20NpG50yru5jq06ubKcGH4voWGO1kp7Dc76Z0RV4M9AAgEaika
        PimIHCH6x/cRCZ3n07EtSbbB+odtUllwXw==
X-Google-Smtp-Source: AMsMyM48Mfg4yVy5feoPDCCBQdQwLIwcM6DX1ush5A3ziu34UT6nqQcvv5ozWvyKLJv17AX2vn2PLA==
X-Received: by 2002:a05:6000:1b85:b0:230:3652:335 with SMTP id r5-20020a0560001b8500b0023036520335mr4134747wru.467.1665770670310;
        Fri, 14 Oct 2022 11:04:30 -0700 (PDT)
Received: from planet9.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g17-20020a05600c001100b003c6bbe910fdsm8950346wmc.9.2022.10.14.11.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 11:04:29 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/3] media: i2c: imx412: Add new compatible strings
Date:   Fri, 14 Oct 2022 19:04:17 +0100
Message-Id: <20221014180417.3683285-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221014180417.3683285-1-bryan.odonoghue@linaro.org>
References: <20221014180417.3683285-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The Sony imx577 uses the same silicon enabling reference code in the
available examples provided as the imx412.

Add in compatible strings to enable and differentiate the parts.

Cc: sakari.ailus@iki.fi
Cc: dave.stevenson@raspberrypi.com
Cc: jacopo@jmondi.org
Cc: "Paul J. Murphy" <paul.j.murphy@intel.com>
Cc: Daniele Alessandrelli <daniele.alessandrelli@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/i2c/imx412.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index 353304312e1c..e1e986dc8856 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -1286,6 +1286,7 @@ static const struct dev_pm_ops imx412_pm_ops = {
 
 static const struct of_device_id imx412_of_match[] = {
 	{ .compatible = "sony,imx412", .data = "imx412" },
+	{ .compatible = "sony,imx577", .data = "imx577" },
 	{ }
 };
 
-- 
2.34.1

