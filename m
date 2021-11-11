Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FEBB44D9F0
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 17:09:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234179AbhKKQLy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 11:11:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234181AbhKKQLt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 11:11:49 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22ED8C0613F5
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:08:59 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id u1so10595747wru.13
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SuWrMG0bo45Jb11rqxnKYmyuhg+LmcaZSa2mZISuLUo=;
        b=sQ9NDRPOlYPHC/7gDxMY0o+bEv2LXHQAqQWHKFUPuvPXO2r8jkODwrDrG+BKxJczhy
         kg9A23NqRw+OXHOU3xmM4+cztSAY3UbMGNcw4lzBo5n5y2T9zXrODFAQYmunTjOMmrds
         HuriDqcimzRScRpnTaw9OhmgKae/SmUMxqo2RyQzOXuQxKe7lV1yWzYiy5cTVamaIYdf
         mV9CYL73mjgCX/PutW3XXJYiN0WJItaDQAl3f/UGiLpOXPRc1mZuEEjwp5mBkvpnACxD
         PP3Xi7fnyB5EelUxBTgiPR6c6WjisKac3GLpK3T+uEDMFGSonpIiqjPv/rSH2XKqHAPW
         aG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SuWrMG0bo45Jb11rqxnKYmyuhg+LmcaZSa2mZISuLUo=;
        b=7mp1J45szmwixgxkG4KXSXHHLCMdP0fITA+MAInnq4zNxRJNLkBhr6Gi4a2FpYmgT8
         suFpFH76Wqu18O9AcHWabhCKcNebcwIaLsgbEMS/kYgkyhcLhAT7JnlaHnFtzU2pjq6P
         1/qzD2cYnRF6IkfmlMurSCl53GJKzlu8nuykWLwCshUuKgjQdkpOpzcwCMqy07jNwMpf
         6S4Jwm3Uckkr+DOywIBEGxQSlQ+BVG8yk/InHC1nf3XYMMxFf0u1vYA0rKoEIYmXqeR4
         ibbqegHerrD7Py+8yCE8eciRS1WI/8lFW2qGL08lPKEWfGNJL1CLrN7fx8c4BOtjmPzl
         GxFw==
X-Gm-Message-State: AOAM5311m4MBWbUk+HEpetG5jtshc9jvEnuZvVEh1gKZaYbE3axRqmjx
        D0d4oKpirfEEyzoc5uq7i84ivg==
X-Google-Smtp-Source: ABdhPJzPCoj0JNFb1DVM43YcHtIdAa/D2uyJcopbazmVFojjtNsw1PNq4ogqxQ7mWUh9g842VPSB3w==
X-Received: by 2002:a05:6000:2a2:: with SMTP id l2mr9862986wry.110.1636646937732;
        Thu, 11 Nov 2021 08:08:57 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x8sm3245558wrw.6.2021.11.11.08.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:08:57 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     inux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH 15/18] media: camss: add support for V4L2_PIX_FMT_GREY for sdm845 HW
Date:   Thu, 11 Nov 2021 16:10:35 +0000
Message-Id: <20211111161038.3936217-16-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211111161038.3936217-1-bryan.odonoghue@linaro.org>
References: <20211111161038.3936217-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Add this common format to the various format lists relevant to sdm845.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 7 +++++++
 drivers/media/platform/qcom/camss/camss-csiphy.c   | 1 +
 drivers/media/platform/qcom/camss/camss-vfe.c      | 1 +
 drivers/media/platform/qcom/camss/camss-video.c    | 2 ++
 4 files changed, 11 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index 22a7d7ad6340..9e54d251793f 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -262,6 +262,13 @@ static const struct csid_format csid_formats[] = {
 		10,
 		1,
 	},
+	{
+		MEDIA_BUS_FMT_Y8_1X8,
+		DATA_TYPE_RAW_8BIT,
+		DECODE_FORMAT_UNCOMPRESSED_8_BIT,
+		8,
+		1,
+	},
 	{
 		MEDIA_BUS_FMT_Y10_1X10,
 		DATA_TYPE_RAW_10BIT,
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 24eec16197e7..de1e81bb97c9 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -94,6 +94,7 @@ static const struct csiphy_format csiphy_formats_sdm845[] = {
 	{ MEDIA_BUS_FMT_SGBRG14_1X14, 14 },
 	{ MEDIA_BUS_FMT_SGRBG14_1X14, 14 },
 	{ MEDIA_BUS_FMT_SRGGB14_1X14, 14 },
+	{ MEDIA_BUS_FMT_Y8_1X8, 8 },
 	{ MEDIA_BUS_FMT_Y10_1X10, 10 },
 };
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 165b404761db..3d2f554a4ef7 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -118,6 +118,7 @@ static const struct vfe_format formats_rdi_845[] = {
 	{ MEDIA_BUS_FMT_SGBRG14_1X14, 14 },
 	{ MEDIA_BUS_FMT_SGRBG14_1X14, 14 },
 	{ MEDIA_BUS_FMT_SRGGB14_1X14, 14 },
+	{ MEDIA_BUS_FMT_Y8_1X8, 8 },
 	{ MEDIA_BUS_FMT_Y10_1X10, 10 },
 	{ MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, 16 },
 };
diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index f282275af626..54e77d30d452 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -176,6 +176,8 @@ static const struct camss_format_info formats_rdi_845[] = {
 	  { { 1, 1 } }, { { 1, 1 } }, { 14 } },
 	{ MEDIA_BUS_FMT_SRGGB14_1X14, V4L2_PIX_FMT_SRGGB14P, 1,
 	  { { 1, 1 } }, { { 1, 1 } }, { 14 } },
+	{ MEDIA_BUS_FMT_Y8_1X8, V4L2_PIX_FMT_GREY, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
 	{ MEDIA_BUS_FMT_Y10_1X10, V4L2_PIX_FMT_Y10P, 1,
 	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
 	{ MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, V4L2_PIX_FMT_Y10, 1,
-- 
2.33.0

