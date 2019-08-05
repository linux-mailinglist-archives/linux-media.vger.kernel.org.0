Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FF268280B
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2019 01:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731279AbfHEXfl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 19:35:41 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:43635 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731266AbfHEXfl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 19:35:41 -0400
Received: by mail-pl1-f193.google.com with SMTP id 4so30052616pld.10;
        Mon, 05 Aug 2019 16:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0S1ar2fMdERTJzIO99lo9VyZc288UAn1DrH6O+6xG3A=;
        b=Tg9MUibHxcwDQfGvRWXjw3IaHbqAI3CNSNU94W3GDMVrNbYxaWalkgmaZG9xLSdcdC
         RWB/02yluRHJjyCd9jgp/t4tUYWHrBj/Y4Tj3e/05X+9GMEoJwuKvu3ZI6BnbQzoZ6sX
         0Ha64RCnDaDxQ5Mn4igGvJn+cvDlfx9BFinUjymmVINucui/sV9MJopRFBwGsFGAdgOv
         BsSNrturNVt+kJdz96eJTgOyVs86jIDpmHeBY7IyrKP8tC7sVnmaIRI964/ktYq4hoI5
         QH196OBdiu9Lr7dD8F0HUv86fYgx7+E8zI9F472sQo7jzhoNtp1ULH5Fj1gYWEUnIbEE
         0ACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0S1ar2fMdERTJzIO99lo9VyZc288UAn1DrH6O+6xG3A=;
        b=cQl6RgizhOOmlMjZkYwa514ltctO29r9T/hEenVALLw/uF3r7MOeIXh85J/Rc4Is2h
         Kb80gT7dFGHKi/z9pFzDmda4R8KYE5RbsgGzTRzMFFAVQX2WuX/hQ1gwOzzKJXHVW5m1
         6P2TUzzWuBncEXC+bD+bumAVSCwIQ3UwPiUWSeoFubob2nrupYe6+duGal/5PLCTns9h
         WBMmW3VLytEGQUSmQCC2DJLTmPOa7hSTT12nm4CqtjC7znWXGv60sZXjEaDArvZY31aA
         em0dpVyTVd2fOhZdvGh26c1VYDRZJ3Z5Gx4L8UM29snHEX3zJZHG5ZgPjJOT79h1Ni5y
         QYTA==
X-Gm-Message-State: APjAAAVrcNpePH54j+y6F3iWZ/nVN2VFd3oluWEHPWyyoOhQtyyTZ7n5
        d3QyqLYFXZ8UeW3q2Hv5ILE8ubJl
X-Google-Smtp-Source: APXvYqxarRCZVmeKkHTq+3l7c5xuS2KTn9u0u55xlL4X1ShwB8l5jm4IbrYWk7boV6jD2FtQt8b7oA==
X-Received: by 2002:a17:902:bd06:: with SMTP id p6mr243778pls.189.1565048140051;
        Mon, 05 Aug 2019 16:35:40 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id 30sm31296349pjk.17.2019.08.05.16.35.38
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 16:35:39 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        devel@driverdev.osuosl.org (open list:STAGING SUBSYSTEM),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX
        / MXC ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 21/22] media: imx: Use media_create_fwnode_links for external links
Date:   Mon,  5 Aug 2019 16:35:04 -0700
Message-Id: <20190805233505.21167-22-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190805233505.21167-1-slongerbeam@gmail.com>
References: <20190805233505.21167-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The entities external to the i.MX6 IPU and i.MX7 now create the links
to their fwnode-endpoint connected entities in their notifier bound
callbacks.

This should mean that there is no longer a need for the imx-media driver
to create these external fwnode-endpoint based links. But the v4l2-async
framework does not allow multiple subdevice notifiers to contain a
duplicate subdevice in their asd_list. Only the first subdev notifier that
discovers and adds that one subdevice to its asd_list will receive a bound
callback for it. Other subdevices that also have firmware endpoint
connections to this duplicate subdevice will not have it in their asd_list,
and thus will never receive a bound callback for it.

Until there is a solution to that problem, imx_media_create_links() is
still needed to create media links for subdevices that never received a
bound callback.

But media_create_fwnode_links() can now be used to do that work, so
imx_media_create_of_links() and imx_media_create_csi_of_links() are
removed.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 .../staging/media/imx/imx-media-dev-common.c  |  49 ++++----
 drivers/staging/media/imx/imx-media-of.c      | 113 ------------------
 drivers/staging/media/imx/imx-media.h         |   4 -
 3 files changed, 27 insertions(+), 139 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-dev-common.c b/drivers/staging/media/imx/imx-media-dev-common.c
index 66b505f7e8df..4dbe983af030 100644
--- a/drivers/staging/media/imx/imx-media-dev-common.c
+++ b/drivers/staging/media/imx/imx-media-dev-common.c
@@ -36,31 +36,36 @@ static int imx_media_subdev_bound(struct v4l2_async_notifier *notifier,
 static int imx_media_create_links(struct v4l2_async_notifier *notifier)
 {
 	struct imx_media_dev *imxmd = notifier2dev(notifier);
-	struct v4l2_subdev *sd;
+	struct fwnode_handle *sda_fwnode, *sdb_fwnode;
+	struct v4l2_subdev *sda, *sdb;
+
+	list_for_each_entry(sda, &imxmd->v4l2_dev.subdevs, list) {
+		/* links have already been created for the IPU subdevs */
+		if (is_ipu_internal_subdev(sda))
+			continue;
+
+		sda_fwnode = (sda->grp_id & IMX_MEDIA_GRP_ID_IPU_CSI) ?
+			dev_fwnode(sda->dev->parent) :
+			dev_fwnode(sda->dev);
+
+		list_for_each_entry(sdb, &imxmd->v4l2_dev.subdevs, list) {
+			if (sda == sdb)
+				continue;
+			if (is_ipu_internal_subdev(sdb))
+				continue;
+
+			sdb_fwnode = (sdb->grp_id & IMX_MEDIA_GRP_ID_IPU_CSI) ?
+				dev_fwnode(sdb->dev->parent) :
+				dev_fwnode(sdb->dev);
 
-	list_for_each_entry(sd, &imxmd->v4l2_dev.subdevs, list) {
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
 			/*
-			 * if this subdev has fwnode links, create media
-			 * links for them.
+			 * if there are fwnode endpoint connections between
+			 * these subdevs, create media links for them.
 			 */
-			imx_media_create_of_links(imxmd, sd);
-			break;
+			__media_create_fwnode_links(&sda->entity,
+						    sda_fwnode,
+						    &sdb->entity,
+						    sdb_fwnode, 0);
 		}
 	}
 
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
index c42a2cafb8fb..7bdeecd29248 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -238,10 +238,6 @@ void imx_media_unregister_ipu_internal_subdevs(struct imx_media_dev *imxmd);
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

