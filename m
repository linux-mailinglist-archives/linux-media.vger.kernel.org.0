Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21E7B1C4C06
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2020 04:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728284AbgEECbL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 22:31:11 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:14651 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728183AbgEECbK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 May 2020 22:31:10 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5eb0cfe10001>; Mon, 04 May 2020 19:30:57 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 04 May 2020 19:31:09 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 04 May 2020 19:31:09 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 5 May
 2020 02:31:09 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 5 May 2020 02:31:09 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.165.119]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5eb0cfec0002>; Mon, 04 May 2020 19:31:09 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v12 8/9] dt-bindings: reset: Add ID for Tegra210 VI reset
Date:   Mon, 4 May 2020 19:31:59 -0700
Message-ID: <1588645920-20557-9-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588645920-20557-1-git-send-email-skomatineni@nvidia.com>
References: <1588645920-20557-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588645857; bh=KEZ1lHNwQNYea9tamUq6xhOd3Wa4inGS2Z794lURij8=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=CngNdwXTvdobhvguaTnJns9flg6Qc1VbpXuTky6PVpeS/4re7aJSdTSbQwjSnXug3
         a1dVCOCBk3I98u7QdvtXFVmprRVQ+d3S0mtRXoukhe0IMHTuUB1KNcOmisJ4SbUIpx
         ntaJKdH0XF8xKBy8TIhc5npYpX539+f8dHxM3UUfPvL8jagHZQmGuS6b2E0EblUh+H
         +Q5HFAEBKKY9bemULZYjOfPCeIdPL1tL8rACZC8fj7ZDU+3I3KDVUDJngqNUr9NJaK
         ZeuAJP+kLIRgLXWxUaeCcRxUW6VLyM7bCEiH1pIOBFRJXDcgLjWODUArqvNk84Dv14
         NePcughpgsLRQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds ID for Tegra210 VI controller reset to use with
device tree.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 include/dt-bindings/reset/tegra210-car.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/reset/tegra210-car.h b/include/dt-bindings/reset/tegra210-car.h
index 9dc84ec..8755946 100644
--- a/include/dt-bindings/reset/tegra210-car.h
+++ b/include/dt-bindings/reset/tegra210-car.h
@@ -10,5 +10,6 @@
 #define TEGRA210_RESET(x)		(7 * 32 + (x))
 #define TEGRA210_RST_DFLL_DVCO		TEGRA210_RESET(0)
 #define TEGRA210_RST_ADSP		TEGRA210_RESET(1)
+#define TEGRA210_RST_VI			20
 
 #endif	/* _DT_BINDINGS_RESET_TEGRA210_CAR_H */
-- 
2.7.4

