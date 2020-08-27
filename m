Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB293254236
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 11:26:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728538AbgH0JZI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 05:25:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728550AbgH0JZG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 05:25:06 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A229C061264
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2020 02:25:05 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id f7so4674220wrw.1
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2020 02:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rGqT7srmFAjxM5njBGX2TMqgn+GAvNxXqSd+GHPZX9A=;
        b=f+pTmgDm/DKMlxPbeJzbk9Hif87pYsP3omG0gPyVr9mgLkGJdniqShJ83UPveG/GDz
         o46myXYaeLLS16hwT7cLTN9x+CitiSttF1ldsRTbG5M9MJAYp7jTmlFjXbCeIGkORPY7
         vxN8WYmg9B8ztxNylLjLLok+HiBWesI2wYh/8bTmlIUHI2EUFz9CyKP+cQiYtUAtmS8K
         LUbe+v67RgK2LFR1pzghN/DYExSNrrLbV6jnRMGlSWSFOVWosvNTbFDZSK65XPmb6rTH
         7u0XvnJaY6rPITBn8kK5hVNVkacJA6b5CY6JrO9RkibYyxz8BQRLbvgKGzKb9YDMu8qQ
         pU1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rGqT7srmFAjxM5njBGX2TMqgn+GAvNxXqSd+GHPZX9A=;
        b=qtv6s5EOjNjfbpLAl5Q38iefr6XWqI6aiOku5JHON0CbdmGGtg0GUL3FpealMcDzU7
         4clN19BHYyjr8f7qELYrpaehksTQSJvTV+tiss/MKiXqz++ilgJasruhjKIkWol+O2e7
         ivEXbL73eyVZnVfPAYVpAF2aajbK5uTlHUW6Q1tqSo4xOIxbUwc730cRPFAAB8CRk4uh
         FswTEvmB529A8yDbZaPxfLaUzp8F2cKhBLWd/c3rjPijgZ95RWKpbrpV37n9x/UJtGn6
         DQ2b0mmpobGMs5uHsEj7Vyjo1zNPI9m1RgddQ/xmzm3vsE7yxxnWeqbz/uJc18XEBPy0
         5ayA==
X-Gm-Message-State: AOAM530tQhnNN0nA8T3QUNdKFoOxXUboHgQAELVeMDjivvooW1eOfgEo
        ooRX78vegmJGFOfKTYeZAtL/Bg==
X-Google-Smtp-Source: ABdhPJzUjrlZ6nfXQRs00k+sxlWe8Lcdhud3RXEWA9JgMHa2dZw/NBbQAuBjMVabv+Y8CBD4XemJyg==
X-Received: by 2002:adf:dfc8:: with SMTP id q8mr18516222wrn.231.1598520304235;
        Thu, 27 Aug 2020 02:25:04 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id z203sm4357330wmc.31.2020.08.27.02.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 02:25:03 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 05/13] venus: hfi_plat: Add codecs and capabilities ops
Date:   Thu, 27 Aug 2020 12:24:09 +0300
Message-Id: <20200827092417.16040-6-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827092417.16040-1-stanimir.varbanov@linaro.org>
References: <20200827092417.16040-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add ops to get the supported by the platform codecs and capabilities.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/hfi_platform.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_platform.h b/drivers/media/platform/qcom/venus/hfi_platform.h
index 174428e97b86..8084d092d5d1 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform.h
+++ b/drivers/media/platform/qcom/venus/hfi_platform.h
@@ -46,6 +46,8 @@ struct hfi_platform_codec_freq_data {
 struct hfi_platform {
 	unsigned long (*codec_vpp_freq)(u32 session_type, u32 codec);
 	unsigned long (*codec_vsp_freq)(u32 session_type, u32 codec);
+	void (*codecs)(u32 *enc_codecs, u32 *dec_codecs, u32 *count);
+	const struct hfi_plat_caps *(*capabilities)(unsigned int *entries);
 };
 
 extern const struct hfi_platform hfi_plat_v4;
-- 
2.17.1

