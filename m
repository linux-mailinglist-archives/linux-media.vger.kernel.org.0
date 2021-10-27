Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA4BE43C9EE
	for <lists+linux-media@lfdr.de>; Wed, 27 Oct 2021 14:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240158AbhJ0MsB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Oct 2021 08:48:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230487AbhJ0MsA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Oct 2021 08:48:00 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2547C061767
        for <linux-media@vger.kernel.org>; Wed, 27 Oct 2021 05:45:34 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:441:6c1a:bc30:46e])
        by andre.telenet-ops.be with bizsmtp
        id B0lY2600C2hfXWm010lYZU; Wed, 27 Oct 2021 14:45:33 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mfiJ9-008U4Y-VJ; Wed, 27 Oct 2021 14:45:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mfiJ9-00DuIR-Ed; Wed, 27 Oct 2021 14:45:31 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Dikshita Agarwal <dikshita@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] bindings: media: venus: Drop bogus maxItems for power-domain-names
Date:   Wed, 27 Oct 2021 14:45:30 +0200
Message-Id: <097d8602906e9db279728330c6cf2837be184704.1635338663.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

make dt_binding_check:

    Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml: ignoring, error in schema: properties: power-domain-names
    warning: no schema found in file: Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml

Fixes: e48b839b6699c226 ("media: dt-bindings: media: venus: Add sc7280 dt schema")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
index fa54c560e0bde3cb..e2874683b4d5faf3 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
@@ -30,7 +30,6 @@ properties:
 
   power-domain-names:
     minItems: 2
-    maxItems: 3
     items:
       - const: venus
       - const: vcodec0
-- 
2.25.1

