Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE85646CEA
	for <lists+linux-media@lfdr.de>; Thu,  8 Dec 2022 11:33:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbiLHKd1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Dec 2022 05:33:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbiLHKcB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Dec 2022 05:32:01 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD91D8138E
        for <linux-media@vger.kernel.org>; Thu,  8 Dec 2022 02:31:31 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id b9so1085720ljr.5
        for <linux-media@vger.kernel.org>; Thu, 08 Dec 2022 02:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfazEVXJDWm5fHCm2MG3wz5cKNMzAQ0JQdcxbxRWLtQ=;
        b=XywpUyuyrTrwqePpx3XTlRujHvxMG+3pHb7ngR6jGsuAw17y9EdMWUKEnsrcCgoxup
         KDM1Vt/cmizDvcsSL7I+sKHZBVKGDYgZCMNuijXhVBmYPHiR/fzlyt4HnlxF3tY3a1JQ
         eWxKI/1J12krckmCiQqdM6mH7GzKnmLMLqfWXO6VHIEu9l+ehdecyfQG9ejCyIbil09n
         t86W3++/+Ncep9rUYuZd/fpMZzsKyS/HqVsagE98tdZBcKpUPCVjnDeHICHIzeIg+WZE
         xB/Fi4wZuJKEjiTLOJRGXC+imy390973op4N+9LKjDKhbWsbBGt0sUSGR+4zgepkfZ0a
         Sw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LfazEVXJDWm5fHCm2MG3wz5cKNMzAQ0JQdcxbxRWLtQ=;
        b=gOtLpFK+sBNHXDTmIsxLPp3qMtDMr7KTUN8zbF1Vu4v4ODAdhLbn2z7na393CJsqAb
         dJ8SyzVxbDnF8h7lYT8tjVX43i3T/TC4aZU4PXTTFvWlkVXp2tOArEiJTnpYFms2eOhR
         t9+lWAiQqXv0mzUj8EM/BBwK6VNWndUBefKeKY7Xoc4TWkpp5RsRLd43OW0YMd8PZuMh
         7ETInLl8/QxS3uF82HcetNddqQmUGiczwrM+HU2u268/qLweMZF9hDJjGHrHWdWkdxHW
         exE9/bEeePx2/cpc0Ao1SM963yAf1XZTF2lMVoddGQNZegEOVh85pouwzDFIb3WzLG9V
         FIyA==
X-Gm-Message-State: ANoB5pnWAOwVdz6mhwa2GdpAwadvWlhKXvdOWb/3lZvbRlRNMbphYwXN
        Z+YTPTRrOVNa2gqQD+y+PI9GEw==
X-Google-Smtp-Source: AA0mqf6XKX5jq957jK+woicXsTTntfBxeoK2aGNS6zdyv/C4XbbAHE+MqylJi7c6xm66RFaiQKFCiQ==
X-Received: by 2002:a2e:b526:0:b0:26e:494a:de3f with SMTP id z6-20020a2eb526000000b0026e494ade3fmr29828870ljm.85.1670495489928;
        Thu, 08 Dec 2022 02:31:29 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id h18-20020a2eb0f2000000b00279e5247dabsm1699580ljl.18.2022.12.08.02.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 02:31:29 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Joe Tessler <jrt@google.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Jeff Chase <jnchase@google.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 2/9] media: dt-bindings: st,stm32-cec: move to cec subfolder
Date:   Thu,  8 Dec 2022 11:31:08 +0100
Message-Id: <20221208103115.25512-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
References: <20221208103115.25512-1-krzysztof.kozlowski@linaro.org>
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

Move st,stm32-cec.yaml bindings to cec subfolder and drop unneeded
"bindings" in the title.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/media/{ => cec}/st,stm32-cec.yaml     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/media/{ => cec}/st,stm32-cec.yaml (89%)

diff --git a/Documentation/devicetree/bindings/media/st,stm32-cec.yaml b/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
similarity index 89%
rename from Documentation/devicetree/bindings/media/st,stm32-cec.yaml
rename to Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
index 77144cc6f7db..2314a9a14650 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-cec.yaml
+++ b/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/media/st,stm32-cec.yaml#
+$id: http://devicetree.org/schemas/media/cec/st,stm32-cec.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: STMicroelectronics STM32 CEC bindings
+title: STMicroelectronics STM32 CEC
 
 maintainers:
   - Yannick Fertre <yannick.fertre@foss.st.com>
-- 
2.34.1

