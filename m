Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF73D3632C9
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 02:13:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236407AbhDRANR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Apr 2021 20:13:17 -0400
Received: from mail.tuxforce.de ([84.38.66.179]:47282 "EHLO mail.tuxforce.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230339AbhDRANQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Apr 2021 20:13:16 -0400
Received: from fedora.fritz.box (2001-4dd5-b099-0-19b2-6b8c-f4bb-b22d.ipv6dyn.netcologne.de [IPv6:2001:4dd5:b099:0:19b2:6b8c:f4bb:b22d])
        by mail.tuxforce.de (Postfix) with ESMTPSA id 9BDA5520082;
        Sun, 18 Apr 2021 02:12:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.tuxforce.de 9BDA5520082
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tuxforce.de;
        s=202009; t=1618704768;
        bh=9eMZRpffFD04UwOuBm/MW1cYy1qYusQkfQLfDzI83rw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KA6RNGeJKOqZWQvuVlgs3XYOASvotpjdCLLrnN0m4KybHHi49Vc8C438u6e63eDAb
         DtirQMfcecwjzvOt6oJh/8JW9Cr+zOmcb/SSv2WV6nUHOxm8KhO/NkzOfZTXR4XsRn
         6l0n+TWHWAzMOk19hbtc8qa7JRab9w4571jI9wthVhbFkKiY5jM2qbZDWyOpGHWdZy
         GJ8dYP91xrVBbx/MCkbaCLHu4ayyvHqaBTLvaQZwG79zhQXyad8GUYS3S3Eekavifv
         oEDjI6R989DwojFwagw3KTDWXqKrx4AsgmIGY2gqhM/XQ1wLsz1ktnBSFH+ZSicOQH
         vzP2T6ai24FAA==
From:   Lukas Middendorf <kernel@tuxforce.de>
To:     linux-media@vger.kernel.org
Cc:     Lukas Middendorf <kernel@tuxforce.de>,
        Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH 1/2] media dvb_frontend: add suspend and resume callbacks to dvb_frontend_ops
Date:   Sun, 18 Apr 2021 02:12:03 +0200
Message-Id: <20210418001204.7453-2-kernel@tuxforce.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210418001204.7453-1-kernel@tuxforce.de>
References: <20210418001204.7453-1-kernel@tuxforce.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While dvb_tuner_ops already has dedicated suspend and resume callbacks,
dvb_frontend_ops currently does not have them. Add those callbacks and
use them for suspend and resume. If they are not set, the old behavior
of calling sleep or init is used.

This allows dvb_frontend drivers to handle resume differently from init,
and suspend differently from sleep. No change is required for drivers
not needing this functionality.

Signed-off-by: Lukas Middendorf <kernel@tuxforce.de>
---
 drivers/media/dvb-core/dvb_frontend.c |  8 ++++++--
 include/media/dvb_frontend.h          | 13 +++++++++++--
 2 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/media/dvb-core/dvb_frontend.c b/drivers/media/dvb-core/dvb_frontend.c
index fb35697dd93c..9e78191db5c6 100644
--- a/drivers/media/dvb-core/dvb_frontend.c
+++ b/drivers/media/dvb-core/dvb_frontend.c
@@ -2912,7 +2912,9 @@ int dvb_frontend_suspend(struct dvb_frontend *fe)
 	else if (fe->ops.tuner_ops.sleep)
 		ret = fe->ops.tuner_ops.sleep(fe);
 
-	if (fe->ops.sleep)
+	if (fe->ops.suspend)
+		ret = fe->ops.suspend(fe);
+	else if (fe->ops.sleep)
 		ret = fe->ops.sleep(fe);
 
 	return ret;
@@ -2928,7 +2930,9 @@ int dvb_frontend_resume(struct dvb_frontend *fe)
 		fe->id);
 
 	fe->exit = DVB_FE_DEVICE_RESUME;
-	if (fe->ops.init)
+	if (fe->ops.resume)
+		ret = fe->ops.resume(fe);
+	else if (fe->ops.init)
 		ret = fe->ops.init(fe);
 
 	if (fe->ops.tuner_ops.resume)
diff --git a/include/media/dvb_frontend.h b/include/media/dvb_frontend.h
index 0d76fa4551b3..e7c44870f20d 100644
--- a/include/media/dvb_frontend.h
+++ b/include/media/dvb_frontend.h
@@ -364,6 +364,10 @@ struct dvb_frontend_internal_info {
  *			allocated by the driver.
  * @init:		callback function used to initialize the tuner device.
  * @sleep:		callback function used to put the tuner to sleep.
+ * @suspend:		callback function used to inform that the Kernel will
+ *			suspend.
+ * @resume:		callback function used to inform that the Kernel is
+ *			resuming from suspend.
  * @write:		callback function used by some demod legacy drivers to
  *			allow other drivers to write data into their registers.
  *			Should not be used on new drivers.
@@ -443,6 +447,8 @@ struct dvb_frontend_ops {
 
 	int (*init)(struct dvb_frontend* fe);
 	int (*sleep)(struct dvb_frontend* fe);
+	int (*suspend)(struct dvb_frontend *fe);
+	int (*resume)(struct dvb_frontend *fe);
 
 	int (*write)(struct dvb_frontend* fe, const u8 buf[], int len);
 
@@ -755,7 +761,8 @@ void dvb_frontend_detach(struct dvb_frontend *fe);
  * &dvb_frontend_ops.tuner_ops.suspend\(\) is available, it calls it. Otherwise,
  * it will call &dvb_frontend_ops.tuner_ops.sleep\(\), if available.
  *
- * It will also call &dvb_frontend_ops.sleep\(\) to put the demod to suspend.
+ * It will also call &dvb_frontend_ops.suspend\(\) to put the demod to suspend,
+ * if available. Otherwise it will call &dvb_frontend_ops.sleep\(\).
  *
  * The drivers should also call dvb_frontend_suspend\(\) as part of their
  * handler for the &device_driver.suspend\(\).
@@ -769,7 +776,9 @@ int dvb_frontend_suspend(struct dvb_frontend *fe);
  *
  * This function resumes the usual operation of the tuner after resume.
  *
- * In order to resume the frontend, it calls the demod &dvb_frontend_ops.init\(\).
+ * In order to resume the frontend, it calls the demod
+ * &dvb_frontend_ops.resume\(\) if available. Otherwise it calls demod
+ * &dvb_frontend_ops.init\(\).
  *
  * If &dvb_frontend_ops.tuner_ops.resume\(\) is available, It, it calls it.
  * Otherwise,t will call &dvb_frontend_ops.tuner_ops.init\(\), if available.
-- 
2.31.1

