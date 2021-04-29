Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF0636E93F
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 12:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240601AbhD2K7R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 06:59:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232108AbhD2K7M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 06:59:12 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D5ACC06138B
        for <linux-media@vger.kernel.org>; Thu, 29 Apr 2021 03:58:24 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id x7so66383625wrw.10
        for <linux-media@vger.kernel.org>; Thu, 29 Apr 2021 03:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yX68PnWt82JqqvaIeLqptsXuqqdgzkaoY2lNx9HH3fE=;
        b=YnzwceP8U0S+indgF5DyHzwNq2c7+3xad5HCdpCKnt9ggc3qbEePi6z1EFXJw8euGh
         NFrMIWqPIsbzGJRD38ByKvpOupj7Z1WYwU7/6mZQ4Y5izinBcVqtloOPrA69PGA0Grn+
         nXejj9KUG8Sd2BuF0VPqQJiQ2SYDH1tS20jqgZ5nAwYv6fPNSO44jCUGxXhcGvw+3fUw
         qysIYirnk50gA/MrIaAwR+F69aXvKVae9x28EomHs6q6xCp5pXKU6EU/ZU41saoMkoGm
         AzLiZTUtsdoieqlqd2GGbaIWLwHo+IcwwlhmTBLKV602ZMe5aehkTnDbHJGQ1JkR+525
         XMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yX68PnWt82JqqvaIeLqptsXuqqdgzkaoY2lNx9HH3fE=;
        b=lwBLKxfvizyYjg1HnafZ5n+Sk4s+huloN8qUuIH1LsUIh1BjTy+XZYAvqW5/79XjM0
         auNuf+/Vxj4DjtCR1vaLTd1V/NuGCpjaISM0DNMUeP78fXJuBmxT2Z8vAoIHTDje5H/b
         P0Wnyy39772Xuoxtt0QwHZHmHltgIQR9Mghe2kaQGp3hay6S1CDDOba6/WhulnCoCg+3
         QWRSL7yZ9qQ2HtGsPQUYe3LKEEPbuyurso7we0/+xuFOGrfBurOe1tDqzj5InAI9Mx8a
         jjRZns+Bd6CF1Scot4Yt17j+B1pFW22VbKmMAiB1tHncW4q/OO/oqDCeQpPnsmsMhRpn
         yxNA==
X-Gm-Message-State: AOAM531i7R7cWy/ttQ8q8kctoaMj3lDCxD4R0GVRuBuh1wC14YTPIU1y
        HgM4LdGW00hw7s7JaMkiJ7o9z6HSbn1woF20
X-Google-Smtp-Source: ABdhPJxXJXDxOHijYlO7spKrJea1/3bsj+kN2SnW3zigQTep6fakuBiYSEjQQQxJWRqUb4UZBa/WWg==
X-Received: by 2002:a5d:60cd:: with SMTP id x13mr21575236wrt.377.1619693902996;
        Thu, 29 Apr 2021 03:58:22 -0700 (PDT)
Received: from localhost.localdomain (hst-221-29.medicom.bg. [84.238.221.29])
        by smtp.gmail.com with ESMTPSA id a9sm3372903wmj.1.2021.04.29.03.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 03:58:22 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-api@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 3/3] venus: Add a handling of QC10C compressed format
Date:   Thu, 29 Apr 2021 13:58:15 +0300
Message-Id: <20210429105815.2790770-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429105815.2790770-1-stanimir.varbanov@linaro.org>
References: <20210429105815.2790770-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This adds QC10C compressed pixel format in the Venus driver, and
make it enumeratable from v4l2 clients.

Note: The QC10C format shouldn't be possible to enumerate by the
client if the decoded bitstream is not 10bits. This is not
implemented in this patch yet.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/helpers.c | 2 ++
 drivers/media/platform/qcom/venus/vdec.c    | 6 +++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 3a0b07d237a5..58bf2e0654ce 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -563,6 +563,8 @@ static u32 to_hfi_raw_fmt(u32 v4l2_fmt)
 		return HFI_COLOR_FORMAT_NV21;
 	case V4L2_PIX_FMT_QC8C:
 		return HFI_COLOR_FORMAT_NV12_UBWC;
+	case V4L2_PIX_FMT_QC10C:
+		return HFI_COLOR_FORMAT_YUV420_TP10_UBWC;
 	default:
 		break;
 	}
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index d4cc51fc019c..7ad8cd66b8bc 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -35,6 +35,10 @@ static const struct venus_format vdec_formats[] = {
 		.num_planes = 1,
 		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
 	}, {
+		.pixfmt = V4L2_PIX_FMT_QC10C,
+		.num_planes = 1,
+		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+	},{
 		.pixfmt = V4L2_PIX_FMT_NV12,
 		.num_planes = 1,
 		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
@@ -1508,7 +1512,7 @@ static const struct hfi_inst_ops vdec_hfi_ops = {
 static void vdec_inst_init(struct venus_inst *inst)
 {
 	inst->hfi_codec = HFI_VIDEO_CODEC_H264;
-	inst->fmt_out = &vdec_formats[6];
+	inst->fmt_out = &vdec_formats[8];
 	inst->fmt_cap = &vdec_formats[0];
 	inst->width = frame_width_min(inst);
 	inst->height = ALIGN(frame_height_min(inst), 32);
-- 
2.25.1

