Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A108B3A0713
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 00:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235222AbhFHWkO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Jun 2021 18:40:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234908AbhFHWkJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Jun 2021 18:40:09 -0400
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8908C0613A4
        for <linux-media@vger.kernel.org>; Tue,  8 Jun 2021 15:38:06 -0700 (PDT)
Received: by mail-qk1-x731.google.com with SMTP id i67so21902788qkc.4
        for <linux-media@vger.kernel.org>; Tue, 08 Jun 2021 15:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qv/WIkY6oSNCsPIFFE/y//JDuQCjzop1Z+8l/NgvBRE=;
        b=Q8soHcmIf4JZB76TCB/hCzXLsAqY0zgmPqJHMOZaXF/LVNUO2xW0e67LmSDD/W84gg
         Us5Vh4WVX28266NHDGgosC4VXKCGQ95cuAmia2JRq6XgEaV8cOm3t5r7UbQ37shRtCWv
         HJ/2GOaqplXKG1gXWMSc1jLHek/agSU/xtaI4p9RIvskymcwjfY7Urs5MU81BECxk7LV
         1HGg2pctmbQY4fx75G8A1Us6MpB7kRbuCxZ9oq1/QABjzc6WmqZ5P/G/l0JaOXxXGjgq
         fk2dcBiwY3pDH85O4CoofRERcPeJe+dzwSkesG3XHcai0sYtDaSkz7T8nFn8x6yuWqPQ
         d5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qv/WIkY6oSNCsPIFFE/y//JDuQCjzop1Z+8l/NgvBRE=;
        b=EuOIZm2MKbF6iBg9Bsepd8zIcfaU3W+vQm7gJe2pj8IhaVLhJ/S525Iscasx8cU6l1
         8zQNiF5ni2H9cf5If8U5OwRpt93VGyRw+7FFE4JSWKrIe6Cx+8vqim1gIxv++dbUM9aP
         FEXb/uzrSpaRVq8nOq7201h3QyKWoijKgydHHjGPJWIDnlIf8SzwD1fMcaNkuNnfFZQy
         lUuTuMltGT/SuXyz32mmk0ektIDBdWzsO7winiZOsLzTon0N1ZSxupbyp+ye8LEdTmIQ
         VaRv7bzLOHdmVRH6scWo1Wwzaoj2g2gE+YGrhB9FzQrKIUWjwdLeByELIhR0L7QXQdMO
         mwSQ==
X-Gm-Message-State: AOAM533IEXW+8+E75BO8/Pk43DNKfT6qWvhEcjN4EHv+t4XjwoEqDh1G
        zwGR2se+3ntmunxMugvZSg/+Cg==
X-Google-Smtp-Source: ABdhPJy/DbNpkkBb0eOIYrB+/3IaY8KK0TyxV2Qscim1UdfO2tswLo9Yw/j1mcZ8ouvRypDVgdlPeg==
X-Received: by 2002:a05:620a:13f0:: with SMTP id h16mr16038861qkl.32.1623191885542;
        Tue, 08 Jun 2021 15:38:05 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id m3sm2324266qkh.135.2021.06.08.15.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 15:38:05 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     robert.foss@linaro.org, andrey.konovalov@linaro.org,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org (open list:QUALCOMM CAMERA SUBSYSTEM DRIVER),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 15/17] media: camss: add support for V4L2_PIX_FMT_GREY for sdm845 HW
Date:   Tue,  8 Jun 2021 18:35:04 -0400
Message-Id: <20210608223513.23193-16-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210608223513.23193-1-jonathan@marek.ca>
References: <20210608223513.23193-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add this common format to the various format lists relevant to sdm845.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 7 +++++++
 drivers/media/platform/qcom/camss/camss-csiphy.c   | 1 +
 drivers/media/platform/qcom/camss/camss-vfe.c      | 1 +
 drivers/media/platform/qcom/camss/camss-video.c    | 2 ++
 4 files changed, 11 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index 22a7d7ad63403..9e54d251793fc 100644
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
index b3c3bf19e5223..f82f1e2aa6883 100644
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
index 3e467034710b9..b08bded2344e6 100644
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
index f282275af626f..54e77d30d452c 100644
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
2.26.1

