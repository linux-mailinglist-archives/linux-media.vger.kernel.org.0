Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D0E9254229
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 11:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728657AbgH0J0A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 05:26:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728589AbgH0JZW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 05:25:22 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACFC1C06121A
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2020 02:25:20 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id o4so4668310wrn.0
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2020 02:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IjADWSzCT4tmeYYeqMnXWFvGOJch/PV6F9uHmYRiMqE=;
        b=H5LzqCfeFZyNCB8pFfEUZDJVEbwg3Q4f9eQe6thXzFWYdZdONwgHO86GMtBhyn8IL5
         0RER+QCmlz5nDZEkIgPsvGJOARpWjuFRNK5xy6qg0AqcnVrcJRHQAn1sC9hRWR/MZoo1
         FbDpQZvuJ4FNVgV2C6lI6+DIoTtxlvBAeJuPzj4X8a+w/qyW3b5YJ9AecYk1EoDyhUH2
         kccxfi8L5RvDEPwdipli08No/B+MVkIiI8Sa7Hy3kZpeCGoZEPeSPvIjKKQpI/7Nuen8
         8hMdO3deTxfFBQiEcBkHjSdMGHOXS/+wi+ZPyeROthYZFCMXuItg2DTE40Y09PygkQbL
         OH4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=IjADWSzCT4tmeYYeqMnXWFvGOJch/PV6F9uHmYRiMqE=;
        b=M1S1npVUE65diDBMNUYM4iFcflNMaNtsRFnKvXefZV4ewbsCSCSeCTAQNPT1E1FL/J
         7Lb07vQpigUgdKI1ScL9XN/y6Q3y/x+MV26+VqY+DgJscplRIZE6YZ9CJosnN8/28uUn
         VZhOK5ubsJm2vpSzhcQMJaApKeI1hI3bPnbeH2GvmesZqCavNKwgSxgC2K9HaCgdnNve
         djj5eQn77/GgN8gKFEbn1EVCkhaA0r5Jr/mndFyynQ30Vk14CY0fKiiyrHfU6cyE9FgN
         DKpS7RckKTfgQju13h3DCQJWhg+VTimmFjIcaUn7lLPzeaLKR3jtTY7tNeDju2V1avT9
         g4NA==
X-Gm-Message-State: AOAM533CfuCn43iVlPbesZvfeNiRIuybhNj2Q6ZRp2h7yzKwMRtit1fi
        L5BoT8GTdhkkrlluHW1PwhOSS0KTKGrO8g2a
X-Google-Smtp-Source: ABdhPJyXdByp/QY4jGTTdz9nkVjI6RE0Le5Q5fbmhmL4aoKfdL8/G0zUINvAzbXXR5CY9KntS2YWzA==
X-Received: by 2002:adf:f20b:: with SMTP id p11mr13232088wro.388.1598520319384;
        Thu, 27 Aug 2020 02:25:19 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id z203sm4357330wmc.31.2020.08.27.02.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 02:25:18 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 11/13] venus: Get codecs and capabilities from hfi platform
Date:   Thu, 27 Aug 2020 12:24:15 +0300
Message-Id: <20200827092417.16040-12-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827092417.16040-1-stanimir.varbanov@linaro.org>
References: <20200827092417.16040-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Wire up hfi platform codec and capabilities instead of
getting them from firmware.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../media/platform/qcom/venus/hfi_parser.c    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index ecf68852c680..f0c9f73f842d 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -228,11 +228,48 @@ static void parser_fini(struct venus_inst *inst, u32 codecs, u32 domain)
 	}
 }
 
+static int hfi_platform_parser(struct venus_core *core, struct venus_inst *inst)
+{
+	const struct hfi_platform *plat;
+	const struct hfi_plat_caps *caps = NULL;
+	u32 enc_codecs, dec_codecs, count;
+	unsigned int entries;
+
+	if (inst)
+		return 0;
+
+	plat = hfi_platform_get(core->res->hfi_version);
+	if (!plat)
+		return -EINVAL;
+
+	if (plat->codecs)
+		plat->codecs(&enc_codecs, &dec_codecs, &count);
+
+	if (plat->capabilities)
+		caps = plat->capabilities(&entries);
+
+	if (!caps || !entries || !count)
+		return -EINVAL;
+
+	core->enc_codecs = enc_codecs;
+	core->dec_codecs = dec_codecs;
+	core->codecs_count = count;
+	memset(core->caps, 0, sizeof(*caps) * MAX_CODEC_NUM);
+	memcpy(core->caps, caps, sizeof(*caps) * entries);
+
+	return 0;
+}
+
 u32 hfi_parser(struct venus_core *core, struct venus_inst *inst, void *buf,
 	       u32 size)
 {
 	unsigned int words_count = size >> 2;
 	u32 *word = buf, *data, codecs = 0, domain = 0;
+	int ret;
+
+	ret = hfi_platform_parser(core, inst);
+	if (!ret)
+		return HFI_ERR_NONE;
 
 	if (size % 4)
 		return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
-- 
2.17.1

