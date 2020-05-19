Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F40C1D8CFF
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 03:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727981AbgESBQw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 21:16:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726713AbgESBQv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 21:16:51 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DCE1C05BD09
        for <linux-media@vger.kernel.org>; Mon, 18 May 2020 18:16:51 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id x27so9635349lfg.9
        for <linux-media@vger.kernel.org>; Mon, 18 May 2020 18:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=globallogic.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=iNtkjLBofdH+4f64nkDpx4VziClnAaPL36XhTHv5QzU=;
        b=W8CqP3lMPScdIK6wIrmeT3P/nb87MaSjC2kmNctZJ5viIvGgB48mlnUCoGMa+JFxgw
         cFJE8Ime/RLaYAU+N+vk5UGBE44yFuZK7NQn/afZArp+f4a2nPYxZDRRKTe0yW2MBN5x
         5Z80Ftp/ZYoMOA58mSpEmDUkUu8sTz5kgZj/GQKFjV/wmFIsK7EBAfQo/t0wAXEtx2EN
         NosGoAbeXUKde2bZu2eeZY3Ok75YdM/LptpD+HC1lZx3V/bJ0G05LDU1Gxv3Q+10Raq+
         fzJmQc8cVouEOgW6GqbMjFg6jpKT8OMwNhQD6T+lbhlhSLhkxNYt6Yl0JTyKcSrWhhCu
         w+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=iNtkjLBofdH+4f64nkDpx4VziClnAaPL36XhTHv5QzU=;
        b=ao+YF/tferbyio9jV464+BKumSSP7Egcmy92ragpQIbRwE0auhKOIDRkZvQQo9kzxj
         vnNFWsuRnFua24NeNXtJje1C/7jeLcUeFpRkJUKNeko5NxvcT8ue01bZqDDp5xFKzToj
         BxR4pQfaH8OoppuHo6Y8jjdcitSqQzDrwFYYvztOPmx5JWFGoYMXVRJMY+sWWzL6KoaR
         qJ0R64dJGQA4ZmAIi8TVjd/ZqeHFdxOmHediqFnqcVYXdix1sNroYjhXWq6mdAvs5CmJ
         sUB6pZLKc5j6sbJOFmMXNbG8M38NqIr4kC09k4zULxbig+yj5JOkIqYiJPxKxs/3GPV2
         v8NQ==
X-Gm-Message-State: AOAM531CliyYrEozrIpXTJbU+zETc+7hV0t1+hSd4r2ImtOH0lnp3att
        ARU5esfjq+JpQcvnIJwpH0MA6g==
X-Google-Smtp-Source: ABdhPJzTVQ7s6a5XPWnmoKQsqku0bOnsdidXGcDFI4Nrwm6hwoCvxf6HZrbBO61ZjPhhtmUNk/oxYw==
X-Received: by 2002:a19:c016:: with SMTP id q22mr5245316lff.191.1589851009299;
        Mon, 18 May 2020 18:16:49 -0700 (PDT)
Received: from localhost.localdomain ([159.224.5.60])
        by smtp.googlemail.com with ESMTPSA id i8sm4764244lfl.72.2020.05.18.18.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 18:16:48 -0700 (PDT)
From:   Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Cc:     Luis Oliveira <lolivei@synopsys.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Michael Rodin <mrodin@de.adit-jv.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hugues Fruchet <hugues.fruchet@st.com>,
        Maxime Ripard <mripard@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Todor Tomov <todor.tomov@linaro.org>,
        Suresh Udipi <sudipi@jp.adit-jv.com>,
        Andrew Gabbasov <andrew_gabbasov@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
Subject: [PATCH v2 1/6] media: ov5647: Add set_fmt and get_fmt calls.
Date:   Tue, 19 May 2020 04:16:16 +0300
Message-Id: <8a4c0d157d26251c9916b32866e6a4a91c023ef9.1589850165.git.roman.kovalivskyi@globallogic.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589847910.git.roman.kovalivskyi@globallogic.com>
References: <cover.1589847910.git.roman.kovalivskyi@globallogic.com>
In-Reply-To: <cover.1589850165.git.roman.kovalivskyi@globallogic.com>
References: <cover.1589850165.git.roman.kovalivskyi@globallogic.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

There's no way to query the subdevice for the supported
resolutions. Add set_fmt and get_fmt implementations. Since there's
only one format supported set_fmt does nothing and get returns single
format.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Roman Kovalivskyi <roman.kovalivskyi@globallogic.com>
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
---
 drivers/media/i2c/ov5647.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index e7d2e5b4ad4b..3e587eb0a30e 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -463,8 +463,30 @@ static int ov5647_enum_mbus_code(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int ov5647_set_get_fmt(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_pad_config *cfg,
+			      struct v4l2_subdev_format *format)
+{
+	struct v4l2_mbus_framefmt *fmt = &format->format;
+
+	if (format->pad != 0)
+		return -EINVAL;
+
+	/* Only one format is supported, so return that */
+	memset(fmt, 0, sizeof(*fmt));
+	fmt->code = MEDIA_BUS_FMT_SBGGR8_1X8;
+	fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	fmt->field = V4L2_FIELD_NONE;
+	fmt->width = 640;
+	fmt->height = 480;
+
+	return 0;
+}
+
 static const struct v4l2_subdev_pad_ops ov5647_subdev_pad_ops = {
 	.enum_mbus_code = ov5647_enum_mbus_code,
+	.set_fmt =	  ov5647_set_get_fmt,
+	.get_fmt =	  ov5647_set_get_fmt,
 };
 
 static const struct v4l2_subdev_ops ov5647_subdev_ops = {
-- 
2.17.1

