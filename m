Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DAB51084A7
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2019 20:07:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727117AbfKXTHg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 24 Nov 2019 14:07:36 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46722 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727113AbfKXTHg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 24 Nov 2019 14:07:36 -0500
Received: by mail-pl1-f194.google.com with SMTP id k20so964197pll.13
        for <linux-media@vger.kernel.org>; Sun, 24 Nov 2019 11:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OkkbpuVrsDEczJ8S9HRvlV+n1naGN5QgjJsGUUqNzOk=;
        b=fgfZcyFL3uipWXkBO8JghY/CKId/gwY+d6iePJ5hNPbdKyemOpChbFJ/lo/WNqIi10
         pG+7e14hiernRjfKxeCgCc4e9hStpxM2bnVcPSP4ESYHjWOW0RG76eSZc0BFDSg8Vu09
         lDZ0wWeKlZodXT3vB/QwnsYnDGjncC4fiZELoNJH4Uh3QVqOsZlfMvad7K+CmBH3LO4F
         4tXVt5Qbm7CjBRiQjsCbzlRhFRGE5WkqjJGxDsUuph9eAm9BBO13xD1QZV0ew4CWjbPc
         B51wFrhMGuCNJcxb5tB6OV4MVn1m/MONHsBrdmZ2rX+74AlteF9JAXpeURhVoiCvhfKY
         N1/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OkkbpuVrsDEczJ8S9HRvlV+n1naGN5QgjJsGUUqNzOk=;
        b=PiXvOIJrCHYi7TfGVR1WjRg5SKwGAEjHCOc4YH6swVJn+FLyAaNpCc1FSfB/zNZ8EC
         n/jTZZL/iJLNn/vL25Z6PLF53Crt7gdj8wFcnCaRlml1CUQRXl3Ki6++gdte2ot/U5Ib
         ItAPka3J0FUnK4cxnYz8kzQoZZEZx1P4ObhtM3NvViV6xN8P+A2NSvl+qSsAU64u9pqX
         sTkbclMhu11zOSU4xaALBw1v4WrrD+/I4y7l8Pi1fySSVgOaLpf8KzGim967QHd1zPMe
         vxMtvXElXm0Ot4XF6WhvAsBeg764I959V61kqpD1787t0FyxrU0qEoEO8tVdo/T8tvYO
         t7NA==
X-Gm-Message-State: APjAAAUd3ZsJQtNax5kQB/WgkVqNTP6NXBQG8b5H0ccJOqEcX9b5c7Yv
        AT3sXVdPbAshZlycIVpb8pR3/g0DDeU=
X-Google-Smtp-Source: APXvYqw98Z1WgneXjQEmuSaQpPAIr+gdx9DKjuQ3bS0t70vA20CACn2BDFM7QV45PgOVOWmREvmZlw==
X-Received: by 2002:a17:90a:230b:: with SMTP id f11mr3786367pje.124.1574622454952;
        Sun, 24 Nov 2019 11:07:34 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id r20sm5367801pgo.74.2019.11.24.11.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2019 11:07:34 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v2 22/23] media: imx: Create missing links from CSI-2 receiver
Date:   Sun, 24 Nov 2019 11:07:02 -0800
Message-Id: <20191124190703.12138-23-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191124190703.12138-1-slongerbeam@gmail.com>
References: <20191124190703.12138-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The entities external to the i.MX6 IPU and i.MX7 now create the links
to their fwnode-endpoint connected entities in their notifier bound
callbacks. Which means imx_media_create_of_links() and
imx_media_create_csi_of_links() are no longer needed and are removed.

However there is still one case in which imx-media needs to create
fwnode-endpoint based links at probe completion. The v4l2-async framework
does not allow multiple subdevice notifiers to contain a duplicate
subdevice in their asd_list. Only the first subdev notifier that discovers
and adds that one subdevice to its asd_list will receive a bound callback
for it. Other subdevices that also have firmware endpoint connections to
this duplicate subdevice will not have it in their asd_list, and thus will
never receive a bound callback for it. In the case of imx-media, the one
duplicate subdevice in question is the i.MX6 MIPI CSI-2 receiver.

Until there is a solution to that problem, rewrite imx_media_create_links()
to add the missing links from the CSI-2 receiver to the CSIs and CSI muxes.
The function is renamed imx_media_create_csi2_links().

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
Changes in v2:
- this is a rewrite of v1 "media: imx: Use media_create_fwnode_links for
  external links", which only adds the missing CSI-2 receiver links.
