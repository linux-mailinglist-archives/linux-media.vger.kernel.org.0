Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE3921BEB41
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 00:02:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727985AbgD2WBd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Apr 2020 18:01:33 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:14839 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727961AbgD2WBc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Apr 2020 18:01:32 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5ea9f8f90001>; Wed, 29 Apr 2020 15:00:25 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 29 Apr 2020 15:01:32 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 29 Apr 2020 15:01:32 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 Apr
 2020 22:01:31 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 29 Apr 2020 22:01:31 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.165.152]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5ea9f93a0003>; Wed, 29 Apr 2020 15:01:31 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v11 7/9] MAINTAINERS: Add Tegra Video driver section
Date:   Wed, 29 Apr 2020 15:00:04 -0700
Message-ID: <1588197606-32124-8-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1588197625; bh=BMQVVr+zunu9dob90MEf4wUgkZwVcUqgaAtE7fDWMfE=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=B4naSig19K4cZJE9p3lgv0AJHYU4Gn1gYE5+7H8w3Stov3lqW9FSc8eqLcoMfYqWl
         uUfDnfW0ePZwVci02lr+YXOgJgiY6rrUy0UCghm9Rm+KNTvP1K+SCcB9O6QK6iFObJ
         irK1tGQQ3lrXq4LXI3nck/gRl1Ejr6vpnVPVjz1o3gs59MzEWkbDiIuuSyMnFMlMzK
         wSaYZ+JnCK2DIYvK063CSTPjwPjyNRqSCSDzrOa3oLSa0oUSij96ufqUVlDLVgiaKJ
         ZGctNU04Xjt+6bSvsnqyJIsdrl2FT0QSXMG/MsQ9X46s5tdLqjZ5LyR8f6ZkI9E4Ib
         tJzKDDcfn1PcQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add maintainers and mailing list entries to Tegra Video driver section.

Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 973b7db..795b201 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16644,6 +16644,16 @@ M:	Laxman Dewangan <ldewangan@nvidia.com>
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

