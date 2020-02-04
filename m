Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA0C9152374
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2020 00:50:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727906AbgBDXuA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Feb 2020 18:50:00 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39189 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727899AbgBDXt7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Feb 2020 18:49:59 -0500
Received: by mail-pf1-f193.google.com with SMTP id 84so173954pfy.6;
        Tue, 04 Feb 2020 15:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xWXrdZ90Rqh6QAAhxL2MMK6jyJVUDs2rWHZG2jR0834=;
        b=aZ2fMSmBb8INC9ZjdjDJSoO0C6r2ipOGxG5/w6s1OfQxNQPj7y67obTSS3ojlGbFJr
         vewaFBh4+H8ns/He7PiAh/VUsUH23ucS08bWjKCtyC/nQygZuJWuEWCGqtPjCK4GYN86
         /Zv06iqJ4kngXnXIJCWHndx/cG6wn9Q1Wchyl9eTi7Wgc6ssAe6DGjw8zIYWTjygd/qs
         Q2Tfn9qFmRraWZd1PPhYq0elE7Q6/dO1J9H1nYVTuukq4STOvn6zinW/HYJfDy88Q3R/
         t+MP6SXodxP+/ont99CoBkSDnGlCOwrZfXZVg/ys0UJ53j/I2n7Ji/73zWJn5tPeOKkn
         lsug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xWXrdZ90Rqh6QAAhxL2MMK6jyJVUDs2rWHZG2jR0834=;
        b=SvQVOUA3q3KFoWKqHM+Kte9pAEb2nTZqzZj+qpU2ImSZ1AzMk+F/5z5oYdUUtvW1WM
         KT7XumEluE5TdEjZTsQeVgYZv8+U2TKd143R6HeCH9dcFct8Tmpvx2lXICDbv9CGATZC
         zaC54DxAirpiVA4j5wh4oPINt9V26uUQ9wZKAFEpVzOlLB8xlDtvVIsehoIggoYomLTu
         T96qeQnnjO1Aj7Tmx8lYFD7mGDOKV2/hrKqBaSvAAAxA4xX8G2+yZa9T/JrsvYuW0Rhw
         I0HKOc3Nl5A0C1yYCnpwMTVLL56emVJPZHXTvSkhs3CnC7APoN7aw9uh9dcErXnHgodj
         8YAQ==
X-Gm-Message-State: APjAAAVlHsy9gWdPMeToOVU3xNybsGwLN22LDOq6fHcJcLksj7kswDA0
        HsQvyHSFiCoxYFrR78y9yMvQpnjs
X-Google-Smtp-Source: APXvYqw62ecVGd2VbnxIC4lzwBiEjvK/Wszd7w+Tuao9OgwOH+0hFr0GKvGsJghM30KoDwQa55wUSA==
X-Received: by 2002:a63:7c17:: with SMTP id x23mr14489000pgc.436.1580860198853;
        Tue, 04 Feb 2020 15:49:58 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id u2sm24607929pgj.7.2020.02.04.15.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 15:49:58 -0800 (PST)
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
Subject: [PATCH v3 16/17] media: imx: silence a couple debug messages
Date:   Tue,  4 Feb 2020 15:49:17 -0800
Message-Id: <20200204234918.20425-17-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200204234918.20425-1-slongerbeam@gmail.com>
References: <20200204234918.20425-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Convert to dev_dbg the "subdev bound" and IPU-internal media-link
creation messages.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media-dev-common.c  | 4 +++-
 drivers/staging/media/imx/imx-media-dev.c         | 2 +-
 drivers/staging/media/imx/imx-media-internal-sd.c | 6 +++---
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-dev-common.c b/drivers/staging/media/imx/imx-media-dev-common.c
index f7ad3cbbeec2..b23bbfab388a 100644
--- a/drivers/staging/media/imx/imx-media-dev-common.c
+++ b/drivers/staging/media/imx/imx-media-dev-common.c
@@ -24,7 +24,9 @@ static int imx_media_subdev_bound(struct v4l2_async_notifier *notifier,
 				  struct v4l2_subdev *sd,
 				  struct v4l2_async_subdev *asd)
 {
-	v4l2_info(sd->v4l2_dev, "subdev %s bound\n", sd->name);
+	struct imx_media_dev *imxmd = notifier2dev(notifier);
+
+	dev_dbg(imxmd->md.dev, "subdev %s bound\n", sd->name);
 
 	return 0;
 }
diff --git a/drivers/staging/media/imx/imx-media-dev.c b/drivers/staging/media/imx/imx-media-dev.c
index 2c3c2adca683..6d2205461e56 100644
--- a/drivers/staging/media/imx/imx-media-dev.c
+++ b/drivers/staging/media/imx/imx-media-dev.c
@@ -32,7 +32,7 @@ static int imx_media_subdev_bound(struct v4l2_async_notifier *notifier,
 			return ret;
 	}
 
-	v4l2_info(&imxmd->v4l2_dev, "subdev %s bound\n", sd->name);
+	dev_dbg(imxmd->md.dev, "subdev %s bound\n", sd->name);
 
 	return 0;
 }
diff --git a/drivers/staging/media/imx/imx-media-internal-sd.c b/drivers/staging/media/imx/imx-media-internal-sd.c
index d4237e1a4241..da4109b2fd13 100644
--- a/drivers/staging/media/imx/imx-media-internal-sd.c
+++ b/drivers/staging/media/imx/imx-media-internal-sd.c
@@ -142,9 +142,9 @@ static int create_internal_link(struct imx_media_dev *imxmd,
 				   &sink->entity.pads[link->remote_pad]))
 		return 0;
 
-	v4l2_info(&imxmd->v4l2_dev, "%s:%d -> %s:%d\n",
-		  src->name, link->local_pad,
-		  sink->name, link->remote_pad);
+	dev_dbg(imxmd->md.dev, "%s:%d -> %s:%d\n",
+		src->name, link->local_pad,
+		sink->name, link->remote_pad);
 
 	ret = media_create_pad_link(&src->entity, link->local_pad,
 				    &sink->entity, link->remote_pad, 0);
-- 
2.17.1

