Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7778C1AE2E3
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2020 18:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727805AbgDQQ7B (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 12:59:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:46032 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726694AbgDQQ7A (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 12:59:00 -0400
Received: from mail.kernel.org (ip5f5ad4d8.dynamic.kabel-deutschland.de [95.90.212.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B82D32223D;
        Fri, 17 Apr 2020 16:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587142740;
        bh=VcB9xbzv+uBAo7c79L0MV66hoASXpQZqOjpsNKV3hgY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eQoRLF4FHR5WuIyyU5aQWPEbDRffMVqzWgbJvadr/Cl+Ls5MlG4ybShZHDBbupJ/c
         AbZtILkarQtgLCZd7l1T3wssd7DB0tzGGgtJW3ARoLxNmLSU1jGRImLRMom30fDfM6
         TuXhs2ZXz6AzXBlSQCmI4if729ozOpSy5GWWkspg=
Received: from mchehab by mail.kernel.org with local (Exim 4.92.3)
        (envelope-from <mchehab@kernel.org>)
        id 1jPUKP-007wL8-0a; Fri, 17 Apr 2020 18:58:57 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Antti Palosaari <crope@iki.fi>
Subject: [PATCH 01/15] media: dvb-usb-ids.h: fix an USB PID name
Date:   Fri, 17 Apr 2020 18:58:42 +0200
Message-Id: <5d4d41abb8f85819f0004ff2786d955fc4a023b7.1587142382.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <cover.1587142382.git.mchehab+huawei@kernel.org>
References: <cover.1587142382.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The USB_PID_ALINK_DTU is a Product ID, not a vendor ID.

Fix that.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/usb/dvb-usb-v2/gl861.c | 2 +-
 include/media/dvb-usb-ids.h          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/gl861.c b/drivers/media/usb/dvb-usb-v2/gl861.c
index 42c3b8af0774..b7ca236174f3 100644
--- a/drivers/media/usb/dvb-usb-v2/gl861.c
+++ b/drivers/media/usb/dvb-usb-v2/gl861.c
@@ -550,7 +550,7 @@ static struct dvb_usb_device_properties friio_props = {
 static const struct usb_device_id gl861_id_table[] = {
 	{ DVB_USB_DEVICE(USB_VID_MSI, USB_PID_MSI_MEGASKY580_55801,
 		&gl861_props, "MSI Mega Sky 55801 DVB-T USB2.0", NULL) },
-	{ DVB_USB_DEVICE(USB_VID_ALINK, USB_VID_ALINK_DTU,
+	{ DVB_USB_DEVICE(USB_VID_ALINK, USB_PID_ALINK_DTU,
 		&gl861_props, "A-LINK DTU DVB-T USB2.0", NULL) },
 	{ DVB_USB_DEVICE(USB_VID_774, USB_PID_FRIIO_WHITE,
 		&friio_props, "774 Friio White ISDB-T USB2.0", NULL) },
diff --git a/include/media/dvb-usb-ids.h b/include/media/dvb-usb-ids.h
index 800d473b03c4..41f0bf122f53 100644
--- a/include/media/dvb-usb-ids.h
+++ b/include/media/dvb-usb-ids.h
@@ -96,7 +96,7 @@
 #define USB_PID_AFATECH_AF9035_9035			0x9035
 #define USB_PID_TREKSTOR_DVBT				0x901b
 #define USB_PID_TREKSTOR_TERRES_2_0			0xC803
-#define USB_VID_ALINK_DTU				0xf170
+#define USB_PID_ALINK_DTU				0xf170
 #define USB_PID_ANSONIC_DVBT_USB			0x6000
 #define USB_PID_ANYSEE					0x861f
 #define USB_PID_AZUREWAVE_AD_TU700			0x3237
-- 
2.25.2

