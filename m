Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 912E5299A9
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2019 16:05:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404031AbfEXOF1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 May 2019 10:05:27 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:49839 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403907AbfEXOF0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 May 2019 10:05:26 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.pengutronix.de.)
        by metis.ext.pengutronix.de with esmtp (Exim 4.89)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hUAp3-0002Dk-7m; Fri, 24 May 2019 16:05:25 +0200
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     linux-media@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 03/10] media: hantro: print video device name in addition to device node
Date:   Fri, 24 May 2019 16:04:52 +0200
Message-Id: <20190524140459.4002-4-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190524140459.4002-1-p.zabel@pengutronix.de>
References: <20190524140459.4002-1-p.zabel@pengutronix.de>
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

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
 drivers/staging/media/hantro/hantro_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index c1ed3a2eda3f..1d4d5ec8ab19 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -608,7 +608,8 @@ static int hantro_add_func(struct hantro_dev *vpu, unsigned int funcid)
 		goto err_unreg_dev;
 	}
 
-	v4l2_info(&vpu->v4l2_dev, "registered as /dev/video%d\n", vfd->num);
+	v4l2_info(&vpu->v4l2_dev, "registered %s as /dev/video%d\n", vfd->name,
+		  vfd->num);
 
 	return 0;
 
-- 
2.20.1

