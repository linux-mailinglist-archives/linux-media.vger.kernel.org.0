Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C196837654A
	for <lists+linux-media@lfdr.de>; Fri,  7 May 2021 14:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236820AbhEGMiG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 May 2021 08:38:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236685AbhEGMiF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 May 2021 08:38:05 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13AEAC061574
        for <linux-media@vger.kernel.org>; Fri,  7 May 2021 05:37:06 -0700 (PDT)
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EDEC3ACF;
        Fri,  7 May 2021 14:37:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1620391024;
        bh=ujWbShictQzSPtJxmY+BOuJqQsuCDncrDAXqtk/0Mfc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uA4xeSC/mCA1pvyI4RsFEpjZl8CFD3jh8LSZXTl+QSvaYeYwyFFQRhhUd4oad9LWO
         UTNWKmPJJgPWiolYUkkbwsd2iPzdEC3tJ7PnLErkO2vin9iozkbz7SLlzjxRLTnn4n
         7bO+7RQDLQRudhHj4bk7iI2gHleFs1rMpVgfFplE=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>, john.wei@mediatek.com,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [RFC 09/11] v4l: subdev: add routing & stream config to v4l2_subdev_state
Date:   Fri,  7 May 2021 15:35:56 +0300
Message-Id: <20210507123558.146948-10-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210507123558.146948-1-tomi.valkeinen@ideasonboard.com>
References: <20210507123558.146948-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add routing and stream_configs to struct v4l2_subdev_state. This lets
the drivers to implement V4L2_SUBDEV_FORMAT_TRY support for routing and
the stream configurations.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 3 +++
 include/media/v4l2-subdev.h           | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 52e4290aa8a2..0acc2607b78c 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1216,6 +1216,9 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_alloc_state);
 
 void v4l2_subdev_free_state(struct v4l2_subdev_state *state)
 {
+	v4l2_subdev_free_routing(&state->routing);
+	v4l2_free_stream_configs(&state->stream_configs);
+
 	kvfree(state->pads);
 	kvfree(state);
 }
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 36be66e18abc..1c3de4a0606e 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -706,6 +706,9 @@ struct v4l2_subdev_krouting {
  */
 struct v4l2_subdev_state {
 	struct v4l2_subdev_pad_config *pads;
+
+	struct v4l2_subdev_krouting routing;
+	struct v4l2_subdev_stream_configs stream_configs;
 };
 
 /**
-- 
2.25.1

