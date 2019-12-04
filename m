Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 305EE1134F7
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2019 19:28:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729371AbfLDS15 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Dec 2019 13:27:57 -0500
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:22342 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728072AbfLDR6M (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Dec 2019 12:58:12 -0500
X-Halon-ID: 9de541bf-16bf-11ea-a00b-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p54ac5865.dip0.t-ipconnect.de [84.172.88.101])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 9de541bf-16bf-11ea-a00b-005056917a89;
        Wed, 04 Dec 2019 18:58:07 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] rcar-vin: Use correct pixel format when aligning format
Date:   Wed,  4 Dec 2019 18:57:59 +0100
Message-Id: <20191204175759.2976251-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When aligning the format the pixel format that is being processed shall
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
2.24.0

