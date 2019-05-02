Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29E2412468
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2019 00:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726203AbfEBWBH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 May 2019 18:01:07 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42716 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbfEBWBH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 May 2019 18:01:07 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 1598C282509
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 4/4] media: coda: Clear the interrupt reason
Date:   Thu,  2 May 2019 19:00:45 -0300
Message-Id: <20190502220045.14962-5-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502220045.14962-1-ezequiel@collabora.com>
References: <20190502220045.14962-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This commit clears the interrupt reason (INT_REASON) register
on the interrupt handler. Without this clearing, the CODA hardware
has been observed to get completely stalled on CODA980 variants,
requiring a pretty deep hardware reset.

The datasheet specifies that the INT_REASON register is set
by the CODA hardware, and should be cleared by the host.

While the CODA versions that are currently supported by this driver
don't seem to need this change, it's a really small change,
so it seems a wise thing to do to avoid hitting some
rare race-condition in the hardware.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/platform/coda/coda-bit.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
index bddd2f5c8c2b..a653aaa3ca15 100644
--- a/drivers/media/platform/coda/coda-bit.c
+++ b/drivers/media/platform/coda/coda-bit.c
@@ -2301,6 +2301,7 @@ irqreturn_t coda_irq_handler(int irq, void *data)
 
 	/* read status register to attend the IRQ */
 	coda_read(dev, CODA_REG_BIT_INT_STATUS);
+	coda_write(dev, 0, CODA_REG_BIT_INT_REASON);
 	coda_write(dev, CODA_REG_BIT_INT_CLEAR_SET,
 		      CODA_REG_BIT_INT_CLEAR);
 
-- 
2.20.1

