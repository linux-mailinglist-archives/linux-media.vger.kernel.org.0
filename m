Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDA396DAD85
	for <lists+linux-media@lfdr.de>; Fri,  7 Apr 2023 15:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240841AbjDGN2q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Apr 2023 09:28:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240817AbjDGN2l (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Apr 2023 09:28:41 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 085ED903F
        for <linux-media@vger.kernel.org>; Fri,  7 Apr 2023 06:28:39 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id y7so11131479ljp.2
        for <linux-media@vger.kernel.org>; Fri, 07 Apr 2023 06:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680874117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=grmIxSUAU0kBA7EJgdolRxlhvAD6xuuLCo/DeTKPOd4=;
        b=cOMmHlrGEbtO3yZ2betrRfYyhgeHSJqYgebKGG1sn5LOU3ZBjFwpqxrUgC4Dn2h+8S
         NofaV0W0HOITCig0UgxmDmjccOZe/hp967GmdVHkGZy3p7yMgnqr169PSOp6jBwaZcLh
         61IJuBtGB8EDgmTlzBlz7PunAp4XVGhE+OzDRid7GmPyA01dfw/UPoLuyguHpG89ofpk
         YT/57yooGXrwitCugYgAdvGauTV98U6auEpQrg0NGFKFX96eSTjos3xGqYfCB0smxFcy
         wLwNq1BqI9101d6XoYCft/VuULBvSj/oSAbmXhaNv1jSZarDlO5kascO3KDW1Xv8Eqyh
         IKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680874117;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=grmIxSUAU0kBA7EJgdolRxlhvAD6xuuLCo/DeTKPOd4=;
        b=achq1+beiq04IZkSBoYXVzm2MCy8nb4Xx4TLYA6l9FNUEBmcaKL5e82K3tc/jkkXGb
         0PKzxktERRL5iElSH3nocjvjMKPqb4zo3h0l5iDqztP74kcIk2Iz4AZcO0zlp5GiWtQl
         j6W3adNJAq6ceWjluyNUFD7K+SqKMiZlcje1fSelhkxuawjqycnz4xp7Fy0QdQQuHObk
         Ir5raiSjcBeS4Hcpfh8PCdHvSwYkIEBrmzzTmy1vfi8hv2Z30jHjnxqj9DXiOQXw0rYz
         n822ETtVjsa3k0B7EMgqwnyBUNAS7SK3bRbi1wrlZSoi7HJBSbegELLL8VZ9UQ3Kv6m3
         W5XA==
X-Gm-Message-State: AAQBX9dqrSc+/97JJQcIEohrFNplXl/XgC1bOrmkCNOVwZ3zetw/u909
        DHdTXr6/fSu5w0sFp9eFvPWqPw==
X-Google-Smtp-Source: AKy350aaMgbaCCdcjWNyNhLf9oPTZzXicz8SmfDjO3HAgT62Q3Pdw3TK2UNh5tKA3icr4u1hUazx7g==
X-Received: by 2002:a2e:9851:0:b0:298:a8bf:a65 with SMTP id e17-20020a2e9851000000b00298a8bf0a65mr558843ljj.13.1680874117346;
        Fri, 07 Apr 2023 06:28:37 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id h2-20020a2e3a02000000b002a618eb72b1sm811031lja.98.2023.04.07.06.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 06:28:37 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 07 Apr 2023 15:28:33 +0200
Subject: [PATCH 3/6] dt-bindings: usb: dwc3: Allow dma-ranges
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230407-topic-msm_dtb-v1-3-6efb4196f51f@linaro.org>
References: <20230407-topic-msm_dtb-v1-0-6efb4196f51f@linaro.org>
In-Reply-To: <20230407-topic-msm_dtb-v1-0-6efb4196f51f@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680874110; l=844;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=2wRiR7WEXmQZpYv5SNBYk0HTq2/eu6+iUQ50kZacv00=;
 b=0WYZFFcb41FKVZEjr+Rt3QZBW3WacDCF7a8sYWN6zVRRSIzFFLbR9KfDvAF4VFO4EuK1ln6sUm89
 L3qPPGO2AKdPUmSfhgE9qEydOzLILrexSR6oMm8BuEeOZutzOv9t
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allow the common dma-ranges property to silence warning like this:

qcom/sc7280-herobrine-evoker.dtb: usb@a6f8800: 'dma-ranges' does not
match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index d84281926f10..3c3548f55797 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -55,6 +55,8 @@ properties:
 
   ranges: true
 
+  dma-ranges: true
+
   power-domains:
     description: specifies a phandle to PM domain provider node
     maxItems: 1

-- 
2.40.0

