Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8DF3044CE
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 18:18:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389431AbhAZROs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 12:14:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390423AbhAZInt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 03:43:49 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD18CC06174A
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 00:43:08 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id d2so15189023edz.3
        for <linux-media@vger.kernel.org>; Tue, 26 Jan 2021 00:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t2z1NGbSv+92Iq3y3cHfX8r3rHSgzWMGOLngnUuImF8=;
        b=HqvMQYpbjsMs5FO0qw8p+bYpP7RjH7vBlf6l0HF5VNPGglgnOsbLVfBqJljbCsIasF
         NaYGE3B0ARKF9zXOk8iR5t9vxzgRRMOUE7jeQ4cqURu19xi64IpFfjsjuzIBdl51A+hC
         kmyXKCuwFkg/seQLV8IzyJL2tsx1vEJpZJMh5o2b5n2r1ko4f3p5zXbHSOPZiwd68r+Y
         EuLylY5VI4sLkTuc+4qAJhM/6vvPKW0T8NjQmIhBfqQ8EzuNyprvsXrov4AKw2qPm1ZO
         eWgrDM2jc3tKXYPKcV11SGdwMUuRoBXLTR/iSN8Xl6lBGJSYDPLMJUv6bQ+lcwKpb08+
         VXEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t2z1NGbSv+92Iq3y3cHfX8r3rHSgzWMGOLngnUuImF8=;
        b=OERn1kQqI28yTLI99bWJsi5NN854AXlpARdRQuzv41drbLOIdpCSJsh6vdex++qkOW
         PboI0Px1FXwSgMkO1Y+M0XLKJZQ6Enshvq6nb9Vw6wwZzWmo/ngvx9kysX8Xgl+G0koo
         xVk6c6WPT0x2xjih1ByJZ4Nzgf99g1jZ8gmGNnk0W7d/mxfyjYIaOikyOSuZwZ/gLM2m
         +Y3xL7skLPdd+onqafPeXglMPso8aRDmSysQtrvSo5jvczvd29vaAGsViAVNgamFtnEN
         RRvm+qrJRMAUfnb2UJm8MkJd5bJmhLJulaFGOgT5P3SkDC09PfNWY67RS88xXK2a/vR3
         S/CA==
X-Gm-Message-State: AOAM53275zPKye2stfvN3CH6mkFyfwIcCyHDi434Kzj9L3FvzYEv8zxf
        L/jBjK4KxQnJfjJeTkD0HXvdlWcGYi+92Dy+
X-Google-Smtp-Source: ABdhPJwXmN0+EIt8RzL3ueMP/CCxmZVMUAxRmK9RWZ7CZYPhgMXX2MhPsEKA8AQcrWMlG54ahj8c1Q==
X-Received: by 2002:aa7:cc98:: with SMTP id p24mr3854242edt.126.1611650587275;
        Tue, 26 Jan 2021 00:43:07 -0800 (PST)
Received: from localhost.localdomain (hst-221-9.medicom.bg. [84.238.221.9])
        by smtp.gmail.com with ESMTPSA id i4sm9511524eje.90.2021.01.26.00.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 00:43:06 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] venus: core: Parse firmware-name DT property
Date:   Tue, 26 Jan 2021 10:42:52 +0200
Message-Id: <20210126084252.238078-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On production devices the firmware could be located on different
places, this path could be provided by special firmware-name DT
property.

Here we check for existence of such DT property and if it exist
take the firmware path from there. Otherwise, if the property
is missing we fallback to the predefined path from driver resource
structure.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/firmware.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index d03e2dd5808c..56c8fb5a019b 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -187,6 +187,7 @@ int venus_boot(struct venus_core *core)
 {
 	struct device *dev = core->dev;
 	const struct venus_resources *res = core->res;
+	const char *fwpath = NULL;
 	phys_addr_t mem_phys;
 	size_t mem_size;
 	int ret;
@@ -195,7 +196,12 @@ int venus_boot(struct venus_core *core)
 	    (core->use_tz && !qcom_scm_is_available()))
 		return -EPROBE_DEFER;
 
-	ret = venus_load_fw(core, core->res->fwname, &mem_phys, &mem_size);
+	ret = of_property_read_string_index(dev->of_node, "firmware-name", 0,
+					    &fwpath);
+	if (ret)
+		fwpath = core->res->fwname;
+
+	ret = venus_load_fw(core, fwpath, &mem_phys, &mem_size);
 	if (ret) {
 		dev_err(dev, "fail to load video firmware\n");
 		return -EINVAL;
-- 
2.25.1

