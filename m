Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D08C319E7F3
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2020 00:41:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726444AbgDDWly (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Apr 2020 18:41:54 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37623 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgDDWly (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 Apr 2020 18:41:54 -0400
Received: by mail-pf1-f196.google.com with SMTP id u65so5571891pfb.4
        for <linux-media@vger.kernel.org>; Sat, 04 Apr 2020 15:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+/VYda9ZgC7JPVkGjZAW3fELwXUs4vVMudsN+klC3Tg=;
        b=Z229zu7pK9KJqy+g3mq/6kwMbg2ckIXHcXfq3dyMpc46krSEVW/bOnBRgYRLRi9fJE
         LV86XhthpdlOcdnVXunJEA9gWdlxOZukQS9fI8mrQXYq3qB3XarpEylXyx6beT8jU8bE
         /QyLvZU9o+aqYVgciy7khdUxDC9KKjsztyyg3lVLYZjHEuv7TABlRCwkKvwlihrNxCp9
         O/yP73ACRIx3m3hTuj5Qbreo21VA/g2rY2Wlpsi5bi/fq+On6zNivvlGNl8ZOn/a0Xfk
         gOtXeZfrxVXpICrMUhi77FSfHQk3Az869uOI0MIzyIxZ/571SUrlsigBfm0qHZc4i/Oq
         Ol8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+/VYda9ZgC7JPVkGjZAW3fELwXUs4vVMudsN+klC3Tg=;
        b=FimeeKwHMMDFrgQKwx5PnFkTlu8JSLe+Wvr3O3Yav52h9IklZQYQQQvWWKJG+4EqS7
         at5S0ctlElEHeLqe51j86fi4NCoztv5H+E44CTfTgWbj2wdFDkqTzYHPqv7N11ic5WT5
         SM2uLBbjE8RBfjTMmBlSiKxbz9SA6tQfB/kAuAcRU5+ukG3WW5KaDi4MCPTPm7gCfKCG
         mnmACkx67hSiDtO461oYapjZvS7HS7dEnkZxGXNsjOGXvWkUmcMQwH+NnH0qHgxYbT/r
         vA5mcf5WBwi8kGz6aW/GJlNrG3KcUJ34z+eBLniyfXhpIXX2Qdd9/p0pC3lGwfrm1KOD
         1boA==
X-Gm-Message-State: AGi0PubwszObBvz17Sh3LMJpsjzs7Es0Uo9i4jIRnIGsoPNTH2IedFkl
        IeIl1nD/+3K0o6ZSfV4XYZVboOFOh8E=
X-Google-Smtp-Source: APiQypI8jpuRAfICK8EDUbu1U96k20jGZ9UUB8cl7ulpyRrew2ud/0daA8pZ+SDpeICcTrFnRk1gSQ==
X-Received: by 2002:a63:5645:: with SMTP id g5mr15448326pgm.268.1586040111128;
        Sat, 04 Apr 2020 15:41:51 -0700 (PDT)
Received: from mappy.world.mentorg.com (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id o11sm8690989pjb.18.2020.04.04.15.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 15:41:50 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6 10/11] media: imx: utils: Constify mbus argument to imx_media_mbus_fmt_to_*
Date:   Sat,  4 Apr 2020 15:41:29 -0700
Message-Id: <20200404224130.23118-11-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404224130.23118-1-slongerbeam@gmail.com>
References: <20200404224130.23118-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The imx_media_mbus_fmt_to_pix_fmt() and imx_media_mbus_fmt_to_ipu_image()
functions do not need to modify their mbus argument. Make them const.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
[Constified mbus arg to imx_media_mbus_fmt_to_ipu_image() as well]
Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 4 ++--
 drivers/staging/media/imx/imx-media.h       | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index c77a0cf5cbc9..b8ee005e4445 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -510,7 +510,7 @@ void imx_media_try_colorimetry(struct v4l2_mbus_framefmt *tryfmt,
 EXPORT_SYMBOL_GPL(imx_media_try_colorimetry);
 
 int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
-				  struct v4l2_mbus_framefmt *mbus,
+				  const struct v4l2_mbus_framefmt *mbus,
 				  const struct imx_media_pixfmt *cc)
 {
 	u32 width;
@@ -562,7 +562,7 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
 EXPORT_SYMBOL_GPL(imx_media_mbus_fmt_to_pix_fmt);
 
 int imx_media_mbus_fmt_to_ipu_image(struct ipu_image *image,
-				    struct v4l2_mbus_framefmt *mbus)
+				    const struct v4l2_mbus_framefmt *mbus)
 {
 	int ret;
 
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index 24a993b3216b..c03114a6f6c8 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -184,10 +184,10 @@ int imx_media_init_cfg(struct v4l2_subdev *sd,
 void imx_media_try_colorimetry(struct v4l2_mbus_framefmt *tryfmt,
 			       bool ic_route);
 int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
-				  struct v4l2_mbus_framefmt *mbus,
+				  const struct v4l2_mbus_framefmt *mbus,
 				  const struct imx_media_pixfmt *cc);
 int imx_media_mbus_fmt_to_ipu_image(struct ipu_image *image,
-				    struct v4l2_mbus_framefmt *mbus);
+				    const struct v4l2_mbus_framefmt *mbus);
 int imx_media_ipu_image_to_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
 				    struct ipu_image *image);
 void imx_media_grp_id_to_sd_name(char *sd_name, int sz,
-- 
2.17.1

