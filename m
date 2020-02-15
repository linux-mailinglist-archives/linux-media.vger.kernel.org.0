Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7E116001D
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2020 20:42:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbgBOTmT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Feb 2020 14:42:19 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43742 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727799AbgBOTmS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Feb 2020 14:42:18 -0500
Received: by mail-pg1-f193.google.com with SMTP id u12so6547245pgb.10;
        Sat, 15 Feb 2020 11:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tRajCHkCPnS+6BeYHw+Smokn34AQmfROoq0aYGtX0Dg=;
        b=oARk1DaO3noUsR+qW+pygvrVgG/23PEzrIqLPjadMvcQ9Q5g4UabNbOKwPjarZkhzV
         aqBH5nKan0vW4DQ21C6xvwaS2tB57CuzPbwe1gd+F1wWX1PaLB3mxRVnK8lP7KLdRVGB
         uFsbStRfOSCKi/fLWY5St+NQKNPTVcQ3eGq96LLAdSbLc/BfFpPzagjKRgN1wwsQ846k
         eNW7KmUUIoHQaKw+YzpC4B/JbrHqo55V7jZrWvOndVZuIs0MF0Bi6LqmQjrvhCMwaT+5
         +vMe/QWdX094PXrVOqYz/PZCTOaV1SN93Rubd1YhFC2DVFbsCeb7+VGPrwRTADMogOJx
         y2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tRajCHkCPnS+6BeYHw+Smokn34AQmfROoq0aYGtX0Dg=;
        b=EY2320eoJgdgJllvMeqbWe2PR+rkomt+AdhtOONm7wL8c8RRVr4B3j/PBykDAtDqjl
         ty5tvki7Hn/RjsLFPV9mx5hkmWGWoGg/jcnNsooK1vZr6C+Cl/xYv4/HgW+86EARGJSn
         m6qzfvmze5G68jWA9HgSmFUtivFvTVlu8uMh/yhPbUtn5Qf8XCHvnT+MXe/PYDuMj3no
         BUYq+3i3BqUAi4xLDy8qQ/cRsN5c8uxXrcUq0tIiKasvNHzlPeap6YLbu9Hm1xfadTXP
         PxqAnzQVRXHSltSYPG5BMCqvTjSbBC/6/HybbyfJvRC9NFehVhB46hpWux/yvGqbEcIH
         0o+Q==
X-Gm-Message-State: APjAAAUSxqNVV0AhBI6OqXySgfH2HyrDxikcuzjH/73eLtxKHnlLEsby
        BnirNy8NElFYRQpbDNciK3jSRTbNGEk=
X-Google-Smtp-Source: APXvYqxB+c5KEwcaiWWabRC0Hpows19EuwyJhN0LkZcyzvyObroaOVztlQMSEcc4Sm0hCPvq/m/H5A==
X-Received: by 2002:aa7:8755:: with SMTP id g21mr9501097pfo.36.1581795736519;
        Sat, 15 Feb 2020 11:42:16 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id q4sm11802751pfl.175.2020.02.15.11.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 11:42:16 -0800 (PST)
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
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        devel@driverdev.osuosl.org (open list:STAGING SUBSYSTEM),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX
        / MXC ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: [RESEND PATCH v3 06/17] media: imx: Add imx_media_create_fwnode_pad_link()
Date:   Sat, 15 Feb 2020 11:41:25 -0800
Message-Id: <20200215194136.10131-7-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200215194136.10131-1-slongerbeam@gmail.com>
References: <20200215194136.10131-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add functions to create media links between a source and sink subdevice
based on fwnode endpoint connections between them.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 91 +++++++++++++++++++++
 drivers/staging/media/imx/imx-media.h       |  4 +
 2 files changed, 95 insertions(+)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 0788a1874557..87152bd9af22 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -729,6 +729,97 @@ void imx_media_grp_id_to_sd_name(char *sd_name, int sz, u32 grp_id, int ipu_id)
 }
 EXPORT_SYMBOL_GPL(imx_media_grp_id_to_sd_name);
 
