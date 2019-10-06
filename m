Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B173CD1F4
	for <lists+linux-media@lfdr.de>; Sun,  6 Oct 2019 14:48:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbfJFMs1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 6 Oct 2019 08:48:27 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58286 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726320AbfJFMs1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 6 Oct 2019 08:48:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=5L+UtHGxmsqJF12bOpo0CEFdDEP3YC5S7HF3N/tK/wA=; b=mhE5t+wwsKFvEOw4pOlwPaN5R
        r8pV3z5ZgCfOknAAAjofAOsP6aSflk2cLrRSy4sLq+HaXEkcUNsYyHyTc7F3s41mChzsqafRhBUnq
        1PECg3f80pUQrvr1FigKPAt8wIAoLua9txoVZkI+HlFobCAdxPoIcXOwGy/BIF/pimD+Zb5o82Fvs
        kflFMUXAprz0cqcK7rCqkUM4GOOcvbRKrslM3DdE+1qrRaORY53HquO83rhUg9cNKghe7r57qxsXF
        reDVM8OT2/9qBUdgaTabDDT5rqDkf1x7uvD4MYpg/uV2w0DKafZ88/N2kkdJu48LCBIZqiTAZ8rhQ
        aEpTCg8uA==;
Received: from 179.187.109.114.dynamic.adsl.gvt.net.br ([179.187.109.114] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iH5xa-0006wg-La; Sun, 06 Oct 2019 12:48:26 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.3)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1iH5xY-0001Ta-Bd; Sun, 06 Oct 2019 09:48:24 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>
Subject: [PATCH] media: cxd2841er: avoid too many status inquires
Date:   Sun,  6 Oct 2019 09:48:23 -0300
Message-Id: <44699c92e5bf28b736d07d45e82ee7e21eccc506.1570366100.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I2C ops are expensive, as the I2C bus typical speed is 100kbps.

Also, stats reading take some time, as it requires to retrieve a
certain number of packets to complete.

While we don't know the minimal for CXD2841er, trying to do it
too quickly is still a very bad idea.

So, add some sanity logic there, preventing to retrieve stats
faster than one second.

This shouldn't cause any issues with well behavior apps, as they
usually take stats on a polling rate slower than 1 second.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 drivers/media/dvb-frontends/cxd2841er.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/cxd2841er.c b/drivers/media/dvb-frontends/cxd2841er.c
index 1b30cf570803..758c95bc3b11 100644
--- a/drivers/media/dvb-frontends/cxd2841er.c
+++ b/drivers/media/dvb-frontends/cxd2841er.c
@@ -60,6 +60,7 @@ struct cxd2841er_priv {
 	enum cxd2841er_xtal		xtal;
 	enum fe_caps caps;
 	u32				flags;
+	unsigned long			stats_time;
 };
 
 static const struct cxd2841er_cnr_data s_cn_data[] = {
@@ -3279,9 +3280,15 @@ static int cxd2841er_get_frontend(struct dvb_frontend *fe,
 		p->strength.stat[0].scale = FE_SCALE_NOT_AVAILABLE;
 
 	if (status & FE_HAS_LOCK) {
+		if (priv->stats_time &&
+		    (!time_after(jiffies, priv->stats_time)))
+			return 0;
+
+		/* Prevent retrieving stats faster than once per second */
+		priv->stats_time = jiffies + msecs_to_jiffies(1000);
+
 		cxd2841er_read_snr(fe);
 		cxd2841er_read_ucblocks(fe);
-
 		cxd2841er_read_ber(fe);
 	} else {
 		p->cnr.stat[0].scale = FE_SCALE_NOT_AVAILABLE;
@@ -3360,6 +3367,9 @@ static int cxd2841er_set_frontend_s(struct dvb_frontend *fe)
 	p->post_bit_error.stat[0].scale = FE_SCALE_NOT_AVAILABLE;
 	p->post_bit_count.stat[0].scale = FE_SCALE_NOT_AVAILABLE;
 
+	/* Reset the wait for jiffies logic */
+	priv->stats_time = 0;
+
 	return ret;
 }
 
-- 
2.21.0

