Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E154403A34
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 15:03:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbhIHNE3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 09:04:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236221AbhIHNE0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Sep 2021 09:04:26 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55128C06175F
        for <linux-media@vger.kernel.org>; Wed,  8 Sep 2021 06:03:18 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxES-0004mH-L8; Wed, 08 Sep 2021 15:03:16 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxER-0004S8-Lo; Wed, 08 Sep 2021 15:03:15 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxER-00DpG2-Kx; Wed, 08 Sep 2021 15:03:15 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     kernel@pengutronix.de, m.tretter@pengutronix.de
Subject: [PATCH 1/6] media: allegro: ignore interrupt if mailbox is not initialized
Date:   Wed,  8 Sep 2021 15:03:10 +0200
Message-Id: <20210908130315.3295253-2-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210908130315.3295253-1-m.tretter@pengutronix.de>
References: <20210908130315.3295253-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The mailbox is initialized after the interrupt handler is installed. As
the firmware is loaded and started even later, it should not happen that
the interrupt occurs without the mailbox being initialized.

As the Linux Driver Verification project (linuxtesting.org) keeps
reporting this as an error, add a check to ignore interrupts before the
mailbox is initialized to fix this potential null pointer dereference.

Reported-by: Yuri Savinykh <s02190703@gse.cs.msu.ru>
Reported-by: Nadezda Lutovinova <lutovinova@ispras.ru>
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/media/platform/allegro-dvt/allegro-core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 887b492e4ad1..14a119b43bca 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -2185,6 +2185,15 @@ static irqreturn_t allegro_irq_thread(int irq, void *data)
 {
 	struct allegro_dev *dev = data;
 
+	/*
+	 * The firmware is initialized after the mailbox is setup. We further
+	 * check the AL5_ITC_CPU_IRQ_STA register, if the firmware actually
+	 * triggered the interrupt. Although this should not happen, make sure
+	 * that we ignore interrupts, if the mailbox is not initialized.
+	 */
+	if (!dev->mbox_status)
+		return IRQ_NONE;
+
 	allegro_mbox_notify(dev->mbox_status);
 
 	return IRQ_HANDLED;
-- 
2.30.2

