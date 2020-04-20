Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 146EC1AFF4B
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 02:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbgDTAkA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Apr 2020 20:40:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726121AbgDTAkA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Apr 2020 20:40:00 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 241BEC061A0C
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:40:00 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id g6so4193227pgs.9
        for <linux-media@vger.kernel.org>; Sun, 19 Apr 2020 17:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cjzjDl7JHxJQeLK72XK1Q3pp4TAeVaMa8A7/cGohwnw=;
        b=RA1yGQhJnszrIP8KT3nDnutZOlMgdJL7TaYHRLF5JHNMFl775MS+gk4G0XrdugteS8
         9ZlWst2u+/6Pf7+r9EtdpAEWMrDnD+82Dh5UkekD+CwYsW71dT0sqLm1s8PUSm/vb2Ax
         KsFamy2nfOi06mJxAXTVDImtCtXkdMbOnsU/UvqsQa7Cl64guxBesqRIut+mtueoetRF
         m116/BykuLmiaNaSYFd2nE7KSao+HFeTK+3msiUeGGU14ybFUEpGrjG/ykhRGb+Kfyov
         yBbxJxcLZf7HH72fejdKazLuyMEtXsu0YGaal2syLWjVvuqkTg993gnFxTr02nGXVzku
         nsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cjzjDl7JHxJQeLK72XK1Q3pp4TAeVaMa8A7/cGohwnw=;
        b=LonEJJh+K7kUwlsjy+G3J6i6oRhBY5fmev+9390k9Q93kvEpDiGDvrAHobeAzc87J5
         Otsfdjf03g7Kyi3H98fLaRzmBmtFTtro/uW5PfY1QUaIU8cz8psIPvM0TlohwZZ8whiw
         jr1GAtUvNRBgfmpiYnGGmVjwpJbuaqynX1/1HS4yEZrFnoOvfADbMoxsiKWRiCpv68QW
         j5tvACIPb8Z4bBYzRZ/VaJk+N9ptsfD9JT4auzJ8qBj3b3SBfXEeeJlkfmG5bonbaWDO
         rRjzb2aviqF/vRc6BXTVDiN4an1NWWCtZc8AGBdy/Jwu1b23w9PDdM4tBJSirrGiPvtc
         1fqg==
X-Gm-Message-State: AGi0PuYty3808XWa77KjAhzKJdOBncR7taW6mUnFNBhrJ0tGhrzTwEOQ
        UTq85P+tK66fg9h+tSNRiuym9MVd7MU=
X-Google-Smtp-Source: APiQypIItdwUaaHNSI9YaORMalCvd5ZKraoMgkQhRBHZiDC5N3cOqDxMYuChDOY372Hvl5F9XpvMqQ==
X-Received: by 2002:a62:7c51:: with SMTP id x78mr13876732pfc.227.1587343199402;
        Sun, 19 Apr 2020 17:39:59 -0700 (PDT)
Received: from mappy.hsd1.ca.comcast.net (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id f30sm12313701pje.29.2020.04.19.17.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 17:39:58 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 16/23] media: imx7: csi: Create media links in bound notifier
Date:   Sun, 19 Apr 2020 17:39:23 -0700
Message-Id: <20200420003930.11463-17-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200420003930.11463-1-slongerbeam@gmail.com>
References: <20200420003930.11463-1-slongerbeam@gmail.com>
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
index e27d8f896a62..357475de4e0c 100644
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
@@ -1203,6 +1209,20 @@ static const struct v4l2_subdev_internal_ops imx7_csi_internal_ops = {
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
@@ -1233,6 +1253,8 @@ static int imx7_csi_async_register(struct imx7_csi *csi)
 		}
 	}
 
+	csi->notifier.ops = &imx7_csi_notify_ops;
+
 	ret = v4l2_async_subdev_notifier_register(&csi->sd, &csi->notifier);
 	if (ret)
 		return ret;
-- 
2.17.1

