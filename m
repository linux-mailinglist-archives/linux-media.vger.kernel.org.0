Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA7FF656C11
	for <lists+linux-media@lfdr.de>; Tue, 27 Dec 2022 15:41:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231611AbiL0OlU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Dec 2022 09:41:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232050AbiL0OlO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Dec 2022 09:41:14 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11C4AC1E
        for <linux-media@vger.kernel.org>; Tue, 27 Dec 2022 06:41:11 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id g14so13893614ljh.10
        for <linux-media@vger.kernel.org>; Tue, 27 Dec 2022 06:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6l5Stnk7fMzBB/NlZWEX9ZfMF7Mr1OOOUdJOwER72aw=;
        b=LyZ2BkrWO0MiXQywCgrK+jyh1STFITymshJxHK2brkuS966qNexR6VDnt8cxKlYuhL
         jPrNfPwBbFKF/e3gxAqQ2rxrU014/34aI37c5UKYj56d0c9S3/dAcTruEGcOfdcvKYiA
         MZGJfkhJMsPZP38zArJQJRZZa6EKIrCQgfs83yKjRZP+ECN2vNsH49IMNpR8YeMgC18I
         WseCcGnFh9sDxOBtpBYSeVkQmKvpgmmlV5tf78h+BMu8A8cHwcmUI2+NGlABgN/+G/Ov
         7V6srIyp6rT+KicCrPuvoiEeqS31/AjMwEmA90GG2+am+BmW8LaKP4ZRNWnSP540KmMk
         KmDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6l5Stnk7fMzBB/NlZWEX9ZfMF7Mr1OOOUdJOwER72aw=;
        b=pvg9Qhmaxyse4JAWxaC7ZdK+fAQITqaRsJVTy9i2ODLQnBstcpBgQbVlR0WoE73mjV
         Ylq+e7eW1epY7gc/9nBJ5rYKapplH/ejiHyE/pVXnH5s9slOF28G3PoaBlYHLQ0U9jDx
         OJFW3nVNGte3i1TRGKwHordU9bq7EjJ6h20HqOoRlR91ag9cDAjVmJUohWgaeAvQiz4n
         1CXBKo+MH7eH2pozM7CCCsrCYPOU0QL7MHUZd5xXZH+nsKm7KW3kEoQWMjoEE3sN49kp
         I3RBf4/zf8Sd/ndoeY4NZgQiYEG/7rRCVCXYUztkMX6iem0Pf7ZbMsT6FGveG//L4JM1
         t2gw==
X-Gm-Message-State: AFqh2koUWxe98XWhvAmxjejRwmigyNhWYW0liT4oQkbFW4ysMN19UrDV
        yT1f6DmDlH/TYl0PEZzBAvkCmw==
X-Google-Smtp-Source: AMrXdXsuqcph/mGXB0IO57o75fJcp7nWTgTu+OyMrweWv743nwztDJoOIv9ykosEH1bpq1nIWOOaMw==
X-Received: by 2002:a2e:bea6:0:b0:279:be0b:3fab with SMTP id a38-20020a2ebea6000000b00279be0b3fabmr7357246ljr.43.1672152069358;
        Tue, 27 Dec 2022 06:41:09 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s1-20020a056512214100b004b5853f0fc6sm2261126lfr.246.2022.12.27.06.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 06:41:08 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 5/8] media: dt-bindings: qcom,sc7280-venus: document OPP table
Date:   Tue, 27 Dec 2022 15:40:59 +0100
Message-Id: <20221227144102.79391-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221227144102.79391-1-krzysztof.kozlowski@linaro.org>
References: <20221227144102.79391-1-krzysztof.kozlowski@linaro.org>
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

Venus on Qualcomm SC7280 uses Operating Performance Points (both in DTS
and driver):

  sc7280-crd-r3.dtb: video-codec@aa00000: Unevaluated properties are not allowed ('operating-points-v2', 'opp-table' were unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/media/qcom,sc7280-venus.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
index f14bf07e115b..8f9b6433aeb8 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
@@ -53,6 +53,10 @@ properties:
       - const: cpu-cfg
       - const: video-mem
 
+  operating-points-v2: true
+  opp-table:
+    type: object
+
   video-decoder:
     type: object
 
-- 
2.34.1

