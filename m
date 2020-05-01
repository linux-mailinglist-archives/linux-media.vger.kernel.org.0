Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96DA31C1B67
	for <lists+linux-media@lfdr.de>; Fri,  1 May 2020 19:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729701AbgEARQY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 1 May 2020 13:16:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728970AbgEARQX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 1 May 2020 13:16:23 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80DD5C061A0C
        for <linux-media@vger.kernel.org>; Fri,  1 May 2020 10:16:23 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id y25so1837381pfn.5
        for <linux-media@vger.kernel.org>; Fri, 01 May 2020 10:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GEyFXh4vSWfigdSzRW/AG6YVXwt0cYiVSCi8tI0IZg8=;
        b=W0VLtuVWzjgXs5lT0xK3lY9i3osxxaGJB+tZAjaYaOE2S24x0wlzr3yLYjbHcrVTXC
         1AJQDQ6nmb5BMYcjAaFlL56oh7Jl0yrzztWjIdZaUdYHccNS4eLlbW4y9SvGrsrDpZAc
         GKDOM36OCfmNn7G/kSJi87zq6KVpyVvwkEQ4TFHHxcrAiLOvaOjltBKGjKqRRXaNZtDz
         1HdqwQv64QxDakpeJ561J6K+AbM0WZJG7r2f/iga+mn7OuzyimKxS4G0PTbMyfxfWFnI
         cOI77bW+PmaDN33UBSYBanDGQ99dg4en1b8JUPYDrt7E5ltTabZGQPtuLQWMymavzUrV
         a7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GEyFXh4vSWfigdSzRW/AG6YVXwt0cYiVSCi8tI0IZg8=;
        b=Mfi3r3+rCqGgTKVCBJJYxhKDXdsCeIfGMCQsJ4c7rQBhrfmroj7Zy/vvqg/f4cRcAk
         LInkd1RpBnVbEMs1euv94CbZaHpmz5c/zWe57rivYhE52QAuCpCh/y2cAQ985/OzX2He
         Dr9TyfRlLIOblqwmiBSVX/BFWo+ULPsrwjFIk3UtXmNAI7EuFLIHUx2TEYLzYZ+d/9FG
         PD52G/edEcPFzMK8F7xy1r1B4uaj+Z3RTVcKTJNYfLrewaXfMDg0eW6gKVXZ7fmWSwIZ
         5RItJh1J0GX7Ns0TQTdoea8hbrfi91bygVcgUcXlnJZlvJgfLwELVl79CVuZYrBzxER+
         EgKQ==
X-Gm-Message-State: AGi0PuZKM842tTKgxaLdR9ZQ2P+8TzCs7/BLiriaocM9Xt3b+bo9z5xp
        ZPhooGLawqIXD0n+bgk+EFPK3Q30
X-Google-Smtp-Source: APiQypLfeDOVUNSuRxvD/jPeHEuDVYdFs6aDcbhsSPOgPlWFUajJjdNiTSoEhS8+2RQJsqnXE4FloQ==
X-Received: by 2002:a62:3287:: with SMTP id y129mr5284860pfy.167.1588353382732;
        Fri, 01 May 2020 10:16:22 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id g14sm2733966pfh.49.2020.05.01.10.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 10:16:22 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6 15/22] media: imx7: csi: Create media links in bound notifier
Date:   Fri,  1 May 2020 10:15:49 -0700
Message-Id: <20200501171556.14731-16-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501171556.14731-1-slongerbeam@gmail.com>
References: <20200501171556.14731-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Implement a notifier bound op to register media links from the remote
sub-device's source pad(s) to the CSI sink pad.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>
---
Changes in v5:
- imx_media_create_fwnode_pad_link() has been moved to core as
  v4l2_create_fwnode_links_to_pad().
Changes in v4:
- none
Changes in v3:
- call a local imx-media utility imx_media_create_fwnode_pad_link().
Changes in v2:
- Rename notifier_to_dev() to imx7_csi_notifier_to_dev() and remove
  unnecessary inline. Suggested by Rui Silva.
---
 drivers/staging/media/imx/imx7-media-csi.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index c74455f65b3e..21a86fa3d89b 100644
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
@@ -1204,6 +1210,20 @@ static const struct v4l2_subdev_internal_ops imx7_csi_internal_ops = {
 	.unregistered	= imx7_csi_unregistered,
 };
 
+static int imx7_csi_notify_bound(struct v4l2_async_notifier *notifier,
+				 struct v4l2_subdev *sd,
+				 struct v4l2_async_subdev *asd)
+{
+	struct imx7_csi *csi = imx7_csi_notifier_to_dev(notifier);
+	struct media_pad *sink = &csi->sd.entity.pads[IMX7_CSI_PAD_SINK];
+
+	return v4l2_create_fwnode_links_to_pad(sd, sink);
+}
+
+static const struct v4l2_async_notifier_operations imx7_csi_notify_ops = {
+	.bound = imx7_csi_notify_bound,
+};
+
 static int imx7_csi_async_register(struct imx7_csi *csi)
 {
 	struct v4l2_async_subdev *asd = NULL;
@@ -1234,6 +1254,8 @@ static int imx7_csi_async_register(struct imx7_csi *csi)
 		}
 	}
 
+	csi->notifier.ops = &imx7_csi_notify_ops;
+
 	ret = v4l2_async_subdev_notifier_register(&csi->sd, &csi->notifier);
 	if (ret)
 		return ret;
-- 
2.17.1

