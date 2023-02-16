Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E156D69972A
	for <lists+linux-media@lfdr.de>; Thu, 16 Feb 2023 15:22:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbjBPOWQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Feb 2023 09:22:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230096AbjBPOWO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Feb 2023 09:22:14 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A80814DBC3
        for <linux-media@vger.kernel.org>; Thu, 16 Feb 2023 06:22:10 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id t16so3349954edd.10
        for <linux-media@vger.kernel.org>; Thu, 16 Feb 2023 06:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FFSICMNCf+cnC1kdKQE45X4ohBcHV/EILTtWgDyR10c=;
        b=q2Myj/NDoO39115jNuPbOnkUiu1Rxdj1nP6VhsWdKZVZ0eWx8nDhMlE/kR/H4Dpb7d
         UDGNUq+PTVWqhRC26OBOirOoT8VgwhQ98xJlHoP1fwxvWEAGrbq9X9NVy7UM8z7L2KLW
         MBE0R4IqEuFH/HUMI2D+kvstZQTtFyIPCRR60jITUSOgaC1MO4SFqla0rfabNZO8BZ0v
         bsLgwWUaF4rFpBrqMtN0n8qhOsGAeVdFVIGB4CZwmSqOJo58tqa8Ub3yZEf6/P7BibyU
         kcCWIuxJQxJRuXuXnORK5XOjQQCFvGcYIAnr/YCkiyCbNKAWeq3mc4d1bVT+XfJMACwm
         gnzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FFSICMNCf+cnC1kdKQE45X4ohBcHV/EILTtWgDyR10c=;
        b=AXzyEoWe0K1P9XI6YmsbMBLAg0RdeNYLeTSXHGzL6QWnwm1Z/F0ftWdCcR6Bw9QuK2
         oyLuhnFRzWGYhoXZTLPtfTcobsJ7Jk5IkAppqwh67s1l5uGsMpYuf2TFX529NEVb/YFE
         gZiE1IXN0nk8sbobU16DJlRh/ZwjjNIO0C53VMohFpHRT1mojmWxFpQUS6p58se91QC9
         EUspGeLMN+H3VRQRtdJifnhtXs2DixD/frI5RzR4DUrSRSyH251U//THh1i6sMBceHQ8
         VGXYYU6UCKZP3rlv/q10AZ1FARDkLc6o3REuTB8Qcd54zAi9QcxC9IRcird9bwH3lNkH
         mKRg==
X-Gm-Message-State: AO0yUKUiAxWTjI5b1fbFZr7fEieSRxwgYsCvgWQl3yBwWC4bV/fP+6S3
        nEhk2fw3B6xAMUxsa2M90DSr8g==
X-Google-Smtp-Source: AK7set+f/ZU/TyqK7kdIJ1GAMD4yEvJQNNz87t3Fj795iqRUsFImuZJRGgbzRu+OgVpXXaTn86EWzQ==
X-Received: by 2002:a17:907:a42a:b0:8b1:730b:a296 with SMTP id sg42-20020a170907a42a00b008b1730ba296mr1503971ejc.15.1676557328883;
        Thu, 16 Feb 2023 06:22:08 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id ad24-20020a170907259800b0087bdac06a3bsm884757ejc.2.2023.02.16.06.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 06:22:08 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 0/7] media: dt-bindings: Convert Samsung SoC Camera to DT schema
Date:   Thu, 16 Feb 2023 15:21:57 +0100
Message-Id: <20230216142204.48394-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

The patchset depends on:
https://lore.kernel.org/all/20230207205834.673163-1-krzysztof.kozlowski@linaro.org/

Changes since v2
================
1. Move size-cells next to address-cells.
2. Drop dead/debug code.
3. Add Rb tags.

Changes since v1
================
1. Collect few independent patches into one patchset.

Best regards,
Krzysztof

Krzysztof Kozlowski (7):
  media: dt-bindings: i2c: samsung,s5k6a3: convert to dtschema
  media: dt-bindings: i2c: samsung,s5k5baf: convert to dtschema
  media: dt-bindings: samsung,exynos4210-csis: convert to dtschema
  media: dt-bindings: samsung,exynos4212-fimc-lite: convert to dtschema
  media: dt-bindings: samsung,exynos4212-is: convert to dtschema
  media: dt-bindings: samsung,fimc: convert to dtschema
  media: dt-bindings: samsung,s5c73m3: convert to dtschema

 .../bindings/media/exynos-fimc-lite.txt       |  16 -
 .../bindings/media/exynos4-fimc-is.txt        |  50 ----
 .../bindings/media/i2c/samsung,s5k5baf.yaml   | 101 +++++++
 .../bindings/media/i2c/samsung,s5k6a3.yaml    |  98 ++++++
 .../media/samsung,exynos4210-csis.yaml        | 170 +++++++++++
 .../media/samsung,exynos4210-fimc.yaml        | 152 ++++++++++
 .../media/samsung,exynos4212-fimc-is.yaml     | 220 ++++++++++++++
 .../media/samsung,exynos4212-fimc-lite.yaml   |  63 ++++
 .../bindings/media/samsung,fimc.yaml          | 279 ++++++++++++++++++
 .../bindings/media/samsung,s5c73m3.yaml       | 165 +++++++++++
 .../bindings/media/samsung-fimc.txt           | 210 -------------
 .../bindings/media/samsung-mipi-csis.txt      |  81 -----
 .../bindings/media/samsung-s5c73m3.txt        |  97 ------
 .../bindings/media/samsung-s5k5baf.txt        |  58 ----
 .../bindings/media/samsung-s5k6a3.txt         |  33 ---
 MAINTAINERS                                   |   6 +
 16 files changed, 1254 insertions(+), 545 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/exynos-fimc-lite.txt
 delete mode 100644 Documentation/devicetree/bindings/media/exynos4-fimc-is.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5baf.yaml
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k6a3.yaml
 create mode 100644 Documentation/devicetree/bindings/media/samsung,exynos4210-csis.yaml
 create mode 100644 Documentation/devicetree/bindings/media/samsung,exynos4210-fimc.yaml
 create mode 100644 Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-is.yaml
 create mode 100644 Documentation/devicetree/bindings/media/samsung,exynos4212-fimc-lite.yaml
 create mode 100644 Documentation/devicetree/bindings/media/samsung,fimc.yaml
 create mode 100644 Documentation/devicetree/bindings/media/samsung,s5c73m3.yaml
 delete mode 100644 Documentation/devicetree/bindings/media/samsung-fimc.txt
 delete mode 100644 Documentation/devicetree/bindings/media/samsung-mipi-csis.txt
 delete mode 100644 Documentation/devicetree/bindings/media/samsung-s5c73m3.txt
 delete mode 100644 Documentation/devicetree/bindings/media/samsung-s5k5baf.txt
 delete mode 100644 Documentation/devicetree/bindings/media/samsung-s5k6a3.txt

-- 
2.34.1

