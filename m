Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C94F1A649D
	for <lists+linux-media@lfdr.de>; Mon, 13 Apr 2020 11:25:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728306AbgDMJY5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Apr 2020 05:24:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728238AbgDMJYn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Apr 2020 05:24:43 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5998FC00860A
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2020 02:18:26 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id 198so6036049lfo.7
        for <linux-media@vger.kernel.org>; Mon, 13 Apr 2020 02:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=globallogic.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=g64ft+x3hBUoNKaOlNsqOIBji2tCG8A8Sg8KRFe28Yc=;
        b=kg6ykZxF9Sg3DIKw4sLTc7wrIYsnOS1F0G3B6b4/E+yNNiTq6/CUotfvSeyDIOHR/r
         ZrqNeqfJCLBa5UDqK/KZ/paCvMlYMjG5l3Ol+rNJCXYNmbekl6Srhf9uct55aVBtcIa6
         fvfATh+tuQNfDPPfLbCF/0GFaYwvDxefnNZXI5H+bASe3vkZJT906W1tQ5K0CNmVfCgK
         +otgCvqFVk+vo/OLeUyQQbig/uffIqcMqN/K3C+tL0AS4APDyvw7uXpvA0PFgnmp1zMC
         pzQd0M4fDUvFrYYRoWlVOQa5BX7/JIDLHSRdp+lXPr0Huj5jxzzbhovTAnF3EYVxV2/h
         9J7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=g64ft+x3hBUoNKaOlNsqOIBji2tCG8A8Sg8KRFe28Yc=;
        b=Cz9oQsjjiI/pm69BARODqZRvo9Smb5NDQiCgA+1b5JnfPOWi/QZw2YqNhoy9WUwPAC
         TUGLVr5NpznxXNocvwvNGrQPY90qfUFU5LcT/esSkpju66ac/M0APctRv+bTprvHgkbT
         AG9gjsHOPFITL1TY3wAVTEoP47N/g7IGYt4reFw/3976rnjFKyBPEIbbCtqFQ9Fm0O+X
         vD1s0KwAT4b2TbI3jeGevikM+l8nO2yp/C9bAg3im5EPIBAe92G72IvrIm+MKLSQcoG4
         NgU75nYjV5A15KDg4cXLnaVcS2KghLQvw2+l5dAfh0Il90CDuFeTV+oDyg1OfhQy/yMd
         UZCg==
X-Gm-Message-State: AGi0PuYPLIqxZvUcWKJK0YFZWvqhiJs/ddpRi9jVPvYdFMqzJ0lrCOKO
        lhFXwMCnnz8WiKY0m3ka0rdTiQ==
X-Google-Smtp-Source: APiQypKsD9OoGak6fki/X4BhtvzdRdt8QcUcFqDWZ/kirBl+F7dY0/BGOtgEXs30BbUHtznkTZvNTQ==
X-Received: by 2002:a05:6512:1095:: with SMTP id j21mr10024855lfg.118.1586769504807;
        Mon, 13 Apr 2020 02:18:24 -0700 (PDT)
Received: from localhost.localdomain ([159.224.5.60])
        by smtp.googlemail.com with ESMTPSA id e16sm8339049ljh.18.2020.04.13.02.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 02:18:24 -0700 (PDT)
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
Subject: [PATCH 1/4] media: ov5647: Add set_fmt and get_fmt calls.
Date:   Mon, 13 Apr 2020 12:17:44 +0300
Message-Id: <8a4c0d157d26251c9916b32866e6a4a91c023ef9.1586759968.git.roman.kovalivskyi@globallogic.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1586758372.git.roman.kovalivskyi@globallogic.com>
References: <cover.1586758372.git.roman.kovalivskyi@globallogic.com>
In-Reply-To: <cover.1586759968.git.roman.kovalivskyi@globallogic.com>
References: <cover.1586759968.git.roman.kovalivskyi@globallogic.com>
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

