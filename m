Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8CADD1786A3
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2020 00:43:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728499AbgCCXnh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Mar 2020 18:43:37 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45065 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728107AbgCCXng (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Mar 2020 18:43:36 -0500
Received: by mail-pf1-f194.google.com with SMTP id 2so2301211pfg.12
        for <linux-media@vger.kernel.org>; Tue, 03 Mar 2020 15:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xWXrdZ90Rqh6QAAhxL2MMK6jyJVUDs2rWHZG2jR0834=;
        b=TOZWuriAMFf5smnHuDqY31JDv3zdpwmGYPM9OwkX2cZ8S2D9n9256Pr0Pn+IcG8R0i
         AJQ1AUvmujr2w2Tr0pTYNYw8AU3fYe4Ml0vwQ4heLNDdPyvuwUj08Ce3mqSBUpHkISIj
         W06J2u4Cfhki2Vu1bltTU5d0HVvS6JbMQaOZybHHRbFm0TptHLSPQxX4IvR0aZgW8ns2
         1f3D40oS63ieL9dFN6h0jt2CdXpTp9Uv5ED7rVAcjSAY+f4UOp3hu/stgKNJnUhkSaTa
         4VKwgI6wqhurHC6aG+UJLa1JB6SYdWj2p6hjuEidhcICOTDhk0kV+PNaGIHNva1NZf3Y
         wrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xWXrdZ90Rqh6QAAhxL2MMK6jyJVUDs2rWHZG2jR0834=;
        b=Vp9bX1LhIn1v23BF9qKZbeQKEiQmroaJi3+BDMwf8DkoOfA2W+UkofbEspLFDR7idw
         q6cj0RmGixBJzfpIRaIBG5IRxECUyjKeZV1EwRIV/uMX8tYPOk9GNhla3+EdyFln4C7W
         TOzeduh1RuTpXSOQPqtI28fw78fYsG1iufnGnlbiXEV7Hq+opnrVehKk0TC/JaWBQ8P2
         ZiT+aDiV6cwzW0PSuq+yFcMWsFZGPMA1Aa5ySPNg501EKB3zgE6Gk2q0MHlmM0CJy0/y
         BemWdcBljOksRLNV/8HKFQSTA75WK/YMQ3s7vcaeJMGas0+3A5zuhT0uO8X2rPPa/S7E
         Oaqw==
X-Gm-Message-State: ANhLgQ0om734sVY7PG4f/QAWLTSTHQvAkg65wmAizqvOFGIwKS52dw3Y
        wRKiblpm75vC7vU7ka0U357Xl90yxE4=
X-Google-Smtp-Source: ADFU+vvQOqac3XdrocdKJXwPQmo9rGvJ2DYakKwrchRmep68KFR1we0hUCUL5Jj2+H0gVZkJl0Rz7A==
X-Received: by 2002:a62:7c09:: with SMTP id x9mr217492pfc.80.1583279014153;
        Tue, 03 Mar 2020 15:43:34 -0800 (PST)
Received: from mappy.sklembedded.com ([2605:e000:d445:6a00:8145:3904:f092:dd35])
        by smtp.gmail.com with ESMTPSA id q66sm23540009pgq.50.2020.03.03.15.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2020 15:43:33 -0800 (PST)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v4 16/17] media: imx: silence a couple debug messages
Date:   Tue,  3 Mar 2020 15:42:55 -0800
Message-Id: <20200303234256.8928-17-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200303234256.8928-1-slongerbeam@gmail.com>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
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

