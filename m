Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAD38258227
	for <lists+linux-media@lfdr.de>; Mon, 31 Aug 2020 21:53:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729808AbgHaTwu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 Aug 2020 15:52:50 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:2968 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728671AbgHaTwt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 Aug 2020 15:52:49 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f4d54930000>; Mon, 31 Aug 2020 12:50:43 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 31 Aug 2020 12:52:49 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 31 Aug 2020 12:52:49 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 31 Aug
 2020 19:52:49 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 31 Aug 2020 19:52:49 +0000
Received: from skomatineni-linux.nvidia.com (Not Verified[10.2.173.243]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f4d55100006>; Mon, 31 Aug 2020 12:52:48 -0700
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <sakari.ailus@iki.fi>,
        <hverkuil@xs4all.nl>, <luca@lucaceresoli.net>,
        <leonl@leopardimaging.com>, <robh+dt@kernel.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 0/4] IMX274 fixes and power on and off implementation
Date:   Mon, 31 Aug 2020 12:52:34 -0700
Message-ID: <1598903558-9691-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1598903443; bh=ObH5yIt3OmMX+IKEdrYTYd8H5mBLzF2Tl1tY4rioIwM=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=oBX7S/ehfaOAhOMEVrpdth0Esw244gGLPDM9YzfajZiBSU3svu/ucE6yiaFt02QM+
         KPmsVeBpxy0dHIOFNXW8//o2pgr7RzKiF22N7Oy40jM/kXVvlJm/JpALt2fXTPbMI8
         DXek/OC2abKzdLfiOw8RO5FmgE/icYLIWsxp9LDYL+LejUvrjI79UPg6y8vvS528HP
         5uFKfYc4AIfyp2QinWBrSyT7UCiiKes8dI/lFH0r51BOJEqx2DQjyMukeqnhnUsmbC
         VSMf5raeLn0CAQkY6TCCDgr+JZ5Q+DUXo4hyQ3IwyFOwj3qgdjKBaJPBIPoOeuX2PI
         1wH3guxdJ2hMw==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series includes
- Fix for proper Y_OUT_SIZE register configuration.
- Power on/off sequence implementation through runtime PM.
- dt-binding doc update to move input clock and supplies as required
  properties.

Delta between patch versions:
[v4]:	Includes below v4 feedback
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

Sowjanya Komatineni (4):
  media: i2c: imx274: Fix Y_OUT_SIZE register setting
  dt-bindings: media: imx274: Use lower case for supply names
  dt-bindings: media: imx274: Move clock and supplies to required
    properties
  media: i2c: imx274: Add IMX274 power on and off sequence

 .../devicetree/bindings/media/i2c/imx274.txt       |  10 +-
 drivers/media/i2c/imx274.c                         | 153 ++++++++++++++++++++-
 2 files changed, 154 insertions(+), 9 deletions(-)

-- 
2.7.4

