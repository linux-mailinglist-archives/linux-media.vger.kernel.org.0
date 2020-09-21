Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80780273508
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 23:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbgIUVjr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 17:39:47 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:10722 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbgIUVjr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 17:39:47 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f691d750000>; Mon, 21 Sep 2020 14:39:01 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 21 Sep
 2020 21:39:46 +0000
Received: from skomatineni-linux.nvidia.com (172.20.13.39) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server id
 15.0.1473.3 via Frontend Transport; Mon, 21 Sep 2020 21:39:46 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <sakari.ailus@iki.fi>,
        <hverkuil@xs4all.nl>, <jacopo+renesas@jmondi.org>,
        <luca@lucaceresoli.net>, <leonl@leopardimaging.com>,
        <robh+dt@kernel.org>, <lgirdwood@gmail.com>, <broonie@kernel.org>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 0/3] IMX274 fixes and power on and off implementation
Date:   Mon, 21 Sep 2020 14:39:36 -0700
Message-ID: <1600724379-7324-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1600724341; bh=3ZrsgUrCYqNpkJgRT8cKF5nNh5zlSJzd4kSDO9zrOBg=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:X-NVConfidentiality:
         MIME-Version:Content-Type;
        b=r3R+jRS2OoLgQWNqm328WHTybAtl3G4hMgNKJeaJdeZaOM5nd4FiPmm4HmDvwVRg2
         WIOwBiE1gAjgmd0fnNrP61b7eaIqA5MPDqvOkJACH1pPwQTD3oBjSoY4VTj+SnIKPq
         UmfISTWCdg87mZP6pUP811V9Tfvbt5stW9I9cg8srvyBjq2k7t+4GIzLL9/Udz2DZg
         fOWWNkdNebtAJZwhm3Hbi6+lSncrccKgLAVVGtQKoB1hSgOjTvLvyBN20zq5CbjgHF
         O8G4TLA094q6lnxKy78j0dei0ffigrwf3TNplIf10aXP38uNC2+vY0ErC8/Qh8r3fK
         VJtP/ah93O4jA==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch series includes
- Fix for proper Y_OUT_SIZE register configuration.
- Remove sensor i2c register writes to stop stream during remove.
- Power on/off sequence implementation through runtime PM.

Delta between patch versions:
[v6]:	Includes below v5 feedback
	- Added separate small patch to remove i2c writes to stop sensor
	  during remove.
	- Removed dt-binding patch from this series as they are posted by
	  Jacob.
	  https://www.spinics.net/lists/linux-renesas-soc/msg52831.html
	- Uses udelay for 2uS delay after regulators are on before
	  releasing reset.
	- Moved v4l2_ctrl_handler setup to do during start streaming to
	  configure user controls when sensor power is on during streaming.
	- Other minor changes based on v5 feedback.

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
  media: i2c: imx274: Remove stop stream i2c writes during remove
  media: i2c: imx274: Add IMX274 power on and off sequence

 drivers/media/i2c/imx274.c | 187 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 134 insertions(+), 53 deletions(-)

-- 
2.7.4

