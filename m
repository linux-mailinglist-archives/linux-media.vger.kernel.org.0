Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8636519DFF9
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 22:59:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728536AbgDCU7C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 16:59:02 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41110 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727842AbgDCU7B (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 16:59:01 -0400
Received: by mail-pf1-f193.google.com with SMTP id a24so4149668pfc.8
        for <linux-media@vger.kernel.org>; Fri, 03 Apr 2020 13:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4oLLDK4+SS1hLQO0L6gmLzpjq2x1arrGpoAygELn+fc=;
        b=nDLd2YmaJzNZ+zWAc08DFUfNokRDka4h5ZZPv4iNmcSpJlo9W8IH/AaHFAfHBB1IbY
         io8PtgiZCVmBUOe2KcwyB7Hw98j+IfbDLorUu80b4irx3lN8rQNDqpaI+smeWjhKdml9
         jGLODwZFTCSxH/66Iy9pIcTeDywCO3kf2y018wsBCmKlqj6d3XZficEaKxdTPWVZL5Lk
         JDUx8icaFnWKnCk/24HVHBwfX0GEP1OkJz0c//wd0X/Z1FPNaN2gSqEscJDtPl7mHnpw
         VqyPEG/0F240NQ+vCkecylJEp8ZGFLpgPcn3gZaZNzN/Djreo9UJqhG3NlZrX9e+qUjP
         D9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4oLLDK4+SS1hLQO0L6gmLzpjq2x1arrGpoAygELn+fc=;
        b=VEdX8EyUvrpWTUobiKL5dcBV7O1MoucqkvOoYrLVXqtcVywbMnwRrp7AISpWjZxqKc
         ZoccPBOx4vyI2Apv8az/okpiSa7nms/F7HCcpAjwuiAh5w7zSVhPnsQ224/R50rmpf5B
         Vhih/vj+Lc0pLBENhJ2eeMzt9iFDEVBUeM/uMd/7RU+frO7yrVWE9XXEM+/+GJkKdN7h
         Oq1ZmEu1ik6kFURTssIBYYLp5AB3srHM4hfOP4DCHwx+TjJ5TQgKdpgDrmrlW1gfGfK0
         WdqupuN4+K+UUQUtwjiE44gVt+4YFvvxi1+kUNVrRQ7q+7RDQ3cpzNopk2qAk7AW+VCz
         CA2w==
X-Gm-Message-State: AGi0PuZeZJIYMQT1ku+7aZ31Djuhsg6e1ZHniSrvjIndo17POHTVrHOl
        1ynCeDZhICKxjZkXIb/lw6Yinibf2kk=
X-Google-Smtp-Source: APiQypKPg/8+LTI1Qp1iQCPv7uZ3l/iR60CZ6Aezpex0ZNkFajtSPpk1CKe4CbG7KOqYppOmyV6Mtg==
X-Received: by 2002:a63:f849:: with SMTP id v9mr9844424pgj.116.1585947540308;
        Fri, 03 Apr 2020 13:59:00 -0700 (PDT)
Received: from mappy.world.mentorg.com (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id s39sm6521266pjb.10.2020.04.03.13.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 13:58:59 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Steve Longerbeam <slongerbeam@gmail.com>
Subject: [PATCH v5 11/12] media: imx: utils: Constify ipu_image argument to imx_media_ipu_image_to_mbus_fmt()
Date:   Fri,  3 Apr 2020 13:58:38 -0700
Message-Id: <20200403205839.4531-12-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200403205839.4531-1-slongerbeam@gmail.com>
References: <20200403205839.4531-1-slongerbeam@gmail.com>
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
index 7a8d7212d9e2..f8bd0ff32049 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -525,7 +525,7 @@ int imx_media_mbus_fmt_to_ipu_image(struct ipu_image *image,
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

