Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 382CD2F786
	for <lists+linux-media@lfdr.de>; Thu, 30 May 2019 08:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727379AbfE3Gpv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 May 2019 02:45:51 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:57267 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727296AbfE3Gpv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 May 2019 02:45:51 -0400
Received: from [IPv6:2001:983:e9a7:1:c843:3d28:cba4:8b6e] ([IPv6:2001:983:e9a7:1:c843:3d28:cba4:8b6e])
        by smtp-cloud7.xs4all.net with ESMTPA
        id WEouhL4s93qlsWEovhyNJH; Thu, 30 May 2019 08:45:49 +0200
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] dvb-usb/cxusb-analog.c: fix coccinelle warning, use ktime.h
Message-ID: <7cdb41ac-6c11-270b-8864-adafad423b9a@xs4all.nl>
Date:   Thu, 30 May 2019 08:45:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfOK2EN16f+FDSeoq1v5+S2/rwt1yesuTJbR3yZQnKT7dAiPrnrEjXnTcBLOwFqetAiy1sQEB4GbdNkQCX+ScGKQ+YkOET/laCnwFRffqZp1REcs/Wmay
 DuiGHHmc0NxvMgmJWMfXE6DPiOaY3on/GlZXVw5n6RvO/KjeF9+bhtojxocrdej2w41ws5rnhD1io16lzM8X+GPinhGBVFCTfX5jJT9acXCGhzZ4M0woVoE/
 cpPTDpnELIB25pMSDwTukv0/XL6rGbkFJU56C078V8xsTvm0t+4DnDwI7R22jM1o
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This patch fixes a coccinelle warning and includes ktime.h instead of
timekeeping.h. The first includes the latter, but the latter doesn't
exist before 3.17, causing problems for our compat build. It's easier
to just use ktime.h instead.

coccinelle warnings: (new ones prefixed by >>)

>> drivers/media/usb/dvb-usb/cxusb-analog.c:1498:41-42: WARNING: Use ARRAY_SIZE

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Reported-by: kbuild test robot <lkp@intel.com>
---
diff --git a/drivers/media/usb/dvb-usb/cxusb-analog.c b/drivers/media/usb/dvb-usb/cxusb-analog.c
index 9b42ca71c177..9b4f17ec63d3 100644
--- a/drivers/media/usb/dvb-usb/cxusb-analog.c
+++ b/drivers/media/usb/dvb-usb/cxusb-analog.c
@@ -25,7 +25,7 @@
 #include <linux/device.h>
 #include <linux/slab.h>
 #include <linux/string.h>
-#include <linux/timekeeping.h>
+#include <linux/ktime.h>
 #include <linux/vmalloc.h>
 #include <media/drv-intf/cx25840.h>
 #include <media/tuner.h>
@@ -1622,8 +1622,7 @@ int cxusb_medion_analog_init(struct dvb_usb_device *dvbdev)
 	/* TODO: setup audio samples insertion */

 	ret = v4l2_subdev_call(cxdev->cx25840, core, s_io_pin_config,
-			       sizeof(cxusub_medion_pin_config) /
-			       sizeof(cxusub_medion_pin_config[0]),
+			       ARRAY_SIZE(cxusub_medion_pin_config),
 			       cxusub_medion_pin_config);
 	if (ret != 0)
 		dev_warn(&dvbdev->udev->dev,