---
 .../staging/media/imx/imx-media-dev-common.c  |  60 +++++-----
 drivers/staging/media/imx/imx-media-of.c      | 113 ------------------
 drivers/staging/media/imx/imx-media.h         |   4 -
 3 files changed, 31 insertions(+), 146 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-dev-common.c b/drivers/staging/media/imx/imx-media-dev-common.c
index 66b505f7e8df..8acf2f2e28c6 100644
--- a/drivers/staging/media/imx/imx-media-dev-common.c
+++ b/drivers/staging/media/imx/imx-media-dev-common.c
@@ -30,41 +30,45 @@ static int imx_media_subdev_bound(struct v4l2_async_notifier *notifier,
 }
 
 /*
- * Create the media links for all subdevs that registered.
+ * Create the missing media links from the CSI-2 receiver.
  * Called after all async subdevs have bound.
  */
-static int imx_media_create_links(struct v4l2_async_notifier *notifier)
+static void imx_media_create_csi2_links(struct imx_media_dev *imxmd)
 {
-	struct imx_media_dev *imxmd = notifier2dev(notifier);
-	struct v4l2_subdev *sd;
+	struct v4l2_subdev *sd, *csi2 = NULL;
 
 	list_for_each_entry(sd, &imxmd->v4l2_dev.subdevs, list) {
-		switch (sd->grp_id) {
-		case IMX_MEDIA_GRP_ID_IPU_VDIC:
-		case IMX_MEDIA_GRP_ID_IPU_IC_PRP:
-		case IMX_MEDIA_GRP_ID_IPU_IC_PRPENC:
-		case IMX_MEDIA_GRP_ID_IPU_IC_PRPVF:
-			/*
-			 * links have already been created for the
-			 * sync-registered subdevs.
-			 */
-			break;
-		case IMX_MEDIA_GRP_ID_IPU_CSI0:
-		case IMX_MEDIA_GRP_ID_IPU_CSI1:
-		case IMX_MEDIA_GRP_ID_CSI:
-			imx_media_create_csi_of_links(imxmd, sd);
-			break;
-		default:
-			/*
-			 * if this subdev has fwnode links, create media
-			 * links for them.
-			 */
-			imx_media_create_of_links(imxmd, sd);
+		if (sd->grp_id == IMX_MEDIA_GRP_ID_CSI2) {
+			csi2 = sd;
 			break;
 		}
 	}
 
-	return 0;
+	if (!csi2)
+		return;
+
+	list_for_each_entry(sd, &imxmd->v4l2_dev.subdevs, list) {
+		struct fwnode_handle *fwnode;
+
+		/* skip if not a CSI or a video mux */
+		if (!(sd->grp_id & IMX_MEDIA_GRP_ID_IPU_CSI) &&
+		    !(sd->grp_id & IMX_MEDIA_GRP_ID_CSI) &&
+		    sd->entity.function != MEDIA_ENT_F_VID_MUX)
+			continue;
+
+		fwnode = (sd->grp_id & IMX_MEDIA_GRP_ID_IPU_CSI) ?
+			dev_fwnode(sd->dev->parent) :
+			dev_fwnode(sd->dev);
+
+		/*
+		 * if there are fwnode endpoint connections between
+		 * the CSI-2 receiver and this CSI or video-mux,
+		 * create media links for them.
+		 */
+		__media_create_fwnode_links(&csi2->entity,
+					    dev_fwnode(csi2->dev),
+					    &sd->entity, fwnode, 0);
+	}
 }
 
 /*
@@ -196,9 +200,7 @@ int imx_media_probe_complete(struct v4l2_async_notifier *notifier)
 
 	mutex_lock(&imxmd->mutex);
 
-	ret = imx_media_create_links(notifier);
-	if (ret)
-		goto unlock;
+	imx_media_create_csi2_links(imxmd);
 
 	ret = imx_media_create_pad_vdev_lists(imxmd);
 	if (ret)
diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
index 736c954a8ff5..82e13e972e23 100644
--- a/drivers/staging/media/imx/imx-media-of.c
+++ b/drivers/staging/media/imx/imx-media-of.c
@@ -74,116 +74,3 @@ int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
 	return ret;
 }
 EXPORT_SYMBOL_GPL(imx_media_add_of_subdevs);
-
-/*
- * Create a single media link to/from sd using a fwnode link.
- *
- * NOTE: this function assumes an OF port node is equivalent to
- * a media pad (port id equal to media pad index), and that an
- * OF endpoint node is equivalent to a media link.
- */
-static int create_of_link(struct imx_media_dev *imxmd,
-			  struct v4l2_subdev *sd,
-			  struct fwnode_link *link)
-{
-	struct v4l2_subdev *remote, *src, *sink;
-	int src_pad, sink_pad;
-
-	if (link->local.port >= sd->entity.num_pads)
-		return -EINVAL;
-
-	remote = imx_media_find_subdev_by_fwnode(imxmd,
-						 link->remote_port_parent);
-	if (!remote)
-		return 0;
-
-	if (sd->entity.pads[link->local.port].flags & MEDIA_PAD_FL_SINK) {
-		src = remote;
-		src_pad = link->remote.port;
-		sink = sd;
-		sink_pad = link->local.port;
-	} else {
-		src = sd;
-		src_pad = link->local.port;
-		sink = remote;
-		sink_pad = link->remote.port;
-	}
-
-	/* make sure link doesn't already exist before creating */
-	if (media_entity_find_link(&src->entity.pads[src_pad],
-				   &sink->entity.pads[sink_pad]))
-		return 0;
-
-	v4l2_info(sd->v4l2_dev, "%s:%d -> %s:%d\n",
-		  src->name, src_pad, sink->name, sink_pad);
-
-	return media_create_pad_link(&src->entity, src_pad,
-				     &sink->entity, sink_pad, 0);
-}
-
-/*
- * Create media links to/from sd using its device-tree endpoints.
- */
-int imx_media_create_of_links(struct imx_media_dev *imxmd,
-			      struct v4l2_subdev *sd)
-{
-	struct fwnode_handle *endpoint;
-	struct fwnode_link link;
-	int ret;
-
-	fwnode_graph_for_each_endpoint(dev_fwnode(sd->dev), endpoint) {
-		ret = fwnode_graph_parse_link(endpoint, &link);
-		if (ret)
-			continue;
-
-		ret = create_of_link(imxmd, sd, &link);
-		fwnode_graph_put_link(&link);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(imx_media_create_of_links);
-
-/*
- * Create media links to the given CSI subdevice's sink pads,
- * using its device-tree endpoints.
- */
-int imx_media_create_csi_of_links(struct imx_media_dev *imxmd,
-				  struct v4l2_subdev *csi)
-{
-	struct fwnode_handle *csi_np = dev_fwnode(csi->dev);
-	struct fwnode_handle *csi_ep;
-
-	fwnode_for_each_child_node(csi_np, csi_ep) {
-		struct fwnode_handle *fwnode;
-		struct fwnode_link link;
-		int ret;
-
-		memset(&link, 0, sizeof(link));
-
-		link.local_port_parent = csi_np;
-		link.local.port = CSI_SINK_PAD;
-
-		fwnode = fwnode_graph_get_remote_endpoint(csi_ep);
-		if (!fwnode)
-			continue;
-
-		fwnode = fwnode_get_parent(fwnode);
-		fwnode_property_read_u32(fwnode, "reg", &link.remote.port);
-		fwnode = fwnode_get_next_parent(fwnode);
-		if (is_of_node(fwnode) &&
-		    of_node_name_eq(to_of_node(fwnode), "ports"))
-			fwnode = fwnode_get_next_parent(fwnode);
-		link.remote_port_parent = fwnode;
-
-		ret = create_of_link(imxmd, csi, &link);
-		fwnode_handle_put(link.remote_port_parent);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(imx_media_create_csi_of_links);
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index 3363af07a5ca..d462759f583c 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -244,10 +244,6 @@ void imx_media_unregister_ipu_internal_subdevs(struct imx_media_dev *imxmd);
 /* imx-media-of.c */
 int imx_media_add_of_subdevs(struct imx_media_dev *dev,
 			     struct device_node *np);
-int imx_media_create_of_links(struct imx_media_dev *imxmd,
-			      struct v4l2_subdev *sd);
-int imx_media_create_csi_of_links(struct imx_media_dev *imxmd,
-				  struct v4l2_subdev *csi);
 int imx_media_of_add_csi(struct imx_media_dev *imxmd,
 			 struct device_node *csi_np);
 
-- 
2.17.1

