Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48F2819FA46
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 18:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729522AbgDFQj3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 12:39:29 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38896 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729511AbgDFQj3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 12:39:29 -0400
Received: by mail-pf1-f195.google.com with SMTP id c21so7799762pfo.5
        for <linux-media@vger.kernel.org>; Mon, 06 Apr 2020 09:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=T6mdK1jhXiCps0msJYeXSYYTM4w3nNScnHk7Av/RCpc=;
        b=PahmsxfqRIIyhRsu4CH8zWNlNz3CLrw34+Uj5Reu3+9QyQ22k1Er9hYuVbjMJFyqy1
         CsIFXfX2GaHqnaNnryCui+laPZc6dNEbcSDMfWKuateEFkzvmaq/qN45H4H5h7bsNGLX
         l7UsQwQUo2oYM5ooCjkYYq3U0kOiTklizMPtff+4rOFa89jfTwcQUeDBxHGJNDnrhc/l
         OQOu9mgDGud7lI9LRbg46x+Jp+Xy1trO2QYoS80/VNn+BgYhLyyIljUiPagMTAdslMS8
         Wq6IheuzRqyGMc4Iylr+60If7+1ZGFL8v6zHF0Xg2++9un6ii8aUr7hnVMUhlzQp3rQE
         keRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=T6mdK1jhXiCps0msJYeXSYYTM4w3nNScnHk7Av/RCpc=;
        b=STPFYC775xtDVU+T1P5QdJ4oLr0cgwQ5WWBB/gmBtNYZGLFOfJ14pqwBtwk/AYN75p
         a0E49v3Vy4O214I2KAr7ESXwb30UCnPO9FMU+Llj+6fPU0mHfgg0UOeUk9LPq7111OjR
         hN+rbOta3CBQvJugOoPiW687/OcfghtTLmjHHOqN9jdRKBYaA7MH9HQFjmzRzKvVmuhN
         oR20WtaTXan/qhh/v9pSO/i4oDPfnPTW26DJ2mM5LoccEvRFEcpay/dcDq10PrUzf93Z
         LEuXtXrh6FSebOuG5g+Yvmg4XlzaycJFsHb3dgBM8sOnObnLlpONhg/XPblY7tHGzrS9
         3C+A==
X-Gm-Message-State: AGi0PuZFUt/DJVF8gUxh+/Sua+GeHOh9k6+uF/SRoEA9F4VLNeNcfZgY
        PlEuAJ2+DVhG2/ww6bQ+D0E4FTC4p4A=
X-Google-Smtp-Source: APiQypJYa1fD7gpJGTI6ftj5Bcm+n9l5s5KXIMJh7ve+txsvOjQwUzHFU+gi8Nx4V/kErBFxBVZ4pA==
X-Received: by 2002:a65:6405:: with SMTP id a5mr21793041pgv.255.1586191167692;
        Mon, 06 Apr 2020 09:39:27 -0700 (PDT)
Received: from mappy.world.mentorg.com (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id w29sm11165131pge.25.2020.04.06.09.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 09:39:27 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v7 11/11] media: imx: utils: Constify some mbus and ipu_image arguments
Date:   Mon,  6 Apr 2020 09:39:05 -0700
Message-Id: <20200406163905.24475-12-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200406163905.24475-1-slongerbeam@gmail.com>
References: <20200406163905.24475-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

The imx_media_mbus_fmt_to_pix_fmt() and imx_media_mbus_fmt_to_ipu_image()
functions do not need to modify their mbus argument, and
imx_media_ipu_image_to_mbus_fmt() does not need to modify its ipu_image
argument. Make them const.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

[Constified mbus arg to imx_media_mbus_fmt_to_ipu_image(), and ipu_image
 arg to imx_media_ipu_image_to_mbus_fmt(), as well]
Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 6 +++---
 drivers/staging/media/imx/imx-media.h       | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 85ddea05997a..42e64b618a61 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -497,7 +497,7 @@ void imx_media_try_colorimetry(struct v4l2_mbus_framefmt *tryfmt,
 EXPORT_SYMBOL_GPL(imx_media_try_colorimetry);
 
 int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
-				  struct v4l2_mbus_framefmt *mbus,
+				  const struct v4l2_mbus_framefmt *mbus,
 				  const struct imx_media_pixfmt *cc)
 {
 	u32 width;
@@ -550,7 +550,7 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
 EXPORT_SYMBOL_GPL(imx_media_mbus_fmt_to_pix_fmt);
 
 int imx_media_mbus_fmt_to_ipu_image(struct ipu_image *image,
-				    struct v4l2_mbus_framefmt *mbus)
+				    const struct v4l2_mbus_framefmt *mbus)
 {
 	int ret;
 
@@ -568,7 +568,7 @@ int imx_media_mbus_fmt_to_ipu_image(struct ipu_image *image,
 EXPORT_SYMBOL_GPL(imx_media_mbus_fmt_to_ipu_image);
 
 int imx_media_ipu_image_to_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
-				    struct ipu_image *image)
+				    const struct ipu_image *image)
 {
 	const struct imx_media_pixfmt *fmt;
 
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index 03467f6397c3..ca36beca16de 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -194,12 +194,12 @@ int imx_media_init_cfg(struct v4l2_subdev *sd,
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
-				    struct ipu_image *image);
+				    const struct ipu_image *image);
 void imx_media_grp_id_to_sd_name(char *sd_name, int sz,
 				 u32 grp_id, int ipu_id);
 struct v4l2_subdev *
-- 
2.17.1

