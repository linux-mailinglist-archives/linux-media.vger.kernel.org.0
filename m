Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7CF217028C
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 16:32:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728186AbgBZPck (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 10:32:40 -0500
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:13958 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728073AbgBZPck (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 10:32:40 -0500
Received-SPF: Pass (esa3.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa3.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa3.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa3.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: /VLtVb4iueReMInxFE5R1/eknzhBhvdoVZwpcPg2tz8kcPQ8VNEdIEQ4MJcTPOSNwCIxpQ3yMT
 GL92AtvPqysbGwDO4MeO70xvEjAl5j+wA1MxtYc2G7EwhMFqpXxP6E9vtODOaT250pvChjQOX0
 +ezROPxuxxV77tWkMXXBsGLswax4DYnAdk90/H8KKbPCLncTAGC+ZC/WNICMFZzVNqD00cxxjc
 iodcSer59n0MwIJgo0xNLHifj/aMlR7o0/vaEmhXFMg3m8d42R44W9Q2SBQdIvx92Ba2EC1Ja+
 vgk=
X-IronPort-AV: E=Sophos;i="5.70,488,1574146800"; 
   d="scan'208";a="68060727"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Feb 2020 08:32:39 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 26 Feb 2020 08:32:51 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 26 Feb 2020 08:32:37 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <hverkuil@xs4all.nl>,
        <laurent.pinchart@ideasonboard.com>,
        <linux-kernel@vger.kernel.org>, <sakari.ailus@iki.fi>
CC:     Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH v2] media: v4l2-core: fix entity initialization in device_register_subdev
Date:   Wed, 26 Feb 2020 17:28:16 +0200
Message-ID: <20200226152816.31557-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The entity variable was being initialized in the wrong place, before the
parameters have been checked.
To solve this, completely removed the entity variable and replaced it
with the initialization value : &sd->entity.
This will avoid dereferencing 'sd' pointer before it's being checked if
it's NULL.

Fixes: 61f5db549dde ("[media] v4l: Make v4l2_subdev inherit from media_entity")
Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
Changes in v2:
 - replaced entity with &sd->entity completely as suggested

 drivers/media/v4l2-core/v4l2-device.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-core/v4l2-device.c
index 63d6b147b21e..fa9c806a8ccd 100644
--- a/drivers/media/v4l2-core/v4l2-device.c
+++ b/drivers/media/v4l2-core/v4l2-device.c
@@ -111,9 +111,6 @@ EXPORT_SYMBOL_GPL(v4l2_device_unregister);
 int v4l2_device_register_subdev(struct v4l2_device *v4l2_dev,
 				struct v4l2_subdev *sd)
 {
-#if defined(CONFIG_MEDIA_CONTROLLER)
-	struct media_entity *entity = &sd->entity;
-#endif
 	int err;
 
 	/* Check for valid input */
@@ -143,7 +140,7 @@ int v4l2_device_register_subdev(struct v4l2_device *v4l2_dev,
 #if defined(CONFIG_MEDIA_CONTROLLER)
 	/* Register the entity. */
 	if (v4l2_dev->mdev) {
-		err = media_device_register_entity(v4l2_dev->mdev, entity);
+		err = media_device_register_entity(v4l2_dev->mdev, &sd->entity);
 		if (err < 0)
 			goto error_module;
 	}
@@ -163,7 +160,7 @@ int v4l2_device_register_subdev(struct v4l2_device *v4l2_dev,
 
 error_unregister:
 #if defined(CONFIG_MEDIA_CONTROLLER)
-	media_device_unregister_entity(entity);
+	media_device_unregister_entity(&sd->entity);
 #endif
 error_module:
 	if (!sd->owner_v4l2_dev)
-- 
2.20.1

