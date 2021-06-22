Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDE373B02C1
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 13:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbhFVLbO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 07:31:14 -0400
Received: from retiisi.eu ([95.216.213.190]:59752 "EHLO hillosipuli.retiisi.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230059AbhFVLbL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 07:31:11 -0400
X-Greylist: delayed 409 seconds by postgrey-1.27 at vger.kernel.org; Tue, 22 Jun 2021 07:31:10 EDT
Received: from lanttu.localdomain (unknown [192.168.2.193])
        by hillosipuli.retiisi.eu (Postfix) with ESMTP id EDB27634C8E;
        Tue, 22 Jun 2021 14:21:54 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH 5/6] media: rcar-vin: Remove explicit device availability check
Date:   Tue, 22 Jun 2021 14:21:59 +0300
Message-Id: <20210622112200.13914-6-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210622112200.13914-1-sakari.ailus@linux.intel.com>
References: <20210622112200.13914-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

The fwnode is retrieved using fwnode_graph_get_endpoint_by_id() without
the FWNODE_GRAPH_DEVICE_DISABLED flag set. So there is no need to
explicitly check if the fwnode is available as it always will be when
the check is performed, remove it.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 3b7052ff7117..a24aeda37e74 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -834,13 +834,6 @@ static int rvin_mc_parse_of(struct rvin_dev *vin, unsigned int id)
 		goto out;
 	}
 
-	if (!of_device_is_available(to_of_node(fwnode))) {
-		vin_dbg(vin, "OF device %pOF disabled, ignoring\n",
-			to_of_node(fwnode));
-		ret = -ENOTCONN;
-		goto out;
-	}
-
 	asd = v4l2_async_nf_add_fwnode(&vin->group->notifier, fwnode,
 				       struct v4l2_async_subdev);
 	if (IS_ERR(asd)) {
-- 
2.30.2

