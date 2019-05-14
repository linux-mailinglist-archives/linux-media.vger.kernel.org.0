Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6D691E555
	for <lists+linux-media@lfdr.de>; Wed, 15 May 2019 00:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbfENWu5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 May 2019 18:50:57 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:32990 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726597AbfENWur (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 May 2019 18:50:47 -0400
Received: by mail-lf1-f66.google.com with SMTP id x132so463369lfd.0;
        Tue, 14 May 2019 15:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lRV9qy86YkxGO30+V0j5zzjwK58T+yK4LkJYyPGRu2M=;
        b=rv76Tzvv5xTtNhz54g1FI1yTF6Y2iTJ6/x1J49i6TegYJQhM49N30DStMqxSUB0fne
         VH06rDC8tXbfGJHm49EqmEE0YwUW30n6k/S/aGO5LdS+TEVFLU2yiDym+nr6tbXvhSCX
         oP+MnpprhEnOaq3Dl0hd6RrJJvvEFeqYdp2t50j0GR3BfZdIJfuCMaDevptpdoTC3pqb
         1W6g+mMu0KKGBTkoQGkD2DvEXQmhEpXx7MmDp1apkP8dSAcDLYCsSEcXLcygGNBrhaaG
         WmxKDdRzd0uAa8KipFQrhYTu7oGUqESTp3vrdv2VQjHqBvDC6JGWqrd9UYadzNdxQxcN
         MQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lRV9qy86YkxGO30+V0j5zzjwK58T+yK4LkJYyPGRu2M=;
        b=gqMuWnXbPipWBM9sHPgnujZujyjwDERQOtiJs7ooIT9QF5NGtZKuE8lEe+3xVGIg1P
         JL3nHjB2nnra5TpKMv44SGXfZk/ux06RsrVSy8AmXmx/10ptf0Tk3PWtblMaee8KH5fn
         oDgqcWbMDWXnjDYHeDKG4w9IQOpr/ep6eP8DRKL8Sf9qKw3CfwahVxEDR80GSRkq50zO
         L5NKYZMbhBXCS+4ka/v1e8Dmz4wF4ACHU8CEvuNbr3aGNs8qjtCOmh/OCn1tbTQNXm88
         tkTu4F1JbObAEtdhsldmt0mw5yZQh7Zpf/WCO8DtttxjaT2PHyz1dLOJPdMaR4Ytlros
         dm6A==
X-Gm-Message-State: APjAAAVzsF0XpZB5fuAru7tLbIFoQJQaT6ApoYhhZ0MjkCq9cR1rsinN
        BWupKP+va//SoY+FJnCOyoA=
X-Google-Smtp-Source: APXvYqxt0LwDi5H2y8srDHie2hT3CWGW2UqgGL9VbMmK7MQKgJ4GgQ+hgME93UjnodF2VMT+pC8BMw==
X-Received: by 2002:ac2:52a8:: with SMTP id r8mr17668182lfm.20.1557874245065;
        Tue, 14 May 2019 15:50:45 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id s6sm50190lje.89.2019.05.14.15.50.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 15:50:44 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v6 3/3] media: v4l2-subdev: Verify v4l2_subdev_call() pad config argument
Date:   Wed, 15 May 2019 00:48:23 +0200
Message-Id: <20190514224823.11564-4-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190514224823.11564-1-jmkrzyszt@gmail.com>
References: <20190514224823.11564-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Extend parameter checks performed by v4l2_subdev_call() with a check for
a non-NULL pad config pointer if V4L2_SUBDEV_FORMAT_TRY format type is
requested so drivers don't need to care.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 6933f30e5041..6a5c4f046723 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -138,20 +138,30 @@ static inline int check_pad(struct v4l2_subdev *sd, __u32 pad)
 	return 0;
 }
 
+static int check_cfg(__u32 which, struct v4l2_subdev_pad_config *cfg)
+{
+	if (which == V4L2_SUBDEV_FORMAT_TRY && !cfg)
+		return -EINVAL;
+
+	return 0;
+}
+
 static inline int check_format(struct v4l2_subdev *sd,
+			       struct v4l2_subdev_pad_config *cfg,
 			       struct v4l2_subdev_format *format)
 {
 	if (!format)
 		return -EINVAL;
 
-	return check_which(format->which) ? : check_pad(sd, format->pad);
+	return check_which(format->which) ? : check_pad(sd, format->pad) ? :
+	       check_cfg(format->which, cfg);
 }
 
 static int call_get_fmt(struct v4l2_subdev *sd,
 			struct v4l2_subdev_pad_config *cfg,
 			struct v4l2_subdev_format *format)
 {
-	return check_format(sd, format) ? :
+	return check_format(sd, cfg, format) ? :
 	       sd->ops->pad->get_fmt(sd, cfg, format);
 }
 
@@ -159,7 +169,7 @@ static int call_set_fmt(struct v4l2_subdev *sd,
 			struct v4l2_subdev_pad_config *cfg,
 			struct v4l2_subdev_format *format)
 {
-	return check_format(sd, format) ? :
+	return check_format(sd, cfg, format) ? :
 	       sd->ops->pad->set_fmt(sd, cfg, format);
 }
 
@@ -171,6 +181,7 @@ static int call_enum_mbus_code(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	return check_which(code->which) ? : check_pad(sd, code->pad) ? :
+	       check_cfg(code->which, cfg) ? :
 	       sd->ops->pad->enum_mbus_code(sd, cfg, code);
 }
 
@@ -182,6 +193,7 @@ static int call_enum_frame_size(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	return check_which(fse->which) ? : check_pad(sd, fse->pad) ? :
+	       check_cfg(fse->which, cfg) ? :
 	       sd->ops->pad->enum_frame_size(sd, cfg, fse);
 }
 
@@ -216,23 +228,26 @@ static int call_enum_frame_interval(struct v4l2_subdev *sd,
 		return -EINVAL;
 
 	return check_which(fie->which) ? : check_pad(sd, fie->pad) ? :
+	       check_cfg(fie->which, cfg) ? :
 	       sd->ops->pad->enum_frame_interval(sd, cfg, fie);
 }
 
 static inline int check_selection(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_pad_config *cfg,
 				  struct v4l2_subdev_selection *sel)
 {
 	if (!sel)
 		return -EINVAL;
 
-	return check_which(sel->which) ? : check_pad(sd, sel->pad);
+	return check_which(sel->which) ? : check_pad(sd, sel->pad) ? :
+	       check_cfg(sel->which, cfg);
 }
 
 static int call_get_selection(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_pad_config *cfg,
 			      struct v4l2_subdev_selection *sel)
 {
-	return check_selection(sd, sel) ? :
+	return check_selection(sd, cfg, sel) ? :
 	       sd->ops->pad->get_selection(sd, cfg, sel);
 }
 
@@ -240,7 +255,7 @@ static int call_set_selection(struct v4l2_subdev *sd,
 			      struct v4l2_subdev_pad_config *cfg,
 			      struct v4l2_subdev_selection *sel)
 {
-	return check_selection(sd, sel) ? :
+	return check_selection(sd, cfg, sel) ? :
 	       sd->ops->pad->set_selection(sd, cfg, sel);
 }
 
-- 
2.21.0

