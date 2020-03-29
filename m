Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22DBA19706B
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2020 22:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728883AbgC2U7k (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Mar 2020 16:59:40 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35655 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728848AbgC2U7j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Mar 2020 16:59:39 -0400
Received: by mail-pf1-f194.google.com with SMTP id u68so7574625pfb.2
        for <linux-media@vger.kernel.org>; Sun, 29 Mar 2020 13:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=93Rj8w4z1HwRyZ2xPLUHuYDoYaMnmWIZNibl2hindZw=;
        b=KiwnjVLNomn91oZ5CfHKhpP++Y7l/SmPFdYQJvCHJmF1TQ5d2/lWBRgLjgANlOWtE5
         YQ0KamX5QtKodF69S6IoxZH0A+vUjPAHhw51BmPCtYKEz6rpn7jCH773nIzASLko7leQ
         X3B88uPHNBnQy7lNOzd/aZsnOCC1Qt1K10kZZpzlgh3Q1orTCUJ+KumS/pH+olscyP1b
         N9tWr/zMd9UWzo6aZJPZHGWSWd7b/JyvyAUtiKnpJhW8I6jckHmihQ3fs+6ViF9jkbrA
         zire/3tIqMf9Niyuzw9taDfofbQwKPNzNhHmxOjHj+eo+QuIhILNarzgGfeYPEA1lRwi
         aRMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=93Rj8w4z1HwRyZ2xPLUHuYDoYaMnmWIZNibl2hindZw=;
        b=Rn3RpHem8jWBookgI027hsiRQtVzOsQ5kDf4tkCajfCKgNmcRcCdWlNJe658hNPOMp
         HK6m0SQDp0goqdmvGWnmUdUkUSwpSVerIXMkvCd3120dh8iZbpa07CvGXtBg7P1ZSbTG
         5g6/td2CZsxwCLVdAeQdpMeJqxifOpLgjCnJFtLps/+3fGDeXLXjGNeRYmq9RdWljKjF
         Ulj7PR2W9ebVlgV9VBXAuQl/krhXBgujq1/mBC/g4omddkHmsKC5PI/Nl9WnCaG7crm+
         P1MzEqbyAgljGwTDZI4hbaj/x6s//takBduP2Dh9wz4ctwKWtZbUetse50d7xzq+sinX
         XX+A==
X-Gm-Message-State: ANhLgQ32xDXQiWd53V/oEaJE2Kg0kRR3xFLtJSO+5dLiswhcsgG9TTTD
        L26X+/+Yv8iU7nG9ro/o2rax1WKvrFs=
X-Google-Smtp-Source: ADFU+vtas2tHxkjK//QFAmRJACLtRgKR+8NznDBA91a/RpcicKbj9ghqTvVdSITjIY2fylk+oCI1ow==
X-Received: by 2002:aa7:947d:: with SMTP id t29mr9483018pfq.184.1585515577922;
        Sun, 29 Mar 2020 13:59:37 -0700 (PDT)
Received: from mappy.nv.charter.com ([2600:6c4e:200:e053:a0c5:5fbc:c28e:f91f])
        by smtp.gmail.com with ESMTPSA id 15sm8606049pfu.186.2020.03.29.13.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2020 13:59:37 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v4 09/11] media: imx: utils: Constify mbus argument to imx_media_mbus_fmt_to_*
Date:   Sun, 29 Mar 2020 13:59:18 -0700
Message-Id: <20200329205920.20118-10-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200329205920.20118-1-slongerbeam@gmail.com>
References: <20200329205920.20118-1-slongerbeam@gmail.com>
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
index 5631b01510ef..b30045221841 100644
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
@@ -553,7 +553,7 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
 EXPORT_SYMBOL_GPL(imx_media_mbus_fmt_to_pix_fmt);
 
 int imx_media_mbus_fmt_to_ipu_image(struct ipu_image *image,
-				    struct v4l2_mbus_framefmt *mbus)
+				    const struct v4l2_mbus_framefmt *mbus)
 {
 	int ret;
 
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index 67983a26e5ff..f4b0fe508553 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -178,10 +178,10 @@ int imx_media_init_cfg(struct v4l2_subdev *sd,
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

