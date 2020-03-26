Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66216193D2A
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 11:43:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727999AbgCZKn5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 06:43:57 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:55247 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727560AbgCZKn5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 06:43:57 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MqqLB-1jdbaM2s7t-00mrx1 for <linux-media@vger.kernel.org>; Thu, 26 Mar
 2020 11:43:55 +0100
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 79B9865034C
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2020 10:43:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id SQ6OirATGN7Y for <linux-media@vger.kernel.org>;
        Thu, 26 Mar 2020 11:43:55 +0100 (CET)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id 1CEA46502CB
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2020 11:43:55 +0100 (CET)
Received: from pflmari.corp.cetitec.com (10.8.5.79) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 26 Mar 2020 11:43:54 +0100
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 4A517804FE; Thu, 26 Mar 2020 11:34:59 +0100 (CET)
Date:   Thu, 26 Mar 2020 11:34:59 +0100
From:   Alex Riesen <alexander.riesen@cetitec.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>
Subject: [PATCH v4 2/9] media: adv748x: include everything adv748x.h needs
 into the file
Message-ID: <e37abb9c66571ad02a7d0c7903d1889d7d52ed46.1585218857.git.alexander.riesen@cetitec.com>
Mail-Followup-To: Alex Riesen <alexander.riesen@cetitec.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <cover.1585218857.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1585218857.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.79]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6D7C67
X-Provags-ID: V03:K1:yHXAca1ldufhKqEBn8jB3MCJVtbyp0dAd0F55R03P5NSEK3sxyd
 DJFZhBTFh85bHg/oEYkYFBdtAIIDHKnx6h+JLMYgF+eBeKYnJFLsf9Y21rCsyE2QufsCKQk
 i6JLCZQfJt0Xp9ojS7u+CBNER5k1G7o6uVyJ52q8ZxWH1lku00kFJTYmlYTneXxEPhrcAxO
 QyJwo6UUuWa2IGPaFjXZA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HB+NR3FILnE=://XRW9XLPQIoXqrV4khKOw
 +jtCh8glBrBWW1xBP4EMQxZdolqA8fG4ZNHAcg3DoVkxCzOMSGH3yG7vGj47CgfbPkyIH8r1r
 ADCktir/GEcnvde6zlrwsyNFLiZ6r1qVc7PrcF5f/Ru1ph+Deu1FJ9yK4H/hZ6mhvw9mltJjm
 HK2TiMfPc3CJxLszgIiJygCAcsQSzNGCyWhUxHgoCtue5e0ziwJyTP1X1Id6Zkxo4r6LAz4BP
 Am8tpls+DGgj9xkRDczHLtwO4ZoFptXdtAyRbQjq48re9tUtNId+dm37oZgSqUXYL2XX2qbEN
 vUFAzUnSrIhtfwBcI8Rsll82MkPhjbwodneyvzjqy/DXxxvfPdL4e7MFlFlPQB9xSh1Uhe3sI
 0CdF9I8XtVDBzWZsq77CuLEsuGN/jP1gRQwtUwcLku8RjPTLwg1hIepQpKbrXrSNBAAlLnIdJ
 UHrEiChZEnCideKJCjLCKt9sEki1YVR5MUTchTyEv8DnQNCwdX4fntaKVDcrZZ426jjZgvT5c
 ptvH2pZUOZaQ90hCqX/48+p/Wdm7OpLo2J5rkLAC5aDq0fgHKBIqDBiG3b8c3LcmSPUFBEXZK
 5akXaK2tL69CoskfYO+ggXfPlKKbW60h7qAzaIyQdZc4WVxtFXuj8Uu2TnbX68rGqaO68M+Mu
 hlZ2jG/jsmFWSMG/Vj60y3E3baliHctbKiEVKMtGyra6S47xReE4kUwkP7Mhpz3C9newHkEcI
 bzT+EbNwTUd7bYor5AWCoJkVD8ygktD8IHYhZw9vwjgZhqheD2oGMaaFsb/HD0i0k+63iHCm9
 9Eiu81z5gdeEiuk0R5dvp5GVb6xrDGkUeqBH1/L0XEAiMiIx5vHE/aC14EE3ruysR18FrQI
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To follow the established practice of not depending on others to
pull everything in. While at it, make sure it stays like this.

Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/adv748x/adv748x-afe.c  | 6 ++----
 drivers/media/i2c/adv748x/adv748x-core.c | 6 ++----
 drivers/media/i2c/adv748x/adv748x-csi2.c | 6 ++----
 drivers/media/i2c/adv748x/adv748x-hdmi.c | 6 ++----
 drivers/media/i2c/adv748x/adv748x.h      | 2 ++
 5 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/adv748x/adv748x-afe.c b/drivers/media/i2c/adv748x/adv748x-afe.c
