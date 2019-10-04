Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC329CB95A
	for <lists+linux-media@lfdr.de>; Fri,  4 Oct 2019 13:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728766AbfJDLmw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Oct 2019 07:42:52 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:57286 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725826AbfJDLmw (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Oct 2019 07:42:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=zRO/NX4jYO3zNTff4j2CEIxgdB9iLnJl/0oHvLuPhZc=; b=lgCYGzK61Oz8Cjae2alDUrjQM
        fMHfpsm7mqxxnvUJR0QgpG/Ca4i1koVAX3F6+NMcosdUXlGuQWETB9yjUvBw2LRTl5k7VjjxEB5Nx
        3N02gZb4iqvh/643+y9g6BWq22LowKRNksNU6b3mXX4SeJG34Sy6sYzB5eOQulQEHmyjFEs06WV5Z
        YWlC8T3jpd6P6X2ohUUqQhAac5jE0THaCCCq+5Kxc9gnWWoOIX3KJrVA+bWZVD9kAEtI9jTUBEa4M
        aZISf/izqVZEkfTlb1JfVou1uo32vaZPOx0uNd939QGHSIz7ODeByTyzsZleyMrNsJUxwHbqZx47l
        AXxsftSeA==;
Received: from 177.133.68.49.dynamic.adsl.gvt.net.br ([177.133.68.49] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iGLz1-0006rQ-Oz; Fri, 04 Oct 2019 11:42:51 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.2)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1iGLyy-000403-22; Fri, 04 Oct 2019 08:42:48 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH] media: mb86a20s: make the bit rate estimation function more generic
Date:   Fri,  4 Oct 2019 08:42:47 -0300
Message-Id: <ec12d0eb11a791f97ff22d8981de8db048e2342b.1570189363.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

While 99% of the implementation of the bitrate estimation
routine for ISDB-T is generic, the current approach mangles it
with some mb86a20s-specific thing.

Split the calculus from the specific stuff, in order to make
easier to use the same approach on other drivers requiring
a similar formula.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 drivers/media/dvb-frontends/mb86a20s.c | 54 +++++++++++---------------
 1 file changed, 23 insertions(+), 31 deletions(-)

diff --git a/drivers/media/dvb-frontends/mb86a20s.c b/drivers/media/dvb-frontends/mb86a20s.c
index 4e50441c247a..a7faf0cf8788 100644
--- a/drivers/media/dvb-frontends/mb86a20s.c
+++ b/drivers/media/dvb-frontends/mb86a20s.c
@@ -517,7 +517,7 @@ static void mb86a20s_reset_frontend_cache(struct dvb_frontend *fe)
  * Estimates the bit rate using the per-segment bit rate given by
  * ABNT/NBR 15601 spec (table 4).
  */
-static u32 isdbt_rate[3][5][4] = {
+static const u32 isdbt_rate[3][5][4] = {
 	{	/* DQPSK/QPSK */
 		{  280850,  312060,  330420,  340430 },	/* 1/2 */
 		{  374470,  416080,  440560,  453910 },	/* 2/3 */
@@ -539,13 +539,9 @@ static u32 isdbt_rate[3][5][4] = {
 	}
 };
 
-static void mb86a20s_layer_bitrate(struct dvb_frontend *fe, u32 layer,
-				   u32 modulation, u32 forward_error_correction,
-				   u32 guard_interval,
-				   u32 segment)
+static u32 isdbt_layer_min_bitrate(struct dtv_frontend_properties *c,
+				   u32 layer)
 {
-	struct mb86a20s_state *state = fe->demodulator_priv;
-	u32 rate;
 	int mod, fec, guard;
 
 	/*
@@ -553,7 +549,7 @@ static void mb86a20s_layer_bitrate(struct dvb_frontend *fe, u32 layer,
 	 * to consider the lowest bit rate, to avoid taking too long time
 	 * to get BER.
 	 */
-	switch (modulation) {
+	switch (c->layer[layer].modulation) {
 	case DQPSK:
 	case QPSK:
 	default:
@@ -567,7 +563,7 @@ static void mb86a20s_layer_bitrate(struct dvb_frontend *fe, u32 layer,
 		break;
 	}
 
-	switch (forward_error_correction) {
+	switch (c->layer[layer].fec) {
 	default:
 	case FEC_1_2:
 	case FEC_AUTO:
@@ -587,7 +583,7 @@ static void mb86a20s_layer_bitrate(struct dvb_frontend *fe, u32 layer,
 		break;
 	}
 
-	switch (guard_interval) {
+	switch (c->guard_interval) {
 	default:
 	case GUARD_INTERVAL_1_4:
 		guard = 0;
@@ -603,29 +599,14 @@ static void mb86a20s_layer_bitrate(struct dvb_frontend *fe, u32 layer,
 		break;
 	}
 
-	/* Samples BER at BER_SAMPLING_RATE seconds */
-	rate = isdbt_rate[mod][fec][guard] * segment * BER_SAMPLING_RATE;
-
-	/* Avoids sampling too quickly or to overflow the register */
-	if (rate < 256)
-		rate = 256;
-	else if (rate > (1 << 24) - 1)
-		rate = (1 << 24) - 1;
-
-	dev_dbg(&state->i2c->dev,
-		"%s: layer %c bitrate: %d kbps; counter = %d (0x%06x)\n",
-		__func__, 'A' + layer,
-		segment * isdbt_rate[mod][fec][guard]/1000,
-		rate, rate);
-
-	state->estimated_rate[layer] = rate;
+	return isdbt_rate[mod][fec][guard] * c->layer[layer].segment_count;
 }
 
 static int mb86a20s_get_frontend(struct dvb_frontend *fe)
 {
 	struct mb86a20s_state *state = fe->demodulator_priv;
 	struct dtv_frontend_properties *c = &fe->dtv_property_cache;
-	int layer, rc;
+	int layer, rc, rate, counter;
 
 	dev_dbg(&state->i2c->dev, "%s called.\n", __func__);
 
@@ -676,10 +657,21 @@ static int mb86a20s_get_frontend(struct dvb_frontend *fe)
 		dev_dbg(&state->i2c->dev, "%s: interleaving %d.\n",
 			__func__, rc);
 		c->layer[layer].interleaving = rc;
-		mb86a20s_layer_bitrate(fe, layer, c->layer[layer].modulation,
-				       c->layer[layer].fec,
-				       c->guard_interval,
-				       c->layer[layer].segment_count);
+
+		rate = isdbt_layer_min_bitrate(c, layer);
+		counter = rate * BER_SAMPLING_RATE;
+
+		/* Avoids sampling too quickly or to overflow the register */
+		if (counter < 256)
+			counter = 256;
+		else if (counter > (1 << 24) - 1)
+			counter = (1 << 24) - 1;
+
+		dev_dbg(&state->i2c->dev,
+			"%s: layer %c bitrate: %d kbps; counter = %d (0x%06x)\n",
+			__func__, 'A' + layer, rate / 1000, counter, counter);
+
+		state->estimated_rate[layer] = counter;
 	}
 
 	rc = mb86a20s_writereg(state, 0x6d, 0x84);
-- 
2.21.0

