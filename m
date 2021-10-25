Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8588E4393CB
	for <lists+linux-media@lfdr.de>; Mon, 25 Oct 2021 12:33:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232904AbhJYKgA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Oct 2021 06:36:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232896AbhJYKf6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Oct 2021 06:35:58 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84EACC061767
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 03:33:36 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id s1so15302610edd.3
        for <linux-media@vger.kernel.org>; Mon, 25 Oct 2021 03:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=uOI455EZK+xQ6LZy+Qgtz7hZ9+hlabcft7bqsTfsnwk=;
        b=cCBifTqp5lTGiiPTru5INp+kuxdIhhO+7iBanmzoNCcXsDYqhexIozh7ZJv2ObkaT7
         iQD8tGoTwk9Ah7ZzYSG6LOq9Oqi6pJHeLlOpuT4kmHPywSmT6X4haChoPun5uczNeuo9
         ppd4TGksPNcFIWND4+I6GduIy7Sfu0O7MxxN6/7KxoSZInnHGcl1AC6UpE4kvMPyLx5A
         sFD+zeZpotsV17S76X6HwWxrBrl1VhjhsY4wof4hIKLRo+3fyPze1dXUEapSF2kyjn92
         iozUtCfLCUntocrXvxy1KGf6u0G0Ne//5s/TCrJd76bGT1u0QB59vxKWW6D+sumqcRWq
         Bbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uOI455EZK+xQ6LZy+Qgtz7hZ9+hlabcft7bqsTfsnwk=;
        b=u5/zFGQMVZRHQ7e0xSkYiKsXIFKpIqmradvKuLf17Z0VgLj0wT377chS6IkYFoXfMz
         LJ5Tp7LxxpTZxkLcFe9+v+GF4bNPF6bS/HgfRNGkGBGGU5nDV9sddil0ZXO2EflHEWFF
         GB4JIw5mf43htpCHX7YIa3zLbhQ7QMEKPu2Y5WUfH4RmnevzG3Zhw7UbnKPZStNWeQ+b
         H53SqJAB9jI+eqo00lHspdtAfmOqeXF9bo1pwfolqwfu2ImWHh2P0Za2ddblz91Ungbw
         F29cOJFj0l3XYFdOR4dzsKyRLMgV0X+QERRrE0LUOdrBB72jmVdH5+5HtgWJIZQSF8Nk
         A+5Q==
X-Gm-Message-State: AOAM532MLQy5iRGH8H3Jcgw/QVdD5VNhKC3L2SgFKmVTfAigyaJ7IPge
        PzWxhyBqLwVdU92k8uyl41o/X6geZVK+j1bW
X-Google-Smtp-Source: ABdhPJzNUmre0eMFNlhEzkvE4eyV03gxzJEOFPUJNWRuPm+Xs6hWK0P9fQUQjgeQXsLQOqdeP21aag==
X-Received: by 2002:a50:d4cd:: with SMTP id e13mr25234696edj.29.1635158014975;
        Mon, 25 Oct 2021 03:33:34 -0700 (PDT)
Received: from localhost.localdomain (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id k23sm8562822edv.22.2021.10.25.03.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 03:33:34 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH v1 2/2] media: dt-bindings: media: camss: Document clock-lanes property
Date:   Mon, 25 Oct 2021 12:33:22 +0200
Message-Id: <20211025103322.160913-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211025103322.160913-1-robert.foss@linaro.org>
References: <20211025103322.160913-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The clock-lanes property corresponds to a hardware register field
that is required to be set, in order to enable the CSI clock signal.

The physical lane of the clock signal is not programmable, but only
togglable On or Off, which what BIT(7) of the
CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(5) register controls.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 .../devicetree/bindings/media/qcom,msm8996-camss.yaml        | 5 +++++
 .../devicetree/bindings/media/qcom,sdm660-camss.yaml         | 5 +++++
 .../devicetree/bindings/media/qcom,sdm845-camss.yaml         | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
index 38be41e932f0..d4da1fad12cf 100644
--- a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
@@ -106,6 +106,11 @@ properties:
 
             properties:
               clock-lanes:
+                description:
+                  The index of the clock-lane is not programmable by
+                  the hardware, but is required to define a CSI port.
+                  Lane 7 reflects the hardware register field that enables
+                  the clock lane.
                 items:
                   - const: 7
 
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
index 841a1aafdd13..f110152909b9 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
@@ -112,6 +112,11 @@ properties:
 
             properties:
               clock-lanes:
+                description:
+                  The index of the clock-lane is not programmable by
+                  the hardware, but is required to define a CSI port.
+                  Lane 7 reflects the hardware register field that enables
+                  the clock lane.
                 items:
                   - const: 7
 
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
index d8fb6ce1d7f9..087d5606f2be 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
@@ -106,6 +106,11 @@ properties:
 
             properties:
               clock-lanes:
+                description:
+                  The index of the clock-lane is not programmable by
+                  the hardware, but is required to define a CSI port.
+                  Lane 7 reflects the hardware register field that enables
+                  the clock lane.
                 items:
                   - const: 7
 
-- 
2.30.2

