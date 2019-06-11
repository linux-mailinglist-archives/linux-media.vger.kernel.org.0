Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 316083D6AF
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 21:23:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407484AbfFKTVQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 15:21:16 -0400
Received: from smtprelay-out1.synopsys.com ([198.182.47.102]:37604 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2404789AbfFKTVQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 15:21:16 -0400
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com [10.225.0.209])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1610FC014E;
        Tue, 11 Jun 2019 19:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1560280876; bh=tHIJCAqTF+UPHZ5DtLIcgsUdC1LXsknXPaU2PJfFj5E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gLcApO+wN86rDTtu12tkhOzLIR/ojbxyBB39+/3vliFulgKmtv48gGR0k9IafoCM7
         cVFQ4on43WaeutuTEU8zWRbLqC1oZy7dsne5SlcGatx37gNdRYEktZMmd9reRxlaVq
         0o7bN/qKr/ee71pdjr0fivPjXK4NS17PhtwMoejCzgnT5DPgV36SW3CmGagHgjSwg5
         e6dyQMwcISQgwdeZOP0LOKoMwu0IwzrqA1TFNmmeq99fcebMptoRQlVd0GvuK3dMJo
         M9cJv+MW2NlffYV4Q/m9yS+h23g0QnzdUapVddKLl7lATnzLiOEsEmg3pOYi8uIQsU
         x9qqekphIqOuA==
Received: from de02.synopsys.com (de02.internal.synopsys.com [10.225.17.21])
        by mailhost.synopsys.com (Postfix) with ESMTP id 6C18BA005D;
        Tue, 11 Jun 2019 19:21:13 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com (de02dwia024.internal.synopsys.com [10.225.19.81])
        by de02.synopsys.com (Postfix) with ESMTP id 4AE9F3F896;
        Tue, 11 Jun 2019 21:21:13 +0200 (CEST)
From:   Luis Oliveira <Luis.Oliveira@synopsys.com>
To:     mchehab@kernel.org, davem@davemloft.net,
        gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com,
        robh@kernel.org, nicolas.ferre@microchip.com,
        paulmck@linux.ibm.com, mark.rutland@arm.com, kishon@ti.com,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Joao.Pinto@synopsys.com, Luis Oliveira <Luis.Oliveira@synopsys.com>
Subject: [v4 1/6] dt-bindings: media: Document bindings for DW MIPI CSI-2 Host
Date:   Tue, 11 Jun 2019 21:20:50 +0200
Message-Id: <1560280855-18085-2-git-send-email-luis.oliveira@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Luis Oliveira <lolivei@synopsys.com>

Add bindings for Synopsys DesignWare MIPI CSI-2 host.

Signed-off-by: Luis Oliveira <lolivei@synopsys.com>
---
Changelog
v3-v4
- remove "plat" from the block name @rob @laurent
- remove "phy-names" when single-entry @rob
- remove "snps,output-type" -> went to the driver config @laurent

 .../devicetree/bindings/media/snps,dw-csi.txt      | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/snps,dw-csi.txt

diff --git a/Documentation/devicetree/bindings/media/snps,dw-csi.txt b/Documentation/devicetree/bindings/media/snps,dw-csi.txt
new file mode 100644
index 0000000..613b7f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/snps,dw-csi.txt
@@ -0,0 +1,41 @@
+Synopsys DesignWare CSI-2 Host controller
+
+Description
+-----------
+
+This HW block is used to receive image coming from an MIPI CSI-2 compatible
+camera.
+
+Required properties:
+- compatible		: shall be "snps,dw-csi"
+- reg			: physical base address and size of the device memory
+			  mapped registers;
+- interrupts		: DW CSI-2 Host interrupts
+- phys			: List of one PHY specifier (as defined in
+			  Documentation/devicetree/bindings/phy/phy-bindings.txt).
+			  This PHY is a MIPI DPHY working in RX mode.
+- resets		: Reference to a reset controller (optional)
+
+The per-board settings:
+ - port sub-node describing a single endpoint connected to the camera as
+   described in video-interfaces.txt[1].
+
+Example:
+
+	csi2: csi2@3000 {
+		compatible = "snps,dw-csi";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = < 0x03000 0x7FF>;
+		phys = <&mipi_dphy_rx>;
+		resets = <&dw_rst 1>;
+		interrupts = <2>;
+
+		port@0 {
+			reg = <0>;
+			csi_ep1: endpoint {
+				remote-endpoint = <&camera_1>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
-- 
2.7.4

