Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6D8319C8F3
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2020 20:43:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389065AbgDBSnE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Apr 2020 14:43:04 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:54775 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388540AbgDBSnE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 Apr 2020 14:43:04 -0400
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MLiXQ-1jbkDG13se-00HgBH for <linux-media@vger.kernel.org>; Thu, 02 Apr
 2020 20:43:02 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
        by mail.cetitecgmbh.com (Postfix) with ESMTP id 08EBD650A8B
        for <linux-media@vger.kernel.org>; Thu,  2 Apr 2020 18:43:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
        by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id lYWiZEtjGgQM for <linux-media@vger.kernel.org>;
        Thu,  2 Apr 2020 20:43:01 +0200 (CEST)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
        by mail.cetitecgmbh.com (Postfix) with ESMTPS id A09A464D593
        for <linux-media@vger.kernel.org>; Thu,  2 Apr 2020 20:43:01 +0200 (CEST)
Received: from pflmari.corp.cetitec.com (10.8.5.12) by
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Thu, 2 Apr 2020 20:43:01 +0200
Received: by pflmari.corp.cetitec.com (Postfix, from userid 1000)
        id 768EB804FE; Thu,  2 Apr 2020 20:34:03 +0200 (CEST)
Date:   Thu, 2 Apr 2020 20:34:03 +0200
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
Subject: [PATCH v5 2/9] media: adv748x: include everything adv748x.h needs
 into the file
Message-ID: <046f909122e03286faf0a8916f30d56259656e14.1585852001.git.alexander.riesen@cetitec.com>
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
References: <cover.1585852001.git.alexander.riesen@cetitec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1585852001.git.alexander.riesen@cetitec.com>
X-Originating-IP: [10.8.5.12]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536A6C7266
X-Provags-ID: V03:K1:mSnZgHVTaF2b5+9lcEMcZ/7WRWNtYmf6y96KI5NeftGFEMzOPtp
 vL9+3FV5W61+DHMuxnHHuDgZBdxuWzcJOvvTye+XJxwwN734UdgRmRUEPiCYADbfbyo+DAA
 7fxcHE4AZiANEce9JUiUcmMoRdrHlyVrN8u2EhkPPOWTmEpVQETl+fRrZqvCmKGZMn5skii
 N0biqRL2YpScMO5ba7YkQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:J6nG+niFCQk=:ASFpZ3F+cRG+HcyvNR6ECv
 1VMNQZF89WHKPSsDuxR3No6Gy6kQ66NSJ0c5GGw1Ol7XLpENZ7sz9UhH3VidgoD9/16B349wv
 yThuMaINdqQBCtBot1rTiPnlYb75WlMPe2BCx2PBQxMBQwgVzsGb3yKXhCOfDLIdLUE4zvKzp
 sgbVjFbJkNuAaJZolfpJwMMID+XfnzH+Z5VhLckpA0YZ1supqaNP/FUX27yZBV1oR0oj0ekso
 vLwnDl4/ILeXCv6ThitNo8ptK4uScSt/kvedxg2BbKbHzzqpHvJKicqNWiZHhNAqv9m12pOYT
 WS60yuB/R3ruda+n81L5y1xSwWWcYx4ZAQuwiqDwwkFdVDAA6dpMB433vIxzLQYrw6OS1NnJo
 cxegobJlj5RGACIGY1L+gTD0Ap1OKQ76MlFE6aNelUOFw27mV2sv4aIowyww0Tkqu458H9sLz
 ukLcp7GK5HIWWu1kEJliobQ5S8jXN1PDakLVIgGlQ21NsatQ7Br1ks0pPFZhTg1vjc9tnngHS
 sjfL8KXtN8VJjObmRTJP4L2jHUuEpUBVo22vyV6c3XFxdlJS+zvYwMOErLMaI09/j5hbE0tM6
 xkmINbfWPGnnWcV+/xPn8CwlMhM27HSrLVZ/G1u7PgTc3yDluW7l/ni2O0PEaBQ9uTcX5/TJS
 fuz2kARX7fUGcIaHI1yClN6AyAQlpdFPfGyquNtRRw2YThJiSIhAsUgDG9MosDNWN0M7rn7F7
 RQYyO3468o+TePwreqTyMCzUkO93RqlUouLs6N6ImdEJj5NzV8Dgcv3J78Y6iLJ8PZOBA8Vku
 /NAzrdxEmWqPTm+wBpynmXn1RGmw9GH3OBtokP7j9CR8ZUqnCAijMRFsKk3xfPjHwfWr7Qh
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


