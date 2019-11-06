Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9979F2285
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2019 00:25:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbfKFXZ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 18:25:57 -0500
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:54644 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727296AbfKFXZ5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 6 Nov 2019 18:25:57 -0500
X-Halon-ID: 705847ec-00ec-11ea-837a-0050569116f7
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [84.172.88.101])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id 705847ec-00ec-11ea-837a-0050569116f7;
        Thu, 07 Nov 2019 00:23:31 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] rcar-vin: Use correct pixel format when aligning format
Date:   Thu,  7 Nov 2019 00:25:46 +0100
Message-Id: <20191106232546.2332745-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When aligning the format the pixel format that are being processed shall
be used to figure out alignment constraints, not the currently active
pixel format. The alignment might be part of a try operation and shall
not be effected by the active format. Fix this by looking at the correct
pixel format.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 62d308a4ddaee82e..339cb2de111de166 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -149,7 +149,7 @@ static void rvin_format_align(struct rvin_dev *vin, struct v4l2_pix_format *pix)
 	}
 
 	/* HW limit width to a multiple of 32 (2^5) for NV12/16 else 2 (2^1) */
-	switch (vin->format.pixelformat) {
+	switch (pix->pixelformat) {
 	case V4L2_PIX_FMT_NV12:
 	case V4L2_PIX_FMT_NV16:
 		walign = 5;
-- 
2.23.0

