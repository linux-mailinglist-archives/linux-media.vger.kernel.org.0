Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 022DA19E214
	for <lists+linux-media@lfdr.de>; Sat,  4 Apr 2020 03:25:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727192AbgDDBZU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 21:25:20 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:18803 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbgDDBZU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 21:25:20 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e87e1f20000>; Fri, 03 Apr 2020 18:25:06 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 03 Apr 2020 18:25:19 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 03 Apr 2020 18:25:19 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 4 Apr
 2020 01:25:19 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sat, 4 Apr 2020 01:25:18 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.164.193]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e87e1fd0007>; Fri, 03 Apr 2020 18:25:18 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v6 7/9] MAINTAINERS: Add Tegra Video driver section
Date:   Fri, 3 Apr 2020 18:25:05 -0700
Message-ID: <1585963507-12610-8-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1585963506; bh=xT1lz8Cal+j9/kpec3AotPuOZ5Hm5BCGN0uTk/nBQPc=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=oVcGAyDjGFoF8niIVH+wWZ0DH7uVgX7uQQDc7NZrD1I/CCmpubNazVVxnU/nYjDBa
         2W0Ywgi1BBFNDHLAhubpsB5saUiNr2/BxDO8SddqDzM5N2yt3vvy+n4txyBNt0LlHs
         icuHcp+r1bk0rYirt29CKH3RAla+E2QkOzRV1JDj9qo8a9lsQdr37UnMmuiTqareCH
         dTyQD0VUngMtWO86jyBWnVbgJ7QGh0AdN6YP8XHkYscOBNCAli6Bl/SFlrA2wsUYng
         im9XuXQUaK24fAh8FHccIWdrlHOPiayNCQW1+PZag09IV6m6+quGFpXB5XWs0vpTSw
         KxRt4XwxdLXXw==
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
index 5fd1240..9ae3ce7 100644
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

