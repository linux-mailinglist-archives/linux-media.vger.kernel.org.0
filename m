Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BAD0C3D6AD
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2019 21:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407513AbfFKTVT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jun 2019 15:21:19 -0400
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]:37662 "EHLO
        smtprelay-out1.synopsys.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2407496AbfFKTVS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jun 2019 15:21:18 -0400
Received: from mailhost.synopsys.com (unknown [10.225.0.210])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 044BAC019A;
        Tue, 11 Jun 2019 19:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1560280878; bh=7ZtOQar5xQn+bgJQWzr7Ojryo8q6IAx78zywu3z+Hf8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YxOzn70d0CwAPBohu8pVOW/R6YbtUr1fML4sY14BmgeN2NuuixyTQA9pvF6FUkryY
         mFG+XviwPwvHf1FTTtM0xK2prElCgRTURmteOpfyPspt38MdJPxCzAIBDgTDu+9K4l
         MVz5ykxjn73Pft6awe982NtOpaBSFrIUeHONLew+w4Zpd8c9CGPWW8Rsh+NJVf0bIs
         Dfgk820/aza6f8+w4kwWLq6YaRTB7JM16D6MWZD38RIgHOtmYKXESsC10+2Uo79L/W
         0htt6zNdpA5UPOx35TfC0cyESNwQTIq4dR++mnswV/BWiB01NR05kZUpYFh4Pt/Pg2
         sfDNAqoLxDipg==
Received: from de02.synopsys.com (de02.internal.synopsys.com [10.225.17.21])
        by mailhost.synopsys.com (Postfix) with ESMTP id CD92FA0238;
        Tue, 11 Jun 2019 19:21:16 +0000 (UTC)
Received: from de02dwia024.internal.synopsys.com (de02dwia024.internal.synopsys.com [10.225.19.81])
        by de02.synopsys.com (Postfix) with ESMTP id B9EEB3F8A2;
        Tue, 11 Jun 2019 21:21:16 +0200 (CEST)
From:   Luis Oliveira <Luis.Oliveira@synopsys.com>
To:     mchehab@kernel.org, davem@davemloft.net,
        gregkh@linuxfoundation.org, Jonathan.Cameron@huawei.com,
        robh@kernel.org, nicolas.ferre@microchip.com,
        paulmck@linux.ibm.com, mark.rutland@arm.com, kishon@ti.com,
        devicetree@vger.kernel.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Joao.Pinto@synopsys.com, Luis Oliveira <Luis.Oliveira@synopsys.com>
Subject: [v4 4/6] dt-bindings: phy: Document the Synopsys MIPI DPHY Rx bindings
Date:   Tue, 11 Jun 2019 21:20:53 +0200
Message-Id: <1560280855-18085-5-git-send-email-luis.oliveira@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
References: <1560280855-18085-1-git-send-email-luis.oliveira@synopsys.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add device-tree bindings documentation for SNPS DesignWare MIPI D-PHY in
RX mode.

Signed-off-by: Luis Oliveira <luis.oliveira@synopsys.com>
---
Changelog
v3-v4
- @Laurent I know I told you I could remove the snps,dphy-frequency on V3 but
  it is really useful for me here. I removed all other the proprietary
  properties except this one. Do you still think it must be removed?
- Frequency units @Rob

 .../devicetree/bindings/phy/snps,dw-dphy-rx.txt    | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/snps,dw-dphy-rx.txt

diff --git a/Documentation/devicetree/bindings/phy/snps,dw-dphy-rx.txt b/Documentation/devicetree/bindings/phy/snps,dw-dphy-rx.txt
new file mode 100644
index 0000000..50603e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/snps,dw-dphy-rx.txt
@@ -0,0 +1,29 @@
+Synopsys DesignWare MIPI Rx D-PHY block details
+
+Description
+-----------
+
+The Synopsys MIPI D-PHY controller supports MIPI-DPHY in receiver mode.
+Please refer to phy-bindings.txt for more information.
+
+Required properties:
+- compatible		: Shall be "snps,dw-dphy-rx".
+- #phy-cells		: Must be 1.
+- bus-width		: Size of the test interface data bus (8 bits->8 or
+			  12bits->12).
+- snps,dphy-frequency	: Frequency at which D-PHY should start, configurable.
+			  Check Synopsys databook. (-kHz)
+- reg			: Test interface register. This correspondes to the
+			  physical base address of the controller and size of
+			  the device memory mapped registers; Check Synopsys
+			  databook.
+
+Example:
+
+	mipi_dphy_rx1: dphy@d00003040 {
+		compatible = "snps,dw-dphy-rx";
+		#phy-cells = <1>;
+		bus-width = <12>;
+		snps,dphy-frequency = <300000>;
+		reg = <0xd0003040 0x20>;
+	};
-- 
2.7.4

