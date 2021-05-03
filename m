Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A9AB371D0F
	for <lists+linux-media@lfdr.de>; Mon,  3 May 2021 18:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232023AbhECQ54 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 May 2021 12:57:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:43304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235090AbhECQzr (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 May 2021 12:55:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 75FDC61953;
        Mon,  3 May 2021 16:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620060176;
        bh=y1KZOimxnzrONNjyUcvByZsk2dyLGwJrGm9ar+YMXgY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Nhsw69Qrdbi5xgVkU9P2UWkHgG4Wv7WI73180QAUosxiyZ4vIyEq8BlseyjNbe0LB
         HQmFw1O6hZbh3oQaosOzowJpt3OKktyMqjAwyrAH+B/xTWnKmGtfFpKiy7a4IOoHSH
         v1i6lWZJ9ALnRY2A16dWNc3o1jzmbXjONjgh4q2WlknIkfsaJ1zBEI93+r1Gy4eBpW
         VstPg81xjKLSreI/HzDedUEyzkYHDwU9J29JuvQ07tbsmWd8tOWmUbK7IE7qLhu4G/
         QOxSyhYW1FfOnvyUkQvbqyiMJvbHHGABRpIwaVx2zcJEkwkCGeHDSN8zKrVjuJOl9s
         aXgZjrqYB1v5w==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 02/24] media: ite-cir: check for receive overflow
Date:   Mon,  3 May 2021 12:42:30 -0400
Message-Id: <20210503164252.2854487-2-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210503164252.2854487-1-sashal@kernel.org>
References: <20210503164252.2854487-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sean Young <sean@mess.org>

[ Upstream commit 28c7afb07ccfc0a939bb06ac1e7afe669901c65a ]

It's best if this condition is reported.

Signed-off-by: Sean Young <sean@mess.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/rc/ite-cir.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/rc/ite-cir.c b/drivers/media/rc/ite-cir.c
index 63165d324fff..7d3e50d94d86 100644
--- a/drivers/media/rc/ite-cir.c
+++ b/drivers/media/rc/ite-cir.c
@@ -292,8 +292,14 @@ static irqreturn_t ite_cir_isr(int irq, void *data)
 	/* read the interrupt flags */
 	iflags = dev->params.get_irq_causes(dev);
 
+	/* Check for RX overflow */
+	if (iflags & ITE_IRQ_RX_FIFO_OVERRUN) {
+		dev_warn(&dev->rdev->dev, "receive overflow\n");
+		ir_raw_event_reset(dev->rdev);
+	}
+
 	/* check for the receive interrupt */
-	if (iflags & (ITE_IRQ_RX_FIFO | ITE_IRQ_RX_FIFO_OVERRUN)) {
+	if (iflags & ITE_IRQ_RX_FIFO) {
 		/* read the FIFO bytes */
 		rx_bytes =
 			dev->params.get_rx_bytes(dev, rx_buf,
-- 
2.30.2

