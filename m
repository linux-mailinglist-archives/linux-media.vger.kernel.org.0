Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A85414C8FDF
	for <lists+linux-media@lfdr.de>; Tue,  1 Mar 2022 17:13:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236059AbiCAQNr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Mar 2022 11:13:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236066AbiCAQNp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Mar 2022 11:13:45 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C9CF3D4BB
        for <linux-media@vger.kernel.org>; Tue,  1 Mar 2022 08:13:04 -0800 (PST)
Received: from deskari.lan (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B72F737CB;
        Tue,  1 Mar 2022 17:12:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1646151166;
        bh=iHhQtUEcyp9FsJ9DL/gxf/trqb5GmnL5NMd5uSjzVgY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=kjGphytyoxvJXqzIK5meFXCTXWjG7TGr6/EtmIJqGpaD982R7RGKTuL4jcLpzKrBi
         7n5mbtyZY9/XfDJaM5hFKnQ72+zXlUbwfTsKnsaO3qKW5u/Q/VpMWnKxZu8oo5N+Mr
         ZuByXl7bAfM4yDaam0OKoKDWOGSJrIhZqrXShTDw=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: [PATCH v11 30/36] media: subdev: Fallback to pad config in v4l2_subdev_get_fmt()
Date:   Tue,  1 Mar 2022 18:11:50 +0200
Message-Id: <20220301161156.1119557-31-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
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

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

If the subdev doesn't implement routing support, fallback to pad config
as the storage for pad formats. This allows using the V4L2 subdev active
state API and the v4l2_subdev_get_fmt() helper in subdev drivers that
don't implement routing support.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index c1cc9b91dba7..7f50871054cd 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1512,8 +1512,14 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
 {
 	struct v4l2_mbus_framefmt *fmt;
 
-	fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
-						  format->stream);
+	if (sd->flags & V4L2_SUBDEV_FL_MULTIPLEXED)
+		fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
+							  format->stream);
+	else if (format->pad < sd->entity.num_pads && format->stream == 0)
+		fmt = v4l2_subdev_get_try_format(sd, state, format->pad);
+	else
+		fmt = NULL;
+
 	if (!fmt)
 		return -EINVAL;
 
-- 
2.25.1

