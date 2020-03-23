Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA2E18FBFA
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 18:52:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbgCWRwq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 13:52:46 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:15195 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727758AbgCWRwn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 13:52:43 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e78f75d0000>; Mon, 23 Mar 2020 10:52:29 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 23 Mar 2020 10:52:42 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 23 Mar 2020 10:52:42 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Mar
 2020 17:52:42 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 23 Mar 2020 17:52:42 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.160.78]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e78f7690007>; Mon, 23 Mar 2020 10:52:42 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v5 8/9] dt-bindings: reset: Add ID for Tegra210 VI reset
Date:   Mon, 23 Mar 2020 10:52:34 -0700
Message-ID: <1584985955-19101-9-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
References: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1584985949; bh=L8ndW8+Uxj7JNOHxtp4ihFZmkMPUeCnBtUyBLpK+IFo=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=SfqWGgOyvC4bs4m2L9x991tdetDB2p+2AanuGAqD7sLe1OSeU8/kuQxIiBN/4A5jd
         +swAjow7D2dZutziVTFrNRiI7/gNQhl5yTyUdPayA3uzNbWVa9E9S9Sw0UvxxwiQ/4
         BiLa4WyUvbmP8yLaWkRUNTOi1tq8iL1jd5nm7lKGesQIx1XWhKXYJ6MeYRDkCRdrRr
         kWhRok/P695NCBwEivDJ0NqaXacG2aXfZu4HweoHnz9ifgbLVJF3ldGQYd2vnltVTa
         AKtpLCVttHSeoO9y9/lGROSzE0FabWhlUMh4yjBCLDQFroOesz13b9+jGQylC9RYOz
         H2oHx62ianwxA==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch adds ID for Tegra210 VI controller reset to use with
device tree.

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

