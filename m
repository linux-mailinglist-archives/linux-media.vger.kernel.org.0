Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C55485781
	for <lists+linux-media@lfdr.de>; Thu,  8 Aug 2019 03:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389610AbfHHBTw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Aug 2019 21:19:52 -0400
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:18007 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389605AbfHHBTw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 7 Aug 2019 21:19:52 -0400
X-Halon-ID: 995854ac-b97a-11e9-bdc3-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [145.14.112.32])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 995854ac-b97a-11e9-bdc3-005056917a89;
        Thu, 08 Aug 2019 03:19:43 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 4/6] rcar-vin: Do not reset the crop and compose rectangles in s_fmt
Date:   Thu,  8 Aug 2019 03:18:48 +0200
Message-Id: <20190808011850.21219-5-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190808011850.21219-1-niklas.soderlund+renesas@ragnatech.se>
References: <20190808011850.21219-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The crop and compose rectangles are reset when s_fmt is called
resulting in potentially valid rectangles being lost when updating the
format. Fix this by mapping the rectangles inside the new format.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 8b30267f1636aaf1..5dcd787a9cf96ac9 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -279,8 +279,8 @@ static int rvin_s_fmt_vid_cap(struct file *file, void *priv,
 		return ret;
 
 	vin->format = f->fmt.pix;
-	vin->crop = crop;
-	vin->compose = compose;
+	v4l2_rect_map_inside(&vin->crop, &crop);
+	v4l2_rect_map_inside(&vin->compose, &compose);
 	vin->src_rect = crop;
 
 	return 0;
-- 
2.22.0

