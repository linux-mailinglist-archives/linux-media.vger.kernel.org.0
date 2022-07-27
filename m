Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2173758248E
	for <lists+linux-media@lfdr.de>; Wed, 27 Jul 2022 12:37:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbiG0Khq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jul 2022 06:37:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232043AbiG0Khh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jul 2022 06:37:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7E9F474D1
        for <linux-media@vger.kernel.org>; Wed, 27 Jul 2022 03:37:35 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C5943842;
        Wed, 27 Jul 2022 12:37:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658918235;
        bh=wAWO2u9icHUtQqJEtST5UmncCV/f3+RrQD+6P5oIq/0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qpTL23DnM8oWSc1CD24SsP3kBE1UFBW3gWC8cKrSRhiUFLD+WDcopPThrJLuXoARP
         fE3gIWck7Rie9KyClmimVBxeddSRAB1z7FHNmKLy6WYmDiqN7H7CMkKlrX5vt3UJ7s
         rLu4CAezu12IjBBq3v5y04cwJZFHsQP2+G2O7ygY=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v12 24/30] media: subdev: use for_each_active_route() in v4l2_subdev_init_stream_configs()
Date:   Wed, 27 Jul 2022 13:36:33 +0300
Message-Id: <20220727103639.581567-25-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use for_each_active_route() in v4l2_subdev_init_stream_configs().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index f3219c8a6317..97c77b32ca1d 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -929,8 +929,8 @@ static int
 v4l2_subdev_init_stream_configs(struct v4l2_subdev_stream_configs *stream_configs,
 				const struct v4l2_subdev_krouting *routing)
 {
+	struct v4l2_subdev_route *route;
 	u32 num_configs = 0;
-	unsigned int i;
 	u32 format_idx = 0;
 
 	kvfree(stream_configs->configs);
@@ -938,12 +938,7 @@ v4l2_subdev_init_stream_configs(struct v4l2_subdev_stream_configs *stream_config
 	stream_configs->num_configs = 0;
 
 	/* Count number of formats needed */
-	for (i = 0; i < routing->num_routes; ++i) {
-		struct v4l2_subdev_route *route = &routing->routes[i];
-
-		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
-			continue;
-
+	for_each_active_route(routing, route) {
 		/*
 		 * Each route needs a format on both ends of the route, except
 		 * for source streams which only need one format.
@@ -968,13 +963,9 @@ v4l2_subdev_init_stream_configs(struct v4l2_subdev_stream_configs *stream_config
 	 * Fill in the 'pad' and stream' value for each item in the array from
 	 * the routing table
 	 */
-	for (i = 0; i < routing->num_routes; ++i) {
-		struct v4l2_subdev_route *route = &routing->routes[i];
+	for_each_active_route(routing, route) {
 		u32 idx;
 
-		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
-			continue;
-
 		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_SOURCE)) {
 			idx = format_idx++;
 
-- 
2.34.1

