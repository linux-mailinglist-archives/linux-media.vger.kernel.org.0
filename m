Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7985C47CA66
	for <lists+linux-media@lfdr.de>; Wed, 22 Dec 2021 01:36:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239952AbhLVAgE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Dec 2021 19:36:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239942AbhLVAgE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Dec 2021 19:36:04 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC351C061574
        for <linux-media@vger.kernel.org>; Tue, 21 Dec 2021 16:36:03 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id i22so1261602wrb.13
        for <linux-media@vger.kernel.org>; Tue, 21 Dec 2021 16:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SqOUpaHa86SeXlyDw5Co87nQX7FB6PSroFT8OrpLLrU=;
        b=CHtds+HHLqWSi2qD5KD/G86f+1vTHana3HWpfL2aVaJ+2iXYVuuFgFlzoQVdT1A2Ro
         JQM2ZmMrTQ798JC+C89s/HsUMh8F2gzjQTsvOWGhX6z55aLz+dz9VMJsQnEuPyt1fRK8
         O27mosghiEd2ekCikwGlPaCLn32l6E1BE1YEdAOyJ9sJxBTQI7NjN0uHbFC0otoozzmo
         VBC2fljxTNt6H6dvmFS/NRelM4hkq7X4++G7w1KLQmiGpNqLC9Rku3Jbi1Xq8IoQHFGP
         uve8AgUap1Y9EumKynvNhCqUNrte4c6YM+iwQbckjRe0tu4ChTtaG2kzFWVtJD+WR4S8
         RKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SqOUpaHa86SeXlyDw5Co87nQX7FB6PSroFT8OrpLLrU=;
        b=imkB4V2POuslDrS6/M7/n3mU2jxVEMAGLegOsrc5ldNWsWbE1hcSyTgxqZCRlk9z3a
         HkiaCcMuigJ5IlKsFKaeXL6DdvkL7uKiY6a8ebVwNXWidmGhhtod5LESqQeMoMKwxMdO
         UztFkfKOjdKieXOCScLIMzzFI51SfUZ0dCvaVAaDulT2I+kCG71dEsxojSrWYHa0gF5G
         UJefxmLv44Qjwn5C49Jdxx3gnqbGYyQ3ISzGRG7/x5fAZ8hCDQuR2p6/swCvbYCLjBKO
         iOzaC6wkq4hfzT20ZR+R999q3e35U7Kn4AJvY4oKs0g3W2oWTmvWzqBLbwZranOiUgzt
         Nj/Q==
X-Gm-Message-State: AOAM533DYVU1Zy/F76vKHx84/xHQ0C0STp3YJsvOhsbkrrBF+tCg+HHM
        Z3nLMG8AwpS24GEC/F6FwAnWDg==
X-Google-Smtp-Source: ABdhPJxR9l9eOY1aGak9o+tFzjIAA+jY56wMnc/I8h9xSX9UYYBs+TPhYnxgRoIK7wxLNky1XnvwPw==
X-Received: by 2002:a5d:6d41:: with SMTP id k1mr404836wri.134.1640133362371;
        Tue, 21 Dec 2021 16:36:02 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id n7sm282825wms.45.2021.12.21.16.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 16:36:01 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 15/19] media: camss: add support for V4L2_PIX_FMT_GREY for sdm845 HW
Date:   Wed, 22 Dec 2021 00:37:47 +0000
Message-Id: <20211222003751.2461466-16-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
References: <20211222003751.2461466-1-bryan.odonoghue@linaro.org>
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
index 24eec16197e76..de1e81bb97c92 100644
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
index 165b404761db5..3d2f554a4ef71 100644
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
2.33.0

