Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D831927FC71
	for <lists+linux-media@lfdr.de>; Thu,  1 Oct 2020 11:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731818AbgJAJ2W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Oct 2020 05:28:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:54636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725921AbgJAJ2T (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 1 Oct 2020 05:28:19 -0400
Received: from mail.kernel.org (ip5f5ad5d2.dynamic.kabel-deutschland.de [95.90.213.210])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A8F9821707;
        Thu,  1 Oct 2020 09:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601544498;
        bh=bRxCOT0GHdpfEP+hLDzCHh6ExwWYxA+B8cHCx7grTKU=;
        h=From:To:Cc:Subject:Date:From;
        b=n3LLptoC05AgdQddGfNE50eXUrN5MxYeojzcuiUzD6/qugKGw2n/lzmGkLFgY6Y+l
         FKHlShxYF+X6rliQ7qp6rAngJfAxmftkMBOvEOoGPFnagK6T+LJTJYOe89Qk7bI1Y9
         OsvGDEsyAwGeuAWxsMRH+Fg7r0FTH1+glGBGaJR0=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kNusp-005Xag-QO; Thu, 01 Oct 2020 11:28:15 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Corentin Labbe <clabbe@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        mjpeg-users@lists.sourceforge.net
Subject: [PATCH 1/3] media: zoran: use upper case for card types
Date:   Thu,  1 Oct 2020 11:28:13 +0200
Message-Id: <21fd8f12edb27d269eefdbea172aa3a80e2aa6ce.1601544491.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Don't mix case there: let's just use uppercase, as this is
the common pattern for such define-like enums.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/zoran/zoran.h      |  8 ++++----
 drivers/staging/media/zoran/zoran_card.c | 20 ++++++++++----------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran.h b/drivers/staging/media/zoran/zoran.h
index 372fadfd9a01..7217a64fe59b 100644
--- a/drivers/staging/media/zoran/zoran.h
+++ b/drivers/staging/media/zoran/zoran.h
@@ -75,11 +75,11 @@ enum card_type {
 	UNKNOWN = -1,
 
 	/* Pinnacle/Miro */
-	DC10_old,		/* DC30 like */
-	DC10_new,		/* DC10plus like */
-	DC10plus,
+	DC10_OLD,		/* DC30 like */
+	DC10_NEW,		/* DC10_PLUS like */
+	DC10_PLUS,
 	DC30,
-	DC30plus,
+	DC30_PLUS,
 
 	/* Linux Media Labs */
 	LML33,
diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index 84a5d52517cd..8d56d039a686 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -104,8 +104,8 @@ MODULE_VERSION(ZORAN_VERSION);
 	.subvendor = (subven), .subdevice = (subdev), .driver_data = (data) }
 
 static const struct pci_device_id zr36067_pci_tbl[] = {
-	ZR_DEVICE(PCI_VENDOR_ID_MIRO, PCI_DEVICE_ID_MIRO_DC10PLUS, DC10plus),
-	ZR_DEVICE(PCI_VENDOR_ID_MIRO, PCI_DEVICE_ID_MIRO_DC30PLUS, DC30plus),
+	ZR_DEVICE(PCI_VENDOR_ID_MIRO, PCI_DEVICE_ID_MIRO_DC10PLUS, DC10_PLUS),
+	ZR_DEVICE(PCI_VENDOR_ID_MIRO, PCI_DEVICE_ID_MIRO_DC30PLUS, DC30_PLUS),
 	ZR_DEVICE(PCI_VENDOR_ID_ELECTRONICDESIGNGMBH, PCI_DEVICE_ID_LML_33R10, LML33R10),
 	ZR_DEVICE(PCI_VENDOR_ID_IOMEGA, PCI_DEVICE_ID_IOMEGA_BUZ, BUZ),
 	ZR_DEVICE(PCI_ANY_ID, PCI_ANY_ID, NUM_CARDS),
@@ -311,7 +311,7 @@ static const unsigned short bt866_addrs[] = { 0x44, I2C_CLIENT_END };
 
 static struct card_info zoran_cards[NUM_CARDS] = {
 	{
-		.type = DC10_old,
+		.type = DC10_OLD,
 		.name = "DC10(old)",
 		.i2c_decoder = "vpx3220a",
 		.addrs_decoder = vpx3220_addrs,
@@ -340,7 +340,7 @@ static struct card_info zoran_cards[NUM_CARDS] = {
 		.input_mux = 0,
 		.init = &dc10_init,
 	}, {
-		.type = DC10_new,
+		.type = DC10_NEW,
 		.name = "DC10(new)",
 		.i2c_decoder = "saa7110",
 		.addrs_decoder = saa7110_addrs,
@@ -369,8 +369,8 @@ static struct card_info zoran_cards[NUM_CARDS] = {
 		.input_mux = 0,
 		.init = &dc10plus_init,
 	}, {
-		.type = DC10plus,
-		.name = "DC10plus",
+		.type = DC10_PLUS,
+		.name = "DC10_PLUS",
 		.i2c_decoder = "saa7110",
 		.addrs_decoder = saa7110_addrs,
 		.i2c_encoder = "adv7175",
@@ -430,8 +430,8 @@ static struct card_info zoran_cards[NUM_CARDS] = {
 		.input_mux = 0,
 		.init = &dc10_init,
 	}, {
-		.type = DC30plus,
-		.name = "DC30plus",
+		.type = DC30_PLUS,
+		.name = "DC30_PLUS",
 		.i2c_decoder = "vpx3220a",
 		.addrs_decoder = vpx3220_addrs,
 		.i2c_encoder = "adv7175",
@@ -694,7 +694,7 @@ int zoran_check_jpg_settings(struct zoran *zr,
 		break;
 	case 4:
 
-		if (zr->card.type == DC10_new) {
+		if (zr->card.type == DC10_NEW) {
 			pci_dbg(zr->pci_dev, "%s - HDec by 4 is not supported on the DC10\n", __func__);
 			err0++;
 			break;
@@ -715,7 +715,7 @@ int zoran_check_jpg_settings(struct zoran *zr,
 		/* We have to check the data the user has set */
 
 		if (settings->HorDcm != 1 && settings->HorDcm != 2 &&
-		    (zr->card.type == DC10_new || settings->HorDcm != 4)) {
+		    (zr->card.type == DC10_NEW || settings->HorDcm != 4)) {
 			settings->HorDcm = clamp(settings->HorDcm, 1, 2);
 			err0++;
 		}
-- 
2.26.2

