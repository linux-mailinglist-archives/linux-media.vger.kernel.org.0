Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CDCC618FC00
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2020 18:53:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727795AbgCWRwn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Mar 2020 13:52:43 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:17087 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727717AbgCWRwm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Mar 2020 13:52:42 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e78f7100001>; Mon, 23 Mar 2020 10:51:12 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 23 Mar 2020 10:52:42 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 23 Mar 2020 10:52:42 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 23 Mar
 2020 17:52:41 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 23 Mar 2020 17:52:41 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.160.78]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5e78f7690002>; Mon, 23 Mar 2020 10:52:41 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <frankc@nvidia.com>, <hverkuil@xs4all.nl>,
        <helen.koike@collabora.com>
CC:     <digetx@gmail.com>, <sboyd@kernel.org>,
        <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v5 7/9] MAINTAINERS: Add Tegra Video driver section
Date:   Mon, 23 Mar 2020 10:52:33 -0700
Message-ID: <1584985955-19101-8-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
References: <1584985955-19101-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1584985872; bh=KcPKKJH8Spc1bfTQ/3ZL8qaDYWEcMZQqiVlx0YuGo4g=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=LVo7D+lrjIpt+c2sVReZ1YqLEbcCHF8S/OebVnpH7JU9xaK4Zfa86j30qt8flvB5T
         v28sD8369H8i7bUaNPvDqaTVnpQVE9ugG8xfU77VoAReLfkDpBVhc8iHHuadMKECsh
         DfKj3Z31Cci/FZLVv3/gWBhpBwte7F5j90oKpsGaBRIfC048fz5vrBd37e+fLySq9q
         tkfAQkKCiiZ9vOU2Hh7b2pPMWJSvX8vuAB1aDkDOUAla1vo34otzmOFVPhbA3hE8m3
         GIpHLClvgwSSkwBzdxCbIDkmz7jcOIxWa0Uyss8H26u8GSO18rOUFd3lkMUfPJVvm8
         KcRd8UIwSz2yA==
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
index 32a95d1..7af8974 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16584,6 +16584,16 @@ M:	Laxman Dewangan <ldewangan@nvidia.com>
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

