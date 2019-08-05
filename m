Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 821A7827FD
	for <lists+linux-media@lfdr.de>; Tue,  6 Aug 2019 01:35:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731227AbfHEXff (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Aug 2019 19:35:35 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:45093 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731219AbfHEXff (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Aug 2019 19:35:35 -0400
Received: by mail-pf1-f196.google.com with SMTP id r1so40409791pfq.12;
        Mon, 05 Aug 2019 16:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dlPssYq0ryvhz0STq2y2DANQYDQwBzmO+X3pNrhAOiU=;
        b=HauhLk8diwPqoMNLaCvVs+Va+/vM1Lotb6yd4g0srzVoCT4ME7KaWNu46fQtchpf/Y
         4jTYQIFp17uXOCGxJEVna4L87qT8UKZ4PxAgbP0E6TajvP0s8uJ8RAlATnruwoMXZ0xQ
         km1KDe2Qx7lImi9sH0snspt9BhAQc6j2B6PdzFEZwxOsk/Mul5as2/6VJiQAcDwXUfNX
         AcbzzFdw4/Ea7UZibCr/bs+/nMXotUYIrcImd2RbnlZKvt0xXYl8v79Cx8tLs1G0goQF
         09ZJu2P2wAhzIzFe8JYfWdcle5OunSW837g9RZb0iDfm/DZBfy2XiEi+hElxP0oulYap
         ikOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dlPssYq0ryvhz0STq2y2DANQYDQwBzmO+X3pNrhAOiU=;
        b=DuT4+CtSU5bUMszr1sRp6VSwBH0NCs0KDUZgp7zgB6IMDx4w4n+S+SF4l/cTwaC7zx
         sYLPCdZAQtRBPKgIdr4C92D8HsnxjyRkfajRf+XOL2x1xmdXmP7CDdCv37G23J/xjptl
         aZow1M7EO+9M/HvNBc2x0mWVc3dLkyQ9lHV6/AuZi18atYuJD1PGVM94IAftqhQ+w+/X
         yO5A6NnsN8cG5xBPi2PTAMmfrhskq5jvXPHS7gycgt6McqJ3ypU/9KhO/vbdoEPmDkFD
         lInYvN1JqZo0gCcVIVQgIQi+vD4Hoy1x2mpw/6rstgQeeKJwYA76HqyZKfU7vNQcAMrg
         sfNw==
X-Gm-Message-State: APjAAAU0OyfakmOKmY0GjJTC+C7YRbDPtawZ4J3iSU/5qY34dUdNWDVa
        lKZ3/3NFW7DIAePUDjk7Lddr9q4L
X-Google-Smtp-Source: APXvYqyC9KlTqQHjqDVHhWoeilDLM2Elce3C2IsDg6J+VQpzucQEZbF8tGngST/M5+v2rf41OtR9fw==
X-Received: by 2002:aa7:956d:: with SMTP id x13mr553906pfq.132.1565048133803;
        Mon, 05 Aug 2019 16:35:33 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id 30sm31296349pjk.17.2019.08.05.16.35.32
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 05 Aug 2019 16:35:33 -0700 (PDT)
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
Subject: [PATCH 16/22] media: imx: csi: Implement get_fwnode_pad
Date:   Mon,  5 Aug 2019 16:34:59 -0700
Message-Id: <20190805233505.21167-17-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190805233505.21167-1-slongerbeam@gmail.com>
References: <20190805233505.21167-1-slongerbeam@gmail.com>
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
index 367e39f5b382..e193f66fa230 100644
--- a/drivers/staging/media/imx/imx-media-csi.c
+++ b/drivers/staging/media/imx/imx-media-csi.c
@@ -1824,9 +1824,32 @@ static void csi_unregistered(struct v4l2_subdev *sd)
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

