Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FF3D76106D
	for <lists+linux-media@lfdr.de>; Tue, 25 Jul 2023 12:16:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232931AbjGYKQ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Jul 2023 06:16:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232878AbjGYKQs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Jul 2023 06:16:48 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5DF71BCF
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 03:16:29 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9926623e367so920098066b.0
        for <linux-media@vger.kernel.org>; Tue, 25 Jul 2023 03:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690280188; x=1690884988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qh91NfZ3U4C6egIsotV0MBnxWbLv8ptyWOp86GqgOLI=;
        b=y1Trlnb4gB4mMV4VUMtKvQCOE5d+e2N3T7I2rUWDAWcYxUHtecj9Bh8rgMshZVdikm
         1O/Ct4WQ3Xkr4rSfYFzsaZXtoNjQq5CK2Ct1OKaQ/rawtrP0juyFtU/X0c5uRCc6KAa4
         22j3tPkoy7NOi722CIRS2UkiWX7gQfC9zMQXnFQhE0BxTxscDLsUo/v/mzwPgIyAZutJ
         0ULT/0ordlkAJ+E7vp0EnJGosyjsm0/ETV52MAKTb+CjFU/QL5lf7soUEjBV9dpYjMiO
         qElMpzbIFwxB4rwZKJmBTf8ylm5Uya9Futfaf9Vd6OBFxLzyMfq4ZYvabARM0aHe7F4Y
         uB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690280188; x=1690884988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qh91NfZ3U4C6egIsotV0MBnxWbLv8ptyWOp86GqgOLI=;
        b=IHNTLByL0uF7AlGZr66FaA8cFsjtVSVLXG1BtyGHM/RlTejeVZgBDgg5yI2hsF+DaZ
         Jp2C5Qlc2fXqFiFyW1LrRJj9cBL32EZZU7Gx5q00Ulxw0Z90suDhB2Gszvcy4tXCHVW5
         /1D7M/68xB4kig4V8zTI9uTXnZAlkQNd66ZvZ0jWlNA2oq/nn6K8Ge+IZJePf9MyZxow
         +WkpUBd6M0greMKmYOHFnhX+w3ErlZ2QeAE0+pEydEC6p79gcQy/u46tywo3r7l+MxpX
         iQwggMUy81zmBdVOIZ7pLP00rWerw59x12erymPpIiVn+6nTFBhS0lHsF3bUtmTlsWE6
         qI2w==
X-Gm-Message-State: ABy/qLZPU0LaV5+l3t6/KMMc3eox5Jsyprx9iVyEUUWgQ+65wRi0Ft5r
        lkjdD6X6IJndqqffXgYI0XaYEA==
X-Google-Smtp-Source: APBJJlH33uo36eZTl/SakfzC2vCOa5Iq3OoPoR12EwPKr7KqHe676HH+tsYFj1dM6TCCidzg3zGjDA==
X-Received: by 2002:a17:906:15b:b0:993:e9b8:90f4 with SMTP id 27-20020a170906015b00b00993e9b890f4mr13107763ejh.8.1690280188528;
        Tue, 25 Jul 2023 03:16:28 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id l23-20020a1709065a9700b00997e00e78e6sm7944779ejq.112.2023.07.25.03.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 03:16:28 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] media: dt-bindings: drop unneeded status from examples
Date:   Tue, 25 Jul 2023 12:16:25 +0200
Message-Id: <20230725101625.75162-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Example DTS should not have 'status' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml       | 1 -
 Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml b/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
index 369c48fd9bf9..a6b73498bc21 100644
--- a/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
+++ b/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
@@ -53,6 +53,5 @@ examples:
         interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&tegra_car TEGRA124_CLK_CEC>;
         clock-names = "cec";
-        status = "disabled";
         hdmi-phandle = <&hdmi>;
     };
diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
index 19a39d753aad..b68141264c0e 100644
--- a/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
@@ -143,7 +143,6 @@ examples:
         mipid02: csi2rx@14 {
             compatible = "st,st-mipid02";
             reg = <0x14>;
-            status = "okay";
             clocks = <&clk_ext_camera_12>;
             clock-names = "xclk";
             VDDE-supply = <&vdd>;
-- 
2.34.1

