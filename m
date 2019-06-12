Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC8B0421E2
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 12:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732010AbfFLKAk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 06:00:40 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:32983 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731793AbfFLKAk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 06:00:40 -0400
Received: by mail-wm1-f65.google.com with SMTP id h19so3898167wme.0
        for <linux-media@vger.kernel.org>; Wed, 12 Jun 2019 03:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xs/onsvj8LhvP480cm22UcwXWUrCKOKzAtSdr56bwcY=;
        b=cJ5zsX5/F64ZPa4vYXKat/E7bPZzkKxV+yrIkeNzVwPTXTEFD1YDFJA1eO60MrVvFO
         gF4Ls9p1tNOLm1iWWMmX7FCy6n1FsosIRSKLG+rqzP62n+xy84/Dl6YyfPeDLUIFTVH5
         26PbcJR9Xy6TY0z9fbwZZ1la0nI6air9+lMj5FwtOWfyzrzWzzAG4ckvSQWn6AKRPq7h
         s2gFmJ5nCMUwkFkfkrDYyHE4scx2wxxemf7ZFneNK9JA0D002UvEaLBMrPMXX+9LxF/9
         0f00wEjtL7etS+b+iaakFTpK5HKR221AmxOulwCNQBjiAqSokpDkWGI8TkyX884FKrCq
         GGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Xs/onsvj8LhvP480cm22UcwXWUrCKOKzAtSdr56bwcY=;
        b=MwajXbwxFTsHHwxK4cEVqW6ZwJF5bThytF74phgyqRblkJraHgnTPkYkpKEDWXSRAP
         K7c1wok24bSwKNtDWFYjP8yOO5KiStEqY9S6xnDP2uVOHDYol4NgSlw0FhLfPki2jLuL
         +n/U3tfCVPgOlLdOS9xHmnDaaJFetZHR7sXgZtFWOT9GG/ub1MOO5289cbjiwRuBk1L2
         PWsKMhyIKGYQ9ppyJsaz2C1Y+wyRfo98B6bzdA0phHHuBrcwtjBnR8UTqdLl36gQZoMF
         Fmfj8tb4LCHHD5gFNbBGDfEEBWuYJCAvzVDQRX0LN1WFR5/1cISP67T8eHk3tGPAKUCo
         Gsfg==
X-Gm-Message-State: APjAAAV9RXfF4N4hP1OdzQ1PA9SN8wVoXQDIfNGhj7yr9Ob+2rE51SLr
        XeDL9bqZ5CQEyFL2clRUPCGo4g==
X-Google-Smtp-Source: APXvYqxi5qt+Z77Cjl7zSYBDtKZQi8K7Mm14k1yNCutmnw1+eEMvhZsyOJPio+rVXgczYSgJVM5eGQ==
X-Received: by 2002:a1c:f018:: with SMTP id a24mr2731643wmb.66.1560333638470;
        Wed, 12 Jun 2019 03:00:38 -0700 (PDT)
Received: from arch-late.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id t6sm5742864wmb.29.2019.06.12.03.00.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 12 Jun 2019 03:00:37 -0700 (PDT)
From:   Rui Miguel Silva <rui.silva@linaro.org>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Sebastien Szymanski <sebastien.szymanski@armadeus.com>
Subject: [PATCH v2] media: imx7-media-csi: get csi upstream endpoint
Date:   Wed, 12 Jun 2019 11:00:28 +0100
Message-Id: <20190612100028.6138-1-rui.silva@linaro.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When the upstream endpoint is neither a mux nor a CSI2 module, just get
the source pad directly upstream from the CSI.

Fixes: 05f634040c0d ("media: staging/imx7: add imx7 CSI subdev driver")
Reported-by: Sebastien Szymanski <sebastien.szymanski@armadeus.com>
Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
v1->v2:
Dan Carpenter:
  - s/in/is/
  - align code, and white space fix.

 drivers/staging/media/imx/imx7-media-csi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 9101566f3f67..f775870df7e0 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -442,6 +442,14 @@ static int imx7_csi_get_upstream_endpoint(struct imx7_csi *csi,
 
 	src = &csi->src_sd->entity;
 
+	/*
+	 * if the source is neither a mux or csi2 get the one directly upstream
+	 * from this csi
+	 */
+	if (src->function != MEDIA_ENT_F_VID_IF_BRIDGE &&
+	    src->function != MEDIA_ENT_F_VID_MUX)
+		src = &csi->sd.entity;
+
 skip_video_mux:
 	/* get source pad of entity directly upstream from src */
 	pad = imx_media_pipeline_pad(src, 0, 0, true);
-- 
2.22.0