index dbbb1e4d6363..5a25d1fbe25f 100644
--- a/drivers/media/i2c/adv748x/adv748x-afe.c
+++ b/drivers/media/i2c/adv748x/adv748x-afe.c
@@ -6,18 +6,16 @@
  * Copyright (C) 2017 Renesas Electronics Corp.
  */
 
+#include "adv748x.h"
+
 #include <linux/delay.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/v4l2-dv-timings.h>
 
-#include <media/v4l2-ctrls.h>
-#include <media/v4l2-device.h>
 #include <media/v4l2-dv-timings.h>
 #include <media/v4l2-ioctl.h>
 
-#include "adv748x.h"
-
 /* -----------------------------------------------------------------------------
  * SDP
  */
diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
index c3fb113cef62..5c59aad319d1 100644
--- a/drivers/media/i2c/adv748x/adv748x-core.c
+++ b/drivers/media/i2c/adv748x/adv748x-core.c
@@ -10,6 +10,8 @@
  *	Kieran Bingham <kieran.bingham@ideasonboard.com>
  */
 
+#include "adv748x.h"
+
 #include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/i2c.h>
@@ -20,14 +22,10 @@
 #include <linux/slab.h>
 #include <linux/v4l2-dv-timings.h>
 
-#include <media/v4l2-ctrls.h>
-#include <media/v4l2-device.h>
 #include <media/v4l2-dv-timings.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-ioctl.h>
 
-#include "adv748x.h"
-
 /* -----------------------------------------------------------------------------
  * Register manipulation
  */
diff --git a/drivers/media/i2c/adv748x/adv748x-csi2.c b/drivers/media/i2c/adv748x/adv748x-csi2.c
index c43ce5d78723..c00d4f347d95 100644
--- a/drivers/media/i2c/adv748x/adv748x-csi2.c
+++ b/drivers/media/i2c/adv748x/adv748x-csi2.c
@@ -5,15 +5,13 @@
  * Copyright (C) 2017 Renesas Electronics Corp.
  */
 
+#include "adv748x.h"
+
 #include <linux/module.h>
 #include <linux/mutex.h>
 
-#include <media/v4l2-ctrls.h>
-#include <media/v4l2-device.h>
 #include <media/v4l2-ioctl.h>
 
-#include "adv748x.h"
-
 static int adv748x_csi2_set_virtual_channel(struct adv748x_csi2 *tx,
 					    unsigned int vc)
 {
diff --git a/drivers/media/i2c/adv748x/adv748x-hdmi.c b/drivers/media/i2c/adv748x/adv748x-hdmi.c
index c557f8fdf11a..f598acec3b5c 100644
--- a/drivers/media/i2c/adv748x/adv748x-hdmi.c
+++ b/drivers/media/i2c/adv748x/adv748x-hdmi.c
@@ -5,18 +5,16 @@
  * Copyright (C) 2017 Renesas Electronics Corp.
  */
 
+#include "adv748x.h"
+
 #include <linux/module.h>
 #include <linux/mutex.h>
 
-#include <media/v4l2-ctrls.h>
-#include <media/v4l2-device.h>
 #include <media/v4l2-dv-timings.h>
 #include <media/v4l2-ioctl.h>
 
 #include <uapi/linux/v4l2-dv-timings.h>
 
-#include "adv748x.h"
-
 /* -----------------------------------------------------------------------------
  * HDMI and CP
  */
diff --git a/drivers/media/i2c/adv748x/adv748x.h b/drivers/media/i2c/adv748x/adv748x.h
index fccb388ce179..09aab4138c3f 100644
--- a/drivers/media/i2c/adv748x/adv748x.h
+++ b/drivers/media/i2c/adv748x/adv748x.h
@@ -19,6 +19,8 @@
  */
 
 #include <linux/i2c.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
 
 #ifndef _ADV748X_H_
 #define _ADV748X_H_
-- 
2.25.1.25.g9ecbe7eb18


