Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1C8C44AB7D
	for <lists+linux-media@lfdr.de>; Tue,  9 Nov 2021 11:29:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242874AbhKIKce (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Nov 2021 05:32:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242865AbhKIKcd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Nov 2021 05:32:33 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CAABC061766
        for <linux-media@vger.kernel.org>; Tue,  9 Nov 2021 02:29:47 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:9dc9:efd5:4c6f:baa9])
        by michel.telenet-ops.be with bizsmtp
        id GAVj260011LAWtA06AVjgj; Tue, 09 Nov 2021 11:29:45 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mkONq-00BCpC-OF; Tue, 09 Nov 2021 11:29:42 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mkONq-00E7Ix-7b; Tue, 09 Nov 2021 11:29:42 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2] bindings: media: venus: Drop redundant maxItems for power-domain-names
Date:   Tue,  9 Nov 2021 11:29:41 +0100
Message-Id: <d94924e1bd00f396f2106f04d4a2bb839cf5f071.1636453406.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

make dt_binding_check:

    Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml: ignoring, error in schema: properties: power-domain-names
    warning: no schema found in file: Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
    Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml: properties:power-domain-names: {'required': ['maxItems']} is not allowed for {'minItems': 2, 'maxItems': 3, 'items': [{'const': 'venus'}, {'const': 'vcodec0'}, {'const': 'cx'}]}
	   hint: "maxItems" is not needed with an "items" list
	   from schema $id: http://devicetree.org/meta-schemas/items.yaml#

Fixes: e48b839b6699c226 ("media: dt-bindings: media: venus: Add sc7280 dt schema")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring <robh@kernel.org>
---
v2:
  - Add Acked-by,
  - s/bogus/redundant/,
  - Include full error message.
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

