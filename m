Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC4221C1B6C
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 19:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729955AbgEARQb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 13:16:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728970AbgEARQa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 May 2020 13:16:30 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50F64C061A0E
        for <linux-media@vger.kernel.org>; Fri,  1 May 2020 10:16:30 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id a32so140773pje.5
        for <linux-media@vger.kernel.org>; Fri, 01 May 2020 10:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7nDsABg1OEiBsUmQMmNToGbTWaiUH5u7uhY2MzTbsLk=;
        b=qejat9+KbVys97XNtCdWHUTSOOpS7yDnXM+sqGPR+fcQliDl83JU+0RzHj1lURqhsQ
         /fRv87cIFgeUK8e4h2SYWWybpT6zLy7IR6X2/aZpTZVdpQJv4vC7pt5yHl1tdFBqhKUN
         h+t2mqdmoYxpY55D15tcIcuE0wcXISjy4cct8SRIsnXt5LoCKwz/bpWKGI4MyopDtm1I
         9814exbmQCL60/QnYSIGS38bRj0pKPFncKYgYemK3bFmBOEK7ZL7kRWwAz3MHwnL7zIg
         cpFCvsFgcYbjMW3DtQfjNSx1PhGQY7VRpX7x4IPXip6R/3WYtfekWTluDoMhEwD6BWjK
         tlzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7nDsABg1OEiBsUmQMmNToGbTWaiUH5u7uhY2MzTbsLk=;
        b=i7OhhzaNZ4jqbcx4yFSp0mWUI7fss643Wq3NJFPSd1O/XSAEuWWs7TOZ/hBR+Tuyeg
         Z3TjZD3qYeuJl8cOpC/JW8ngISlGRO1B4sekSvBJBElXjTA00+yHJChACkoUrtYO7rBU
         DgBv1qTVfW4zTNKgc3/vb48s/SAF8kP1IfaIGEyTrEt3VCoijowke2i1Wue1DZv/bk8G
         rfahVdz7N/DxRd9HXVORnP7HWhAT2B+6ABIAAgB8RW4Nso+Ct1Z/kFq8Ukqg5HUow/0l
         Nrv8Sp5jp80A+19aeoD4hHlD5/UKPDKZXvOr/MghgdNP/ONejrA0+jj3x8h7YorX0K+7
         1eCQ==
X-Gm-Message-State: AGi0Puat4HzRjuW+OLBF4Gds+JQfx5Y1O8JPBTlUtQjhg7F1cQ/0vSEj
        z1BKWGLUFKZbyTkNRcCESJ134jmC
X-Google-Smtp-Source: APiQypL7jlgQTp0V3CRUjUj+uiyJ+GOE5XgaAL1/UeXkbLjIpolf3jZmPsunOFDW7cbjx2SIQJfgaQ==
X-Received: by 2002:a17:902:74cb:: with SMTP id f11mr5634181plt.171.1588353389412;
        Fri, 01 May 2020 10:16:29 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id g14sm2733966pfh.49.2020.05.01.10.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 10:16:28 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6 20/22] media: imx: Create missing links from CSI-2 receiver
Date:   Fri,  1 May 2020 10:15:54 -0700
Message-Id: <20200501171556.14731-21-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501171556.14731-1-slongerbeam@gmail.com>
References: <20200501171556.14731-1-slongerbeam@gmail.com>
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
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes in v5:
- imx_media_create_fwnode_pad_link() has been moved to core as
  v4l2_create_fwnode_link().
- use the new group id IMX_MEDIA_GRP_ID_CSI_MUX to look specifically
  for an imx CSI video mux. Suggested by Laurent.
Changes in v4:
- none
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
index 66b505f7e8df..f6ad9631fa0e 100644
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
+		/* skip if not a CSI or a CSI mux */
+		if (!(sd->grp_id & IMX_MEDIA_GRP_ID_IPU_CSI) &&
+		    !(sd->grp_id & IMX_MEDIA_GRP_ID_CSI) &&
+		    !(sd->grp_id & IMX_MEDIA_GRP_ID_CSI_MUX))
+			continue;
+
+		v4l2_create_fwnode_links(csi2, sd);
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
index c5f2aa2f0e98..f17135158029 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -263,10 +263,6 @@ void imx_media_unregister_ipu_internal_subdevs(struct imx_media_dev *imxmd);
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

