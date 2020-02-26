Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13F9516FEBE
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 13:16:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727205AbgBZMQq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 07:16:46 -0500
Received: from esa5.microchip.iphmx.com ([216.71.150.166]:64434 "EHLO
        esa5.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726334AbgBZMQp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 07:16:45 -0500
Received-SPF: Pass (esa5.microchip.iphmx.com: domain of
  Eugen.Hristev@microchip.com designates 198.175.253.82 as
  permitted sender) identity=mailfrom;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="Eugen.Hristev@microchip.com";
  x-conformance=spf_only; x-record-type="v=spf1";
  x-record-text="v=spf1 mx a:ushub1.microchip.com
  a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
  include:servers.mcsv.net include:mktomail.com
  include:spf.protection.outlook.com ~all"
Received-SPF: None (esa5.microchip.iphmx.com: no sender
  authenticity information available from domain of
  postmaster@email.microchip.com) identity=helo;
  client-ip=198.175.253.82; receiver=esa5.microchip.iphmx.com;
  envelope-from="Eugen.Hristev@microchip.com";
  x-sender="postmaster@email.microchip.com";
  x-conformance=spf_only
Authentication-Results: esa5.microchip.iphmx.com; spf=Pass smtp.mailfrom=Eugen.Hristev@microchip.com; spf=None smtp.helo=postmaster@email.microchip.com; dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: WLyfkTDgGneTpST693ZioNpeej+UlfBbge9U50URHNUKwyAERzwLnyW7rHR6LpQSz78F0vYgiQ
 Djd36NLBtvVv9Tl+wxBfxq0GwSfeHHwtznV/bi51vF/3u1qLrGoRj21DkKRqO2neo9ueJT99Hb
 nWlCbbmDHRphMJJ6VBOY5DhmiE7No6yDI2oCjbcLlATz1maJzu6xSeN21PZC8FD56yDnTtD7j2
 HFkeYzESvJJiDdGBSc1Kex8wVAN//A7QEqft3NiVOseqBIy0HdBWcWJEo+zrEd8UwLqbef4Af8
 es8=
X-IronPort-AV: E=Sophos;i="5.70,488,1574146800"; 
   d="scan'208";a="66801767"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Feb 2020 05:16:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 26 Feb 2020 05:16:56 -0700
Received: from ROB-ULT-M18282.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.1713.5 via Frontend Transport; Wed, 26 Feb 2020 05:16:42 -0700
From:   Eugen Hristev <eugen.hristev@microchip.com>
To:     <linux-media@vger.kernel.org>, <hverkuil@xs4all.nl>,
        <laurent.pinchart@ideasonboard.com>, <linux-kernel@vger.kernel.org>
CC:     Eugen Hristev <eugen.hristev@microchip.com>
Subject: [PATCH] media: v4l2-core: fix entity initialization in device_register_subdev
Date:   Wed, 26 Feb 2020 14:15:45 +0200
Message-ID: <20200226121545.19880-1-eugen.hristev@microchip.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The check for parameters is done below in the function.
Initialize the entity variable properly, after the parameters
have been checked.

Fixes: 61f5db549dde ("[media] v4l: Make v4l2_subdev inherit from media_entity")
Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
---
 drivers/media/v4l2-core/v4l2-device.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-device.c b/drivers/media/v4l2-core/v4l2-device.c
index 63d6b147b21e..6e33132ebb19 100644
--- a/drivers/media/v4l2-core/v4l2-device.c
+++ b/drivers/media/v4l2-core/v4l2-device.c
@@ -112,7 +112,7 @@ int v4l2_device_register_subdev(struct v4l2_device *v4l2_dev,
 				struct v4l2_subdev *sd)
 {
 #if defined(CONFIG_MEDIA_CONTROLLER)
-	struct media_entity *entity = &sd->entity;
+	struct media_entity *entity;
 #endif
 	int err;
 
@@ -141,6 +141,7 @@ int v4l2_device_register_subdev(struct v4l2_device *v4l2_dev,
 		goto error_module;
 
 #if defined(CONFIG_MEDIA_CONTROLLER)
+	entity = &sd->entity;
 	/* Register the entity. */
 	if (v4l2_dev->mdev) {
 		err = media_device_register_entity(v4l2_dev->mdev, entity);
-- 
2.20.1

