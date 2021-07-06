Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 694133BD6E6
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 14:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240820AbhGFMsm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 08:48:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240114AbhGFMsl (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jul 2021 08:48:41 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D31C0225A6
        for <linux-media@vger.kernel.org>; Tue,  6 Jul 2021 05:41:11 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id n9so8573367wrs.13
        for <linux-media@vger.kernel.org>; Tue, 06 Jul 2021 05:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iQ3yOn/VjqEGKTdI++jjchtNRpo4xx2SRNzVvDxUg3A=;
        b=NkKdOFgL/b5cHNIFxbGHFGF/hyb+j3sLHFwCNN/eZlDyMXf/e/BCK6o88C2Fc7Jh9G
         UWBUXL4BheLJhdJmlYaVr+Ld0BoZsfvHAO+BX8xkA4MjNFR01MNSMNiY0IE/DoHwo+wW
         T6tDIO7ApOlpR35YKGOMzmNHsF6ojw49fInCnUIMmgxUkLNmtSlXG0IP5aE4TEfjs7w1
         BUVF+KRfB63HPmLB5y+MrPBtoJ7Qi8l5QrC0jMJMp1bVT7AS6kjnxiLJCom0GEGW24x+
         NRQDUu2Cxv5yg4VJxAhOlz48yab5eEFjQsOwD+GL0AwwtSDD+BsUh2ba4NFvodtLDAoo
         HOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iQ3yOn/VjqEGKTdI++jjchtNRpo4xx2SRNzVvDxUg3A=;
        b=LkKDLs2cGb86yDZ/QqD7Lc1fb3gcKcNtIU8SaVaXr0lwIVNTO/XepVZTvZ0gS2R+VJ
         4jEEtHrxiFZM7zfa+63TUTQPi9Aq7QVeH/JB2zn2DBFOWF6CHOT4vh4uv+RB7k773+bD
         9HitSwW/Tv7asxVOjUDGDh9SFri6Op1ksoe2Ycr2xVkU7kAPzzsnDNS0tTVNlUBLDRqK
         G0J5i0v4TUCzaXbwvm6gcncK603z4ZEm9a20sT+Dif/YZlEYaMBGECNph10/Nn1ieLmN
         OwM63ocfDlHs8TsiE4ph+TEwJHiiKgZ5D1gJqjgePGlxbIDAemEHYuAKBh24Du0plGEu
         YY8g==
X-Gm-Message-State: AOAM531fN/qj354e/LM41JjPPq0S6ZV/5UA2QwZVOlhDLPfbA8ZD2mh9
        pKU2u9MFKn9hK3y62QGA67BRXAs0KHv5uQ==
X-Google-Smtp-Source: ABdhPJy++XUxB7OhDLu0uCfjmQhtluIZGVNcY/UIg91uyEcaL+ImrvqcUrTsPv/AyLsfxLPEL78b6g==
X-Received: by 2002:a05:6000:18a7:: with SMTP id b7mr21762185wri.348.1625575269997;
        Tue, 06 Jul 2021 05:41:09 -0700 (PDT)
Received: from localhost.localdomain (hst-221-27.medicom.bg. [84.238.221.27])
        by smtp.gmail.com with ESMTPSA id n18sm2585979wms.3.2021.07.06.05.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 05:41:09 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-api@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 4/5] venus: hfi_platform: Correct supported compressed format
Date:   Tue,  6 Jul 2021 15:40:33 +0300
Message-Id: <20210706124034.773503-5-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210706124034.773503-1-stanimir.varbanov@linaro.org>
References: <20210706124034.773503-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In multistream mode HFI supports TP10_UBWC on output2. Correct this
in supported formats capabilities list.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_platform_v4.c | 4 ++--
 drivers/media/platform/qcom/venus/hfi_platform_v6.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v4.c b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
index 3f7f5277a50e..e3f0a90a567b 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform_v4.c
+++ b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
@@ -55,7 +55,7 @@ static const struct hfi_plat_caps caps[] = {
 	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
 	.fmts[4] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
 	.fmts[5] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_P010},
-	.fmts[6] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_YUV420_TP10},
+	.fmts[6] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_YUV420_TP10_UBWC},
 	.num_fmts = 7,
 }, {
 	.codec = HFI_VIDEO_CODEC_VP8,
@@ -106,7 +106,7 @@ static const struct hfi_plat_caps caps[] = {
 	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
 	.fmts[4] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
 	.fmts[5] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_P010},
-	.fmts[6] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_YUV420_TP10},
+	.fmts[6] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_YUV420_TP10_UBWC},
 	.num_fmts = 7,
 }, {
 	.codec = HFI_VIDEO_CODEC_MPEG2,
diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v6.c b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
index d8243b22568a..d98caa6f1011 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform_v6.c
+++ b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
@@ -55,7 +55,7 @@ static const struct hfi_plat_caps caps[] = {
 	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
 	.fmts[4] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
 	.fmts[5] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_P010},
-	.fmts[6] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_YUV420_TP10},
+	.fmts[6] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_YUV420_TP10_UBWC},
 	.num_fmts = 7,
 }, {
 	.codec = HFI_VIDEO_CODEC_VP8,
@@ -106,7 +106,7 @@ static const struct hfi_plat_caps caps[] = {
 	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
 	.fmts[4] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
 	.fmts[5] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_P010},
-	.fmts[6] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_YUV420_TP10},
+	.fmts[6] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_YUV420_TP10_UBWC},
 	.num_fmts = 7,
 }, {
 	.codec = HFI_VIDEO_CODEC_MPEG2,
-- 
2.25.1

