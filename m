Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46BE21E8EA6
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 08:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728912AbgE3G6a (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 May 2020 02:58:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:44972 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728864AbgE3G4H (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 May 2020 02:56:07 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6955E221F1;
        Sat, 30 May 2020 06:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590821764;
        bh=scAvoLDDGn5cq3ZLD2TTb4DoukfwOFpBqOOQshZmdXg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gtUjHPF4pvuZQE6KtrK5iJ+dYC5RdKOpOKuQABgncK4ZIvZB6erGclHUB9G7uwqyx
         W1EK+Xnve/unhrNMX1dDtbQpBYkQemW3gq87TjszuOU5ZKZ4jBhumXseOQIs5wkyFE
         qFkh761p5cNJoHoN7N5UDY8MsKXhem1rWb/jDRFM=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jevPW-001hqw-A6; Sat, 30 May 2020 08:56:02 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 36/41] media: atomisp: print firmware data during load
Date:   Sat, 30 May 2020 08:55:53 +0200
Message-Id: <0cad0cb793ea9946043b8a02112673165e24ec72.1590821410.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1590821410.git.mchehab+huawei@kernel.org>
References: <cover.1590821410.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While there's a way to list the firmware binaries in runtime,
it is worth to also print it during firmware load.

One advantage is that this code also introduces additional
checks with regards to invalid firmware types, which can be
useful to identify problems.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/atomisp/pci/sh_css_firmware.c       | 48 ++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index 63415356c36d..7cd27707a35f 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -206,6 +206,20 @@ sh_css_check_firmware_version(struct device *dev, const char *fw_data)
 	return 0;
 }
 
+static const char *fw_type_name[] = {
+	[ia_css_sp_firmware]		= "SP",
+	[ia_css_isp_firmware]		= "ISP",
+	[ia_css_bootloader_firmware]	= "BootLoader",
+	[ia_css_acc_firmware]		= "accel",
+};
+
+static const char *fw_acc_type_name[] = {
+	[IA_CSS_ACC_NONE] = 		"Normal",
+	[IA_CSS_ACC_OUTPUT] = 		"Accel for output",
+	[IA_CSS_ACC_VIEWFINDER] = 	"Accel for viewfinder",
+	[IA_CSS_ACC_STANDALONE] = 	"Stand-alone accel",
+};
+
 int
 sh_css_load_firmware(struct device *dev, const char *fw_data,
 		     unsigned int fw_size) {
@@ -276,13 +290,45 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 		if (bi->blob.offset + bi->blob.size > fw_size)
 			return -EINVAL;
 
+		switch (bd.header.type) {
+		case ia_css_isp_firmware:
+			if (bd.header.info.isp.type > IA_CSS_ACC_STANDALONE) {
+				dev_err(dev, "binary #%2d: invalid SP type\n",
+					i);
+				return -EINVAL;
+			}
+
+			dev_dbg(dev,
+				"binary #%-2d type %s (%s), binary id is %2d: %s\n",
+				i,
+				fw_type_name[bd.header.type],
+				fw_acc_type_name[bd.header.info.isp.type],
+				bd.header.info.isp.sp.id,
+				bd.name);
+			break;
+		case ia_css_sp_firmware:
+		case ia_css_bootloader_firmware:
+		case ia_css_acc_firmware:
+			dev_dbg(dev,
+				"binary #%-2d type %s: %s\n",
+				i, fw_type_name[bd.header.type],
+				bd.name);
+		default:
+			if (bd.header.info.isp.type > IA_CSS_ACC_STANDALONE) {
+				dev_err(dev,
+					"binary #%2d: invalid firmware type\n",
+					i);
+				return -EINVAL;
+			}
+			break;
+		}
+
 		if (bi->type == ia_css_sp_firmware) {
 			if (i != SP_FIRMWARE)
 				return -EINVAL;
 			err = setup_binary(bi, fw_data, &sh_css_sp_fw, i);
 			if (err)
 				return err;
-			dev_dbg(dev, "firmware #%d (SP), name %s\n", i, bd.name);
 
 		} else {
 			/* All subsequent binaries (including bootloaders) (i>NUM_OF_SPS) are ISP firmware */
-- 
2.26.2

