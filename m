Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6790069614B
	for <lists+linux-media@lfdr.de>; Tue, 14 Feb 2023 11:47:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232708AbjBNKrX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Feb 2023 05:47:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232622AbjBNKrS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Feb 2023 05:47:18 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F057722789
        for <linux-media@vger.kernel.org>; Tue, 14 Feb 2023 02:46:54 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so11210781wms.1
        for <linux-media@vger.kernel.org>; Tue, 14 Feb 2023 02:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nl8VzIg0XTBtuUGCbgymYwhmqQdV9/S2Londk08mfDc=;
        b=e4OnI8eRgdDV5nWzruUH+D85OEMv8id+GLyjj+enskPa21a+fZaDXRg0dRBEJcY7vp
         tt75Mvl4GhZq9jBUx/VCfrS7GXlZ/ZT+RVOBDeW8xWfpZuOPzjhNM5qToPBdduxhwXDs
         cnILBfofxI/putHCd7utWgel5cvJBN+4zBctVxRrXqUFW9xxaVLCxawhbFphaiM2s8UT
         u/SV1AZwzjPB2LobLgVJpxBReU/cZEN34hLtDoJOD1RslNI5Ou5fRUZ4x+YTJai3KYTN
         BdSd3PJCStDML0fe6YWWN1ors7nJ/Ol8CjWEg2ttS7STaIOhRu8Fy/p2kN7AG+c4WNUA
         n9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nl8VzIg0XTBtuUGCbgymYwhmqQdV9/S2Londk08mfDc=;
        b=ousHsrDQ54pN9YyA97vsToPpuAg2qgCCtEjHmmQgSdRy3yJUonKZMld2cHa5XNQFEc
         ofMBfck0I1kQ7E33OBBR0K2yUivdnQ6DlmkXUUBQ3srnSyArrWs+DH1M4IGEIvqbAC9b
         IbulkQpcH7AmPctS5hGFpBx9H7u6wPhuptC6XdiLq/6LQDdy4AMqi3TqksBT50jQ0qem
         Ld7T58O/hBho4S9t5q0F8lP3u4XS/34Lwhv3vL4AMiPt7e3an+GWFX7Nso/6b4cb3ctU
         m5bPQ9dJY8Vuquz3eqaM3/mHpPullf15yQZ/pn5iQE29ZKKx1omwV7Jf85HmQrXHHJxX
         tNjg==
X-Gm-Message-State: AO0yUKXQBuMTE959ORBQXIrnm6c2ysTkcSKm/xAHGTxwVsOqJvsarIqu
        NNpSYtX1iDbdR962PAYIpNqkdQ==
X-Google-Smtp-Source: AK7set8IWpV4gIam5FjkNJq193Kp8r7oGbJn7a6xJJYQ3amCGBylgRDvL4zzPX7AUA4xCzfoKuAwhg==
X-Received: by 2002:a05:600c:a297:b0:3dc:5a9f:1c7a with SMTP id hu23-20020a05600ca29700b003dc5a9f1c7amr1660447wmb.30.1676371610511;
        Tue, 14 Feb 2023 02:46:50 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m20-20020a05600c4f5400b003e1f319b87bsm2623719wmq.24.2023.02.14.02.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 02:46:50 -0800 (PST)
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
Subject: [PATCH v2 0/7] media: dt-bindings: Convert Samsung SoC Camera to DT schema
Date:   Tue, 14 Feb 2023 11:45:01 +0100
Message-Id: <20230214104508.51955-1-krzysztof.kozlowski@linaro.org>
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

Changes since v1
================
1. Collect few independent patches into one patchset.

The patchset depends on:
https://lore.kernel.org/all/20230207205834.673163-1-krzysztof.kozlowski@linaro.org/

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
 .../media/samsung,exynos4212-fimc-is.yaml     | 221 ++++++++++++++
 .../media/samsung,exynos4212-fimc-lite.yaml   |  63 ++++
 .../bindings/media/samsung,fimc.yaml          | 279 ++++++++++++++++++
 .../bindings/media/samsung,s5c73m3.yaml       | 165 +++++++++++
 .../bindings/media/samsung-fimc.txt           | 210 -------------
 .../bindings/media/samsung-mipi-csis.txt      |  81 -----
 .../bindings/media/samsung-s5c73m3.txt        |  97 ------
 .../bindings/media/samsung-s5k5baf.txt        |  58 ----
 .../bindings/media/samsung-s5k6a3.txt         |  33 ---
 MAINTAINERS                                   |   6 +
 16 files changed, 1255 insertions(+), 545 deletions(-)
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

