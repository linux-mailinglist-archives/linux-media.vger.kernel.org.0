Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A062412466
	for <lists+linux-media@lfdr.de>; Fri,  3 May 2019 00:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbfEBWBB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 May 2019 18:01:01 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42704 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbfEBWBB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 2 May 2019 18:01:01 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 332F227FDD4
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     kernel@collabora.com, Ezequiel Garcia <ezequiel@collabora.com>
Subject: [PATCH v2 2/4] media: coda: Remove unbalanced and unneeded mutex unlock
Date:   Thu,  2 May 2019 19:00:43 -0300
Message-Id: <20190502220045.14962-3-ezequiel@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190502220045.14962-1-ezequiel@collabora.com>
References: <20190502220045.14962-1-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The mutex unlock in the threaded interrupt handler is not paired
with any mutex lock. Remove it.

This bug has been here for a really long time, so it applies
to any stable repo.

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
---
 drivers/media/platform/coda/coda-bit.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/coda/coda-bit.c b/drivers/media/platform/coda/coda-bit.c
index eaa86737fa04..bddd2f5c8c2b 100644
--- a/drivers/media/platform/coda/coda-bit.c
+++ b/drivers/media/platform/coda/coda-bit.c
@@ -2308,7 +2308,6 @@ irqreturn_t coda_irq_handler(int irq, void *data)
 	if (ctx == NULL) {
 		v4l2_err(&dev->v4l2_dev,
 			 "Instance released before the end of transaction\n");
-		mutex_unlock(&dev->coda_mutex);
 		return IRQ_HANDLED;
 	}
 
-- 
2.20.1

