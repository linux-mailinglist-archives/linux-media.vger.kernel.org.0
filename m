Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B711A31746
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2019 00:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726776AbfEaWiJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 18:38:09 -0400
Received: from vps-vb.mhejs.net ([37.28.154.113]:50622 "EHLO vps-vb.mhejs.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726538AbfEaWiJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 18:38:09 -0400
Received: from MUA
        by vps-vb.mhejs.net with esmtps (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <mail@maciej.szmigiero.name>)
        id 1hWq9x-000715-Tn; Sat, 01 Jun 2019 00:38:01 +0200
From:   "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
To:     Michael Krufky <mkrufky@linuxtv.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        kbuild test robot <lkp@intel.com>
Subject: [PATCH] media: cxusb-analog: Use ARRAY_SIZE for cxusub_medion_pin_config
Date:   Sat,  1 Jun 2019 00:37:56 +0200
Message-Id: <20190531223756.1305617-1-mail@maciej.szmigiero.name>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use ARRAY_SIZE for computing element count of cxusub_medion_pin_config
array as suggested by the kbuild test robot.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
---
 drivers/media/usb/dvb-usb/cxusb-analog.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/cxusb-analog.c b/drivers/media/usb/dvb-usb/cxusb-analog.c
index 9b42ca71c177..51d3cba32b60 100644
--- a/drivers/media/usb/dvb-usb/cxusb-analog.c
+++ b/drivers/media/usb/dvb-usb/cxusb-analog.c
@@ -1622,8 +1622,7 @@ int cxusb_medion_analog_init(struct dvb_usb_device *dvbdev)
 	/* TODO: setup audio samples insertion */
 
 	ret = v4l2_subdev_call(cxdev->cx25840, core, s_io_pin_config,
-			       sizeof(cxusub_medion_pin_config) /
-			       sizeof(cxusub_medion_pin_config[0]),
+			       ARRAY_SIZE(cxusub_medion_pin_config),
 			       cxusub_medion_pin_config);
 	if (ret != 0)
 		dev_warn(&dvbdev->udev->dev,
