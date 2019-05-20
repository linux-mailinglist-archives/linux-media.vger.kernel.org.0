Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2322D2419F
	for <lists+linux-media@lfdr.de>; Mon, 20 May 2019 22:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbfETUBq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 May 2019 16:01:46 -0400
Received: from gofer.mess.org ([88.97.38.141]:46459 "EHLO gofer.mess.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725776AbfETUBq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 May 2019 16:01:46 -0400
Received: by gofer.mess.org (Postfix, from userid 1000)
        id 2F35060022; Mon, 20 May 2019 21:01:45 +0100 (BST)
From:   Sean Young <sean@mess.org>
To:     linux-media@vger.kernel.org
Subject: [PATCH 2/2] media: dvb: remove replace frontend_debug with dynamic debug
Date:   Mon, 20 May 2019 21:01:44 +0100
Message-Id: <20190520200144.16713-2-sean@mess.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190520200144.16713-1-sean@mess.org>
References: <20190520200144.16713-1-sean@mess.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This simplifies the code a little. This does move a dev_dbg() into a
timing sensitive code path. This is in the microseconds order so dev_dbg()
should not make a difference.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/dvb-core/dvb_frontend.c | 39 +++++++++++++--------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index d3c0f6267bf8..3aad13415654 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -47,15 +47,12 @@
 #include <media/dvbdev.h>
 #include <linux/dvb/version.h>
 
-static int dvb_frontend_debug;
 static int dvb_shutdown_timeout;
 static int dvb_force_auto_inversion;
 static int dvb_override_tune_delay;
 static int dvb_powerdown_on_sleep = 1;
 static int dvb_mfe_wait_time = 5;
 
-module_param_named(frontend_debug, dvb_frontend_debug, int, 0644);
-MODULE_PARM_DESC(frontend_debug, "Turn on/off frontend core debugging (default:off).");
 module_param(dvb_shutdown_timeout, int, 0644);
 MODULE_PARM_DESC(dvb_shutdown_timeout, "wait <shutdown_timeout> seconds after close() before suspending hardware");
 module_param(dvb_force_auto_inversion, int, 0644);
@@ -917,9 +914,9 @@ static void dvb_frontend_get_frequency_limits(struct dvb_frontend *fe,
 			 "DVB: adapter %i frontend %u frequency limits undefined - fix the driver\n",
 			 fe->dvb->num, fe->id);
 
-	if (dvb_frontend_debug)
-		dprintk("frequency interval: tuner: %u...%u, frontend: %u...%u",
-			tuner_min, tuner_max, frontend_min, frontend_max);
+	dev_dbg(fe->dvb->device,
+		"frequency interval: tuner: %u...%u, frontend: %u...%u",
+		tuner_min, tuner_max, frontend_min, frontend_max);
 
 	/* If the standard is for satellite, convert frequencies to kHz */
 	switch (c->delivery_system) {
@@ -2586,41 +2583,41 @@ static int dvb_frontend_handle_ioctl(struct file *file,
 			 */
 			unsigned long swcmd = ((unsigned long)parg) << 1;
 			ktime_t nexttime;
-			ktime_t tv[10];
+			ktime_t now, lasttime;
 			int i;
 			u8 last = 1;
 
-			if (dvb_frontend_debug)
-				dprintk("switch command: 0x%04lx\n",
-					swcmd);
+			dev_dbg(fe->dvb->device, "switch command: 0x%04lx\n",
+				swcmd);
 			nexttime = ktime_get_boottime();
-			if (dvb_frontend_debug)
-				tv[0] = nexttime;
 			/* before sending a command, initialize by sending
 			 * a 32ms 18V to the switch
 			 */
 			fe->ops.set_voltage(fe, SEC_VOLTAGE_18);
+
+			dev_dbg(fe->dvb->device, "(adapter %d): switch delay (should be 32k followed by all 8k)\n",
+				fe->dvb->num);
+
+			lasttime = nexttime;
 			dvb_frontend_sleep_until(&nexttime, 32000);
 
 			for (i = 0; i < 9; i++) {
-				if (dvb_frontend_debug)
-					tv[i + 1] = ktime_get_boottime();
 				if ((swcmd & 0x01) != last) {
 					/* set voltage to (last ? 13V : 18V) */
 					fe->ops.set_voltage(fe, (last) ? SEC_VOLTAGE_13 : SEC_VOLTAGE_18);
 					last = (last) ? 0 : 1;
 				}
 				swcmd = swcmd >> 1;
+
+				now = ktime_get_boottime();
+				dev_dbg(fe->dvb->device, "%d: %lld\n", i,
+					ktime_us_delta(now, lasttime));
+				lasttime = now;
+
 				if (i != 8)
 					dvb_frontend_sleep_until(&nexttime, 8000);
 			}
-			if (dvb_frontend_debug) {
-				dprintk("(adapter %d): switch delay (should be 32k followed by all 8k)\n",
-					fe->dvb->num);
-				for (i = 1; i < 10; i++)
-					pr_info("%d: %d\n", i,
-						(int)ktime_us_delta(tv[i], tv[i - 1]));
-			}
+
 			err = 0;
 			fepriv->state = FESTATE_DISEQC;
 			fepriv->status = 0;
-- 
2.20.1

