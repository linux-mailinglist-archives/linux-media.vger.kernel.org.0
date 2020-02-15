Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C858160046
	for <lists+linux-media@lfdr.de>; Sat, 15 Feb 2020 20:43:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727800AbgBOTnK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 15 Feb 2020 14:43:10 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:33158 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728079AbgBOTnJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 15 Feb 2020 14:43:09 -0500
Received: by mail-pl1-f194.google.com with SMTP id ay11so5155503plb.0;
        Sat, 15 Feb 2020 11:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xWXrdZ90Rqh6QAAhxL2MMK6jyJVUDs2rWHZG2jR0834=;
        b=kkZaNiMCto9qboPG3KkfEyftLRjsCxbl8VSUXkTJe9GEcR1BQGxAyCQUN6xEN28bxj
         eAmsr9FJEhMlSJNyo1C6i1PTpvt61cE7ChxwwOjF3947YQZiTLOJ+1wwb9aiPJzEBxTU
         pFvupsyWt271rQ8iAW8UNOfUwaPumWatdBAlFagootQZ/anSpW/tTAaF5HpG24ndm5eR
         IxxgrUxOC6iMI5wVTVycFocSUEyYwlOWQ3ompnUuNLYx0Su30UfbKoJRox1ot0VS/iYw
         Z/nmhfIEhgIJX99NkoWppTkbQwjYVLs0uDRApAGBR184SuqxZk0hiY/eL2K3bIBogWiO
         EufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xWXrdZ90Rqh6QAAhxL2MMK6jyJVUDs2rWHZG2jR0834=;
        b=UgwIqscw66tYsNAWitZ1ptsvP3N0kGzo0YoNS5KzXMIyT0nr5v3k5L2vg8n+nbv3Oa
         4XCCTHZLKeh9sUIALmdHm05paBmuxzqJfke1zqqLCGUrShZEHUCc/ucccYMJsll9nxPl
         /65jJhS5+/34LZGS3zGCxZmaJa9cjD4UYCOM0weMuLJafoqIVapVeAt9w5Yz5tJP3VO9
         2B3BYSRfM4B1f7/kEOUgFdTHmjLv0X5JvJuFmFIwCgEnZoDYy6bg4PL0vLE35FJ5VVgK
         b9fhjasaU2EJQi55CXz09PyS+zLcbVg4hQt5pvy5f53F8HvJdWn0MVLccshppYk1U/qV
         Z0Cg==
X-Gm-Message-State: APjAAAUcmS5ySfdkf3lo9/IenRnoh/GbviQcG/ej5hjvjL8mOEwYeBh4
        pSPy+Wo6/jcrbVRvIwtj2oPEu6ks1Bo=
X-Google-Smtp-Source: APXvYqwzjKJzHTQI7d9t9TLy5kd0/CNhq95OAzyw4PDTakvup3633irweQWCqYwCy5uD7iB0l1GPVw==
X-Received: by 2002:a17:90a:608:: with SMTP id j8mr11070072pjj.85.1581795788407;
        Sat, 15 Feb 2020 11:43:08 -0800 (PST)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id q4sm11802751pfl.175.2020.02.15.11.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2020 11:43:07 -0800 (PST)
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
Subject: [RESEND PATCH v3 16/17] media: imx: silence a couple debug messages
Date:   Sat, 15 Feb 2020 11:41:35 -0800
Message-Id: <20200215194136.10131-17-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200215194136.10131-1-slongerbeam@gmail.com>
References: <20200215194136.10131-1-slongerbeam@gmail.com>
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

