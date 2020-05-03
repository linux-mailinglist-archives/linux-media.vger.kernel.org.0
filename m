Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C503E1C2FE1
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 00:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729165AbgECWGd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 May 2020 18:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729114AbgECWGd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 3 May 2020 18:06:33 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9650AC061A0E
        for <linux-media@vger.kernel.org>; Sun,  3 May 2020 15:06:31 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id e25so7824625ljg.5
        for <linux-media@vger.kernel.org>; Sun, 03 May 2020 15:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EfKamFfTVpvru80eT02A3+UKqspihWi9aVYBpbm4WN0=;
        b=RViQcO5taL2805iPYOaknLxXGwJ3NV9DADsyLaMOdtmSnukxX/fE88ntTpPZ1M/MnD
         vhEG7ShUEqfka3XEAXjbLGot3wn5eRqd7041aLg19Ijm9fvBCsco2zAgYd+AK1USiMEf
         9nuSVXANGyfsBUq2W9MUZGn8sMmnAceBjTx5bi582uoNiCPCkm1gkww5LQfAiQEs2s8A
         1d/VkeqWvgC6jft6ocQythtifWd4DFw0oHxWok13olhhzPcuq+RFIYQcNKqCYMQgzvad
         F0clUdxs3TlEBarLImwkMM0JrJeBO3zRa0AUFMvrnoLVGrtExwClgMfoSPF4vy5nduak
         bC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EfKamFfTVpvru80eT02A3+UKqspihWi9aVYBpbm4WN0=;
        b=E1b0k9CyLLCiZ1y/Lobb9+Nd2RVQmqiHzclDpn8kKhfuIl+fAApGy2m0UVDOtfSSOj
         iWKVFzDrlQtY2dlKGpZqoXvN09mO5lRprW1qw93SoBp0jCGwzD1z6VMYUpSHy2YHGcH+
         pK5vEmuwJ2S5nh/pj7CTAgB5FxBKFcTDmqYVFJDsuJXyaOmS4GXFL4zQC2KocWYctHSw
         3OtWyXufANN/DJCAyJygI/zuNRqMEtugz3mBYeMuOcDos9dMSfpzv7D1UB7vTALNxvW5
         CBaPD56/oJoASw0G2lYetkxTlR7zADjY9aqHckJ+3nlsgd0niQaUGa+DPIgLsKA5v+ZT
         YzLQ==
X-Gm-Message-State: AGi0Pubg73pdL1Zl1R6V/zopEFnAMPYKDx+fVUq5u5OmQrS/42C10bwc
        pu9jUuHyw2UCbpHJHfoxTdM=
X-Google-Smtp-Source: APiQypIADUUI9UDgXt6N+zIq1Y35S14CHqgNt+la/no8cnUAqu1v+J5o6faFpRrvGeYXRb15CWt1dg==
X-Received: by 2002:a2e:8686:: with SMTP id l6mr8641751lji.152.1588543590014;
        Sun, 03 May 2020 15:06:30 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl (109241122244.gdansk.vectranet.pl. [109.241.122.244])
        by smtp.gmail.com with ESMTPSA id 16sm6637433ljr.55.2020.05.03.15.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 15:06:29 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: [PATCH 3/3] media: ov6650: Fix crop rectangle affected by set format
Date:   Mon,  4 May 2020 00:06:18 +0200
Message-Id: <20200503220618.27743-4-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200503220618.27743-1-jmkrzyszt@gmail.com>
References: <20200503220618.27743-1-jmkrzyszt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

According to subdevice interface specification found in V4L2 API
documentation, set format pad operations should not affect image
geometry set in preceding image processing steps. Unfortunately, that
requirement is not respected by the driver implementation of set format
as it was not the case when that code was still implementing a pair of
now obsolete .s_mbus_fmt() / .try_mbus_fmt() video operations before
they have been merged and reused as an implementation of .set_fmt() pad
operation by commit 717fd5b4907a ("[media] v4l2: replace try_mbus_fmt
by set_fmt").

Exclude non-compliant crop rectangle adjustments from set format try,
as well as a call to .set_selection() from set format active processing
path, so only frame scaling is applied as needed and crop rectangle is
no longer modified.

Fixes: 717fd5b4907a ("[media] v4l2: replace try_mbus_fmt by set_fmt")
Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 drivers/media/i2c/ov6650.c | 28 ++++------------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
index 65701f2c7c7c..4439e2aca076 100644
--- a/drivers/media/i2c/ov6650.c
+++ b/drivers/media/i2c/ov6650.c
@@ -693,11 +693,7 @@ static int ov6650_set_fmt(struct v4l2_subdev *sd,
 	struct v4l2_mbus_framefmt *mf = &format->format;
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov6650 *priv = to_ov6650(client);
-	struct v4l2_subdev_selection sel = {
-		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
-		.target = V4L2_SEL_TGT_CROP,
-	};
-	struct v4l2_rect *crop = &sel.r;
+	struct v4l2_rect *crop;
 	bool half_scale;
 
 	if (format->pad)
@@ -721,24 +717,13 @@ static int ov6650_set_fmt(struct v4l2_subdev *sd,
 	}
 
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY)
-		*crop = cfg->try_crop;
+		crop = &cfg->try_crop;
 	else
-		*crop = priv->rect;
+		crop = &priv->rect;
 
 	half_scale = !is_unscaled_ok(mf->width, mf->height, crop);
 
-	/* adjust new crop rectangle position against its current center */
-	crop->left += (crop->width - (mf->width << half_scale)) / 2;
-	crop->top += (crop->height - (mf->height << half_scale)) / 2;
-	/* adjust new crop rectangle size */
-	crop->width = mf->width << half_scale;
-	crop->height = mf->height << half_scale;
-
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
-		/* store new crop rectangle, hadware bound, in pad config */
-		ov6650_bind_align_crop_rectangle(crop);
-		cfg->try_crop = *crop;
-
 		/* store new mbus frame format code and size in pad config */
 		cfg->try_fmt.width = crop->width >> half_scale;
 		cfg->try_fmt.height = crop->height >> half_scale;
@@ -751,12 +736,7 @@ static int ov6650_set_fmt(struct v4l2_subdev *sd,
 		mf->code = cfg->try_fmt.code;
 
 	} else {
-		int ret;
-
-		/* apply new crop rectangle */
-		ret = ov6650_set_selection(sd, NULL, &sel);
-		if (ret)
-			return ret;
+		int ret = 0;
 
 		/* apply new media bus frame format and scaling if changed */
 		if (mf->code != priv->code || half_scale != priv->half_scale)
-- 
2.24.1

