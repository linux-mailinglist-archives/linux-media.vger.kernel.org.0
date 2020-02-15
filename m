Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DAE0160025
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2020 20:42:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727930AbgBOTm3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Feb 2020 14:42:29 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:37410 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727916AbgBOTm2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Feb 2020 14:42:28 -0500
Received: by mail-pj1-f68.google.com with SMTP id m13so5499108pjb.2;
        Sat, 15 Feb 2020 11:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=h5BHRotCYsy0a67S2KVH1ySLbRo1QXYTOC5G0a45OSw=;
        b=cDI2dL7L941I9EiBEqWio76ng5wQHc1eCoS2tIQD5FdSipYFf19P+kO/DdGqvns1JD
         HE1md4Eken3gfmAMPbyb9ZfOsj2CG/iAiseAnugqloC6Dfe0t8i3bw28yitlOy1hHTy1
         PiXZEHvHndVAmC/FCCmGIFKuYZPexA5d9CSEpNKT1otpeFJIt+iu3AwkF+ew0wa9OwB6
         mk/FWb45B9on2z1xlKgZu2RBKsugZiDyXRrTm9xCOTWtgi4CR3iLvKLWs2Xd7jQxHFBf
         jsG3ApuD/ufXBMqYddYE2K76cm+CfroMPQsIjn/w+/6uU5m7W/tzKu7rxAmfN8z596P3
         hqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=h5BHRotCYsy0a67S2KVH1ySLbRo1QXYTOC5G0a45OSw=;
        b=Zfbm5aChh4YOBuj24Icyvi/tUyVeLu7NwJo16GT+JZqzxLzyDENMKMJ5iJl+/p2ZbN
         gkpEwxMpAaQu6D5lVuatSYCf9kSoxK20Cr3zxYPGKL5zQ8eGoGkdDP5JifDZ2bekYfk4
         D93lxRIb07qsn2QhwMDh1JlvtshjbLVenj9sYUfNXgdtkvKK14UHk6x9uTXvnRctdFO4
         oI0//m8WO3df8/sE/Jlhd26B/Am87a+0K8BZVpcYPWiYmJ32flFPHLZnapfr3kMxWDRL
         l9N6/C5VvimkQe2CQwUF9ZX9Cs/Nd+EN1EPJrlQzb99/ogULzY78EihO0CyTcNakQifj
         IBPQ==
X-Gm-Message-State: APjAAAWn3RbmF8rXXAnerI5GtXKehnGfTubJQ3FQuEg9nA6GaHrRACF3
        P4UShmGzrOJsHJivFs32Q/95g8BfKyo=
X-Google-Smtp-Source: APXvYqy5FL814cSRx0y6uCQP7K0Wqd4IttStBHjm/I6g0MD5BOw9JE2lyKE1OervxSBUBNXty2JpVw==
X-Received: by 2002:a17:90a:1e63:: with SMTP id w90mr10933872pjw.36.1581795747794;
        Sat, 15 Feb 2020 11:42:27 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id q4sm11802751pfl.175.2020.02.15.11.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 11:42:27 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        devel@driverdev.osuosl.org (open list:STAGING SUBSYSTEM),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX
        / MXC ARM ARCHITECTURE), linux-kernel@vger.kernel.org (open list)
Subject: [RESEND PATCH v3 09/17] media: imx7-mipi-csis: Create media links in bound notifier
Date:   Sat, 15 Feb 2020 11:41:28 -0800
Message-Id: <20200215194136.10131-10-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200215194136.10131-1-slongerbeam@gmail.com>
References: <20200215194136.10131-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement a notifier bound op to register media links from the remote
sub-device's source pad(s) to the mipi csi-2 receiver sink pad.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
Changes in v3:
- call a local imx-media utility imx_media_create_fwnode_pad_link().
Changes in v2:
- Move notifier_to_csis_state() next to mipi_sd_to_csis_state(), remove
  unnecessary inline, and rename to mipi_notifier_to_csis_state().
  Suggested by Rui Silva.
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 4c54456318ea..d3a83577efed 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -317,6 +317,12 @@ static int mipi_csis_dump_regs(struct csi_state *state)
 	return 0;
 }
 
+static struct csi_state *
+mipi_notifier_to_csis_state(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct csi_state, notifier);
+}
+
 static struct csi_state *mipi_sd_to_csis_state(struct v4l2_subdev *sdev)
 {
 	return container_of(sdev, struct csi_state, mipi_sd);
@@ -848,6 +854,20 @@ static int mipi_csis_parse_endpoint(struct device *dev,
 	return 0;
 }
 
+static int mipi_csis_notify_bound(struct v4l2_async_notifier *notifier,
+				  struct v4l2_subdev *sd,
+				  struct v4l2_async_subdev *asd)
+{
+	struct csi_state *state = mipi_notifier_to_csis_state(notifier);
+	struct media_pad *sink = &state->mipi_sd.entity.pads[CSIS_PAD_SINK];
+
+	return imx_media_create_fwnode_pad_link(sd, sink);
+}
+
+static const struct v4l2_async_notifier_operations mipi_csis_notify_ops = {
+	.bound = mipi_csis_notify_bound,
+};
+
 static int mipi_csis_subdev_init(struct v4l2_subdev *mipi_sd,
 				 struct platform_device *pdev,
 				 const struct v4l2_subdev_ops *ops)
@@ -886,6 +906,8 @@ static int mipi_csis_subdev_init(struct v4l2_subdev *mipi_sd,
 
 	v4l2_async_notifier_init(&state->notifier);
 
+	state->notifier.ops = &mipi_csis_notify_ops;
+
 	ret = v4l2_async_register_fwnode_subdev(mipi_sd, &state->notifier,
 						sizeof(struct v4l2_async_subdev),
 						&sink_port, 1,
-- 
2.17.1

