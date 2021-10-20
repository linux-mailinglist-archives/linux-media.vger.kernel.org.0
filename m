Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B410043545A
	for <lists+linux-media@lfdr.de>; Wed, 20 Oct 2021 22:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231690AbhJTUL5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Oct 2021 16:11:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231695AbhJTUL4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Oct 2021 16:11:56 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 073FEC061749
        for <linux-media@vger.kernel.org>; Wed, 20 Oct 2021 13:09:42 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id g39so16665281wmp.3
        for <linux-media@vger.kernel.org>; Wed, 20 Oct 2021 13:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nrAE4aRZDE6t7iD0Y4F3aNM7M8EVXqHIk1u6wQonne4=;
        b=aCOqtUi95m1RfcT2abx53pMwNotN9DphtaXF4lT0oJKrhJlptRMh0uYQz5oYHliIBU
         8A1lRGVyEfG5MRxwaP9UKQ5E23aByXceYzSlMKCuqk9fi5uplHZzC0QmLDOrscV1hHak
         toOotcK5JC8KLr458mvLCYradp1jzj+4AcfXEJ93e8bRLieGdkxC0c5HQ0mxiO6Ejg1o
         9O1MPEIgpB1qeDdS2ujP6AIWVEWxTihxLCfTvwK7eTbEqaPybGa1Co6gyK6Fd4Y4k4nZ
         JPM2/DsCwC0G5n6EGtv0+7UL73e7fmV06C4WffBpfQ/Yqtt+EG6ybWS7BlWBWrbIJcg2
         0Q9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nrAE4aRZDE6t7iD0Y4F3aNM7M8EVXqHIk1u6wQonne4=;
        b=dnJOS6LY5Qo5tKUqTOG8sd+smoUJdv9DF8es7p9Pau/Hwk6x7dSBESVrjoYOoW82yH
         3krVKti0DpfT4uI9SlonnSkFyrKk7E5ZWJPzKHD4YLAPnQ3OKMQAkinEUJZDeU5oAUqE
         8TFupYMkeMS4NgkmT1CErqJ6xoyqNonN0G5R8+uIJeJDC6Yw3GRuO0E9BR2XWH4hFY4q
         IwrY5dH+h3jfmzaBdQdFaXxYGzoxidGgopl7nUkn0ynadGImNNA0VBB/sPHBh+oLD9HP
         Wpc3ZuRJ3yI2ViXttclh1snvgyB1kf3eGu1xqw74xTGMVYbqKECFFNw0miASmBXGI9Wf
         ODTQ==
X-Gm-Message-State: AOAM532L31J2N/z+FWw/k8h6lTAa1k2uldA3JTrUH57PHMTn70VhVOAu
        B7gFSs25+9zFIO2b0W1TiKB+0w==
X-Google-Smtp-Source: ABdhPJxPw5XACmlR3m8nrfLec7lFsnut8zxDPGhEzvjBsTywgE9euNhlodFS8g3gmqG8vb8xkFy/1A==
X-Received: by 2002:a05:600c:1c97:: with SMTP id k23mr16029506wms.80.1634760580534;
        Wed, 20 Oct 2021 13:09:40 -0700 (PDT)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id x7sm2849904wrq.69.2021.10.20.13.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 13:09:40 -0700 (PDT)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/3] media: rcar-vin: Breakout media link creation
Date:   Wed, 20 Oct 2021 22:02:24 +0200
Message-Id: <20211020200225.1956048-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211020200225.1956048-1-niklas.soderlund+renesas@ragnatech.se>
References: <20211020200225.1956048-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In preparation of creating more links to allow for full Virtual Channel
routing within the CSI-2 block break out the link creation logic to a
helper function as the logic will grow in future work.

There is no functional change.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/platform/rcar-vin/rcar-core.c | 38 ++++++++++-----------
 1 file changed, 18 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index bd960c348ba5228c..65ab66a072e9d635 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -909,6 +909,22 @@ static const struct media_device_ops rvin_csi2_media_ops = {
 	.link_notify = rvin_csi2_link_notify,
 };
 
+static int rvin_csi2_add_route(struct rvin_group *group,
+			       const struct rvin_group_route *route)
+
+{
+	struct media_entity *source = &group->remotes[route->csi].subdev->entity;
+	unsigned int source_idx = rvin_group_csi_channel_to_pad(route->channel);
+	struct media_entity *sink = &group->vin[route->vin]->vdev.entity;
+	struct media_pad *source_pad = &source->pads[source_idx];
+	struct media_pad *sink_pad = &sink->pads[0];
+
+	if (media_entity_find_link(source_pad, sink_pad))
+		return 0;
+
+	return media_create_pad_link(source, source_idx, sink, 0, 0);
+}
+
 static int rvin_csi2_setup_links(struct rvin_dev *vin)
 {
 	const struct rvin_group_route *route;
@@ -917,10 +933,6 @@ static int rvin_csi2_setup_links(struct rvin_dev *vin)
 	/* Create all media device links between VINs and CSI-2's. */
 	mutex_lock(&vin->group->lock);
 	for (route = vin->info->routes; route->mask; route++) {
-		struct media_pad *source_pad, *sink_pad;
-		struct media_entity *source, *sink;
-		unsigned int source_idx;
-
 		/* Check that VIN is part of the group. */
 		if (!vin->group->vin[route->vin])
 			continue;
@@ -933,23 +945,9 @@ static int rvin_csi2_setup_links(struct rvin_dev *vin)
 		if (!vin->group->remotes[route->csi].subdev)
 			continue;
 
-		source = &vin->group->remotes[route->csi].subdev->entity;
-		source_idx = rvin_group_csi_channel_to_pad(route->channel);
-		source_pad = &source->pads[source_idx];
-
-		sink = &vin->group->vin[route->vin]->vdev.entity;
-		sink_pad = &sink->pads[0];
-
-		/* Skip if link already exists. */
-		if (media_entity_find_link(source_pad, sink_pad))
-			continue;
-
-		ret = media_create_pad_link(source, source_idx, sink, 0, 0);
-		if (ret) {
-			vin_err(vin, "Error adding link from %s to %s\n",
-				source->name, sink->name);
+		ret = rvin_csi2_add_route(vin->group, route);
+		if (ret)
 			break;
-		}
 	}
 	mutex_unlock(&vin->group->lock);
 
-- 
2.33.1

