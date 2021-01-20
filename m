Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7DDE2FDB79
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 22:26:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731740AbhATUz7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 15:55:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729959AbhATNpx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 08:45:53 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27F0CC0617AA
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 05:44:39 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id j18so2894516wmi.3
        for <linux-media@vger.kernel.org>; Wed, 20 Jan 2021 05:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sfFHGntv9vS08N2U1NTEmFN9zbWTIzne2qD4TJ7xpuU=;
        b=X3+Us7Oav43F2DO+SH5cIBDIYWLn+Bc+A5227rTGHzJ+P6A65lJ2V5j7/AoiBLkN+x
         KGUfPwezfX3/j6mFikfOiqBXhdIlPeUT6LwkiEO8JrfefFqFjxi7nSwt2BxmXOIMRGxF
         cXeAcSrlUFw14uMIq1cYWjCu7tn1IYQAfqhTr3az6E32+5mOow8MAaBMWEdubwnGVqCr
         l41B2T1JhFjREQm6FutTMqK+NyxNKh6E6GRKuuZv82bdcPS+qnwFvAveoZEABUTgenla
         IAYV7qEBhl4OvFto1/8DDuQ4WmXD0RbNnUxcxXPxzm/94M1vmEKCVQcAGnmuav18jBrl
         HJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sfFHGntv9vS08N2U1NTEmFN9zbWTIzne2qD4TJ7xpuU=;
        b=fxuSgQmQ8BF6FnXos8DmCFHxMpD0URBJRgwaaC3OyUam8dd9oTUo3GFaqCmNUpPChd
         0EKfJYNga3BzV5RDmXanffShCCfYtTsvTdBx49Id3yVMigsh9QsbFthAYOnZ0VeplKly
         PutXRUj+03X1+N1B++cy8sOXu2eM0D9j3gauMsM3mUjE7Iww/cHaRgVEBJyd/b5ArsDD
         LI/NhjbSRxHdL+ZUXSwt6zFlHXz0uraWQF9wTAQMEGGhNm+fHHF6Bl+n1DHzIRe5iu79
         T3otFbmCLln+WhTYOEcisQ2g04dxhdf7SZvpv0McNEaO0dVbIpc//oEmK5ARfSIJ9QBa
         lzrQ==
X-Gm-Message-State: AOAM531SfIDXJ1/bpdLe2RacZtC9RplAC4civJwHa63hx0lzxXEEo1PH
        RgNLLl9VEs25B9+c4OQnYDH+oQ==
X-Google-Smtp-Source: ABdhPJzmuc01Ym+szua9LJB3ZIzqfJ0F84M5aMhizptggLHKZzsNzHlOEdWxQBtlmHAR3cONYSY2HQ==
X-Received: by 2002:a7b:c3d6:: with SMTP id t22mr4448191wmj.1.1611150277927;
        Wed, 20 Jan 2021 05:44:37 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:93b3:1f80:ae7b:a5c6])
        by smtp.gmail.com with ESMTPSA id t67sm4224075wmt.28.2021.01.20.05.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 05:44:37 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        vkoul@kernel.org, Anson.Huang@nxp.com, michael@walle.cc,
        agx@sigxcpu.org, max.oss.09@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v2 07/22] media: camss: Add missing format identifiers
Date:   Wed, 20 Jan 2021 14:43:42 +0100
Message-Id: <20210120134357.1522254-7-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210120134357.1522254-1-robert.foss@linaro.org>
References: <20210120134357.1522254-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CSI-2 spec defines the following types:
 - Data Type - Often abbreviated DT
 - Decode Format - Often abbreviated as DF
 - Encode Format

These definitions are as far as I can tell complete for CSI-2.

Additionally the Qualcomm internal type describing Plain Formats
has been added. Plain formats describe the size of the pixels
written by the RDI units to memory. PLAIN8 for example has the size
8 bits, and PLAIN32 32 bits. The appropriate Plain Format is
determined by the Decode Format used. The smallest Plain Format
that is able to contain a pixel of the used Decode Format is the
appropriate one to use.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 .../media/platform/qcom/camss/camss-csid.h    | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 1824b3745e10..02fc34ee8a41 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -21,6 +21,56 @@
 #define MSM_CSID_PAD_SRC 1
 #define MSM_CSID_PADS_NUM 2
 
