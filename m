Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73E29AADCB
	for <lists+linux-media@lfdr.de>; Thu,  5 Sep 2019 23:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732683AbfIEVZ3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Sep 2019 17:25:29 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:22365 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731259AbfIEVZ3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Sep 2019 17:25:29 -0400
X-Halon-ID: a8a5b8eb-d023-11e9-903a-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [84.172.84.18])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id a8a5b8eb-d023-11e9-903a-005056917f90;
        Thu, 05 Sep 2019 23:25:22 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] rcar-vin: Use bytes per line instead of width for UV offset
Date:   Thu,  5 Sep 2019 23:25:17 +0200
Message-Id: <20190905212517.7872-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The image size is doubled for NV16 and is calculated as bytesperline *
height * 2 to accommodate the split of UV data. When writing the offset
to hardware width is used instead of bytesperline, fix this.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
index c7859b329dd4f02a..af4f774149f08597 100644
--- a/drivers/media/platform/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/rcar-vin/rcar-dma.c
@@ -703,8 +703,8 @@ static int rvin_setup(struct rvin_dev *vin)
 	switch (vin->format.pixelformat) {
 	case V4L2_PIX_FMT_NV16:
 		rvin_write(vin,
-			   ALIGN(vin->format.width * vin->format.height, 0x80),
-			   VNUVAOF_REG);
+			   ALIGN(vin->format.bytesperline * vin->format.height,
+				 0x80), VNUVAOF_REG);
 		dmr = VNDMR_DTMD_YCSEP;
 		output_is_yuv = true;
 		break;
-- 
2.23.0

