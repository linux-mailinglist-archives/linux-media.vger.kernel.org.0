Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC48CA073
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 16:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727697AbfJCOhS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 10:37:18 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:44112 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726199AbfJCOhS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Oct 2019 10:37:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=R+P9ukKf1Oss2N4Zb6s1vlRCppIrkd4GHmZSumbBLZ4=; b=bmWt2JAzrlzKxl+LojcXmfjiQ
        wlZ4OZWr/A/ftB8epuYX/x9TEWdjVsRYQegEjazlcH4c3cxZ84VjU7HmFC8/MihjBsXzaFYHoE7PW
        R3WhIm0YZS3JOrlEZj+lyWT4UvME7L+saG5PNc1v1QR8WbixfvKledxfkGWRMxGdZ2COGnewPdqGT
        p+M8cjRk7TG/jykL8floDcUF4mxO2VhnOWwPDgH4GLq2ArB3RCA3cCe/JZfxrGTLy2au+NqyTHiwW
        X+dxT6B1wRqNYvvUe4Vq4qCIXGiUMglj/uJCKdSOsbi5Fp7pg9hnX2FwFu3jYOzBjK4E1mX86HQWn
        OXMfwnfPQ==;
Received: from 177.133.68.49.dynamic.adsl.gvt.net.br ([177.133.68.49] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iG2EH-00035b-8t; Thu, 03 Oct 2019 14:37:17 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.2)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1iG2EE-0003l6-Fe; Thu, 03 Oct 2019 11:37:14 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>
Subject: [PATCH] media: cxd2841er: avoid too many status inquires
Date:   Thu,  3 Oct 2019 11:37:13 -0300
Message-Id: <deda32250ad32078b98eb41eb09d6d20050a6f9c.1570113429.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As reported at:
	https://tvheadend.org/issues/5625

Retrieving certain status can cause discontinuity issues.

Prevent that by adding a timeout to each status logic.

Currently, the timeout is estimated based at the channel
bandwidth. There are other parameters that may also affect
the timeout, but that would require a per-delivery system
calculus and probably more information about how cxd2481er
works, with we don't have.

So, do a poor man's best guess.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 drivers/media/dvb-frontends/cxd2841er.c | 54 +++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/drivers/media/dvb-frontends/cxd2841er.c b/drivers/media/dvb-frontends/cxd2841er.c
index 1b30cf570803..c75e63b9cfa7 100644
--- a/drivers/media/dvb-frontends/cxd2841er.c
+++ b/drivers/media/dvb-frontends/cxd2841er.c
@@ -60,6 +60,13 @@ struct cxd2841er_priv {
 	enum cxd2841er_xtal		xtal;
 	enum fe_caps caps;
 	u32				flags;
+
+	unsigned long			ber_interval;
+	unsigned long			ucb_interval;
+
+	unsigned long			ber_time;
+	unsigned long			ucb_time;
+	unsigned long			snr_time;
 };
 
 static const struct cxd2841er_cnr_data s_cn_data[] = {
@@ -1941,6 +1948,10 @@ static void cxd2841er_read_ber(struct dvb_frontend *fe)
 	struct cxd2841er_priv *priv = fe->demodulator_priv;
 	u32 ret, bit_error = 0, bit_count = 0;
 
+	if (priv->ber_time &&
+	   (!time_after(jiffies, priv->ber_time)))
+		return;
+
 	dev_dbg(&priv->i2c->dev, "%s()\n", __func__);
 	switch (p->delivery_system) {
 	case SYS_DVBC_ANNEX_A:
@@ -1978,6 +1989,19 @@ static void cxd2841er_read_ber(struct dvb_frontend *fe)
 		p->post_bit_error.stat[0].scale = FE_SCALE_NOT_AVAILABLE;
 		p->post_bit_count.stat[0].scale = FE_SCALE_NOT_AVAILABLE;
 	}
+
+	/*
+	 * If the per-delivery system doesn't specify, set a default timeout
+	 * that will wait for 10^7 bits or 1 second
+	 */
+	if (!priv->ber_interval && p->bandwidth_hz) {
+		priv->ber_interval = (10000000) / (p->bandwidth_hz / 1000);
+	}
+
+	if (priv->ber_interval < 1000)
+		priv->ber_interval = 1000;
+
+	priv->ber_time = jiffies + msecs_to_jiffies(priv->ber_interval);
 }
 
 static void cxd2841er_read_signal_strength(struct dvb_frontend *fe)
@@ -2037,6 +2061,13 @@ static void cxd2841er_read_snr(struct dvb_frontend *fe)
 	struct dtv_frontend_properties *p = &fe->dtv_property_cache;
 	struct cxd2841er_priv *priv = fe->demodulator_priv;
 
+	if (priv->snr_time &&
+	   (!time_after(jiffies, priv->snr_time)))
+		return;
+
+	/* Preventing asking SNR more than once per second */
+	priv->snr_time = jiffies + msecs_to_jiffies(1000);
+
 	dev_dbg(&priv->i2c->dev, "%s()\n", __func__);
 	switch (p->delivery_system) {
 	case SYS_DVBC_ANNEX_A:
@@ -2081,6 +2112,10 @@ static void cxd2841er_read_ucblocks(struct dvb_frontend *fe)
 	struct cxd2841er_priv *priv = fe->demodulator_priv;
 	u32 ucblocks = 0;
 
+	if (priv->ucb_time &&
+	   (!time_after(jiffies, priv->ucb_time)))
+		return;
+
 	dev_dbg(&priv->i2c->dev, "%s()\n", __func__);
 	switch (p->delivery_system) {
 	case SYS_DVBC_ANNEX_A:
@@ -2105,6 +2140,18 @@ static void cxd2841er_read_ucblocks(struct dvb_frontend *fe)
 
 	p->block_error.stat[0].scale = FE_SCALE_COUNTER;
 	p->block_error.stat[0].uvalue = ucblocks;
+
+	/*
+	 * If the per-delivery system doesn't specify, set a default timeout
+	 * that will wait for 100 packets or 1 second
+	 */
+	if (!priv->ucb_interval && p->bandwidth_hz)
+		priv->ucb_interval = (100 * 204 * 1000 * 8) / p->bandwidth_hz;
+
+	if (priv->ucb_interval < 1000)
+		priv->ucb_interval = 1000;
+
+	priv->ucb_time = jiffies + msecs_to_jiffies(priv->ucb_interval);
 }
 
 static int cxd2841er_dvbt2_set_profile(
@@ -3360,6 +3407,13 @@ static int cxd2841er_set_frontend_s(struct dvb_frontend *fe)
 	p->post_bit_error.stat[0].scale = FE_SCALE_NOT_AVAILABLE;
 	p->post_bit_count.stat[0].scale = FE_SCALE_NOT_AVAILABLE;
 
+	/* Reset the wait for jiffies logic */
+	priv->ber_interval = 0;
+	priv->ucb_interval = 0;
+	priv->ber_time = 0;
+	priv->ucb_time = 0;
+	priv->snr_time = 0;
+
 	return ret;
 }
 
-- 
2.21.0

