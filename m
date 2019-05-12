Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D19D51AE0F
	for <lists+linux-media@lfdr.de>; Sun, 12 May 2019 22:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727118AbfELUQM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 May 2019 16:16:12 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:38370 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726967AbfELUQL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 May 2019 16:16:11 -0400
Received: by mail-lj1-f193.google.com with SMTP id 14so9123196ljj.5;
        Sun, 12 May 2019 13:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EaY1su4hEWKGEwfPVblCSADrkO2FOUhq1ciLnu8ghzI=;
        b=PrY1Wzjp46HKoTP4coQqHQyMrf/c6/KedYI4xU1E+ynvC7kwUW+7tlOxZcji2wFHao
         +XUru6DIMTohHTaanpX0foJjCacrOAbUQzbA328kzPa0yblP6KNYFul7lZA+SSUCzyEd
         FkbqC+PXTLR9bK1+plFDEBbjSDVwBsM4Ai0rVrQ7NxDPTrXEDTR00bh1XV9vervXUp/Y
         2TI1NiXuaqSyaZbD+i1+Bob5T0ZkM6/dLUudpGKfbN98MHQvRgtTPAf8he7t6X1mR7jN
         GkFCB7NVtlaI7wLghE5e7D0PY3InR8WFE+W6Rm97SRjuLueBkkOoe9ajNVMUo2j21XAE
         wIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EaY1su4hEWKGEwfPVblCSADrkO2FOUhq1ciLnu8ghzI=;
        b=HlYKSV9j/cwzek65HbFdQNTzYQlByLjel79RtLwkSKhic35XPmbXxYQO8l2EW7FKSw
         gLRNkRpFEnP0BfaMgXPV5cBIHeWCpdQCcXmpERYFbo0rHI/YY0WuyhKVJwnzRvFop3ml
         8Q6pH0sdi2mwEbW5iKi7ap/k3aDA3uRaj7dzvVUSMaP1y9nWFa/a8KGhwgMaXtbUJtxA
         /bCH/uEkAHGwDJniTibHJkeh5febFe16kEm9lfxxb7LxX5Ulx3QcuU6NIE1rScKIvg3U
         6C6wDAutaLIqx+2BvVWeP5SmJSguND1xW3VIXxRZrmw/kgGz0UYi9ph8SanTuvZAaFg4
         x7eA==
X-Gm-Message-State: APjAAAUudlOI5aFsh7C8by+NvX5TlQgoALexOFci0PEpKkFyGZ3vjb3o
        tZjWXwGqf6EUUHRMHEuDSyg=
X-Google-Smtp-Source: APXvYqxuDS8jazRUOIjZxSKmwWmNMREJC4bx6CT8BNWtSKmQoF4sRSlLcCg6EEMMEk4ub6QxdSA7Yg==
X-Received: by 2002:a2e:74f:: with SMTP id i15mr11424120ljd.156.1557692169180;
        Sun, 12 May 2019 13:16:09 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id w20sm2360533ljd.39.2019.05.12.13.16.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 13:16:08 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v5 2/4] media: v4l2-subdev: WARN_ON invalid v4l2_subdev_call() arguments
Date:   Sun, 12 May 2019 22:15:49 +0200
Message-Id: <20190512201551.18724-3-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190512201551.18724-1-jmkrzyszt@gmail.com>
References: <20190512201551.18724-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Invalid arguments passed to v4l2_subdev_call generally mean bugs.  Be
noisy if that happens.

Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 890916674d42..5f2264575cd7 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -122,8 +122,8 @@ static int subdev_close(struct file *file)
 
 static int check_which(__u32 which)
 {
-	if (which != V4L2_SUBDEV_FORMAT_TRY &&
-	    which != V4L2_SUBDEV_FORMAT_ACTIVE)
+	if (WARN_ON(which != V4L2_SUBDEV_FORMAT_TRY &&
+		    which != V4L2_SUBDEV_FORMAT_ACTIVE))
 		return -EINVAL;
 
 	return 0;
@@ -132,7 +132,7 @@ static int check_which(__u32 which)
 static int check_pad(struct v4l2_subdev *sd, __u32 pad)
 {
 #if defined(CONFIG_MEDIA_CONTROLLER)
-	if (sd->entity.num_pads && pad >= sd->entity.num_pads)
+	if (WARN_ON(sd->entity.num_pads && pad >= sd->entity.num_pads))
 		return -EINVAL;
 #endif
 	return 0;
@@ -228,7 +228,7 @@ static int check_set_selection(struct v4l2_subdev *sd,
 
 static int check_edid(struct v4l2_subdev *sd, struct v4l2_subdev_edid *edid)
 {
-	if (edid->blocks && edid->edid == NULL)
+	if (WARN_ON(edid->blocks && edid->edid == NULL))
 		return -EINVAL;
 
 	return check_pad(sd, edid->pad);
-- 
2.21.0

