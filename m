Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BCB33632CA
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 02:13:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236454AbhDRANX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Apr 2021 20:13:23 -0400
Received: from mail.tuxforce.de ([84.38.66.179]:47288 "EHLO mail.tuxforce.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230339AbhDRANX (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Apr 2021 20:13:23 -0400
Received: from fedora.fritz.box (2001-4dd5-b099-0-19b2-6b8c-f4bb-b22d.ipv6dyn.netcologne.de [IPv6:2001:4dd5:b099:0:19b2:6b8c:f4bb:b22d])
        by mail.tuxforce.de (Postfix) with ESMTPSA id 0EC4D52008B;
        Sun, 18 Apr 2021 02:12:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.tuxforce.de 0EC4D52008B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tuxforce.de;
        s=202009; t=1618704775;
        bh=DXh4KK4ge0Vay3/2TB/+yedp+6YGMzZmF/9sra00tj0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=chjmCmLTliyoQ9pJA3fox4Muwg4TQ+NvDHJ//nwmfh/8pLxsZ+MyS7aLoc575c3UP
         BpOH1p9egHdfrZ61ssC3YTNYveMCcimpZ8UVDgnUXwAeIeSQI6EBG7V2o3UQOlHjul
         mLL1u98e57uGuxDr2tjK5oDCVQKx+u+bflpixMg9QYsgcz0Z9Y3lW2R51ZZ09X5zC4
         6L0cvpC0J/va1rAdU82OJlADVqKN+mjonbiIJsz08zNekGiFhutU/oxRfMBkCmaYBF
         6RiGoTI6dhemHMK6iLCZFKuRa2WqgHIy3gNfiUrQVz9uS2pJ5whdaxCvjMmJMG2rDV
         hYprfkyFJiWfQ==
From:   Lukas Middendorf <kernel@tuxforce.de>
To:     linux-media@vger.kernel.org
Cc:     Lukas Middendorf <kernel@tuxforce.de>,
        Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH 2/2] media si2168: fully initialize si2168 on resume only when necessary
Date:   Sun, 18 Apr 2021 02:12:04 +0200
Message-Id: <20210418001204.7453-3-kernel@tuxforce.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210418001204.7453-1-kernel@tuxforce.de>
References: <20210418001204.7453-1-kernel@tuxforce.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

At connection time (or boot) in si2168_probe(), the firmware is not
loaded to the device and the device is not fully activated. It is
not useful or sensible to do this full initialization on resume in
case it has not been previously initialized and is expected to be
in this initialized state.
Calling si2168_init() and therefore reading the firmware file for
the first time during resume leads to problems and should be avoided.
It is however safe to read the firmware file once it has already been
read outside of a suspend/resume situation.

Add a staus flag 'initialized' to store whether si2168_init() has
successfully been called. If initialization fails (e.g. due to missing
firmware file), the flag is not set.
Register a separate si2168_resume callback which only calls
si2168_init() once the 'initialized' flag has been set and it is safe
to load the firmware at resume.
The first call to si2168_init() will now always happen when the device
is actually used for the first time and never during resume.
This avoids the unsafe firmware file reading and should also speed up
resume by skipping unnecessary device initialization.

Signed-off-by: Lukas Middendorf <kernel@tuxforce.de>
---
 drivers/media/dvb-frontends/si2168.c      | 24 +++++++++++++++++++++++
 drivers/media/dvb-frontends/si2168_priv.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
index 14b93a7d3358..f4ea7a896cdf 100644
--- a/drivers/media/dvb-frontends/si2168.c
+++ b/drivers/media/dvb-frontends/si2168.c
@@ -527,6 +527,7 @@ static int si2168_init(struct dvb_frontend *fe)
 		goto err;
 
 	dev->warm = true;
+	dev->initialized=true;
 warm:
 	/* Init stats here to indicate which stats are supported */
 	c->cnr.len = 1;
@@ -548,6 +549,28 @@ static int si2168_init(struct dvb_frontend *fe)
 	return ret;
 }
 
+static int si2168_resume(struct dvb_frontend *fe)
+{
+	struct i2c_client *client = fe->demodulator_priv;
+	struct si2168_dev *dev = i2c_get_clientdata(client);
+	
+	/* check whether si2168_init() has been called successfully
+	 * outside of a resume cycle. Ony call it (and load firmware)
+	 * in this case. si2168_init() is only called during resume
+	 * once the device has actually been used. Otherwise, leave the
+	 * device untouched.
+	 */
+	if(dev->initialized) {
+		dev_dbg(&client->dev, "previsously initialized, call si2168_init()\n");
+		return si2168_init(fe);
+	}
+	else {
+		dev_dbg(&client->dev, "not initialized yet, skipping init on resume\n");
+		return 0;
+	}
+}
+
+
 static int si2168_sleep(struct dvb_frontend *fe)
 {
 	struct i2c_client *client = fe->demodulator_priv;
@@ -657,6 +680,7 @@ static const struct dvb_frontend_ops si2168_ops = {
 
 	.init = si2168_init,
 	.sleep = si2168_sleep,
+	.resume = si2168_resume,
 
 	.set_frontend = si2168_set_frontend,
 
diff --git a/drivers/media/dvb-frontends/si2168_priv.h b/drivers/media/dvb-frontends/si2168_priv.h
index 18bea5222082..007a02c7fee8 100644
--- a/drivers/media/dvb-frontends/si2168_priv.h
+++ b/drivers/media/dvb-frontends/si2168_priv.h
@@ -37,6 +37,7 @@ struct si2168_dev {
 	u8 ts_mode;
 	unsigned int active:1;
 	unsigned int warm:1;
+	unsigned int initialized:1;
 	unsigned int ts_clock_inv:1;
 	unsigned int ts_clock_gapped:1;
 	unsigned int spectral_inversion:1;
-- 
2.31.1

