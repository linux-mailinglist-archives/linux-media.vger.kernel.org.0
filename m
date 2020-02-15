Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BFF3160019
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2020 20:42:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727697AbgBOTmH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Feb 2020 14:42:07 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:52361 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbgBOTmH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Feb 2020 14:42:07 -0500
Received: by mail-pj1-f65.google.com with SMTP id ep11so5449804pjb.2;
        Sat, 15 Feb 2020 11:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tEFP9EfjLyBSm2GDbhHW2vsbKN5BJT5FKVyhRHQNMY8=;
        b=NeCzqZcsM4ip7J7p8r3xMhsXey+xbtIN2mBvJ1q8bfFgPJcbmjrWbrDeqdjK0DaecD
         Xn6Hx2DveLYiARrGYdhFJqPFL3phkhmYxwMj/taPdb4kAY/PMyVVCVoUzXc/AAGWMq/9
         cmY0pdFaf5/Gk657YOPDH47MNlvWDnyQ67bR/2n8cVvGuUmi16t7Pb3F26FTeQ2RMzdY
         R7xpokIM8VXtXh8FwXuPRrodGtsPNn06qB+IXrlmU1Kew7168WXEqqo9S0B23ax6rAEj
         i1yapst7ruP2VALkb6DRCsokK4vdJWKeEjRqugfgQ3+m6bo63ay3YLHulpWfonSQlgzP
         noDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tEFP9EfjLyBSm2GDbhHW2vsbKN5BJT5FKVyhRHQNMY8=;
        b=gsItkhq2FmKIr2eRI1p25lfPmyVCSHn2HFyvnO830qmJ9+Yg/s5udeipjrJCh9fG69
         jwqiU+PzpiAImhjkODbHeaINGbXM8cVih65T7WlQz+zQmphZOFY5CEJ8NpFKZNq61udw
         4E/rW0BexIBGq8fyVBPnDt6t7Q61txjAABdI2ekz9Y+cE2A7Nzj/KP3Qjj/ksAS1xfyj
         iK663bsTZpsVwliUNz16axtVqK/oPoFdb7kNtUo7eK8wgCZLP2jGhFoQaRvUkhUfM20c
         qcU8eE1uc4rev/Rbpa2iN0SikvCYIqOBYlfRZNdLyxfDKITdYs7keHbMTOBqo94y4ZNe
         FKfQ==
X-Gm-Message-State: APjAAAULWTguaXniWUxteabWHifqYQQVcRYeRQafKVY0Wdnzb95L/lCX
        G9ignskIhiItQ2fdwIzFkH4Vx85zCpY=
X-Google-Smtp-Source: APXvYqx/mg4tIU1tr63Knwf6hjq0RDp8xtlDDNDD8XPHG9TpxACQT79+bFj90QYux56vF+roPlpqSA==
X-Received: by 2002:a17:902:7d93:: with SMTP id a19mr9130882plm.283.1581795726696;
        Sat, 15 Feb 2020 11:42:06 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id q4sm11802751pfl.175.2020.02.15.11.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 11:42:06 -0800 (PST)
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
Subject: [RESEND PATCH v3 03/17] media: imx: csi: Implement get_fwnode_pad op
Date:   Sat, 15 Feb 2020 11:41:22 -0800
Message-Id: <20200215194136.10131-4-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200215194136.10131-1-slongerbeam@gmail.com>
References: <20200215194136.10131-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CSI does not have a 1:1 relationship between fwnode port numbers and
pad indexes. In fact the CSI fwnode device is itself a port which is the
sink, containing only a single fwnode endpoint. Implement media_entity
operation get_fwnode_pad to first verify the given endpoint is the CSI's
sink endpoint, and if so return the CSI sink pad index.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media-csi.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/staging/media/imx/imx-media-csi.c b/drivers/staging/media/imx/imx-media-csi.c
index b60ed4f22f6d..dc5fe25fe7b8 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1825,9 +1825,32 @@ static void csi_unregistered(struct v4l2_subdev *sd)
 		ipu_csi_put(priv->csi);
 }
 
+/*
+ * The CSI has only one fwnode endpoint, at the sink pad. Verify the
+ * endpoint belongs to us, and return CSI_SINK_PAD.
+ */
+static int csi_get_fwnode_pad(struct media_entity *entity,
+			      struct fwnode_endpoint *endpoint)
+{
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
+	struct csi_priv *priv = v4l2_get_subdevdata(sd);
+	struct fwnode_handle *csi_port = dev_fwnode(priv->dev);
+	struct fwnode_handle *csi_ep;
+	int ret;
+
+	csi_ep = fwnode_get_next_child_node(csi_port, NULL);
+
+	ret = endpoint->local_fwnode == csi_ep ? CSI_SINK_PAD : -ENXIO;
+
+	fwnode_handle_put(csi_ep);
+
+	return ret;
+}
+
 static const struct media_entity_operations csi_entity_ops = {
 	.link_setup = csi_link_setup,
 	.link_validate = v4l2_subdev_link_validate,
+	.get_fwnode_pad = csi_get_fwnode_pad,
 };
 
 static const struct v4l2_subdev_core_ops csi_core_ops = {
-- 
2.17.1

