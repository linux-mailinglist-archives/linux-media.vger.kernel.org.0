Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DFAC27D056
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 15:59:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731493AbgI2N7h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 09:59:37 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:47096 "EHLO
        mail2-relais-roc.national.inria.fr" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730843AbgI2N5w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 09:57:52 -0400
X-IronPort-AV: E=Sophos;i="5.77,318,1596492000"; 
   d="scan'208";a="470079952"
Received: from palace.lip6.fr ([132.227.105.202])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/AES256-SHA256; 29 Sep 2020 15:57:41 +0200
From:   Julia Lawall <Julia.Lawall@inria.fr>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     =?UTF-8?q?Valdis=20Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
        Joe Perches <joe@perches.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        kernel-janitors@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 06/20] media: gspca: ov534-ov772x: use semicolons rather than commas to separate statements
Date:   Tue, 29 Sep 2020 15:14:29 +0200
Message-Id: <1601385283-26144-7-git-send-email-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
References: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace commas with semicolons.  Commas introduce unnecessary
variability in the code structure and are hard to see.  What is done
is essentially described by the following Coccinelle semantic patch
(http://coccinelle.lip6.fr/):

// <smpl>
@@ expression e1,e2; @@
e1
-,
+;
e2
... when any
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/media/usb/gspca/ov534.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/usb/gspca/ov534.c b/drivers/media/usb/gspca/ov534.c
index 9a11158f38da..8b6a57f170d0 100644
--- a/drivers/media/usb/gspca/ov534.c
+++ b/drivers/media/usb/gspca/ov534.c
@@ -1220,9 +1220,9 @@ static int sd_init_controls(struct gspca_dev *gspca_dev)
 	int hflip_def;
 
 	if (sd->sensor == SENSOR_OV767x) {
-		saturation_min = 0,
-		saturation_max = 6,
-		saturation_def = 3,
+		saturation_min = 0;
+		saturation_max = 6;
+		saturation_def = 3;
 		brightness_min = -127;
 		brightness_max = 127;
 		brightness_def = 0;
@@ -1233,9 +1233,9 @@ static int sd_init_controls(struct gspca_dev *gspca_dev)
 		exposure_def = 0x13;
 		hflip_def = 1;
 	} else {
-		saturation_min = 0,
-		saturation_max = 255,
-		saturation_def = 64,
+		saturation_min = 0;
+		saturation_max = 255;
+		saturation_def = 64;
 		brightness_min = 0;
 		brightness_max = 255;
 		brightness_def = 0;

