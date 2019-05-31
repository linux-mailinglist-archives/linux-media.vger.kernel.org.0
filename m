Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 03D3B30ABD
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 10:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbfEaIz3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 04:55:29 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:43661 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbfEaIz1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 04:55:27 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.89)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hWdJt-0003zW-AU; Fri, 31 May 2019 10:55:25 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH v3 06/10] media: hantro: add support for separate control block
Date:   Fri, 31 May 2019 10:55:19 +0200
Message-Id: <20190531085523.10892-7-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190531085523.10892-1-p.zabel@pengutronix.de>
References: <20190531085523.10892-1-p.zabel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On i.MX8MQ/MM a separate control block contains registers for per-core
resets, clock gating, and fuse register control.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/staging/media/hantro/hantro.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/media/hantro/hantro.h b/drivers/staging/media/hantro/hantro.h
index feaa439a17b3..295a00d59a5f 100644
--- a/drivers/staging/media/hantro/hantro.h
+++ b/drivers/staging/media/hantro/hantro.h
@@ -167,6 +167,7 @@ hantro_vdev_to_func(struct video_device *vdev)
  * @bases:		Mapped addresses of VPU registers.
  * @enc_base:		Mapped address of VPU encoder register for convenience.
  * @dec_base:		Mapped address of VPU decoder register for convenience.
+ * @ctrl_base:		Mapped address of VPU control block.
  * @vpu_mutex:		Mutex to synchronize V4L2 calls.
  * @irqlock:		Spinlock to synchronize access to data structures
  *			shared with interrupt handlers.
@@ -185,6 +186,7 @@ struct hantro_dev {
 	void __iomem **bases;
 	void __iomem *enc_base;
 	void __iomem *dec_base;
+	void __iomem *ctrl_base;
 
 	struct mutex vpu_mutex;	/* video_device lock */
 	spinlock_t irqlock;
-- 
2.20.1

