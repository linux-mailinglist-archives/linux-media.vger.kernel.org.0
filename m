Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED35A5B91CA
	for <lists+linux-media@lfdr.de>; Thu, 15 Sep 2022 02:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbiIOAgS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Sep 2022 20:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbiIOAfz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Sep 2022 20:35:55 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36EAF2719
        for <linux-media@vger.kernel.org>; Wed, 14 Sep 2022 17:35:45 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id bo13so11785379wrb.1
        for <linux-media@vger.kernel.org>; Wed, 14 Sep 2022 17:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=YuHJH10c8FvtUXJ2438gkG0TC72ZsbeaRJJji5SO8kM=;
        b=v5aDTc9EIdBMVqWhIV2meGDDjEsn+nnm2h7qGYgin0xh+NywFA6KJSqhxpNuYScY26
         P1jBGHJkEG2BszQuUQM/CEfmaU2TKzcf9+JBZkV8wRjzRn0CyenIBS8gkme8n8Y09JfS
         3ori6LDzNRmDAigrP3GAQmNndPqnCg3fRQRGDAOrv8LbsFuZOWdyMQE94Jj2ocUqOgrG
         nvj7FEzhrgw08MXQVW+6lj1AftRwqJdx7/RlFE7y7z+aGXCkEb5k41tI3Ih+kwDz5YFq
         OFEpzS7SrmQRvB+ldYuBuf1JUBjIpDuvP7BCogZbbdxzNLuvEVw+3aHM5zwZCJ/YQ5Nq
         S2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=YuHJH10c8FvtUXJ2438gkG0TC72ZsbeaRJJji5SO8kM=;
        b=Oyx1TvTo2TbtZPV0QUzW2NiBiOQKVKRconf02EHsQfLB+kg77zDycVPqFf/Ahlu8Yw
         cGHFFqEnPi0orqOmuSJ8W/XVOc8z/cIJZernSg2/OnTavFHnBBjQuiJTQoJKfUm+2bYq
         LmF2kMJJaqQaer1zmWAvxOOwGoSqYoQtlRXZAYW5+J90K7Ma3oOPZe9ZOlPTAwpIjNhN
         yWZs7B8JA3oSBAkZeW/T3WksIUPWOOu2cEhc0m3YJ6hYwn0gn4nywSzGjc03CSBuN09b
         AaewIgI7HMFgvEccEiCxotMlbVnOweWg16H6VcRwv1EmaYRlXrZX+8A3LzINE4P2YFCS
         4h5A==
X-Gm-Message-State: ACgBeo3HpjiuhWbVuP1JBZg6E/wE17KJoX7aKAOjfpM6XrpXFu5kwL6x
        SjPmboPImMXAhlEo4+azB08DAQ==
X-Google-Smtp-Source: AA6agR5bin1Zk0UtmpSYrXkwpRlsm1H0dnLVWBUq8tixcTjNcqNZyGwvdsJBRBQd/hs+Ygke2R6/Fg==
X-Received: by 2002:a05:6000:1ac7:b0:22a:906d:3577 with SMTP id i7-20020a0560001ac700b0022a906d3577mr10690016wry.33.1663202143762;
        Wed, 14 Sep 2022 17:35:43 -0700 (PDT)
Received: from planet9.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id d8-20020adff848000000b002253af82fa7sm905235wrq.9.2022.09.14.17.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 17:35:43 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     sakari.ailus@iki.fi, jacopo@jmondi.org, paul.j.murphy@intel.com,
        daniele.alessandrelli@intel.com, mchehab@kernel.org,
        linux-media@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH v3 4/5] media: i2c: imx412: Add imx477 compatible string
Date:   Thu, 15 Sep 2022 01:35:21 +0100
Message-Id: <20220915003522.1227073-5-bryan.odonoghue@linaro.org>
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

The Sony imx477 uses the same silicon enabling reference code from Sony in
the available examples provided.

Add an imx477 compatible string and re-use the existing imx412 code.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/i2c/imx412.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index bc7fdb24235f..1013a5afc85f 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -1289,6 +1289,7 @@ static const struct dev_pm_ops imx412_pm_ops = {
 
 static const struct of_device_id imx412_of_match[] = {
 	{ .compatible = "sony,imx412", .data = "imx412" },
+	{ .compatible = "sony,imx477", .data = "imx477" },
 	{ }
 };
 
-- 
2.34.1

