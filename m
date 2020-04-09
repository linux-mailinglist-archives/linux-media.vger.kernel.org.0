Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFDEB1A3322
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2020 13:24:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbgDILYY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Apr 2020 07:24:24 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:32883 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgDILYY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Apr 2020 07:24:24 -0400
Received: by mail-lj1-f195.google.com with SMTP id q22so7304326ljg.0
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2020 04:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Dv/rOgJVP2GV5fR/2ghMm5umi2s9/aJlyrrqAYWwC4M=;
        b=XwVGmfxT7453PsXhwlGkiY2ZdR5DYSz9mQ68zvznekaLLGGCkt3CcJj05bRkyWtl6+
         kD5Mmc/tXmAo4Uqst5vQ/JWAo0DofVlQkTtulSHHGmJi43xUSkmwdppd6BdfF8G1Rii7
         8UInHyV9XmzwlnWqW3D0yhwIhGrw5NzG6Ryl4zlguepm9tMDqwTkgillp2VeGs4dmkQ8
         XIBbv+hn1KEv61V0GdND2Dilu4EMIzbtUTFVyBKQZwxDSS6eQbzXSQ6NpO19ALcCZAr+
         ldUvTSLoCDIzHXEZ+smCIkJH/Cfheh7FZ09wDjCljFxZqfXcuauMHsEVb0A3rZM/77Nd
         KD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Dv/rOgJVP2GV5fR/2ghMm5umi2s9/aJlyrrqAYWwC4M=;
        b=PP3EWxEi2hy3/VOXqSgW7iceX8oHzxlbf5PtciS7ayBUCYZ9nf/XBThAErByTZxevc
         tlZdYghqUoZ6BefjRQ7PlhO+fxHcynue9RzsvHXFIhBE4tSTGX/19DSFqJ6e8AdJ2iMV
         TT2NcGCagpJlbMn8O0cwCXSvsh2ytyFOevWxoXQr5grEQyWeNM7xPsuHdszW/KD8JipC
         dURl7GGBhOlGFnVSeMflLGopq+6C6fnt4NXJ1qRhCpxBsMNjQUp7Utw/+1XH1Ri0W6bY
         jL+Xspj07dH0AActTc2Pj6okYPo3hfDQD4yfimKd/HNsTEWzj1UfHAeJyI8z0SvG95wc
         iqoQ==
X-Gm-Message-State: AGi0Pub/VbpTBkB5sxrgg5/1f+NlUucqs+qwtpcT/KH14z2SQdf4gGFv
        DW4Pg9hPMtv6CDw65VYLKRSaCg==
X-Google-Smtp-Source: APiQypJc58WHhlGCKDLFAa49iaE/GWMTKqTOQyx0qxi5PrN8WK0JeejzMPuzJKUjns5TeBLOYxF7rQ==
X-Received: by 2002:a2e:330e:: with SMTP id d14mr7988826ljc.153.1586431462748;
        Thu, 09 Apr 2020 04:24:22 -0700 (PDT)
Received: from localhost.localdomain (37-144-159-139.broadband.corbina.ru. [37.144.159.139])
        by smtp.googlemail.com with ESMTPSA id h16sm15083975ljl.73.2020.04.09.04.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 04:24:22 -0700 (PDT)
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
To:     todor.too@gmail.com
Cc:     linux-media@vger.kernel.org, robert.foss@linaro.org,
        loic.poulain@linaro.org, peter.griffin@linaro.org,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Subject: [PATCH] media: camss: use proper media entity function for subdevices
Date:   Thu,  9 Apr 2020 14:24:04 +0300
Message-Id: <20200409112404.21071-1-andrey.konovalov@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently for msm_csiphy, msm_csid, and msm_ispif subdevices the media
entity function field is set to MEDIA_ENT_F_IO_V4L. This is incorrect
as MEDIA_ENT_F_IO_V4L implies V4L2 video node.

Change it to MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER as this is the best
fit from the functions defined in include/uapi/linux/media.h.

Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid.c   | 2 +-
 drivers/media/platform/qcom/camss/camss-csiphy.c | 2 +-
 drivers/media/platform/qcom/camss/camss-ispif.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index a5ae85674ffb..721d7434253e 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1356,7 +1356,7 @@ int msm_csid_register_entity(struct csid_device *csid,
 	pads[MSM_CSID_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
 	pads[MSM_CSID_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
 
-	sd->entity.function = MEDIA_ENT_F_IO_V4L;
+	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
 	sd->entity.ops = &csid_media_ops;
 	ret = media_entity_pads_init(&sd->entity, MSM_CSID_PADS_NUM, pads);
 	if (ret < 0) {
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 008afb85023b..03ef9c5f4774 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -737,7 +737,7 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
 	pads[MSM_CSIPHY_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
 	pads[MSM_CSIPHY_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
 
-	sd->entity.function = MEDIA_ENT_F_IO_V4L;
+	sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
 	sd->entity.ops = &csiphy_media_ops;
 	ret = media_entity_pads_init(&sd->entity, MSM_CSIPHY_PADS_NUM, pads);
 	if (ret < 0) {
diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
index 1f33b4eb198c..f04cdeafbcac 100644
--- a/drivers/media/platform/qcom/camss/camss-ispif.c
+++ b/drivers/media/platform/qcom/camss/camss-ispif.c
@@ -1323,7 +1323,7 @@ int msm_ispif_register_entities(struct ispif_device *ispif,
 		pads[MSM_ISPIF_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
 		pads[MSM_ISPIF_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
 
-		sd->entity.function = MEDIA_ENT_F_IO_V4L;
+		sd->entity.function = MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER;
 		sd->entity.ops = &ispif_media_ops;
 		ret = media_entity_pads_init(&sd->entity, MSM_ISPIF_PADS_NUM,
 					     pads);
-- 
2.17.1

