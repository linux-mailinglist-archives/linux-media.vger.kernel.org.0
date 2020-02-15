Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA18B16003B
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2020 20:43:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727772AbgBOTmL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Feb 2020 14:42:11 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45062 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbgBOTmK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Feb 2020 14:42:10 -0500
Received: by mail-pf1-f193.google.com with SMTP id 2so6737045pfg.12;
        Sat, 15 Feb 2020 11:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GoHwA/NUt6bdmcBWMk3GrpTBSbEsSYQ8eBgsnOl6FH8=;
        b=TGhkM8HhZmjY6DuPQb4msMGHcL2dzou1bD6wb1KGAftp1o3QHahLkCxh3w2vLkJLAW
         L+KiqIFB35nAHd5eUFpbR9RaqzFZwb8ZAC/atCwwXQM0Tnje/D2Z4++AprA6vSkwa8js
         8buim4rd11xf7othSwdH1CR9PwauFkp23Iiwv8R62DtUJ65ngGFaZjyaR0i2I+2r9fkv
         lHQdo2tWRyANKH8czra1L2U/nMnigwRTlv7vgR/ovAXu4Q3+roMzvJ9aupaOhLpwPizY
         cO+n85XdHuwByzNr5GPH3/8RZTJYXoLOvvvVoUjCl1A7kix84J9ysgVv04C9X5UiGD3S
         nUXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GoHwA/NUt6bdmcBWMk3GrpTBSbEsSYQ8eBgsnOl6FH8=;
        b=prk0NiyODiQvKhSSpGgYiulqc+RNq4GoH1iYpKDcTbhdIVaT589KhSnumuj1yhZLCy
         fMkrwloQlUzGbpPD/h2Z4uPwQVUUwi67obLlrarij4ULUWAHLRGTfYZSPeFFI8zr3UkM
         Ou+5j2rnJzTcgOR4OZOdQzPeu/hyljJ027szG+j0mNr2jTXlMnMNlPeSfxnf+QdHuDJU
         EU9B1MolIDK1kuIC6d5lMDVmq6gwCsrePvN53G2MM2yar+NX+5y+hgbTGG5+g68GDWjm
         /e2HHtRQ6caicoTykCXoKIsh6YwSPxwr/xf19YtAPyndZ8X2rRXgfAVj8cv5+xSvw7sA
         qvOw==
X-Gm-Message-State: APjAAAWOasZv2gjuqv4ZdN/nF1X1yq48u2ko/3W7ALJ86Ad4wPkCBSnB
        KzaLDo6/aSI8Aa5K6rweZ5x0sdo/LAs=
X-Google-Smtp-Source: APXvYqykL2GsAy4uDFniQNsQVMLOFN4GwHeH/9K6Btq7YRMenUHjMOgBREWJ9t33xXFT+4LdznuKdw==
X-Received: by 2002:aa7:8654:: with SMTP id a20mr9407051pfo.88.1581795729527;
        Sat, 15 Feb 2020 11:42:09 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id q4sm11802751pfl.175.2020.02.15.11.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 11:42:09 -0800 (PST)
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
Subject: [RESEND PATCH v3 04/17] media: imx: mipi csi-2: Implement get_fwnode_pad op
Date:   Sat, 15 Feb 2020 11:41:23 -0800
Message-Id: <20200215194136.10131-5-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200215194136.10131-1-slongerbeam@gmail.com>
References: <20200215194136.10131-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement get_fwnode_pad operation. If the endpoint is owned by the MIPI
CSI-2 receiver, return the endpoint's port number. The MIPI CSI-2 receiver
maps port numbers and pad indexes 1:1.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index c1d1afeea53a..e27a342751fc 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -507,9 +507,37 @@ static int csi2_registered(struct v4l2_subdev *sd)
 				      640, 480, 0, V4L2_FIELD_NONE, NULL);
 }
 
+static int csi2_get_fwnode_pad(struct media_entity *entity,
+			       struct fwnode_endpoint *endpoint)
+{
+	struct v4l2_subdev *sd = media_entity_to_v4l2_subdev(entity);
+	struct csi2_dev *csi2 = sd_to_dev(sd);
+	struct fwnode_handle *csi2_ep;
+
+	/*
+	 * If the endpoint is one of ours, return the endpoint's port
+	 * number. This device maps port numbers and pad indexes 1:1.
+	 */
+	fwnode_graph_for_each_endpoint(dev_fwnode(csi2->dev), csi2_ep) {
+		if (endpoint->local_fwnode == csi2_ep) {
+			struct fwnode_endpoint fwep;
+			int ret;
+
+			ret = fwnode_graph_parse_endpoint(csi2_ep, &fwep);
+
+			fwnode_handle_put(csi2_ep);
+
+			return ret ? ret : fwep.port;
+		}
+	}
+
+	return -ENXIO;
+}
+
 static const struct media_entity_operations csi2_entity_ops = {
 	.link_setup = csi2_link_setup,
 	.link_validate = v4l2_subdev_link_validate,
+	.get_fwnode_pad = csi2_get_fwnode_pad,
 };
 
 static const struct v4l2_subdev_video_ops csi2_video_ops = {
-- 
2.17.1

