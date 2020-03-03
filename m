Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1F2F17869F
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 00:43:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728458AbgCCXn3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 18:43:29 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45881 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728107AbgCCXn3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 18:43:29 -0500
Received: by mail-pg1-f196.google.com with SMTP id m15so45792pgv.12
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2020 15:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=0YReqWAumc7c9udJV52FSM86eqqC/L7jXq4w/Lscg1I=;
        b=Zy+hGwUvC++U4n5J4hvXkMd7LH7Hze1DZtHbkV8niYOaBF5MNIodnxF+97Iaw4f4Cv
         TJEMaYl+2o1GRJ4T7JwoN+VICb5FEi4X73tzjDJ98zShawxhxKgsJms8v0+d3UnGpCOh
         sBQI85s5betAl0n2+A1vL5OawwozBX7osZjyHHEnlqJnKemODIZl2pmFBG0GFTx4hwiZ
         7q5045UozLLlOQNDFFL/agPjK4SAvtBskoYv3aurEY91iKZcn0xynJKz/BRCoGEjnOA/
         0q7oZObCuSNK08M5DLoysvDvRT+SsV670ohHJxO7JyqvPh53gHL4qToWJ1niO5l2e+Yp
         k99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=0YReqWAumc7c9udJV52FSM86eqqC/L7jXq4w/Lscg1I=;
        b=O2+udC7jNG456EgO/QTPjQdcIHjmGjTHUJigTQO9STeZttcKhWB6nSKYBXNh/4uoMT
         lEOI/b7VP+bFw7OuZBIELGnAeZBXJHezH5EQ+EVG6zEEQSzrOwlfvwPoHy+/bXk3uoqZ
         cB2vuwmTroEdCJWkE8hY8kA+RNI3X62ojSUE+oohC1CY/CgmmVNBS/3izc9v5hOe8RoL
         p6Aey5q1Kinx2QlMytdvwGd5K5UDPiEfl9KRWW3a02IcUFFj7ikRTZ0G3u6wqtF3/ZHR
         IAtBMAJeBtPIRIbk3kzjmp6V2rSCr3CmN4ZKDKyG6/wDSGb2fmoZtjwSnnBafl+nRD7i
         oZPg==
X-Gm-Message-State: ANhLgQ21R/mLPsDbLf7YJOO/RM/65mrpdTKNLbOfex6ucQPggYUoEBGH
        Hqt5sXISbGGp9bVR6FEMlJLqXQh8ZUM=
X-Google-Smtp-Source: ADFU+vs/QBpgmPPG2UY9VpWTEEvTPnhSk0Nlzqmr286/QfFDiTclrv9AkXcmrEBaTrznQibKZk3YMg==
X-Received: by 2002:a63:6841:: with SMTP id d62mr6014971pgc.86.1583279007663;
        Tue, 03 Mar 2020 15:43:27 -0800 (PST)
Received: from mappy.sklembedded.com ([2605:e000:d445:6a00:8145:3904:f092:dd35])
        by smtp.gmail.com with ESMTPSA id q66sm23540009pgq.50.2020.03.03.15.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 15:43:27 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v4 12/17] media: imx7: csi: Create media links in bound notifier
Date:   Tue,  3 Mar 2020 15:42:51 -0800
Message-Id: <20200303234256.8928-13-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200303234256.8928-1-slongerbeam@gmail.com>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement a notifier bound op to register media links from the remote
sub-device's source pad(s) to the CSI sink pad.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
Changes in v3:
- call a local imx-media utility imx_media_create_fwnode_pad_link().
Changes in v2:
- Rename notifier_to_dev() to imx7_csi_notifier_to_dev() and remove
  unnecessary inline. Suggested by Rui Silva.
---
 drivers/staging/media/imx/imx7-media-csi.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 776eb42ae5c8..88e21c13e420 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -196,6 +196,12 @@ struct imx7_csi {
 	struct completion last_eof_completion;
 };
 
+static struct imx7_csi *
+imx7_csi_notifier_to_dev(struct v4l2_async_notifier *n)
+{
+	return container_of(n, struct imx7_csi, notifier);
+}
+
 static u32 imx7_csi_reg_read(struct imx7_csi *csi, unsigned int offset)
 {
 	return readl(csi->regbase + offset);
@@ -1180,6 +1186,20 @@ static const struct v4l2_subdev_internal_ops imx7_csi_internal_ops = {
 	.unregistered	= imx7_csi_unregistered,
 };
 
+static int imx7_csi_notify_bound(struct v4l2_async_notifier *notifier,
+				 struct v4l2_subdev *sd,
+				 struct v4l2_async_subdev *asd)
+{
+	struct imx7_csi *csi = imx7_csi_notifier_to_dev(notifier);
+	struct media_pad *sink = &csi->sd.entity.pads[IMX7_CSI_PAD_SINK];
+
+	return imx_media_create_fwnode_pad_link(sd, sink);
+}
+
+static const struct v4l2_async_notifier_operations imx7_csi_notify_ops = {
+	.bound = imx7_csi_notify_bound,
+};
+
 static int imx7_csi_async_register(struct imx7_csi *csi)
 {
 	struct v4l2_async_subdev *asd = NULL;
@@ -1210,6 +1230,8 @@ static int imx7_csi_async_register(struct imx7_csi *csi)
 		}
 	}
 
+	csi->notifier.ops = &imx7_csi_notify_ops;
+
 	ret = v4l2_async_subdev_notifier_register(&csi->sd, &csi->notifier);
 	if (ret)
 		return ret;
-- 
2.17.1

