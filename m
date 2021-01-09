Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2C392F0357
	for <lists+linux-media@lfdr.de>; Sat,  9 Jan 2021 21:12:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726198AbhAIULn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Jan 2021 15:11:43 -0500
Received: from mail.horus.com ([78.46.148.228]:41697 "EHLO mail.horus.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726001AbhAIULm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 9 Jan 2021 15:11:42 -0500
Received: from [192.168.1.20] (62-116-63-217.adsl.highway.telekom.at [62.116.63.217])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "E-Mail Matthias Reichl", Issuer "HiassofT CA 2014" (not verified))
        by mail.horus.com (Postfix) with ESMTPSA id A77F46409C;
        Sat,  9 Jan 2021 21:11:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=horus.com;
        s=20180324; t=1610223060;
        bh=yP/zRhmevJRBTKDNMoaumBDgPhVoVFaePz5bIwWr74k=;
        h=From:To:Cc:Subject:Date:From;
        b=O75Fg6+AnnzA0nk5dKsCMjp5pHQsjqYfb7R0voUgJnqboXhMoGkhaXJmLFip0RLtK
         YyfOTimsF6HtclBtCAQpbXBLgT7NbjP+eMLO1NDhTWLMSsiDVMKoxCyHagrd19NYKK
         PsaCsp57jRfNITXws+4y8hLhbUAl8lnt4/sUBAkU=
Received: by camel2.lan (Postfix, from userid 1000)
        id 31F6B1C7520; Sat,  9 Jan 2021 21:11:00 +0100 (CET)
From:   Matthias Reichl <hias@horus.com>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org
Subject: [PATCH] media: rc: ite-cir: fix min_timeout calculation
Date:   Sat,  9 Jan 2021 21:10:55 +0100
Message-Id: <20210109201055.12051-1-hias@horus.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 528222d853f92 ("media: rc: harmonize infrared durations to
microseconds") missed to switch the min_timeout calculation from ns
to us. This resulted in a minimum timeout of 1.2 seconds instead of 1.2ms,
leading to large delays and long key repeats.

Fix this by applying proper ns->us conversion.

Fixes: 528222d853f92 ("media: rc: harmonize infrared durations to microseconds")
Signed-off-by: Matthias Reichl <hias@horus.com>
---
 drivers/media/rc/ite-cir.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/ite-cir.c b/drivers/media/rc/ite-cir.c
index a905113fef6e..0c6229592e13 100644
--- a/drivers/media/rc/ite-cir.c
+++ b/drivers/media/rc/ite-cir.c
@@ -1551,7 +1551,7 @@ static int ite_probe(struct pnp_dev *pdev, const struct pnp_device_id
 	rdev->s_rx_carrier_range = ite_set_rx_carrier_range;
 	/* FIFO threshold is 17 bytes, so 17 * 8 samples minimum */
 	rdev->min_timeout = 17 * 8 * ITE_BAUDRATE_DIVISOR *
-			    itdev->params.sample_period;
+			    itdev->params.sample_period / 1000;
 	rdev->timeout = IR_DEFAULT_TIMEOUT;
 	rdev->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
 	rdev->rx_resolution = ITE_BAUDRATE_DIVISOR *
-- 
2.20.1

