Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EBA17BB724
	for <lists+linux-media@lfdr.de>; Fri,  6 Oct 2023 14:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232187AbjJFMCJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Oct 2023 08:02:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232173AbjJFMCH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Oct 2023 08:02:07 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49AC3F0
        for <linux-media@vger.kernel.org>; Fri,  6 Oct 2023 05:02:04 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40537481094so18208615e9.0
        for <linux-media@vger.kernel.org>; Fri, 06 Oct 2023 05:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696593723; x=1697198523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+tRRmk02RPImBRLbLRoEQCQTLQJvcEiVX7dpADSsWwY=;
        b=KMlXqqIzMD3qffk4zdBFWxAfoXDXaJ6mL2JkEMGvfkKqRF6AU5fDkTJLTAHXqNkg4N
         y2kGGJ9kf+rcYGDJ6ARz103QELqlBCyXqt7trbppT3fLtqD5bAjBMRZ2g4GayVZiasjs
         Zu0Jdr3UOagj3bXm8PHWnuQi3n/lL8a+wPIgaIt7e4IqcJyRhLrk8RJh62OsjIIIsi4w
         T87OWmIrpLk718pAP/ijirTFjdqZJcB60zqROxUQ00afvDpQRE498E25mZZ9a5jJVV2m
         1irsi+zJSHZMh2mM0KWlS8u/iVr0/G7Ed8ankSeetQCFXWq0DgoWEM2nCzpm/YrsvTTP
         a4CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696593723; x=1697198523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+tRRmk02RPImBRLbLRoEQCQTLQJvcEiVX7dpADSsWwY=;
        b=MUqbxM626yo5JdhMKl906eMifbIuBkIxv+HWxOX/caI9u15OR0XODrnGqvQzWLfCTK
         toQNPHb6LC0xTSbR1RZ/r8ShMju06KuL0b3Qi3lwMe/LMQ3WuLUrKHPl/i6yf8Ty9+Ib
         E2vLqnsWr/jkWH8jA2wlhYCTb4FzB0CQAsGicJzwuF5Z6D/K053yk4E8rHbBXBtZjCNH
         +wc2OpZ56NXpXnKrS5+8FUqWcL7cSeBBdR08dK6yCo7RuxoOAFp0HF9jeynQkPftrimS
         NH8rV3NjhQnBmsIlIU4xibB8qbcDMEasC2BqoxW/P89lv3b7hJWnugPdL/DCnrRY7Mcy
         M1bw==
X-Gm-Message-State: AOJu0YyWkJ5VJp1gqx6wRnjZRwOWlgOxgihh3pEzjcXb9Gf9HkwkS7YV
        YPY5PkuaepILhF7R599Te5ef1Q==
X-Google-Smtp-Source: AGHT+IF5RYEvEKl+xS0P6/d0XseRZ9B+HxnqsobCALycXlaL8VL62NI/pH6Es1GVdJS7/sv7tNcNbA==
X-Received: by 2002:a05:600c:3b20:b0:406:847a:2934 with SMTP id m32-20020a05600c3b2000b00406847a2934mr6432197wms.28.1696593722608;
        Fri, 06 Oct 2023 05:02:02 -0700 (PDT)
Received: from x13s-linux.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m8-20020a056000180800b00321773bb933sm1491061wrh.77.2023.10.06.05.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 05:02:02 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        loic.poulain@linaro.org, rfoss@kernel.org, andi.shyti@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, todor.too@gmail.com, mchehab@kernel.org,
        bryan.odonoghue@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] Add sc8280xp CCI and CAMSS core dtsi
Date:   Fri,  6 Oct 2023 13:01:54 +0100
Message-Id: <20231006120159.3413789-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The sc8280xp provides a standard Camera Control Interface and Camera
SubSystem hardware interface similar to antecedent parts sdm845 and
sm8250.

Per the target segments for this part, sc8280xp has more of everything.
More CCI, VFE, CSIPHY and therefore more interrupt lines and clocks to
declare.

CCI x 4
CSIPHY x 4
VFE x 4
VFE Lite x 4
CSID x 4

Bootable 6.5.y x13s:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/lenovo-x13s-linux-6.5.y

Linux next:
https://git.codelinaro.org/bryan.odonoghue/kernel/-/tree/linux-next-23-10-06-sc8280xp-camss

This patch depends-on:
https://lore.kernel.org/lkml/20231004161853.86382-2-bryan.odonoghue@linaro.org/T/

Bryan O'Donoghue (5):
  dt-bindings: i2c: qcom-cci: Document sc8280xp compatible
  i2c: qcom-cci: Add sc8280xp compatible
  arm64: dts: qcom: sc8280xp: camss: Add CCI definitions
  media: dt-bindings: media: camss: Add qcom,sc8280xp-camss binding
  arm64: dts: qcom: sc8280xp: camss: Add CAMSS block definition

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml |   2 +
 .../bindings/media/qcom,sc8280xp-camss.yaml   | 598 +++++++++++++++++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 608 ++++++++++++++++++
 drivers/i2c/busses/i2c-qcom-cci.c             |   1 +
 4 files changed, 1209 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml

-- 
2.40.1

