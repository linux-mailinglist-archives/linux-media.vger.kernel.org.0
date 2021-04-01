Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA1D1351D7D
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 20:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238511AbhDAS2s (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 14:28:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:45718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239673AbhDASQp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 1 Apr 2021 14:16:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D152561222;
        Thu,  1 Apr 2021 12:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617279477;
        bh=0AGwy6Tl68VsWBu68wDgwZ5CzpVE/d5ORNGmhEDws2g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=j9+6sIJKmL+XOmxe06aUOTq1k9rbWG1ko3gLDYYloZawQ+uPzb6HyLO0axwBtY/Ml
         jEkUoJ6zUkX7bndJh8cFEKmiybNNqXDM2/N51fsLAcRv8KSFdfsOq6t2Lqw1c+7owx
         JlUeuTdafy2N/TkneDHlThe1fAG/peHgxaKuZ5irClbtzrgNvwG8Cu6cjpJDu8Pyqw
         VQJfPHNNFDlpcQ/t/ynxrYUdvt5ngXcTEQpbbm6CBM3/TsOtiSwbO6j9L3XnbMHcrh
         42PaDgiDzIgzIOab1guPYd/uAMB7PqTriadjZY+MZAe3kyHidi2bMjqQMX6tN1Jeq0
         7oNNkgvReRKmw==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1lRwGo-001c3X-GL; Thu, 01 Apr 2021 14:17:54 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Bin Liu <bin.liu@mediatek.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rick Chang <rick.chang@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH 26/32] dt-bindings: iommu: mediatek: update mediatek,iommu.yaml references
Date:   Thu,  1 Apr 2021 14:17:46 +0200
Message-Id: <f1a798e2d5ffa829d0324333a1af91f1b3a63dad.1617279356.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1617279355.git.mchehab+huawei@kernel.org>
References: <cover.1617279355.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changeset bca28426805d ("dt-bindings: iommu: mediatek: Convert IOMMU to DT schema")
renamed: Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
to: Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml.

Update the cross-references accordingly.

Fixes: bca28426805d ("dt-bindings: iommu: mediatek: Convert IOMMU to DT schema")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../devicetree/bindings/display/mediatek/mediatek,disp.txt      | 2 +-
 .../devicetree/bindings/media/mediatek-jpeg-decoder.txt         | 2 +-
 .../devicetree/bindings/media/mediatek-jpeg-encoder.txt         | 2 +-
 Documentation/devicetree/bindings/media/mediatek-mdp.txt        | 2 +-
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt     | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index 93b160df3eec..fbb59c9ddda6 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -64,7 +64,7 @@ Required properties (DMA function blocks):
 - larb: Should contain a phandle pointing to the local arbiter device as defined
   in Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
 - iommus: Should point to the respective IOMMU block with master port as
-  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
   for details.
 
 Optional properties (RDMA function blocks):
diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
index cf60c5acc0e4..39c1028b2dfb 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
@@ -19,7 +19,7 @@ Required properties:
   Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
   for details.
 - iommus: should point to the respective IOMMU block with master port as
-  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
   for details.
 
 Example:
diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
index acfb50375b8a..5e53c6ab52d0 100644
--- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.txt
@@ -17,7 +17,7 @@ Required properties:
   Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
   for details.
 - iommus: should point to the respective IOMMU block with master port as
-  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
   for details.
 
 Example:
diff --git a/Documentation/devicetree/bindings/media/mediatek-mdp.txt b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
index f4798d04e925..caa24943da33 100644
--- a/Documentation/devicetree/bindings/media/mediatek-mdp.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-mdp.txt
@@ -25,7 +25,7 @@ Required properties (DMA function blocks, child node):
         "mediatek,mt8173-mdp-wdma"
         "mediatek,mt8173-mdp-wrot"
 - iommus: should point to the respective IOMMU block with master port as
-  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
   for details.
 - mediatek,larb: must contain the local arbiters in the current Socs, see
   Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index 8217424fd4bd..a83ebc1a1c7f 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -18,7 +18,7 @@ Required properties:
   "univpll_d2", "clk_cci400_sel", "vdec_sel", "vdecpll", "vencpll",
   "venc_lt_sel", "vdec_bus_clk_src".
 - iommus : should point to the respective IOMMU block with master port as
-  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
+  argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
   for details.
 One of the two following nodes:
 - mediatek,vpu : the node of the video processor unit, if using VPU.
-- 
2.30.2

