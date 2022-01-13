Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BB3B48DF39
	for <lists+linux-media@lfdr.de>; Thu, 13 Jan 2022 21:52:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232844AbiAMUwH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jan 2022 15:52:07 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:47174 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232824AbiAMUwH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jan 2022 15:52:07 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E2FA697;
        Thu, 13 Jan 2022 21:52:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642107125;
        bh=bFToEwprWlKwzICKEYX76GXGv1yT21Krk7pe7uj0/mY=;
        h=From:To:Cc:Subject:Date:From;
        b=iteBaJ3nE9JRqleaUSWLMCiayOdvPJGTDoXWZ+IpDbAtVcZd61u63z8yjKTA1lktg
         uQhq/zJm5lOr+ROkmOORhSIU1o5xm+ZpFOtWmc/KvOyYoFlPqI58sVJP26RPKPPgTv
         BLNV9EzoE9zWGH21D43cMO9qbU02K0kB8B2htB1I=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Subject: [PATCH] media: i2c: max9286: Implement media entity .link_validate() operation
Date:   Thu, 13 Jan 2022 22:51:50 +0200
Message-Id: <20220113205150.6533-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The MAX9286 has sink pads, so it should implement .link_validate(). Do
so.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/i2c/max9286.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index eb2b8e42335b..b4885d3b3059 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -846,6 +846,10 @@ static const struct v4l2_subdev_internal_ops max9286_subdev_internal_ops = {
 	.open = max9286_open,
 };
 
+static const struct media_entity_operations max9286_media_ops = {
+	.link_validate = v4l2_subdev_link_validate
+};
+
 static int max9286_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	switch (ctrl->id) {
@@ -895,6 +899,7 @@ static int max9286_v4l2_register(struct max9286_priv *priv)
 		goto err_async;
 
 	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	priv->sd.entity.ops = &max9286_media_ops;
 
 	priv->pads[MAX9286_SRC_PAD].flags = MEDIA_PAD_FL_SOURCE;
 	for (i = 0; i < MAX9286_SRC_PAD; i++)
-- 
Regards,

Laurent Pinchart

