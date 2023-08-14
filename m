Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B10A77BCB1
	for <lists+linux-media@lfdr.de>; Mon, 14 Aug 2023 17:13:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232838AbjHNPNX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Aug 2023 11:13:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232834AbjHNPNB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Aug 2023 11:13:01 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C887CE6E
        for <linux-media@vger.kernel.org>; Mon, 14 Aug 2023 08:12:59 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fe8242fc4dso36499415e9.1
        for <linux-media@vger.kernel.org>; Mon, 14 Aug 2023 08:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692025978; x=1692630778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0x4ozwHcR60yAzmxM62laa6YE67TcNzLtskHx94XiuY=;
        b=NR+tWI2p9tWodyUEqe41Fo/PQntf4NmE6AAZzgycxCiCjRbFceISnPAjipsUgXr7Ip
         qQQL6ExQMNsD3ZOSrYiPA7PfP2Z6/6AptDdzchRs+47u7mqFvG62C5jFdZccUGCE4Kse
         Q3zJAop0JeYBnuoTdTnii08VlLK5RZTnU6LnUFcLFqNHpdnh8oqfoFVUx/USn8OyTsxC
         Ly6uzfe0/d8cTs9ElYXgfrg5i5WiENaciyUaao5lq5mIjnZ5mTtcdcgA81wpJHuCY/LZ
         C7CYL8p2QtiRZ2iDyg6FznU22ov/zsQRWhYiwTZDiW84XLNNskoHsaRTlsXIncjhrt/a
         IjfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692025978; x=1692630778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0x4ozwHcR60yAzmxM62laa6YE67TcNzLtskHx94XiuY=;
        b=HmZj5YLQoLLA4B5naFch853CQ7orcPX5kuhhorCubryyFavZjHjFDqm+jgq9nQGhBe
         x61Vqigycd9IQRc4a9Sq7mgxgfCO/3BZ/L6NtFBvWfhNuqsRVuYyVc6sNfydz0oibb3N
         JqcK7lSQkUvgVVVNriD9wq9vIEHDaW3Hn4MW7aJQpLhcmAYpyk/NORSR1RuqgXL+9ykk
         DTKONLpzmQT3gYw3WgPCYKobKIyXup/dtss5xrxQRBWvvMFZvXAUVjgx9o2F+jR/8J0g
         ANvrMb43GXM2sFFEMYM2X8+qFQiXDC/FIj6KbCHcwVzhyCYLwVgQPbMrGZJ5UcBJ5/a2
         q1IQ==
X-Gm-Message-State: AOJu0YwxwTObALJYwb7wPTp3a7bWHv7GFz0bRjrTf53YrS3M14ZeJrqd
        jY/ynHMEBHqxeb+Xo6UQny9Zaw==
X-Google-Smtp-Source: AGHT+IHKc17lMVbfZKLIgLIlhESVgnyycna/yBLBfnwT5VLrAEXTYqkANqPtJa7ZTa6zi5w5pdD3+A==
X-Received: by 2002:a05:600c:2482:b0:3fc:5bcc:a909 with SMTP id 2-20020a05600c248200b003fc5bcca909mr8467105wms.2.1692025978429;
        Mon, 14 Aug 2023 08:12:58 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c021100b003fe1c332810sm17644572wmi.33.2023.08.14.08.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 08:12:57 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     rfoss@kernel.org, todor.too@gmail.com, bryan.odonoghue@linaro.org,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        andrey.konovalov@linaro.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v0 09/13] media: qcom: camss: Untangle if/else spaghetti in camss
Date:   Mon, 14 Aug 2023 16:12:39 +0100
Message-ID: <20230814151243.3801456-10-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230814151243.3801456-1-bryan.odonoghue@linaro.org>
References: <20230814151243.3801456-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

I refuse to add another SoC to this convoluted if/else structure. By the
time we added in a third SoC we ought to have transitioned these control
flow strutures to switches.

Adding in another Soc or two will make some of these if statements into
five clause behemoths.

Introduce switches in the obvious places to despaghetiify.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../media/platform/qcom/camss/camss-csid.c    | 16 ++++---
 .../media/platform/qcom/camss/camss-csiphy.c  | 22 ++++++---
 drivers/media/platform/qcom/camss/camss-vfe.c | 45 +++++++++++++------
 .../media/platform/qcom/camss/camss-video.c   | 16 ++++---
 4 files changed, 68 insertions(+), 31 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 7ff450039ec3f..9e91d9414bebc 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -576,15 +576,19 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 	csid->camss = camss;
 	csid->id = id;
 
