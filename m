Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 147C97BB730
	for <lists+linux-media@lfdr.de>; Fri,  6 Oct 2023 14:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232179AbjJFMCN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Oct 2023 08:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232178AbjJFMCJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Oct 2023 08:02:09 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 369E9F4
        for <linux-media@vger.kernel.org>; Fri,  6 Oct 2023 05:02:06 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3226cc3e324so1966484f8f.3
        for <linux-media@vger.kernel.org>; Fri, 06 Oct 2023 05:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696593724; x=1697198524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSGAkuD+7vWq/4//TzDVC1wtIHtAKa9SU4Jfy5NCE4Y=;
        b=REQcHVwyftW7z/LC3aLxtx6m2wTgFpcwp6Hdo7j9MsAIeripPBWvCE8nMKbF6fmkri
         XLMSkUlgIDUoKbKUXel+xLxR8KicLOAsCcPB4Qo6MdX7uTOOOnXxdooE13iQhdyahTGc
         qwoG0ADdY+ol2kl7pTS9BsJCsZZ4eMGsmcWc9m+grpmrAGzMC2z9fBBSEt95Kc46h4Hq
         ZNTuRTe+qzXMaHGqQpeirs07eAXE5NuyoUAZ/b5Cqf2p/GrxBI3euT19WQ8LV3MlFsx4
         W6qSzCaXhkq5VCnpOO1jQAYtvH/tbuEhqE6PoR7aljzzV4TQHMnY35U3VQzLvDQTIhNS
         4Mkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696593724; x=1697198524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jSGAkuD+7vWq/4//TzDVC1wtIHtAKa9SU4Jfy5NCE4Y=;
        b=ODEG6MzJeicdLXt8CmGcPp5xklJ6r11FxE71cM/li+H0Do2Cjht1WKjdRubEWfRbK0
         mcHQyAbsSz7+Ssa9px325I70NpUugzJFPiFvys2mYRXGHQAl8QTmlCxJdDOvT6B0JrxX
         BUzkshA+tU3noApRgfEwrnFtDFqumPkAU1yfGABQgO8kjHiG0yZlUm+MWnJSEwlrrjG3
         LtNdBZ/qNVTJ35zefIDjhi7SqV6dNv1FSrjK5LeMKtnp6L9rO2/4FYRu6tFiMjPH0cCd
         lGVorOdKP0nlNhz20aCVDRDcmn1zUjc6L+MIbv5LMFCeIDN/+IJdbJgnUBE43PNOtNp5
         249g==
X-Gm-Message-State: AOJu0Yy7uz7EksA17cTjppFXCRqL6wfhdQY+TNb6xgUgm1CO8EV/fSnI
        Il7OEm9WLOipG/HwJcohxS/6Zg==
X-Google-Smtp-Source: AGHT+IGjV6Lkmbq5zBsMUAqIyVea/+fjQS1ggse+sUgiRX/y6wI9EQg0hfmS9uIS9oEljnGZ9LxN/Q==
X-Received: by 2002:a5d:494f:0:b0:31a:d266:3d62 with SMTP id r15-20020a5d494f000000b0031ad2663d62mr7516272wrs.54.1696593724118;
        Fri, 06 Oct 2023 05:02:04 -0700 (PDT)
Received: from x13s-linux.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m8-20020a056000180800b00321773bb933sm1491061wrh.77.2023.10.06.05.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 05:02:03 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        loic.poulain@linaro.org, rfoss@kernel.org, andi.shyti@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, todor.too@gmail.com, mchehab@kernel.org,
        bryan.odonoghue@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: i2c: qcom-cci: Document sc8280xp compatible
Date:   Fri,  6 Oct 2023 13:01:55 +0100
Message-Id: <20231006120159.3413789-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231006120159.3413789-1-bryan.odonoghue@linaro.org>
References: <20231006120159.3413789-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add sc8280xp compatible consistent with recent CAMSS CCI interfaces.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 042d4dc636ee..8a8d0a01017c 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -25,6 +25,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,sc8280xp-cci
               - qcom,sdm845-cci
               - qcom,sm6350-cci
               - qcom,sm8250-cci
@@ -159,6 +160,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,sc8280xp-cci
               - qcom,sm8250-cci
               - qcom,sm8450-cci
     then:
-- 
2.40.1

