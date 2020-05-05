Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DECE1C4C12
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 04:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727991AbgEECbI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 22:31:08 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:10293 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726550AbgEECbF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 22:31:05 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5eb0cfa30000>; Mon, 04 May 2020 19:29:55 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 04 May 2020 19:31:05 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 04 May 2020 19:31:05 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 5 May
 2020 02:31:04 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 5 May 2020 02:31:04 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.165.119]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5eb0cfe7000b>; Mon, 04 May 2020 19:31:04 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v12 2/9] arm64: tegra: Add reset-cells to mc
Date:   Mon, 4 May 2020 19:31:53 -0700
Message-ID: <1588645920-20557-3-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588645920-20557-1-git-send-email-skomatineni@nvidia.com>
References: <1588645920-20557-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588645795; bh=z3bBR4V19xk9JlZpvNqo4prWFUv/8IZEu6WbdTK/c8A=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=hTOgn1AEZxtHuDydHvDfe5siS7N0gMSqw29izg6PDGcCFPCGLbF2PmsZ2YtfHi0nn
         F9opiarvl+G98+YqS1pv6/8ATiNVEaIQlfnZx6I1zAmYLc1UQORQBTesWLfDaNxX9t
         gsvxkRUlZDEIUaJXMnfU6HtyUaRwOnPXQnnqgq84LmzBc87bAu/wEDZbfBrNFnqK7f
         WuOdFhPj+YVqNcMXr1evDYekdb4SvoSbTP6nKI+RWkApYdlYl7z/67oodS/OJ9UV9r
         qYeSEfmsfS4C4/uR/WUmJrQNTASRXcotbv27hGKR8j1KKqDFs8P1FfD5r5rAuKeXsX
         qCbv+l2F9hKZg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Tegra210 device tree is missing reset-cells property for mc node.

This patch fixes it.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 909960a..29a43d7 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -894,6 +894,7 @@
 		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
 
 		#iommu-cells = <1>;
+		#reset-cells = <1>;
 	};
 
 	emc: external-memory-controller@7001b000 {
-- 
2.7.4

