Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 002D82F495B
	for <lists+linux-media@lfdr.de>; Wed, 13 Jan 2021 12:10:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727687AbhAMLBO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Jan 2021 06:01:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:38840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727663AbhAMLBM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Jan 2021 06:01:12 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 65B06235FA;
        Wed, 13 Jan 2021 10:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610535570;
        bh=OG8KARVyVfWYeNIgPTfTdgsyg/2eyYBbFoiOqndpscA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=C6y6kfCLqJoaNBZjagFxC2DgAOjVcfgzTmVYim/sVNZZ1oh8fWHV2beHlGn9HAkST
         6t/Z6cmxn97UbDjITbUJOS12Zl+6FJaySTwjuPuByHABHmi4Zh5ojE4zWrunibi1Xr
         jkpIyRZBEwuyM1K4qu+Mjz97juTQL3qfYo6F5tqmsrOLjYfrTLgDNIANMNdiWNa+KV
         +4zicVDyahiyVYwCZumJzJtAymc1gCCavBO5nRiroinsvcD+kcS2xxXlCysuxz5xtQ
         /gVvgRDRGkZkF1Vl9vTCrDaRmUpd76mbqlkcwwYDskSgngmx+NLTkT3nT0m90DK6uW
         uu51KA4N23VNA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kzds7-00DpGp-SO; Wed, 13 Jan 2021 11:59:27 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        "Linux Doc Mailing List" <linux-doc@vger.kernel.org>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Bin Liu <bin.liu@mediatek.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rick Chang <rick.chang@mediatek.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH 22/24] dt-bindings: memory: mediatek: update mediatek,smi-larb.yaml references
Date:   Wed, 13 Jan 2021 11:59:23 +0100
Message-Id: <c70bd79b311a65babe7374eaf81974563400a943.1610535350.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1610535349.git.mchehab+huawei@kernel.org>
References: <cover.1610535349.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changeset 27bb0e42855a ("dt-bindings: memory: mediatek: Convert SMI to DT schema")
renamed: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
to: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml.

Update its cross-references accordingly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../devicetree/bindings/display/mediatek/mediatek,disp.txt      | 2 +-
 .../devicetree/bindings/media/mediatek-jpeg-decoder.txt         | 2 +-
 .../devicetree/bindings/media/mediatek-jpeg-encoder.txt         | 2 +-
 Documentation/devicetree/bindings/media/mediatek-mdp.txt        | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index 865e1e1b88ac..ed76332ec01e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -61,7 +61,7 @@ Required properties (DMA function blocks):
 	"mediatek,<chip>-disp-wdma"
   the supported chips are mt2701, mt8167 and mt8173.
 - larb: Should contain a phandle pointing to the local arbiter device as defined
-  in Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
+  in Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
 - iommus: Should point to the respective IOMMU block with master port as
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   for details.
diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
index 044b11913c49..cf60c5acc0e4 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
@@ -16,7 +16,7 @@ Required properties:
 - power-domains: a phandle to the power domain, see
   Documentation/devicetree/bindings/power/power_domain.txt for details.
 - mediatek,larb: must contain the local arbiters in the current Socs, see
-  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
+  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
   for details.
 - iommus: should point to the respective IOMMU block with master port as
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
index 736be7cad385..acfb50375b8a 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
@@ -14,7 +14,7 @@ Required properties:
 - power-domains: a phandle to the power domain, see
   Documentation/devicetree/bindings/power/power_domain.txt for details.
 - mediatek,larb: must contain the local arbiters in the current SoCs, see
-  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
+  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
   for details.
 - iommus: should point to the respective IOMMU block with master port as
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
diff --git a/Documentation/devicetree/bindings/media/mediatek-mdp.txt b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
index 0d03e3ae2be2..f4798d04e925 100644
--- a/Documentation/devicetree/bindings/media/mediatek-mdp.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
@@ -28,7 +28,7 @@ Required properties (DMA function blocks, child node):
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   for details.
 - mediatek,larb: must contain the local arbiters in the current Socs, see
-  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
+  Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
   for details.
 
 Example:
-- 
2.29.2

