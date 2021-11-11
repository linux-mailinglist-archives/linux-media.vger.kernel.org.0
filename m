Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59CAD44D9E3
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 17:08:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234125AbhKKQLj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 11:11:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234080AbhKKQLg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 11:11:36 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57D96C061766
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:08:47 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id t30so10617695wra.10
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iT00SPNXaaNsqiLDXj5JoRlqm+cECqYRe4jjGiIw40Q=;
        b=hyxrvmxXYpEx7wQwJMd2Uv5qNkwKGouNWHjydzliTYfQ48dw+0DAS2HSW0SndgzvlU
         Sxx121/2lUdnNeKCe1QD5HmN1agmbFC5Z3ohwA0d8tlF2WAZp9vlenuMUOo8UJBo53l1
         bgbOjR/HxbKKJ2EEf5u9J1fZSvcQnLpWjNfz3/23kZqo50Up0kZP7iw43ARFmW9SVadE
         xsHE9SXAPKfmDgXEccKjChwhr/FBL9OwLE1/75GH/XTDA7uKUa2PT+J6lbCh/SlbsXGQ
         6Z6Qny6sPGqpONXE2sqXYQIoCapUCsC3JaJWClIFRSpV4AmC9haAfTFzP1w2UnacB1LY
         u5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iT00SPNXaaNsqiLDXj5JoRlqm+cECqYRe4jjGiIw40Q=;
        b=VJHEOy6+naRZRD3TpnfcNK8kVP3jsGdMZeks5t7roaAd2zpwDsp4uZGf5KahI2uSTE
         vhwHKFipnmJmZn+Yin6LTYd9kwsK1HvOgw8sBTAjSXK8bNdKlM2vYGQDi3OLGZOP33U2
         UQ3Pjn8cvSj3Eq94zo4kCfdqYZ4X86Nvrv3y0Le+2W8A6/3x4ii3W/2kJ6UGw2P6mFhi
         JW7h/zDDTt0mbmA9dTp+lVcjtcM96YIw1i0Z93+dKoW1z253O1Jt4UngttJWi4DrkGYc
         NS+JLfWFIJiRfVLT/9qoH++wvXiYoxRgNhgbxiDsmbMbA7jvE2uSswlcVOH54LsMO2YK
         hUrA==
X-Gm-Message-State: AOAM531Xp7K7T8KxQPYmxD8zJpy+WaUPpAx4/BfmbMmWIE3kMVqb0Jjc
        i9pepen1QnW1xhM3BPY369fafw==
X-Google-Smtp-Source: ABdhPJxGn5PEh7RpXQw2+3kVCFu0rioKorEz6/xZXJR331D8ljiUNeu7S08/xjahm2ChsG4m+S4xEw==
X-Received: by 2002:a5d:5846:: with SMTP id i6mr10102109wrf.19.1636646925918;
        Thu, 11 Nov 2021 08:08:45 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id x8sm3245558wrw.6.2021.11.11.08.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:08:45 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     inux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [PATCH 05/18] media: camss: csid-170: fix non-10bit formats
Date:   Thu, 11 Nov 2021 16:10:25 +0000
Message-Id: <20211111161038.3936217-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211111161038.3936217-1-bryan.odonoghue@linaro.org>
References: <20211111161038.3936217-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Use the decode_format/data_type from the "format" struct instead of a
hardcoded 10-bit format.

Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware version Titan 170")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index ac22ff29d2a9..aa65043c3303 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -366,7 +366,7 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 			val |= input_format->width & 0x1fff << TPG_DT_n_CFG_0_FRAME_WIDTH;
 			writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_0(0));
 
-			val = DATA_TYPE_RAW_10BIT << TPG_DT_n_CFG_1_DATA_TYPE;
+			val = format->data_type << TPG_DT_n_CFG_1_DATA_TYPE;
 			writel_relaxed(val, csid->base + CSID_TPG_DT_n_CFG_1(0));
 
 			val = tg->mode << TPG_DT_n_CFG_2_PAYLOAD_MODE;
@@ -382,8 +382,9 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 		val = 1 << RDI_CFG0_BYTE_CNTR_EN;
 		val |= 1 << RDI_CFG0_FORMAT_MEASURE_EN;
 		val |= 1 << RDI_CFG0_TIMESTAMP_EN;
+		/* note: for non-RDI path, this should be format->decode_format */
 		val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
-		val |= DATA_TYPE_RAW_10BIT << RDI_CFG0_DATA_TYPE;
+		val |= format->data_type << RDI_CFG0_DATA_TYPE;
 		val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
 		val |= dt_id << RDI_CFG0_DT_ID;
 		writel_relaxed(val, csid->base + CSID_RDI_CFG0(0));
-- 
2.33.0