+#define DATA_TYPE_EMBEDDED_DATA_8BIT	0x12
+#define DATA_TYPE_YUV420_8BIT		0x18
+#define DATA_TYPE_YUV420_10BIT		0x19
+#define DATA_TYPE_YUV420_8BIT_LEGACY	0x1a
+#define DATA_TYPE_YUV420_8BIT_SHIFTED	0x1c /* Chroma Shifted Pixel Sampling */
+#define DATA_TYPE_YUV420_10BIT_SHIFTED	0x1d /* Chroma Shifted Pixel Sampling */
+#define DATA_TYPE_YUV422_8BIT		0x1e
+#define DATA_TYPE_YUV422_10BIT		0x1f
+#define DATA_TYPE_RGB444		0x20
+#define DATA_TYPE_RGB555		0x21
+#define DATA_TYPE_RGB565		0x22
+#define DATA_TYPE_RGB666		0x23
+#define DATA_TYPE_RGB888		0x24
+#define DATA_TYPE_RAW_24BIT		0x27
+#define DATA_TYPE_RAW_6BIT		0x28
+#define DATA_TYPE_RAW_7BIT		0x29
+#define DATA_TYPE_RAW_8BIT		0x2a
+#define DATA_TYPE_RAW_10BIT		0x2b
+#define DATA_TYPE_RAW_12BIT		0x2c
+#define DATA_TYPE_RAW_14BIT		0x2d
+#define DATA_TYPE_RAW_16BIT		0x2e
+#define DATA_TYPE_RAW_20BIT		0x2f
+
+#define DECODE_FORMAT_UNCOMPRESSED_6_BIT	0x0
+#define DECODE_FORMAT_UNCOMPRESSED_8_BIT	0x1
+#define DECODE_FORMAT_UNCOMPRESSED_10_BIT	0x2
+#define DECODE_FORMAT_UNCOMPRESSED_12_BIT	0x3
+#define DECODE_FORMAT_UNCOMPRESSED_14_BIT	0x4
+#define DECODE_FORMAT_UNCOMPRESSED_16_BIT	0x5
+#define DECODE_FORMAT_UNCOMPRESSED_20_BIT	0x6
+#define DECODE_FORMAT_DPCM_10_6_10		0x7
+#define DECODE_FORMAT_DPCM_10_8_10		0x8
+#define DECODE_FORMAT_DPCM_12_6_12		0x9
+#define DECODE_FORMAT_DPCM_12_8_12		0xA
+#define DECODE_FORMAT_DPCM_14_8_14		0xB
+#define DECODE_FORMAT_DPCM_14_10_14		0xC
+#define DECODE_FORMAT_USER_DEFINED		0xE
+#define DECODE_FORMAT_PAYLOAD_ONLY		0xF
+
+#define ENCODE_FORMAT_RAW_8_BIT		0x1
+#define ENCODE_FORMAT_RAW_10_BIT	0x2
+#define ENCODE_FORMAT_RAW_12_BIT	0x3
+#define ENCODE_FORMAT_RAW_14_BIT	0x4
+#define ENCODE_FORMAT_RAW_16_BIT	0x5
+
+#define PLAIN_FORMAT_PLAIN8	0x0 /* supports DPCM, UNCOMPRESSED_6/8_BIT */
+#define PLAIN_FORMAT_PLAIN16	0x1 /* supports DPCM, UNCOMPRESSED_10/16_BIT */
+#define PLAIN_FORMAT_PLAIN32	0x2 /* supports UNCOMPRESSED_20_BIT */
+
+
 enum csid_payload_mode {
 	CSID_PAYLOAD_MODE_INCREMENTING = 0,
 	CSID_PAYLOAD_MODE_ALTERNATING_55_AA = 1,
-- 
2.27.0

