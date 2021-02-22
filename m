Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3869321C20
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 17:03:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbhBVQDW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 11:03:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230457AbhBVQDT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 11:03:19 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58174C06121D
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:01:45 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id h98so14821228wrh.11
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vlf/ot8rdszf9DD1IlnSclOJAqaQ4vSy7GijpaYLiA8=;
        b=NJhVwKed5vcjzBfb6kT9X/UDdUdVdMYIU3j3dylUtyDCxcaswALQ0xLN4grG1L4idD
         SDCTcC4U7VOqQCtvnqLg/FOXyD6yWVAFGH58/c2gZV+SlGpsNifusSnZCNEXaDIIeOG0
         +XX9illg5CnSgd7YwljaNhaQ5FBuVweShgdeZrUTpvS+PRbgVey8OzbEJQ6riuNujYch
         bTmVgI3KAVxTFynoM53RWC4ooUBS/id6nmm/S1iG8XabHmA/Ts61f4tucD8U1TLQn2j6
         l47LUdSmdfQSeNeIy/lALIdBHJUsiOWYYZOxnw5NS81rfUmyZEONtBYKKARnB6y3O0W3
         zkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vlf/ot8rdszf9DD1IlnSclOJAqaQ4vSy7GijpaYLiA8=;
        b=ngl+mHicPchEeUGZTmEsEzLGF6iIlFvVcoo+u56jIMb3XTISRiu40puVfpZkOHMxg4
         /V8zXjRjHA4HDCwcCH3Bz1FE7n00WZMrtZ7DpThIC4RgUxnBATDADrlhL7mF0adlt3cq
         hMYOY2pEX6NkdvHYjfy5jTHsidCJ51mnlomyfNQbbJ9Vc8UqiXuwS2cRgN4QXqyOJJoq
         2V5qNT80y/qF7yVh/YDQ1pOsuo4qDw97XfV7k7mOdV/U3BMmJHftdCKrJ+J4mpKcjZ//
         yx5KuZzaYZgWb1zUJeLmbSFTHYMjZ959Z3too7tsY0hPuGh8jugN8AbKcsfakD+2kd1r
         qyyw==
X-Gm-Message-State: AOAM532PZxHmWUB3iR5LwMrj8k4SQVjzK+2at4+E3OrDUF+Vt2Pwdhw1
        fHeg2nbH/0SOKQkSrnnm5mbqYGYgDDQTQg==
X-Google-Smtp-Source: ABdhPJysLUCRqvvzTo21k/VHY+1WxWTos4A7dzYxtioWV/Dsf8jUDXZ8nBldsMxqEUoDOPdmz1hUbQ==
X-Received: by 2002:adf:b611:: with SMTP id f17mr21588878wre.8.1614009704138;
        Mon, 22 Feb 2021 08:01:44 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c3sm7373697wrw.80.2021.02.22.08.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 08:01:43 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH 07/25] media: venus: hfi: Define block offsets for V6 hardware
Date:   Mon, 22 Feb 2021 16:02:42 +0000
Message-Id: <20210222160300.1811121-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

This commit defines a range of new base addresses for already defined
blocks.

- CPU_BASE_V6
- CPU_CS_BASE_V6
- CPU_IC_BASE_V6
- WRAPPER_BASE_V6

The base addresses of the blocks are slightly different for 6xx but, aside
from that are layout and bit compatible.

New 6xx specific block addresses will be added in separate commits.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Co-developed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_venus_io.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus_io.h b/drivers/media/platform/qcom/venus/hfi_venus_io.h
index 4c392b67252c..8604b213f03f 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus_io.h
+++ b/drivers/media/platform/qcom/venus/hfi_venus_io.h
@@ -19,6 +19,9 @@
 
 #define CPU_CS_BASE				(CPU_BASE + 0x12000)
 #define CPU_IC_BASE				(CPU_BASE + 0x1f000)
+#define CPU_BASE_V6				0xa0000
+#define CPU_CS_BASE_V6				CPU_BASE_V6
+#define CPU_IC_BASE_V6				(CPU_BASE_V6 + 0x138)
 
 #define CPU_CS_A2HSOFTINTCLR			0x1c
 
@@ -59,6 +62,7 @@
 #define CPU_IC_SOFTINT_H2A_SHIFT		0xf
 
 /* Venus wrapper */
+#define WRAPPER_BASE_V6				0x000b0000
 #define WRAPPER_BASE				0x000e0000
 
 #define WRAPPER_HW_VERSION			0x00
-- 
2.29.2

