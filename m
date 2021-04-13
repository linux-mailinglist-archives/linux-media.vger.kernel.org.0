Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A285A35E5E7
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 20:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347519AbhDMSEg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Apr 2021 14:04:36 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:27709 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230415AbhDMSE2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 14:04:28 -0400
X-Halon-ID: a31cbe7f-9c82-11eb-aed0-005056917f90
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-02.atm.binero.net (Halon) with ESMTPA
        id a31cbe7f-9c82-11eb-aed0-005056917f90;
        Tue, 13 Apr 2021 20:04:06 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 07/11] rcar-vin: Extend group notifier DT parser to work with any port
Date:   Tue, 13 Apr 2021 20:02:49 +0200
Message-Id: <20210413180253.2575451-8-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The R-Car VIN group notifier will be extend to support a new group of
subdevices, the R-Car ISP channel selector in addition to the existing
R-Car CSI-2 receiver subdevices.

The existing DT parsing code can be reused if the port and max number of
endpoints are provided as parameters instead of being hard-coded. While
at it align the group notifier parser function names with the rest of
the driver.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index d951f739b3a9a034..2628637084ae2aa9 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -506,7 +506,8 @@ static const struct v4l2_async_notifier_operations rvin_group_notify_ops = {
 	.complete = rvin_group_notify_complete,
 };
 
-static int rvin_mc_parse_of(struct rvin_dev *vin, unsigned int id)
+static int rvin_group_parse_of(struct rvin_dev *vin, unsigned int port,
+			       unsigned int id)
 {
 	struct fwnode_handle *ep, *fwnode;
 	struct v4l2_fwnode_endpoint vep = {
@@ -515,7 +516,7 @@ static int rvin_mc_parse_of(struct rvin_dev *vin, unsigned int id)
 	struct v4l2_async_subdev *asd;
 	int ret;
 
-	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), 1, id, 0);
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), port, id, 0);
 	if (!ep)
 		return 0;
 
@@ -563,7 +564,8 @@ static void rvin_group_notifier_cleanup(struct rvin_dev *vin)
 	mutex_unlock(&vin->group->lock);
 }
 
-static int rvin_mc_parse_of_graph(struct rvin_dev *vin)
+static int rvin_group_notifier_init(struct rvin_dev *vin, unsigned int port,
+				    unsigned int max_id)
 {
 	unsigned int count = 0, vin_mask = 0;
 	unsigned int i, id;
@@ -589,19 +591,18 @@ static int rvin_mc_parse_of_graph(struct rvin_dev *vin)
 	v4l2_async_notifier_init(&vin->group->notifier);
 
 	/*
-	 * Have all VIN's look for CSI-2 subdevices. Some subdevices will
-	 * overlap but the parser function can handle it, so each subdevice
-	 * will only be registered once with the group notifier.
+	 * Some subdevices may overlap but the parser function can handle it and
+	 * each subdevice will only be registered once with the group notifier.
 	 */
 	for (i = 0; i < RCAR_VIN_NUM; i++) {
 		if (!(vin_mask & BIT(i)))
 			continue;
 
-		for (id = 0; id < RVIN_CSI_MAX; id++) {
+		for (id = 0; id < max_id; id++) {
 			if (vin->group->remotes[id].asd)
 				continue;
 
-			ret = rvin_mc_parse_of(vin->group->vin[i], id);
+			ret = rvin_group_parse_of(vin->group->vin[i], port, id);
 			if (ret)
 				return ret;
 		}
@@ -981,7 +982,7 @@ static int rvin_csi2_init(struct rvin_dev *vin)
 	if (ret && ret != -ENODEV)
 		goto err_group;
 
-	ret = rvin_mc_parse_of_graph(vin);
+	ret = rvin_group_notifier_init(vin, 1, RVIN_CSI_MAX);
 	if (ret)
 		goto err_parallel;
 
-- 
2.31.1

