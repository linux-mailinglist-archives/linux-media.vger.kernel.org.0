Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8CFA1EEC5C
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 22:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730142AbgFDUra (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 16:47:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:41016 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729923AbgFDUrJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 4 Jun 2020 16:47:09 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C96F8207ED;
        Thu,  4 Jun 2020 20:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591303628;
        bh=Log6SWQTxsYpVF33fzIXGDOjHxh7iIO6XU823Wot5zs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y4B81oxEoJDir5oj3zQwUjcub8lh6hDhZFb3WlJdDXCtAaGHHJpHojnxvOS6kWeNV
         rtGqbqkOZ/g9/wWExaQysPvRCb5Aocw7QRQF4RVI/mj+0pooX+X12Gl9OgatNCg0a1
         XpY+ZH/zF+MVByZFNLUToI/xxzpWPiRLmYBNOWwQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jgwlW-0004Al-Sd; Thu, 04 Jun 2020 22:47:06 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] media: atomisp: change clock source default for ISP2401
Date:   Thu,  4 Jun 2020 22:47:04 +0200
Message-Id: <37f290eeb7f0c26b93fe34223d45d1bbce3e8e0c.1591303518.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591303518.git.mchehab+huawei@kernel.org>
References: <cover.1591303518.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There's a notice there stating that the PLL is not reliable
for CHT. Yet, it tries to read it via the BIOS. Well,
this will fail (at least with the devices I checked the
DSDT tables). So, change the logic in a way that it will
change the default, depending on the ISP version.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/atomisp/pci/atomisp_gmin_platform.c  | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index cb02806274d1..a14326111b26 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -493,9 +493,23 @@ static struct gmin_subdev *gmin_subdev_add(struct v4l2_subdev *subdev)
 
 	gmin_subdevs[i].subdev = subdev;
 	gmin_subdevs[i].clock_num = gmin_get_var_int(dev, false, "CamClk", 0);
-	/*WA:CHT requires XTAL clock as PLL is not stable.*/
+	/*
+	 * FIXME:
+	 * 	WA:CHT requires XTAL clock as PLL is not stable.
+	 *
+	 * However, such data doesn't seem to be present at the _DSM
+	 * table under the GUID dc2f6c4f-045b-4f1d-97b9-882a6860a4be.
+	 * So, let's change the default according with the ISP version,
+	 * but allowing it to be overridden by BIOS or by DMI match tables.
+	 */
+	if (IS_ISP2401)
+		gmin_subdevs[i].clock_src = VLV2_CLK_XTAL_25_0MHz;
+	else
+		gmin_subdevs[i].clock_src = VLV2_CLK_PLL_19P2MHZ;
+
 	gmin_subdevs[i].clock_src = gmin_get_var_int(dev, false, "ClkSrc",
-				    VLV2_CLK_PLL_19P2MHZ);
+						     gmin_subdevs[i].clock_src);
+
 	gmin_subdevs[i].csi_port = gmin_get_var_int(dev, false, "CsiPort", 0);
 	gmin_subdevs[i].csi_lanes = gmin_get_var_int(dev, false, "CsiLanes", 1);
 
-- 
2.26.2

