Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 118EA25A2DD
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 04:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726247AbgIBCFJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Sep 2020 22:05:09 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:12457 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726122AbgIBCFJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Sep 2020 22:05:09 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f4efd550001>; Tue, 01 Sep 2020 19:03:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 01 Sep 2020 19:05:09 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 01 Sep 2020 19:05:09 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 2 Sep
 2020 02:05:08 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 2 Sep 2020 02:05:09 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.173.243]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f4efdd40000>; Tue, 01 Sep 2020 19:05:08 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <sakari.ailus@iki.fi>,
        <hverkuil@xs4all.nl>, <jacopo+renesas@jmondi.org>,
        <luca@lucaceresoli.net>, <leonl@leopardimaging.com>,
        <robh+dt@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 0/3] IMX274 fixes and power on and off implementation
Date:   Tue, 1 Sep 2020 19:04:35 -0700
Message-ID: <1599012278-10203-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1599012182; bh=eBg3kbIO56z3l1WV2bga7E8R/WwpmJY7LQd2ogIpF9g=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=Ows7GlDpU5h803N5225cvoEvM0M3cPr4nH3OSv/2DVTFwQLQUsIEg6aLNQGOhCqmD
         X5SbnzumQqgNBKM+2RoUHtqzas7NUDQYETCZnki90KS7/sfb6IgsizwvWSjnxg3qwa
         A6lycw+H4thSxY2vH9cBYPQF+swfdwyX9s0XQCmow4rU+p1lMcNANdpFArELsGQ70R
         ZkIHwQfbP0su74fwMXqZ7Xg6CciQIYw40kPYRxnkLSEs+sRpVpdm0+VGSZa8Lvt5Xm
         prjwknXU5K//cbev30IZIdsvJDmZJ8uv6Rit92++Lbs+Va4KOsPA1PGL8sUW+swCav
         GUOw72MIk8hTg==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series includes
- Fix for proper Y_OUT_SIZE register configuration.
- Power on/off sequence implementation through runtime PM.
- dt-binding doc to add optional input clock and supplies

Delta between patch versions:
[v5]:	Includes below v4 feedback
	- dt-bindings patch to add optional clock and supplies and
	  rebased on below json-schema patch.
	  https://patchwork.kernel.org/patch/11732875/
	- Other minor v4 feedbacks.

[v4]:	Includes below v3 feedback
	- Implemented power on/off through Runtime PM.
	- Use regulator bulk APIs.
	- Use lower case for supply names.

[v3]:	Includes below v2 feedback
	- Removed explicit clk_set_rate from driver as default external
	  input clock rate can be configured through DT.

[v2]:	Includes below changes based on v1 feedback
	- External input clock name changed from xclk to inck.
	- implementation change for get regulators to store all in array.
	- To keep in reset low prior to regulators power on.

Sowjanya Komatineni (3):
  media: i2c: imx274: Fix Y_OUT_SIZE register setting
  dt-bindings: media: imx274: Add optional input clock and supplies
  media: i2c: imx274: Add IMX274 power on and off sequence

 .../devicetree/bindings/media/i2c/sony,imx274.yaml |  21 ++++
 drivers/media/i2c/imx274.c                         | 136 ++++++++++++++++++++-
 2 files changed, 153 insertions(+), 4 deletions(-)

-- 
2.7.4

