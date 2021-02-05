Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5034D31097F
	for <lists+linux-media@lfdr.de>; Fri,  5 Feb 2021 11:51:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231660AbhBEKuL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Feb 2021 05:50:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231720AbhBEKsH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Feb 2021 05:48:07 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08094C061A2E
        for <linux-media@vger.kernel.org>; Fri,  5 Feb 2021 02:45:06 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id u14so5510762wmq.4
        for <linux-media@vger.kernel.org>; Fri, 05 Feb 2021 02:45:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sfFHGntv9vS08N2U1NTEmFN9zbWTIzne2qD4TJ7xpuU=;
        b=TJtAul56S+YrM+WfbzELVxttPtp3dJhLbv2h7kYapSUpIpl76h3yzCR1KpFD7GR4Xs
         6lGbfwswKFwefRnazQ+bBknr5sZpKU58wUH5nygsGncWzkFLHM+cyuuyGFVkumZ5gg2K
         DLZYsSrpz05hitIfpzg10P4Ad2vLnaYgN0xV8ZbdHDtCHSDSsfQbVbaBtzcBXw1PR3la
         391dkihAaCNfTBnBdFDGnNkTdlXZ6X5Cu/R0J1XXl3EycHLLX9QURGbuN+2ybAmXX6aA
         gRLY6Eolvyw/VR1Xo1TA1/lKQU0AHu4BmZ8FW7OaPziPwifFwyOPaQ9SpUDnSOxUfDgA
         6x5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sfFHGntv9vS08N2U1NTEmFN9zbWTIzne2qD4TJ7xpuU=;
        b=J+Cx83wIj3Q3FMdvOXmzMX8oE2/44cLGZ1JuJTm20tmx8o2J6QjU5sbgY0BR7lWC18
         JqGfG9dc0rCQTknjTn99WxegP+Zam67UJnE83CAgSTnuZN+IxcwzrucMMkp56aVLCY9q
         4/Itll6gYxZEk+cWz5SsCuxwkE91vBzv57qzJTN8zD//wJiJOyTRzpWt3ObD9aifQZTq
         4u5+OhE/RHlnpW3baveDfpQxZD0eIGalDtoZI5UmJRd0XGSUKPQcJQxDK6Z8zxSXS31q
         +Htualhb9T8md6nF5NYa1qz3bmGIBoROen1Z651W73Tv5CRzJV7V8cGzmnXGWbqfeH+1
         gXJQ==
X-Gm-Message-State: AOAM531v2CJy7RhLaMCL8lXc77Qh3SV77LfQM0PiWHpH0RX1OAWzztpf
        tHWwtyUCpo/PhZzh1dIUOyMcLA==
X-Google-Smtp-Source: ABdhPJzLBgfSk8BR5qka+3jnVgMzt9+PeWyKtG1G9s1kCFdWMgfjhZJ1X1CNFfRxZTjryieYz5cHUA==
X-Received: by 2002:a05:600c:21cb:: with SMTP id x11mr3083331wmj.29.1612521904728;
        Fri, 05 Feb 2021 02:45:04 -0800 (PST)
Received: from localhost.localdomain ([2a02:2450:102f:d6a:38fd:e0db:ea01:afc8])
        by smtp.gmail.com with ESMTPSA id u4sm11300233wrr.37.2021.02.05.02.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 02:45:04 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Azam Sadiq Pasha Kapatrala Syed <akapatra@quicinc.com>,
        Sarvesh Sridutt <Sarvesh.Sridutt@smartwirelesscompute.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jonathan Marek <jonathan@marek.ca>
Subject: [PATCH v4 08/22] media: camss: Add missing format identifiers
Date:   Fri,  5 Feb 2021 11:44:00 +0100
Message-Id: <20210205104414.299732-9-robert.foss@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210205104414.299732-1-robert.foss@linaro.org>
References: <20210205104414.299732-1-robert.foss@linaro.org>
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

