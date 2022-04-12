Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F80B4FDCE8
	for <lists+linux-media@lfdr.de>; Tue, 12 Apr 2022 13:07:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346287AbiDLKrs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Apr 2022 06:47:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356954AbiDLKpq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Apr 2022 06:45:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C42A5C854
        for <linux-media@vger.kernel.org>; Tue, 12 Apr 2022 02:43:24 -0700 (PDT)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id ECC8C59D;
        Tue, 12 Apr 2022 11:43:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1649756600;
        bh=8/hMOYSDOUiBStvv5ckoI7AROItkWeotddm3pjO+4cM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nQWDEb0r/PHsNzLnhEoPOFDqW1ONCU4lEYwM3D9wxF7geNk7xph1Jm1np3tBT4dtO
         15i7pVs+CfXVd8DXv9muDJkJ4KggxVnwulLoF85Q4zrAEEwQvwWo1Mq7be8rw2nig2
         NMBRLvbA7YhtrJ+tLOmHEc4zkzSBVgPtJXv865Q4=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>, satish.nagireddy@getcruise.com
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v8 02/10] media: v4l2-subdev: drop extra #ifdef
Date:   Tue, 12 Apr 2022 12:42:41 +0300
Message-Id: <20220412094249.695754-3-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412094249.695754-1-tomi.valkeinen@ideasonboard.com>
References: <20220412094249.695754-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

subdev_open() is inside #ifdef CONFIG_VIDEO_V4L2_SUBDEV_API, which
depends on CONFIG_MEDIA_CONTROLLER, so there's no need for an extra

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 30eb50407db5..2f24ef75872b 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -63,7 +63,7 @@ static int subdev_open(struct file *file)
 	v4l2_fh_init(&subdev_fh->vfh, vdev);
 	v4l2_fh_add(&subdev_fh->vfh);
 	file->private_data = &subdev_fh->vfh;
-#if defined(CONFIG_MEDIA_CONTROLLER)
+
 	if (sd->v4l2_dev->mdev && sd->entity.graph_obj.mdev->dev) {
 		struct module *owner;
 
@@ -74,7 +74,6 @@ static int subdev_open(struct file *file)
 		}
 		subdev_fh->owner = owner;
 	}
-#endif
 
 	if (sd->internal_ops && sd->internal_ops->open) {
 		ret = sd->internal_ops->open(sd, subdev_fh);
-- 
2.25.1

