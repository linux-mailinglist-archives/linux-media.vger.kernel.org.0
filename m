Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6F60194705
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 20:06:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728547AbgCZTGA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 15:06:00 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:36766 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728533AbgCZTGA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 15:06:00 -0400
Received: by mail-pg1-f196.google.com with SMTP id j29so3381375pgl.3
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2020 12:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=j354NRPP+bYhEPyv0l/eLWnC/FKJq0l1PwaRMYH1SEA=;
        b=K98mr/2EPSPry1D6CVXZwN/btfbX99NWR7jA2vI0bBzWspoXAj2nVBwSsIOaLH8K99
         nMK17GGVp6Dw/snKF+uNnHAzaGbulASoOFkGRsoZmmiX7p2BQ3HYYtTKUJd7GKSzTHTg
         RNWArY1CgKHcrZNXLF996z2+dGoNDMJ6CBjK2TgckijJlLWtrCmlUrmIPjiILx8+Huc9
         XDSTSMlB4W1AGDE8rXY0XW4T+vq2Hef860nTuCiIrDUhSwial0zSroEtUscWORZZTKX2
         ZnZqU7//1EtFw5Obrx9aVMv9WGIziEXqjvH5MMwsvPtgKpXqsR6xCFWxAQuxZ0HlITXL
         UrCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=j354NRPP+bYhEPyv0l/eLWnC/FKJq0l1PwaRMYH1SEA=;
        b=NKfBnm+3zQcrjZz8HzzmHKTbugafLtDJr9+2hgpof1X0zrXTOh8NFYq12u1lTel24Z
         UsrcoqNTfXJjpMMkTAlI9JeAsAGAvag0sJ9kDr24aQC449ecnV7QFg2BQvuKIvhnnSK9
         0ZjV4TjG+wlRPlmkVPG/2TLnn5BNXb1rdPduxn2ilYQBJOiyA+yp3tuqp5i9EY/+UEV6
         TP0ThEnClzpV/ulJxZFLxAuKwgOmMmy1VG9IvXBKOPCA0Q1vgyZ4MXlRJ27YhhnCzBqp
         08huBOi6k727XwwXVG6kxzsF2axSEd2nUnSURso+HUvZogZiZi+6s/n1OZmD/LmEbXCO
         V9xQ==
X-Gm-Message-State: ANhLgQ1ZsB9ffQSxQQq2nQuiHNdTgKG8wzEk73to9YcWlPut9zUjU7KT
        vcEBjIxT04xGOKpLk04LrKLx7TLJUcY=
X-Google-Smtp-Source: ADFU+vtxJapAcqzMUDVtDGOAyUYJg2mhdFfRp6spiUV/DhsLMkCw5bTyKZV25L8O2DPe+T9jIvxvmw==
X-Received: by 2002:a63:2d6:: with SMTP id 205mr10350091pgc.257.1585249558597;
        Thu, 26 Mar 2020 12:05:58 -0700 (PDT)
Received: from majic.sklembedded.com (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.googlemail.com with ESMTPSA id q103sm7414623pjc.1.2020.03.26.12.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 12:05:58 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH 09/10] media: imx: utils: Constify mbus argument to imx_media_mbus_fmt_to_pix_fmt
Date:   Thu, 26 Mar 2020 12:05:43 -0700
Message-Id: <20200326190544.16349-10-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200326190544.16349-1-slongerbeam@gmail.com>
References: <20200326190544.16349-1-slongerbeam@gmail.com>
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
index ae7396c0b687..ef3702703936 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -502,7 +502,7 @@ void imx_media_try_colorimetry(struct v4l2_mbus_framefmt *tryfmt,
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

