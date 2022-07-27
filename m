Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8076F58248D
	for <lists+linux-media@lfdr.de>; Wed, 27 Jul 2022 12:37:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229953AbiG0Khp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jul 2022 06:37:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232032AbiG0Khh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jul 2022 06:37:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E319D46DAB
        for <linux-media@vger.kernel.org>; Wed, 27 Jul 2022 03:37:35 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5079DF7;
        Wed, 27 Jul 2022 12:37:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658918236;
        bh=oKgG6iMyaxatxpxg+PVtJzCto4AKEoj2DGVfjSV5mQ0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WgMv1inwve3y8rXDJq1GG3pqTPZFrigoorVjECfaN5Xl1TVYtkDwE+JoQazZU5MxV
         GIv/EcRXkTx4Pz66L24C1mdfpXKRld8fuQL6B4ve867lIFsEGZYxB49j9+Egr6mZwX
         66FQ29Vp4OeRT046lN0IVbSNakztmrBJnUSbG1ic=
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
Subject: [PATCH v12 25/30] media: subdev: use for_each_active_route() in v4l2_link_validate_get_streams()
Date:   Wed, 27 Jul 2022 13:36:34 +0300
Message-Id: <20220727103639.581567-26-tomi.valkeinen@ideasonboard.com>
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

Use for_each_active_route() in v4l2_link_validate_get_streams().

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 97c77b32ca1d..2fc999b1b6c1 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1099,10 +1099,10 @@ static int v4l2_link_validate_get_streams(struct media_link *link,
 {
 	static const u32 default_streams[] = { 0 };
 	struct v4l2_subdev_krouting *routing;
+	struct v4l2_subdev_route *route;
 	struct v4l2_subdev *subdev;
 	u32 num_streams;
 	u32 *streams;
-	unsigned int i;
 	struct v4l2_subdev_state *state;
 	int ret;
 
@@ -1128,16 +1128,12 @@ static int v4l2_link_validate_get_streams(struct media_link *link,
 
 	num_streams = 0;
 
-	for (i = 0; i < routing->num_routes; ++i) {
-		struct v4l2_subdev_route *route = &routing->routes[i];
+	for_each_active_route(routing, route) {
 		int j;
 		u32 route_pad;
 		u32 route_stream;
 		u32 link_pad;
 
-		if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
-			continue;
-
 		if (is_source) {
 			route_pad = route->source_pad;
 			route_stream = route->source_stream;
-- 
2.34.1

