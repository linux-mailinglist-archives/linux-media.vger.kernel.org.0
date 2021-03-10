Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C884E3341FE
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 16:48:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233370AbhCJPrP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 10:47:15 -0500
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:2476 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232931AbhCJPrM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 10:47:12 -0500
X-Halon-ID: dba99f96-81b7-11eb-b73f-0050569116f7
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-03.atm.binero.net (Halon) with ESMTPA
        id dba99f96-81b7-11eb-b73f-0050569116f7;
        Wed, 10 Mar 2021 16:47:10 +0100 (CET)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] media: rcar-vin: Remove explicit device availability check
Date:   Wed, 10 Mar 2021 16:47:01 +0100
Message-Id: <20210310154701.3561914-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The fwnode is retrieved using fwnode_graph_get_endpoint_by_id() without
the FWNODE_GRAPH_DEVICE_DISABLED flag set. So there is no need to
explicitly check if the fwnode is available as it always will be when
the check is performed, remove it.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index cb3025992817d625..adcf271ae0a0150d 100644
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
 	asd = v4l2_async_notifier_add_fwnode_subdev(&vin->group->notifier,
 						    fwnode,
 						    struct v4l2_async_subdev);
-- 
2.30.1