+/*
+ * Look for and create a single fwnode link that connects a source
+ * subdevice to a sink pad.
+ */
+int imx_media_create_fwnode_pad_link(struct v4l2_subdev *src_sd,
+				     struct media_pad *sink)
+{
+	struct fwnode_handle *endpoint;
+
+	/* loop thru the source's fwnode endpoints */
+	fwnode_graph_for_each_endpoint(dev_fwnode(src_sd->dev), endpoint) {
+		struct fwnode_handle *remote_ep;
+		int src_idx, sink_idx, ret;
+		struct media_pad *src;
+
+		remote_ep = fwnode_graph_get_remote_endpoint(endpoint);
+		if (!remote_ep)
+			continue;
+
+		/*
+		 * ask the sink entity to verify that this fwnode link
+		 * actually does connect with the entity, and if so that
+		 * it connects to its requested sink pad.
+		 */
+		sink_idx = media_entity_get_fwnode_pad(sink->entity,
+						       remote_ep,
+						       MEDIA_PAD_FL_SINK);
+		fwnode_handle_put(remote_ep);
+
+		if (sink_idx < 0 || sink_idx != sink->index)
+			continue;
+
+		src_idx = media_entity_get_fwnode_pad(&src_sd->entity,
+						      endpoint,
+						      MEDIA_PAD_FL_SOURCE);
+		if (src_idx < 0)
+			continue;
+
+		/*
+		 * found the fwnode link that works, create the media
+		 * link for it.
+		 */
+
+		fwnode_handle_put(endpoint);
+
+		src = &src_sd->entity.pads[src_idx];
+
+		/* success if it already exists */
+		if (media_entity_find_link(src, sink))
+			return 0;
+
+		dev_dbg(src_sd->dev, "%s:%d -> %s:%d\n",
+			src_sd->entity.name, src_idx,
+			sink->entity->name, sink_idx);
+
+		ret = media_create_pad_link(&src_sd->entity, src_idx,
+					    sink->entity, sink_idx, 0);
+		if (ret)
+			dev_err(src_sd->dev,
+				"%s:%d -> %s:%d failed with %d\n",
+				src_sd->entity.name, src_idx,
+				sink->entity->name, sink_idx, ret);
+
+		return ret;
+	}
+
+	return -ENXIO;
+}
+EXPORT_SYMBOL_GPL(imx_media_create_fwnode_pad_link);
+
+int imx_media_create_fwnode_pad_links(struct v4l2_subdev *src_sd,
+				      struct v4l2_subdev *sink_sd)
+{
+	int i;
+
+	for (i = 0; i < sink_sd->entity.num_pads; i++) {
+		struct media_pad *pad = &sink_sd->entity.pads[i];
+		int ret;
+
+		if (!(pad->flags & MEDIA_PAD_FL_SINK))
+			continue;
+
+		ret = imx_media_create_fwnode_pad_link(src_sd, pad);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(imx_media_create_fwnode_pad_links);
+
 struct v4l2_subdev *
 imx_media_find_subdev_by_fwnode(struct imx_media_dev *imxmd,
 				struct fwnode_handle *fwnode)
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index 11861191324a..f90a65ba4ced 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -183,6 +183,10 @@ int imx_media_ipu_image_to_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 				    struct ipu_image *image);
 void imx_media_grp_id_to_sd_name(char *sd_name, int sz,
 				 u32 grp_id, int ipu_id);
+int imx_media_create_fwnode_pad_link(struct v4l2_subdev *src_sd,
+				     struct media_pad *sink);
+int imx_media_create_fwnode_pad_links(struct v4l2_subdev *src_sd,
+				      struct v4l2_subdev *sink_sd);
 struct v4l2_subdev *
 imx_media_find_subdev_by_fwnode(struct imx_media_dev *imxmd,
 				struct fwnode_handle *fwnode);
-- 
2.17.1

