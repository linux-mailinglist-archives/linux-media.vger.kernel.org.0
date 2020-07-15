Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1115E220356
	for <lists+linux-media@lfdr.de>; Wed, 15 Jul 2020 06:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728082AbgGOETZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Jul 2020 00:19:25 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:4596 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725824AbgGOETX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Jul 2020 00:19:23 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f0e83be0000>; Tue, 14 Jul 2020 21:19:10 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 14 Jul 2020 21:19:23 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 14 Jul 2020 21:19:23 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Jul
 2020 04:19:22 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 15 Jul 2020 04:19:22 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.160.169]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f0e83c90003>; Tue, 14 Jul 2020 21:19:22 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
Subject: [RFC PATCH v3 01/18] dt-bindings: i2c: tegra: Document Tegra210 VI I2C clocks and power-domains
Date:   Tue, 14 Jul 2020 21:20:38 -0700
Message-ID: <1594786855-26506-2-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
References: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594786750; bh=M4O0xvH9jkOkIfyCWsWjZaEplFLrJZlC+QemXhCNkTI=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=Q4sNDhf7qMcqUTgPnN0JSwr1ga81wkG28Btq//uewCuxbpPCfCTpeZ0ylf4jHgazr
         F4uaS1/2O1Sda8TS/+HpVw+SnYsth8tsPUwe+f/bcWJvYnGPHcitFhHCb9ggAuWrDL
         aUsVbO5kH6zqAO9CS36SLldto9VpyOuGFRFBQiosdunr65Bo1nTllPjpGytFrRmaeX
         7lfbmz32Xe5+QYVs2WFAYWNBdHPzm5Pt07aF0LY9Fx+yr8aUUX6LNq9KvGd04/RhJg
         AUfUKLgBiLFYp93sBRU3nde3fAvNYgwiiobctzmI5rZqwxHJ7ZqYk4jhHWI6txGH/b
         4U5b2duBBKfhA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch documents missing clocks and power-domains of Tegra210 VI I2C.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 .../devicetree/bindings/i2c/nvidia,tegra20-i2c.txt    | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt
index 18c0de3..3f2f990 100644
--- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.txt
@@ -35,12 +35,12 @@ Required properties:
 	Due to above changes, Tegra114 I2C driver makes incompatible with
 	previous hardware driver. Hence, tegra114 I2C controller is compatible
 	with "nvidia,tegra114-i2c".
-  nvidia,tegra210-i2c-vi: Tegra210 has one I2C controller that is part of the
-	host1x domain and typically used for camera use-cases. This VI I2C
-	controller is mostly compatible with the programming model of the
-	regular I2C controllers with a few exceptions. The I2C registers start
-	at an offset of 0xc00 (instead of 0), registers are 16 bytes apart
-	(rather than 4) and the controller does not support slave mode.
+  nvidia,tegra210-i2c-vi: Tegra210 has one I2C controller that is on host1x bus
+	and is part of VE power domain and typically used for camera use-cases.
+	This VI I2C controller is mostly compatible with the programming model
+	of the regular I2C controllers with a few exceptions. The I2C registers
+	start at an offset of 0xc00 (instead of 0), registers are 16 bytes
+	apart (rather than 4) and the controller does not support slave mode.
 - reg: Should contain I2C controller registers physical address and length.
 - interrupts: Should contain I2C controller interrupts.
 - address-cells: Address cells for I2C device address.
@@ -53,10 +53,17 @@ Required properties:
   - fast-clk
   Tegra114:
   - div-clk
+  Tegra210:
+  - div-clk
+  - slow (only for nvidia,tegra210-i2c-vi compatible node)
 - resets: Must contain an entry for each entry in reset-names.
   See ../reset/reset.txt for details.
 - reset-names: Must include the following entries:
   - i2c
+- power-domains: Only for nvidia,tegra210-i2c-vi compatible node and must
+  include venc powergate node as vi i2c is part of VE power domain.
+  tegra210-i2c-vi:
+  - pd_venc
 - dmas: Must contain an entry for each entry in clock-names.
   See ../dma/dma.txt for details.
 - dma-names: Must include the following entries:
-- 
2.7.4

