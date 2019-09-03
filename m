Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1370A7468
	for <lists+linux-media@lfdr.de>; Tue,  3 Sep 2019 22:13:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbfICUNe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 Sep 2019 16:13:34 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46780 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbfICUNE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 Sep 2019 16:13:04 -0400
Received: by mail-lf1-f67.google.com with SMTP id t8so1485148lfc.13;
        Tue, 03 Sep 2019 13:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q5KotmXfTnoMjmOgmgzzUJPt9WlkNFv2bSSb35yjqRk=;
        b=CNWUdGO7uuMPHYOgYW6iDsqxHyNy9BsD762YI1yn2WOED6HCz5fseybmpfLm2VybDp
         93fSFjmNitS0DnGX9lm16h6I1TjwU4L23csUf6V/jF4j0GtNAxxEWFXiAd6R1g+04mTQ
         3g0k/71RcZtpUwblCpL/Dl9NQce7vrltsrbQbrL/kbbC16J96jSktGcrmEHX4eAsxv3h
         43mguN94H5f4UfnmeeMrnZJzRG1MxDiVr4GNJMrfueM03FGI7XpzIoAIZWH80HQjgMpW
         mBxZS3KBTRuy0sqxS513VQPfwrZZNSvsbevN1HB7icFf7U2AsKGmJpHO9mYdXaTY1RJ0
         3HQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q5KotmXfTnoMjmOgmgzzUJPt9WlkNFv2bSSb35yjqRk=;
        b=NsSB5TDW+mtQHvoh1vZyQWPnTn79xe4xBkbDRHFr9dqN6hXwNn4LmPs3gcYeq97dnI
         hrdZF6EBppQ8JwCAtxvhbCihmp9y3+YX2ydRt21/eyCnpvNIsuzWotqxg1+kd1R2ajvG
         sc0sx21lS1zvXtVCfgL7/OW1Dngut9ES4KH1MQsjgBEzZsJssc2fRMdrXwgoMhpGp6Ex
         xf6TiDgNZiQMh9MM8g2t+GuioS7QOP7D+rlN6qKQC/LYvo8/sGsmPogwXMYZYGNycefI
         YmjDHPB4afHdWo9sRPWkNQNWHmRi1eE79KOjrPBqqMgR9myojRGGFw2pBIf5pbbBEyam
         +W3Q==
X-Gm-Message-State: APjAAAUhZ16ZpUG46APQuXwFnPua6/s32eAmbwQ6nd6hcvdZsjecM49r
        1cpNuJL8AE34pBu6Z5pU/qs=
X-Google-Smtp-Source: APXvYqw7nj5yFdTfTa//BtM9y29LRoHdCR68OzikYhUGFy3Zu/29vQCe1aWKhxqJUexxaM3JrWSnhg==
X-Received: by 2002:ac2:4201:: with SMTP id y1mr13035055lfh.127.1567541582228;
        Tue, 03 Sep 2019 13:13:02 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241207190.gdansk.vectranet.pl. [109.241.207.190])
        by smtp.gmail.com with ESMTPSA id u14sm2960884ljd.14.2019.09.03.13.13.01
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Sep 2019 13:13:01 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hans.verkuil@cisco.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH v3 3/9] media: ov6650: Fix crop rectangle alignment not passed back
Date:   Tue,  3 Sep 2019 22:11:38 +0200
Message-Id: <20190903201144.13219-4-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903201144.13219-1-jmkrzyszt@gmail.com>
References: <20190903201144.13219-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 4f996594ceaf ("[media] v4l2: make vidioc_s_crop const")
introduced a writable copy of constified user requested crop rectangle
in order to be able to perform hardware alignments on it.  Later
on, commit 10d5509c8d50 ("[media] v4l2: remove g/s_crop from video
ops") replaced s_crop() video operation using that const argument with
set_selection() pad operation which had a corresponding argument not
constified, however the original behavior of the driver was not
restored.  Since that time, any hardware alignment applied on a user
requested crop rectangle is not passed back to the user calling
.set_selection() as it should be.

Fix the issue by dropping the copy and replacing all references to it
with references to the crop rectangle embedded in the user argument.

Fixes: 10d5509c8d50 ("[media] v4l2: remove g/s_crop from video ops")
Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/media/i2c/ov6650.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index cb2aa76cd6cc..983b72f33930 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -465,38 +465,37 @@ static int ov6650_set_selection(struct v4l2_subdev *sd,
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov6650 *priv = to_ov6650(client);
-	struct v4l2_rect rect = sel->r;
 	int ret;
 
 	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE ||
 	    sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
 
-	v4l_bound_align_image(&rect.width, 2, W_CIF, 1,
-			      &rect.height, 2, H_CIF, 1, 0);
-	v4l_bound_align_image(&rect.left, DEF_HSTRT << 1,
-			      (DEF_HSTRT << 1) + W_CIF - (__s32)rect.width, 1,
-			      &rect.top, DEF_VSTRT << 1,
-			      (DEF_VSTRT << 1) + H_CIF - (__s32)rect.height, 1,
-			      0);
+	v4l_bound_align_image(&sel->r.width, 2, W_CIF, 1,
+			      &sel->r.height, 2, H_CIF, 1, 0);
+	v4l_bound_align_image(&sel->r.left, DEF_HSTRT << 1,
+			      (DEF_HSTRT << 1) + W_CIF - (__s32)sel->r.width, 1,
+			      &sel->r.top, DEF_VSTRT << 1,
+			      (DEF_VSTRT << 1) + H_CIF - (__s32)sel->r.height,
+			      1, 0);
 
-	ret = ov6650_reg_write(client, REG_HSTRT, rect.left >> 1);
+	ret = ov6650_reg_write(client, REG_HSTRT, sel->r.left >> 1);
 	if (!ret) {
-		priv->rect.left = rect.left;
+		priv->rect.left = sel->r.left;
 		ret = ov6650_reg_write(client, REG_HSTOP,
-				(rect.left + rect.width) >> 1);
+				       (sel->r.left + sel->r.width) >> 1);
 	}
 	if (!ret) {
-		priv->rect.width = rect.width;
-		ret = ov6650_reg_write(client, REG_VSTRT, rect.top >> 1);
+		priv->rect.width = sel->r.width;
+		ret = ov6650_reg_write(client, REG_VSTRT, sel->r.top >> 1);
 	}
 	if (!ret) {
-		priv->rect.top = rect.top;
+		priv->rect.top = sel->r.top;
 		ret = ov6650_reg_write(client, REG_VSTOP,
-				(rect.top + rect.height) >> 1);
+				       (sel->r.top + sel->r.height) >> 1);
 	}
 	if (!ret)
-		priv->rect.height = rect.height;
+		priv->rect.height = sel->r.height;
 
 	return ret;
 }
-- 
2.21.0

