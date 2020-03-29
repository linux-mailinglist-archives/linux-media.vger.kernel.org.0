Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CAA1196EFF
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2020 19:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728496AbgC2Rk3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Mar 2020 13:40:29 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:33586 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728489AbgC2Rk3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Mar 2020 13:40:29 -0400
Received: by mail-pl1-f196.google.com with SMTP id g18so5778029plq.0
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2020 10:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DCTkJQEJUyHAg4mT7stNNJOCcjZqe15UYltHa/UyGWI=;
        b=gB0jQWMiGjYofoJRDVrt4YaO5hru836dHqsiTC39evG39s8IlxYJxhv9zmo9I1TDJL
         jFSve3aiChvnVQzfk0Q8tEp+EnrMVw3jskMJlaQP6HJH0FWHHPXd9nUEv1uAB6PFv24z
         7Qhq2nKiIq1kcrv9DVWpg2FUEwDuE0p39xTAPNqAA/S9cQgfIucxMCDQFjhaYsBmrh3q
         HQoiMyWqniKzoIjpqXaWSlkJLC49kqaYkCRlga/+HoGj+4nSdVB1enz10frKk4Ckeaxt
         cZU0yqJEWOuJ4eakUPPbHo5C3gOc4uZbx0nSaC2sfkqKP6Q16zsgsi+RYlkm6RDjuRNJ
         wetw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DCTkJQEJUyHAg4mT7stNNJOCcjZqe15UYltHa/UyGWI=;
        b=mDNv1ptym8xseL3XM1n7Bkn9mCXvA3vH5Ao6WPFYzYGiCK90rC3BmkvQby5aSbTYtY
         8q8LxShRQ5XLlrCCcukGN5+EX7cWG3Kfw+zMZ77xPsJjcr3BEUsIGcGxk+Jf3oD9Iwms
         EKpy1JjDLwbRcbRTXY4p1MvMKo060DACY255f0No7mqLzSRHxLcdOQkB/gzZJRrPODVg
         i3dEbCOVuGcuDQ8y0BgX7/F3fo27zZXXT0+alRtgL6X+ybdwHmAtxis/1BIzqqWp9NcY
         LGhBPilPpR9Tr0Lji7MOSrl29Zn2E0+DXeOt3GY8DK0bkbTXBXQNnOlhocVID/DKYgqY
         7i4w==
X-Gm-Message-State: ANhLgQ1GgoFla5PEvxb3+8V4TDOhyy+mH8p7fDRI8Q9kJAvLlOzEDOP6
        zPOEGir0aFr9RETGFgo6/GZjR5H3r1k=
X-Google-Smtp-Source: ADFU+vs47N5EaNU6nOQ4sVjyFvzwm/XWenDRIMBbwEQIKiEuHIOcBVyK1hEE8qqXJ2B1m3pxBxB6qQ==
X-Received: by 2002:a17:90a:232d:: with SMTP id f42mr10455681pje.185.1585503628009;
        Sun, 29 Mar 2020 10:40:28 -0700 (PDT)
Received: from mappy.nv.charter.com ([2600:6c4e:200:e053:a0c5:5fbc:c28e:f91f])
        by smtp.gmail.com with ESMTPSA id b133sm7031253pfb.180.2020.03.29.10.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 10:40:27 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v3 09/10] media: imx: utils: Constify mbus argument to imx_media_mbus_fmt_to_pix_fmt
Date:   Sun, 29 Mar 2020 10:40:09 -0700
Message-Id: <20200329174010.12304-10-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200329174010.12304-1-slongerbeam@gmail.com>
References: <20200329174010.12304-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The imx_media_mbus_fmt_to_pix_fmt() function doesn't need to modify its
mbus argument. Make it const.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 2 +-
 drivers/staging/media/imx/imx-media.h       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index f7451197a289..95fef529b741 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -501,7 +501,7 @@ void imx_media_try_colorimetry(struct v4l2_mbus_framefmt *tryfmt,
 EXPORT_SYMBOL_GPL(imx_media_try_colorimetry);
 
 int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
-				  struct v4l2_mbus_framefmt *mbus,
+				  const struct v4l2_mbus_framefmt *mbus,
 				  const struct imx_media_pixfmt *cc)
 {
 	u32 width;
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index 67983a26e5ff..a4885e280b83 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -178,7 +178,7 @@ int imx_media_init_cfg(struct v4l2_subdev *sd,
 void imx_media_try_colorimetry(struct v4l2_mbus_framefmt *tryfmt,
 			       bool ic_route);
 int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
-				  struct v4l2_mbus_framefmt *mbus,
+				  const struct v4l2_mbus_framefmt *mbus,
 				  const struct imx_media_pixfmt *cc);
 int imx_media_mbus_fmt_to_ipu_image(struct ipu_image *image,
 				    struct v4l2_mbus_framefmt *mbus);
-- 
2.17.1

