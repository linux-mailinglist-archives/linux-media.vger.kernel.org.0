Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 971CB15F4D6
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2020 19:24:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405423AbgBNSYC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Feb 2020 13:24:02 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:13413 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394832AbgBNSXe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Feb 2020 13:23:34 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e46e5870001>; Fri, 14 Feb 2020 10:23:03 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 14 Feb 2020 10:23:33 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 14 Feb 2020 10:23:33 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Feb
 2020 18:23:32 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 14 Feb 2020 18:23:32 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.163.245]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e46e5a30003>; Fri, 14 Feb 2020 10:23:32 -0800
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <helen.koike@collabora.com>, <sboyd@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v3 5/6] MAINTAINERS: Add Tegra Video driver section
Date:   Fri, 14 Feb 2020 10:23:27 -0800
Message-ID: <1581704608-31219-6-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1581704608-31219-1-git-send-email-skomatineni@nvidia.com>
References: <1581704608-31219-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1581704583; bh=o4mX7n5qRTlkMMVF49k/gT61ds0WR9Gl8Mi6To4Osxw=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=GWl9lPQmzSuJpqKREuXDXlOxAwISzMDVurysZEVDdK9jFBT1yrkyk3i0MxWEylMTD
         hYofF8czWAjtkNBgIpgqfqGRDrwiyzierVSQ1vL+x01hxcqSSIJHXakTsDPc0VZlhY
         wOPt6UYxoxsaplSgkzeKzwOX5e6WVjfOZUBJDUl/2XJw5V21Nhf9Nb/y5zb+ls2aEF
         O3tczy/mOnEcVNpba22ipfJ87THxGyfhI/wlmzTkHlXw11sHghaB1BWQ9ijsKpRFBR
         OLSTQ4dosjZCgWrHQiX28KWjfvO7EjDxqccPTfh5RYN7KLsWJiTqDpsWTwLUgP0OWr
         34nnHVUkG/kcQ==
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
index 38fe2f3f7b6f..5a3b4887b9ae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16431,6 +16431,16 @@ M:	Laxman Dewangan <ldewangan@nvidia.com>
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

