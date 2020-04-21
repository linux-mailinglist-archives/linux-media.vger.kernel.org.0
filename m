Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAA1B1B1A72
	for <lists+linux-media@lfdr.de>; Tue, 21 Apr 2020 02:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbgDUAL1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 20:11:27 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:11237 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726659AbgDUAL0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 20:11:26 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e9e39bb0000>; Mon, 20 Apr 2020 17:09:31 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 20 Apr 2020 17:11:26 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 20 Apr 2020 17:11:26 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 Apr
 2020 00:11:25 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 21 Apr 2020 00:11:25 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.165.49]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e9e3a2c0002>; Mon, 20 Apr 2020 17:11:25 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v8 7/9] MAINTAINERS: Add Tegra Video driver section
Date:   Mon, 20 Apr 2020 17:11:12 -0700
Message-ID: <1587427874-3291-8-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587427874-3291-1-git-send-email-skomatineni@nvidia.com>
References: <1587427874-3291-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587427771; bh=b88GH42tRlmFWW/LUhlK8Cl0XZ1rw6pCd4qVM58B0gI=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=oEo3cDoPtirG6UIAza/CPO5p/E4ZhhNdlwxekncGn6sYhXVVidCd9jHL8ZhqKOLSn
         5Mr5MKEOIvdVtifnn524bMq+rJ2cDlwE863pENFpcuvutoikhERCh1IuHisWMOmWqJ
         9x/sMTBfr23jhwz0yYnui9D2lY+G+DtIlujG0eYRLgncoo8PfFvVdRMuQBn0vSRKLl
         gqAH3VB6trpjryBRaDvwvgdlNz6GXLyo8RwqWB93Q0+SFH95zZXh+vyhlEBIFYXJQ1
         ojPlwoGp5z8e9xIk8Vso2LOEkLrwJL14vQAYVczDMNOpGmzSwhuisYwXRWym5gxJ6P
         wVRJxKRoDYWDg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add maintainers and mailing list entries to Tegra Video driver section.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5872577..47be371 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16608,6 +16608,16 @@ M:	Laxman Dewangan <ldewangan@nvidia.com>
 S:	Supported
 F:	drivers/spi/spi-tegra*
 
+TEGRA VIDEO DRIVER
+M:	Thierry Reding <thierry.reding@gmail.com>
+M:	Jonathan Hunter <jonathanh@nvidia.com>
+M:	Sowjanya Komatineni <skomatineni@nvidia.com>
+L:	linux-media@vger.kernel.org
+L:	linux-tegra@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
+F:	drivers/staging/media/tegra/
+
 TEGRA XUSB PADCTL DRIVER
 M:	JC Kuo <jckuo@nvidia.com>
 S:	Supported
-- 
2.7.4