-	if (camss->res->version == CAMSS_8x16) {
+	switch (camss->res->version) {
+	case CAMSS_8x16:
 		csid->ops = &csid_ops_4_1;
-	} else if (camss->res->version == CAMSS_8x96 ||
-		   camss->res->version == CAMSS_660) {
+		break;
+	case CAMSS_8x96:
+	case CAMSS_660:
 		csid->ops = &csid_ops_4_7;
-	} else if (camss->res->version == CAMSS_845 ||
-		   camss->res->version == CAMSS_8250) {
+		break;
+	case CAMSS_845:
+	case CAMSS_8250:
 		csid->ops = &csid_ops_gen2;
-	} else {
+		break;
+	default:
 		return -EINVAL;
 	}
 	csid->ops->subdev_init(csid);
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 593aec5c97bc2..0e8c2a59ea241 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -557,21 +557,31 @@ int msm_csiphy_subdev_init(struct camss *camss,
 	csiphy->id = id;
 	csiphy->cfg.combo_mode = 0;
 
-	if (camss->res->version == CAMSS_8x16) {
+	switch (camss->res->version) {
+	case CAMSS_8x16:
+	{
 		csiphy->ops = &csiphy_ops_2ph_1_0;
 		csiphy->formats = csiphy_formats_8x16;
 		csiphy->nformats = ARRAY_SIZE(csiphy_formats_8x16);
-	} else if (camss->res->version == CAMSS_8x96 ||
-		   camss->res->version == CAMSS_660) {
+		break;
+	}
+	case CAMSS_8x96:
+	case CAMSS_660:
+	{
 		csiphy->ops = &csiphy_ops_3ph_1_0;
 		csiphy->formats = csiphy_formats_8x96;
 		csiphy->nformats = ARRAY_SIZE(csiphy_formats_8x96);
-	} else if (camss->res->version == CAMSS_845 ||
-		   camss->res->version == CAMSS_8250) {
+		break;
+	}
+	case CAMSS_845:
+	case CAMSS_8250:
+	{
 		csiphy->ops = &csiphy_ops_3ph_1_0;
 		csiphy->formats = csiphy_formats_sdm845;
 		csiphy->nformats = ARRAY_SIZE(csiphy_formats_sdm845);
-	} else {
+		break;
+	}
+	default:
 		return -EINVAL;
 	}
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index b789b3b2e4cfd..8f48401e31cd3 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -170,7 +170,9 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 {
 	struct vfe_device *vfe = to_vfe(line);
 
-	if (vfe->camss->res->version == CAMSS_8x16)
+	switch (vfe->camss->res->version) {
+	case CAMSS_8x16:
+	{
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_1X16:
 		{
@@ -218,10 +220,13 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 
 			return sink_code;
 		}
-	else if (vfe->camss->res->version == CAMSS_8x96 ||
-		 vfe->camss->res->version == CAMSS_660 ||
-		 vfe->camss->res->version == CAMSS_845 ||
-		 vfe->camss->res->version == CAMSS_8250)
+		break;
+	}
+	case CAMSS_8x96:
+	case CAMSS_660:
+	case CAMSS_845:
+	case CAMSS_8250:
+	{
 		switch (sink_code) {
 		case MEDIA_BUS_FMT_YUYV8_1X16:
 		{
@@ -281,8 +286,12 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 
 			return sink_code;
 		}
-	else
-		return 0;
+		break;
+	}
+	default:
+		break;
+	}
+	return 0;
 }
 
 int vfe_reset(struct vfe_device *vfe)
@@ -1397,7 +1406,9 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 		init_completion(&l->output.sof);
 		init_completion(&l->output.reg_update);
 
-		if (camss->res->version == CAMSS_8x16) {
+		switch (camss->res->version) {
+		case CAMSS_8x16:
+		{
 			if (i == VFE_LINE_PIX) {
 				l->formats = formats_pix_8x16;
 				l->nformats = ARRAY_SIZE(formats_pix_8x16);
@@ -1405,8 +1416,11 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 				l->formats = formats_rdi_8x16;
 				l->nformats = ARRAY_SIZE(formats_rdi_8x16);
 			}
-		} else if (camss->res->version == CAMSS_8x96 ||
-			   camss->res->version == CAMSS_660) {
+			break;
+		}
+		case CAMSS_8x96:
+		case CAMSS_660:
+		{
 			if (i == VFE_LINE_PIX) {
 				l->formats = formats_pix_8x96;
 				l->nformats = ARRAY_SIZE(formats_pix_8x96);
@@ -1414,11 +1428,16 @@ int msm_vfe_subdev_init(struct camss *camss, struct vfe_device *vfe,
 				l->formats = formats_rdi_8x96;
 				l->nformats = ARRAY_SIZE(formats_rdi_8x96);
 			}
-		} else if (camss->res->version == CAMSS_845 ||
-			   camss->res->version == CAMSS_8250) {
+			break;
+		}
+		case CAMSS_845:
+		case CAMSS_8250:
+		{
 			l->formats = formats_rdi_845;
 			l->nformats = ARRAY_SIZE(formats_rdi_845);
-		} else {
+			break;
+		}
+		default:
 			return -EINVAL;
 		}
 	}
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 46a89b5f6c171..e695724437ce1 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -1006,7 +1006,8 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 
 	mutex_init(&video->lock);
 
-	if (video->camss->res->version == CAMSS_8x16) {
+	switch (video->camss->res->version) {
+	case CAMSS_8x16:
 		if (is_pix) {
 			video->formats = formats_pix_8x16;
 			video->nformats = ARRAY_SIZE(formats_pix_8x16);
@@ -1014,8 +1015,9 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 			video->formats = formats_rdi_8x16;
 			video->nformats = ARRAY_SIZE(formats_rdi_8x16);
 		}
-	} else if (video->camss->res->version == CAMSS_8x96 ||
-		   video->camss->res->version == CAMSS_660) {
+		break;
+	case CAMSS_8x96:
+	case CAMSS_660:
 		if (is_pix) {
 			video->formats = formats_pix_8x96;
 			video->nformats = ARRAY_SIZE(formats_pix_8x96);
@@ -1023,11 +1025,13 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 			video->formats = formats_rdi_8x96;
 			video->nformats = ARRAY_SIZE(formats_rdi_8x96);
 		}
-	}  else if (video->camss->res->version == CAMSS_845 ||
-		    video->camss->res->version == CAMSS_8250) {
+		break;
+	case CAMSS_845:
+	case CAMSS_8250:
 		video->formats = formats_rdi_845;
 		video->nformats = ARRAY_SIZE(formats_rdi_845);
-	} else {
+		break;
+	default:
 		ret = -EINVAL;
 		goto error_video_register;
 	}
-- 
2.41.0

