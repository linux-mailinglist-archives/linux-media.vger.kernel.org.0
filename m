Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5257915726F
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2020 11:04:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727575AbgBJKEX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Feb 2020 05:04:23 -0500
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:59409 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726968AbgBJKEW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Feb 2020 05:04:22 -0500
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id A96051E20;
        Mon, 10 Feb 2020 05:04:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 10 Feb 2020 05:04:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm2; bh=lLlJQuK4aZhWh
        uAwBdMqfq93dW9cBbZAvLLBJQZvB1Q=; b=H3wPUD4lcCIEgRq/x9z1tD/7O+wqB
        YgC6hXGVib7O3pbNxyzqB40AzMRig2lZGfPdR/9KcXAP0Q8t6J7U24TRQlXMo1Gr
        asA3mG1WuJlPSTQvyTt4BkS5N899mX+MDCDndIcxVcDKkiwjqouzPeL10OJRPXbA
        K2CFolNQP2jup+Ysi0R7DW+h7AgY2MH2sDvBdIQ/QvNxe61RjsEgPS0rvzevyhyR
        scqJmYpUAVmFvIjyDub1y6Yr+9i/5J/CjdsZUzhdIzjejY1dco/h2wzKNwnvaP6n
        burRCMNGiaaAE5y+0UiaoRTBQMHSLAexdXB2aCXe8SmgOCQejHdH75h+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=lLlJQuK4aZhWhuAwBdMqfq93dW9cBbZAvLLBJQZvB1Q=; b=UtfR4gIr
        tYEsT05bW7y0vVsFyCbGTLX6K8dtm14FkztpT0wQrb5NLMWRVbZ0vTe29TRsE9by
        1FHFZqOeuRjFCD8iNjWbtDfdSoU4/Ww2ES5ZG59ja/F3TSKvS2L2lQuuV+CXNbzU
        hF3eYZVwCcN6rv/Kaj4OwpaY+YbS2OWlgXuAxcZFizcNyre0Yov4z968iYPXIfFq
        RxKVdndDB5pz7b5Ac8p65hNqDshx7XYNFtaCZW41HI+rs/VmCl/c+v+/1YCqCerq
        hHa0y3A8J/0b0bi0/5ffbP4K/ca6BckItvWnr794vkEBAFunlpXjYFQIqkBo1SNj
        Es8kf+y9A5/Zfw==
X-ME-Sender: <xms:pSpBXvZLLeU-Jznqb9k4AL4-EGeBTCYarn5pMGXyRH3LX9LNF6H7Jw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedriedugddutdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucfkphepledtrd
    ekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:pSpBXiMwBekUsw6WKqYCLdCfm-0RoC7azGlPASFzW0GS9Uu4ZT2xUQ>
    <xmx:pSpBXrBQBu0kxhNfUI09yUqtbY6goKLD_pJvvH18pjWQIf0Ay4VRtg>
    <xmx:pSpBXpLWSA5mTu4ZUDgRKKPBMrycC_lKs0mWWBHyLfwdA9PjhmUPfg>
    <xmx:pSpBXsGVMmO8yX0Ib1egwjY8vJGRxrK8gJrxgoJCR3zYaVat0DNchg>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id 49DC13060701;
        Mon, 10 Feb 2020 05:04:21 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        sakari.ailus@linux.intel.com
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        mchehab+huawei@kernel.org, linux-media@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 2/2] dt-bindings: media: csi: Fix clocks description
Date:   Mon, 10 Feb 2020 11:04:17 +0100
Message-Id: <20200210100417.78583-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200210100417.78583-1-maxime@cerno.tech>
References: <20200210100417.78583-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 1de243b07666 ("media: dt-bindings: media: sun4i-csi: Add compatible
for CSI1 on A10/A20") introduced support for the CSI1 controller on A10 and
A20 that unlike CSI0 doesn't have an ISP and therefore only have two
clocks, the bus and module clocks.

The clocks and clock-names properties have thus been modified to allow
either two or tree clocks. However, the current list has the ISP clock at
the second position, which means the bindings expects a list of either
bus and isp, or bus, isp and mod. The initial intent of the patch was
obviously to have bus and mod in the former case.

Let's fix the binding so that it validates properly.

Fixes: 1de243b07666 ("media: dt-bindings: media: sun4i-csi: Add compatible for CSI1 on A10/A20")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../media/allwinner,sun4i-a10-csi.yaml        | 30 +++++++++++--------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
index afde17d9dab1..8453ee340b9f 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-csi.yaml
@@ -33,20 +33,26 @@ properties:
     maxItems: 1
 
   clocks:
-    minItems: 2
-    maxItems: 3
-    items:
-      - description: The CSI interface clock
-      - description: The CSI ISP clock
-      - description: The CSI DRAM clock
+    oneOf:
+      - items:
+        - description: The CSI interface clock
+        - description: The CSI DRAM clock
+
+      - items:
+        - description: The CSI interface clock
+        - description: The CSI ISP clock
+        - description: The CSI DRAM clock
 
   clock-names:
-    minItems: 2
-    maxItems: 3
-    items:
-      - const: bus
-      - const: isp
-      - const: ram
+    oneOf:
+      - items:
+        - const: bus
+        - const: ram
+
+      - items:
+        - const: bus
+        - const: isp
+        - const: ram
 
   resets:
     maxItems: 1
-- 
2.24.1

