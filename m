Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 896412EF1D3
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 13:08:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727406AbhAHMGa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 07:06:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726992AbhAHMG1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 07:06:27 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65BCEC061240
        for <linux-media@vger.kernel.org>; Fri,  8 Jan 2021 04:05:07 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id w1so14096020ejf.11
        for <linux-media@vger.kernel.org>; Fri, 08 Jan 2021 04:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sfFHGntv9vS08N2U1NTEmFN9zbWTIzne2qD4TJ7xpuU=;
        b=YrS5onGrGvI5kc+hU07e8iO1kfRO+wc82YA1np16KghHZs1sVHxuiHxsnMIibvSqh3
         DkUcXskKGQRCADC74hLTJvm4F/P0xWqOrosMFLVzZwtTi46AihoDwSJRznGPq2cw9Dcs
         sXdxhHznH/0azJ6h96BDKzFqkOUMCUBj4G64DZc7l3FXf9q57FdJlHKRy3dWF5Qg/VQX
         loRJNPLqmWYFBT62VrUhgLg7UM8LjqwOFimkuZ4GxuZ5DpH6P+obS24jRmzEgFKv0kGZ
         DtWVVaeHEJ39a9GfTLuxumq3xQpqQfU8flvmxGHvBhbtN1w67thWlar4TipVGGXEa1at
         ezXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sfFHGntv9vS08N2U1NTEmFN9zbWTIzne2qD4TJ7xpuU=;
        b=UYv5MRfQHWYToWW50XerjNCQOVb9iGzNbbPviVmQafw2aorcb+lkHS/NSep6vaFgzG
         wMyFF9/ay13J1RnSyGFV325CvsCuqRr0UVGy0ifphdA3FcJWO8cjdRDRPWrM9+/xhC2a
         vt61j0gMzJcIaVyjUZTMlFSScMuXRyqmPV9GmOGxp+aRfairqg3JXZMYYKy4td+fqozf
         rL3+iAJwqol6Shd3sqsQB9nleuPbjuku3z0xYuQpCQ2gT8sRQ9QJ8QCa7hT9xW4052fr
         cdCW5V+BPErJ7yVTBYwb+QZLPNB/qpwCUU6bJyJuaadK09v54jw4/rCUNxZ1V3hZxDKS
         cw9w==
X-Gm-Message-State: AOAM533AgN2zchR/EOyK2W6eK0VvCk8H5KQUds+no0B6SCBAL4zkVXcs
        uvJefsoW5w0LF5RM5LIx27qw6Q==
X-Google-Smtp-Source: ABdhPJxpsWyMGLiEF4tu5gHe19wgSMrSjb8XQA0Zn0Ko6DZxp8MzPXhuXQXw+BTowyFA6sKxhfY3Cw==
X-Received: by 2002:a17:907:101c:: with SMTP id ox28mr2256847ejb.201.1610107506124;
        Fri, 08 Jan 2021 04:05:06 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:bb2e:8b50:322a:1b9a])
        by smtp.gmail.com with ESMTPSA id i18sm3674498edt.68.2021.01.08.04.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 04:05:05 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        robert.foss@linaro.org, todor.too@gmail.com, mchehab@kernel.org,
        robh+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        shawnguo@kernel.org, leoyang.li@nxp.com, geert+renesas@glider.be,
        arnd@arndb.de, Anson.Huang@nxp.com, michael@walle.cc,
        agx@sigxcpu.org, max.oss.09@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 07/17] media: camss: Add missing format identifiers
Date:   Fri,  8 Jan 2021 13:04:19 +0100
Message-Id: <20210108120429.895046-8-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210108120429.895046-1-robert.foss@linaro.org>
References: <20210108120429.895046-1-robert.foss@linaro.org>
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

