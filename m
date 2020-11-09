Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BEF02AC277
	for <lists+linux-media@lfdr.de>; Mon,  9 Nov 2020 18:36:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732163AbgKIRgR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Nov 2020 12:36:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732069AbgKIRgJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Nov 2020 12:36:09 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42F35C0617A6
        for <linux-media@vger.kernel.org>; Mon,  9 Nov 2020 09:36:07 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id o20so9669289eds.3
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2020 09:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SsKi06aFz0HTo2Yl+cJME4oxrb6MxPsHXouTbem6RGI=;
        b=BFxRxbsn5xdgpJDxro2qTxpz/f0nOnFDLq48DGON105z4GLn5pgjkZnbCOd9mCkkZJ
         CRI0u8Or6ciO+QGVcFfMZ1RJovaGb7gOfORQp3Yv+95GSQ729HL+ZPkBSlN4p2BoJJOu
         aDMvNBe7de5MnwHxmWaio5Z6fbRhA3U3uIs0GyhYJ5WqAkRnJ/xmylnSx/Nzu2utmZck
         EBlHZp5yLxaMGD2b47Thvh57MEwg3LhvhFAkTNuys+cwXZUGrTHaOJ0uBGtz5nUlpsLX
         9DvrAh/iAVOBaboXZsGireRxpymIWivTswiOZwjPQ09vE3FrOKoslXyiCLTQmHHUGNo0
         0Qcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SsKi06aFz0HTo2Yl+cJME4oxrb6MxPsHXouTbem6RGI=;
        b=gY0f/Imv+oD+YYXjlw9Q3E+KiQ2AOMW2hICdrESQAgRd/McIysKti/HGO4wxXrnhcy
         oQ3TievVXownZZgP1OBbXpvM99ch8wQs7WPtdd2Vvs7RqY/U4v1dtpzMIIowfp92fB4R
         vCT1TjK3XEUCn26sdOCdMq4iR8doL7P4HwJ2AJrfhmQTtMT24puzEM3bl9KqdBdMRUFZ
         x8febkl2vrdarYvOrM5Y2N1Q4bhKsBnArHY+hNfa6ISNjaolQwPKrVaRomiBtlfVQDrn
         WpwxUAIz/W19cV8xszQF04/cGI8rkySAoS+WrEqunXKSLe9KCgWFeyAMSZMGUHrXaztq
         Ljog==
X-Gm-Message-State: AOAM533ON2CF4qvxfqvIDUObFjP1w7kCTRu0/8QYyTyHDszKTJbowbJf
        C5HLBfficj2UzrLSqqtw7yoc77cl2TL7ke6m
X-Google-Smtp-Source: ABdhPJxJEqEwcqxwZ5dDOkeXSSn849iNUGTNFrtdZ1oAB0tJBm9PPvPsx4rxq4gFloPMZs4n3fi/jQ==
X-Received: by 2002:a50:eb0a:: with SMTP id y10mr17307631edp.342.1604943365785;
        Mon, 09 Nov 2020 09:36:05 -0800 (PST)
Received: from localhost.localdomain (hst-221-89.medicom.bg. [84.238.221.89])
        by smtp.gmail.com with ESMTPSA id jw7sm9123981ejb.54.2020.11.09.09.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 09:36:05 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 3/4] s5p-mfc: Use display delay and display enable std controls
Date:   Mon,  9 Nov 2020 19:35:40 +0200
Message-Id: <20201109173541.10016-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201109173541.10016-1-stanimir.varbanov@linaro.org>
References: <20201109173541.10016-1-stanimir.varbanov@linaro.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the standard display_delay and display_delay_enable controls,
the legacy private MFC controls are kept for backward compatibility.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/s5p-mfc/s5p_mfc_dec.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
index 61e144a35201..4a3e8e9bbff2 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_dec.c
@@ -167,6 +167,13 @@ static struct mfc_control controls[] = {
 		.step = 1,
 		.default_value = 0,
 	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY,
+		.type = V4L2_CTRL_TYPE_INTEGER,
+		.minimum = 0,
+		.maximum = 16383,
+		.default_value = 0,
+	},
 	{
 		.id = V4L2_CID_MPEG_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY_ENABLE,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
@@ -176,6 +183,13 @@ static struct mfc_control controls[] = {
 		.step = 1,
 		.default_value = 0,
 	},
+	{
+		.id = V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY_ENABLE,
+		.type = V4L2_CTRL_TYPE_BOOLEAN,
+		.minimum = 0,
+		.maximum = 1,
+		.default_value = 0,
+	},
 	{
 		.id = V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
@@ -690,9 +704,11 @@ static int s5p_mfc_dec_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	switch (ctrl->id) {
 	case V4L2_CID_MPEG_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY:
+	case V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY:
 		ctx->display_delay = ctrl->val;
 		break;
 	case V4L2_CID_MPEG_MFC51_VIDEO_DECODER_H264_DISPLAY_DELAY_ENABLE:
+	case V4L2_CID_MPEG_VIDEO_DECODER_DISPLAY_DELAY_ENABLE:
 		ctx->display_delay_enable = ctrl->val;
 		break;
 	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:
-- 
2.17.1

