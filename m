Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52DAA196A02
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2020 00:10:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727771AbgC1XKY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Mar 2020 19:10:24 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34814 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727506AbgC1XKY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Mar 2020 19:10:24 -0400
Received: by mail-pf1-f195.google.com with SMTP id 23so6583376pfj.1
        for <linux-media@vger.kernel.org>; Sat, 28 Mar 2020 16:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2r+BGMcE4zz/s+rSEZSFvyUchfyTpyNZWNxDY3jvnBI=;
        b=EC9ElvezSOAKdORKf2y0hfBd8nJ8mzskgJrCLxWZDaRBqnFFhI84EUtB3aUqkW7JiG
         RIv3SY2RVKYomd09cq0J0IGbxQyMelbXJr4P8QJFmZ69baZIKDtTZdJrJBKQg13Bphek
         mtR8I06OXWzBYYYknC/CoMudTa8sk0P85xR+hQOuguX9hb5tp5JyMYjk00a6Wq/I4OB/
         LTo2ScTVaIlXaJuTPdCme+c7oUI0vofgmzayIyMO1wlFcOiqKIL6NuYdVHTSTM0GMdUi
         8rbs9l3oS8mAxbzpyLqDRP0HuaByu70+mXhGDa3bw/v85O19FD08F/8det49G6w5/Ix4
         PknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2r+BGMcE4zz/s+rSEZSFvyUchfyTpyNZWNxDY3jvnBI=;
        b=fY9RLfNIVNAGEOTzXLBwRT1+l4dx1TNOvNgea7s5kBf9NkO/+YqVqkkJURXn1zJNj9
         I8rT+rXEAM2tBd05+UeC7i6YpAS+CgkvlBuLBzLC4lJ4FFHDHVVi4d2nCfSMion5YP3b
         q6dZi9OgULDmbdZ7Hl/eJH2gLYUcZPLOYCEo2fRGn6ddztdWMcEaQWkT02twBiIFmZC/
         nrwpf6z+z9xtY1qoZuNQZH3z99YzrK5w31HppgB9c9CqsXbrELHfZb8/P0n60fMJVr/a
         UPZpmWyPK43l3f1xZQIu+Ea+IDkqzkHI/ew7+5qqGE+L4qP9ihltEEop1498jrnV3wNo
         jJhw==
X-Gm-Message-State: ANhLgQ1rdHaVJllbYn/1Dmw0EbIxh2qfgvljNysI+Lx+vb4E4wIW0gmL
        VmAMq9IUWFzHurmdoLDIkUPgrORKKzY=
X-Google-Smtp-Source: ADFU+vvLC/Jx1CyMCBPRCsSXLzWR4jToLowuaRxaPRgMeIKikDDdjoZ4ccRlwO2eitwm6+vL9ElMkg==
X-Received: by 2002:a63:2642:: with SMTP id m63mr6184385pgm.258.1585437023285;
        Sat, 28 Mar 2020 16:10:23 -0700 (PDT)
Received: from mappy.nv.charter.com ([2600:6c4e:200:e053:3081:8132:c81a:db99])
        by smtp.gmail.com with ESMTPSA id w74sm3978602pfd.112.2020.03.28.16.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2020 16:10:22 -0700 (PDT)
From:   Steve Longerbeam <slongerbeam@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>
Subject: [PATCH v2 09/10] media: imx: utils: Constify mbus argument to imx_media_mbus_fmt_to_pix_fmt
Date:   Sat, 28 Mar 2020 16:10:01 -0700
Message-Id: <20200328231002.649-10-slongerbeam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200328231002.649-1-slongerbeam@gmail.com>
References: <20200328231002.649-1-slongerbeam@gmail.com>
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
index 5198af5d17d6..54f6ded0f7c6 100644
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

