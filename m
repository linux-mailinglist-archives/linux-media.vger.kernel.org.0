Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA3615238F
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2020 00:50:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727723AbgBDXtl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Feb 2020 18:49:41 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44642 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727711AbgBDXtl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Feb 2020 18:49:41 -0500
Received: by mail-pg1-f193.google.com with SMTP id g3so4768437pgs.11;
        Tue, 04 Feb 2020 15:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tEFP9EfjLyBSm2GDbhHW2vsbKN5BJT5FKVyhRHQNMY8=;
        b=qmhbDNR95uHywwTR96SOWFHQIuY5BcX1uVAKfd+uicZ/k1fooHXSfNBVaesqjSQuZM
         OQMTcnpW7TEz9K/YUDnRklPs/ToaTpYqRigLVpPQu4QcTCoIPUY150DuIMtiSb4/OEyH
         oJ3emGDquRgVHbaJlQYK9Fd1Ftcovqe1Bk+JATIFT7MVbxmoDSys0IY2ekFO7tQqoxLP
         bhQSL0C/24rpHydkRdHxijxlvhu8YM+ssVxLjZXU8FXyWrn7J88sNdv6x3XgL+gqmTrr
         XzMFB4qltVjlXDCHbOzNZgd94Pr/t6vht9lz9F0xzd+xATy4aNz67yWdpbTWB/kvEusB
         nBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tEFP9EfjLyBSm2GDbhHW2vsbKN5BJT5FKVyhRHQNMY8=;
        b=cBNc6eD+tat9DI80QEgdnb8w3A3ljNuV/VDlIkBkQJmmVRmy+YBs/wxiMdxFpClTV3
         NMg2C7VhQrCaBcxoe9gHmCIdTNoPDZ6ndanoymq0rT/zBrfdelfSJHigoGsMqQjZnzxm
         nlO8xHHoladv04x8IT5wFyAJ8yijyC83ksrL7gDuSoP7b1H1sZVRB2EDplkbOOEBZKKg
         IQbcO/tyoEyxtR0nWgzK+fU5ExJdsQDpS761didmrbjzq2SB/T5rWLgXMSSd5+SzLuLj
         LDjISiw+oL0zVru/A7EO0ipmd8rTP1zWIaltExJxfjt95bj050Stkx8cQxwEGiU8vKkJ
         emKQ==
X-Gm-Message-State: APjAAAVyI/VJ0FFxIFHh48vG770Mnrigtc0tVsBrwbqSoRNiHe4370On
        /lpJhXHYtI5b7p9W37nlPwagWHNN
X-Google-Smtp-Source: APXvYqyIsRF7R9F2VnqpYSRTFRZQXt11C2WQyxtCzzEwR1tv4q2JGNKz08KJv6czrUc3SW0JZ1+R3g==
X-Received: by 2002:a63:9251:: with SMTP id s17mr33348585pgn.127.1580860180704;
        Tue, 04 Feb 2020 15:49:40 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id u2sm24607929pgj.7.2020.02.04.15.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 15:49:40 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org, Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
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
Subject: [PATCH v3 03/17] media: imx: csi: Implement get_fwnode_pad op
Date:   Tue,  4 Feb 2020 15:49:04 -0800
Message-Id: <20200204234918.20425-4-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200204234918.20425-1-slongerbeam@gmail.com>
References: <20200204234918.20425-1-slongerbeam@gmail.com>
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

