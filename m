Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2237F19E7F2
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2020 00:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbgDDWly (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 Apr 2020 18:41:54 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:35222 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbgDDWlx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 Apr 2020 18:41:53 -0400
Received: by mail-pj1-f65.google.com with SMTP id g9so4749182pjp.0
        for <linux-media@vger.kernel.org>; Sat, 04 Apr 2020 15:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=acKMT5mBAUXJL5E/oW3H1v6FNP93v7Ap4h7BIdGPoxM=;
        b=Zevq47a5M5KQNmjbAb+ibYc6WkIeB3ViNiMIWTnTsz68+ol5llbdxiOJz6EjAh8+Ug
         Kf5hjHE91ZLcAvO0o70GYORooXOl9XcREtg65tXDw1S/WhPW9KeEb2AFjcbwxGtAeUPN
         5OToPDRoocP9t570Ye3e26Q4W0LnI0R0eiPNoxN+hL94dSuqqgtOefbn0njHMRRANXHR
         7FhDSXKUBz1aIjzGlEXdfpEZWnlmO5K916cFnn5FTiXf6L5QZIaxpJIQnMjNwnhHTVCK
         oOowN84Mw9rSbbRvokJicgbz4uHXqZNJ/KsKLulklfmuwiEh9Nt5G8Lb3sk/oWeW4vno
         nntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=acKMT5mBAUXJL5E/oW3H1v6FNP93v7Ap4h7BIdGPoxM=;
        b=SaPUC7PspqEtACz2Ao75MHGTUKi43kxfy/ho5ne/sO/HsPUnSdBPK8tJC71sIVlAx1
         bsv38bE7GOG5Qf3MIjkQRgbJ7n5k5REeVr6FDhHXTwrecG7Ox2Jis0igWN7HCjTPZgF0
         kai+nvOsBSZNVZNv7GulnMyGZ2Ip656Ke9WyRpwRmq2i5lvm5hydCgxhdLzAMpRE5g3G
         CG62PfKPxV5yjqqwpV9DCwvRTfwNmzGz8bGREGg1LU27fcoFKl8NF81NIyweiICUfUlV
         4dYTJ4hmlU1W66Lz4dO0FaGWH35GNTmaECqzQAQF0ovHJrdP6nLqyLNhtyx6Yr7FM+5b
         XDiA==
X-Gm-Message-State: AGi0Puai6YThJPjAAo0NYBfgXwmO31PiUPa3o8v0T2w1WlTPAtvvf4Ag
        pqx1mdVaSDDpvWUsFC0B1nw+TsJNWiM=
X-Google-Smtp-Source: APiQypI8tgYIvxRPxBCUPnnRGjaX70mjGhxOuwji/Q+xN2OaD5Yy92XA8y5os8IoLFJuiS825Z2oFA==
X-Received: by 2002:a17:902:598e:: with SMTP id p14mr12988990pli.276.1586040112430;
        Sat, 04 Apr 2020 15:41:52 -0700 (PDT)
Received: from mappy.world.mentorg.com (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id o11sm8690989pjb.18.2020.04.04.15.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 15:41:51 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v6 11/11] media: imx: utils: Constify ipu_image argument to imx_media_ipu_image_to_mbus_fmt()
Date:   Sat,  4 Apr 2020 15:41:30 -0700
Message-Id: <20200404224130.23118-12-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404224130.23118-1-slongerbeam@gmail.com>
References: <20200404224130.23118-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The imx_media_ipu_image_to_mbus_fmt() function doesn't need to modify its
ipu_image argument. Make it const.

Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
---
 drivers/staging/media/imx/imx-media-utils.c | 2 +-
 drivers/staging/media/imx/imx-media.h       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index b8ee005e4445..c00f253976f5 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -580,7 +580,7 @@ int imx_media_mbus_fmt_to_ipu_image(struct ipu_image *image,
 EXPORT_SYMBOL_GPL(imx_media_mbus_fmt_to_ipu_image);
 
 int imx_media_ipu_image_to_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
-				    struct ipu_image *image)
+				    const struct ipu_image *image)
 {
 	const struct imx_media_pixfmt *fmt;
 
diff --git a/drivers/staging/media/imx/imx-media.h b/drivers/staging/media/imx/imx-media.h
index c03114a6f6c8..af806ecc67a9 100644
--- a/drivers/staging/media/imx/imx-media.h
+++ b/drivers/staging/media/imx/imx-media.h
@@ -189,7 +189,7 @@ int imx_media_mbus_fmt_to_pix_fmt(struct v4l2_pix_format *pix,
 int imx_media_mbus_fmt_to_ipu_image(struct ipu_image *image,
 				    const struct v4l2_mbus_framefmt *mbus);
 int imx_media_ipu_image_to_mbus_fmt(struct v4l2_mbus_framefmt *mbus,
-				    struct ipu_image *image);
+				    const struct ipu_image *image);
 void imx_media_grp_id_to_sd_name(char *sd_name, int sz,
 				 u32 grp_id, int ipu_id);
 struct v4l2_subdev *
-- 
2.17.1

