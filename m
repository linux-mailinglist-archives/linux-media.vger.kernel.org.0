Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CED6A4C8FCC
	for <lists+linux-media@lfdr.de>; Tue,  1 Mar 2022 17:12:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236027AbiCAQNY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 11:13:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236023AbiCAQNX (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 11:13:23 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D73C3BA72
        for <linux-media@vger.kernel.org>; Tue,  1 Mar 2022 08:12:40 -0800 (PST)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE5811C6D;
        Tue,  1 Mar 2022 17:12:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646151150;
        bh=QaZnVYtP44p5RMPO+s/0RGCjJXXS80cKFLpVtiBSbDE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=p5sxdxNVoeyxUfBZTTJPmPURVa25KDF2tQUjuHYiO4kNmoRdUi1XAIO5vx3AEoJ1e
         m+luKxvI+TXwkImDwxyR+uggQWZnYLqXrYGD8U9xv5KdMc7fkGwyg0QKoZGyxAzsYA
         SNH1m0v8nTmGjJzeLPEi2UproXXbV64yx9sCLyvU=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v11 11/36] media: entity: Skip link validation for pads to which there is no route
Date:   Tue,  1 Mar 2022 18:11:31 +0200
Message-Id: <20220301161156.1119557-12-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Sakari Ailus <sakari.ailus@linux.intel.com>

Links are validated along the pipeline which is about to start streaming.
Not all the pads in entities that are traversed along that pipeline are
part of the pipeline, however. Skip the link validation for such pads.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 323e44d16f7b..6a4e1bbfd961 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -484,6 +484,11 @@ __must_check int __media_pipeline_start(struct media_pad *pad,
 				link->sink->entity == entity ?
 				link->sink : link->source;
 
+			/* Ignore pads to which there is no route. */
+			if (!media_entity_has_route(entity, pad->index,
+						    other_pad->index))
+				continue;
+
 			/* Mark that a pad is connected by a link. */
 			bitmap_clear(has_no_links, other_pad->index, 1);
 
-- 
2.25.1

