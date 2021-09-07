Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C507F402B33
	for <lists+linux-media@lfdr.de>; Tue,  7 Sep 2021 16:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344244AbhIGO5z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Sep 2021 10:57:55 -0400
Received: from comms.puri.sm ([159.203.221.185]:41528 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231362AbhIGO5z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Sep 2021 10:57:55 -0400
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 8C9EDDFA96;
        Tue,  7 Sep 2021 07:56:48 -0700 (PDT)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id JEFBl3aCJ9Q9; Tue,  7 Sep 2021 07:56:47 -0700 (PDT)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     ezequiel@collabora.com, p.zabel@pengutronix.de, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH] media: hantro: Fix media device bus_info string
Date:   Tue,  7 Sep 2021 16:56:37 +0200
Message-Id: <20210907145637.3161395-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Even if model and bus_info currently both are 32 bytes large, use
the correct array size for bus_info.

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 drivers/staging/media/hantro/hantro_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
index 5f8e13eeeccc..f23fc14b3562 100644
--- a/drivers/staging/media/hantro/hantro_drv.c
+++ b/drivers/staging/media/hantro/hantro_drv.c
@@ -980,7 +980,7 @@ static int hantro_probe(struct platform_device *pdev)
 	vpu->mdev.dev = vpu->dev;
 	strscpy(vpu->mdev.model, DRIVER_NAME, sizeof(vpu->mdev.model));
 	strscpy(vpu->mdev.bus_info, "platform: " DRIVER_NAME,
-		sizeof(vpu->mdev.model));
+		sizeof(vpu->mdev.bus_info));
 	media_device_init(&vpu->mdev);
 	vpu->mdev.ops = &hantro_m2m_media_ops;
 	vpu->v4l2_dev.mdev = &vpu->mdev;
-- 
2.30.2

