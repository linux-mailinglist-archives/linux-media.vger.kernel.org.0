Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17DCF1786A2
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 00:43:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728483AbgCCXne (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 18:43:34 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:34372 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728107AbgCCXne (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 18:43:34 -0500
Received: by mail-pl1-f195.google.com with SMTP id j7so145837plt.1
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2020 15:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=bHkoLoAopDh/1dv+BwgYSSiMTnq6CBi7MdRZKVUgkME=;
        b=VLyyd0kltz8/fc8No5wm7uzRRNrmuW1r+LIzH/OFX0K5JU16Cbf5B93EJYquAyVsSJ
         X4ccJ7ntuPQ0LAkFGpjh5PZhCvAMnoTmW7GHrxd4d/7HP5fWrv0hLA+0MlNpSF5VRAFG
         qxixjroFhUFH+p92qjm9OkppDR0/BPX3moo7OGsDExkVNYZhEU9kYnj91AC8KyFrMTKh
         ax3ueRDhjLkVx39709cncNn5wsoqH6Evbr3wcK0JFmuKwmm67ekW55V+eua9icv/CTLn
         IsszwxFRzdVpcLJfzaon5JMui5MoCZUFD8AteK0QbpFsw2GoKPX5skHfGNoH9yEEghjf
         kcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=bHkoLoAopDh/1dv+BwgYSSiMTnq6CBi7MdRZKVUgkME=;
        b=oGj5e1OwJuiKz8kok8orCKPdfEDNF6sVSkqC8BdH8ZdGHidXr3zQ83NVLeWh5WD5ZU
         sQYAfN8kePoks5AMFZ++Hcmm1bQNlgjsMO3Oi331og2b/wMu2vZGLdxFqXnqs3NaO+kp
         XlEzz35o3wxT50AWJHtN0XDpP/zSBkUXbWCGTKXn7lnQg0TGPWcaSOE4/ucT3X5N21ut
         cAM9nnQiARxj6rjDWiKq/4X/nW6eMR7obtMOtxGsa7rUMkQ5OxNDDpVyL03E4RJTVv+p
         I6lErOXkHfITnA6ze6NlJvrEf4BxTzfOBDMmloWf5VY9TGz6fxwOEbfgoXxWqj+2iEka
         9N2g==
X-Gm-Message-State: ANhLgQ1KdF114Wo+4m+F7cnTST4nMwHhuIhYz7fv3CsahCcv15zmDm+3
        KdkSLxuTMU3kApj6iMkHHgqI9Q95V0Y=
X-Google-Smtp-Source: ADFU+vva5TJRM298r9Ngg/vKz7OuF4kS+gb8YGZy2V1PcEwnZV6MlZOK1wBX+O/bMHDwfPuupEQwCw==
X-Received: by 2002:a17:902:bf08:: with SMTP id bi8mr312864plb.305.1583279012653;
        Tue, 03 Mar 2020 15:43:32 -0800 (PST)
Received: from mappy.sklembedded.com ([2605:e000:d445:6a00:8145:3904:f092:dd35])
        by smtp.gmail.com with ESMTPSA id q66sm23540009pgq.50.2020.03.03.15.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 15:43:32 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v4 15/17] media: imx: Create missing links from CSI-2 receiver
Date:   Tue,  3 Mar 2020 15:42:54 -0800
Message-Id: <20200303234256.8928-16-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200303234256.8928-1-slongerbeam@gmail.com>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
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
Changes in v3:
- call a local imx-media utility imx_media_create_fwnode_pad_links().
Changes in v2:
- this is a rewrite of v1 "media: imx: Use media_create_fwnode_links for
  external links", which only adds the missing CSI-2 receiver links.
---
 .../staging/media/imx/imx-media-dev-common.c  |  46 +++----
 drivers/staging/media/imx/imx-media-of.c      | 114 ------------------
 drivers/staging/media/imx/imx-media.h         |   4 -
 3 files changed, 17 insertions(+), 147 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-dev-common.c b/drivers/staging/media/imx/imx-media-dev-common.c
index 66b505f7e8df..f7ad3cbbeec2 100644
--- a/drivers/staging/media/imx/imx-media-dev-common.c
+++ b/drivers/staging/media/imx/imx-media-dev-common.c
@@ -30,41 +30,31 @@ static int imx_media_subdev_bound(struct v4l2_async_notifier *notifier,
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
+	if (!csi2)
+		return;
 
-	return 0;
+	list_for_each_entry(sd, &imxmd->v4l2_dev.subdevs, list) {
+		/* skip if not a CSI or a video mux */
+		if (!(sd->grp_id & IMX_MEDIA_GRP_ID_IPU_CSI) &&
+		    !(sd->grp_id & IMX_MEDIA_GRP_ID_CSI) &&
+		    sd->entity.function != MEDIA_ENT_F_VID_MUX)
+			continue;
+
+		imx_media_create_fwnode_pad_links(csi2, sd);
+	}
 }
 
 /*
@@ -196,9 +186,7 @@ int imx_media_probe_complete(struct v4l2_async_notifier *notifier)
 
 	mutex_lock(&imxmd->mutex);
 
-	ret = imx_media_create_links(notifier);
-	if (ret)
-		goto unlock;
+	imx_media_create_csi2_links(imxmd);
 
 	ret = imx_media_create_pad_vdev_lists(imxmd);
 	if (ret)
diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
index 2d3efd2a6dde..82e13e972e23 100644
--- a/drivers/staging/media/imx/imx-media-of.c
+++ b/drivers/staging/media/imx/imx-media-of.c
@@ -74,117 +74,3 @@ int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
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
-			  struct v4l2_fwnode_link *link)
-{
-	struct v4l2_subdev *remote, *src, *sink;
-	int src_pad, sink_pad;
-
-	if (link->local_port >= sd->entity.num_pads)
-		return -EINVAL;
-
-	remote = imx_media_find_subdev_by_fwnode(imxmd, link->remote_node);
-	if (!remote)
-		return 0;
-
-	if (sd->entity.pads[link->local_port].flags & MEDIA_PAD_FL_SINK) {
-		src = remote;
-		src_pad = link->remote_port;
-		sink = sd;
-		sink_pad = link->local_port;
-	} else {
-		src = sd;
-		src_pad = link->local_port;
-		sink = remote;
-		sink_pad = link->remote_port;
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
-	struct v4l2_fwnode_link link;
-	struct device_node *ep;
-	int ret;
-
-	for_each_endpoint_of_node(sd->dev->of_node, ep) {
-		ret = v4l2_fwnode_parse_link(of_fwnode_handle(ep), &link);
-		if (ret)
-			continue;
-
-		ret = create_of_link(imxmd, sd, &link);
-		v4l2_fwnode_put_link(&link);
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
-	struct device_node *csi_np = csi->dev->of_node;
-	struct device_node *ep;
-
-	for_each_child_of_node(csi_np, ep) {
-		struct fwnode_handle *fwnode, *csi_ep;
-		struct v4l2_fwnode_link link;
-		int ret;
-
-		memset(&link, 0, sizeof(link));
-
-		link.local_node = of_fwnode_handle(csi_np);
-		link.local_port = CSI_SINK_PAD;
-
-		csi_ep = of_fwnode_handle(ep);
-
-		fwnode = fwnode_graph_get_remote_endpoint(csi_ep);
-		if (!fwnode)
-			continue;
-
-		fwnode = fwnode_get_parent(fwnode);
-		fwnode_property_read_u32(fwnode, "reg", &link.remote_port);
-		fwnode = fwnode_get_next_parent(fwnode);
-		if (is_of_node(fwnode) &&
-		    of_node_name_eq(to_of_node(fwnode), "ports"))
-			fwnode = fwnode_get_next_parent(fwnode);
-		link.remote_node = fwnode;
-
-		ret = create_of_link(imxmd, csi, &link);
-		fwnode_handle_put(link.remote_node);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(imx_media_create_csi_of_links);
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index 5f23d852122f..5271b84bea9a 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -248,10 +248,6 @@ void imx_media_unregister_ipu_internal_subdevs(struct imx_media_dev *imxmd);
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

