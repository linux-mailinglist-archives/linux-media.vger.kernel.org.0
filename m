Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B80660051
	for <lists+linux-media@lfdr.de>; Fri,  5 Jul 2019 06:56:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726696AbfGEE4j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jul 2019 00:56:39 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:59464 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725971AbfGEE4h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 5 Jul 2019 00:56:37 -0400
X-Halon-ID: 402f9487-9ee1-11e9-8d05-005056917f90
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (unknown [145.14.112.32])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id 402f9487-9ee1-11e9-8d05-005056917f90;
        Fri, 05 Jul 2019 06:56:29 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/4] rcar-vin: Do not reset the crop and compose rectangles in s_fmt
Date:   Fri,  5 Jul 2019 06:55:55 +0200
Message-Id: <20190705045557.25463-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190705045557.25463-1-niklas.soderlund+renesas@ragnatech.se>
References: <20190705045557.25463-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The crop and compose rectangles where reset when s_fmt was called
resulting in potentially valid rectangles where lost when updating the
format. Fix this by instead trying to map the rectangles inside the new
format.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-v4l2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
index 2d94e700a473572c..d5e860ba6d9a2409 100644
--- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
+++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
@@ -271,8 +271,8 @@ static int rvin_s_fmt_vid_cap(struct file *file, void *priv,
 		return ret;
 
 	vin->format = f->fmt.pix;
-	vin->crop = crop;
-	vin->compose = compose;
+	v4l2_rect_map_inside(&vin->crop, &crop);
+	v4l2_rect_map_inside(&vin->compose, &compose);
 	vin->src_rect = crop;
 
 	return 0;
-- 
2.21.0

