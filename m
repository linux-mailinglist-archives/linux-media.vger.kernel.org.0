Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19E62263F16
	for <lists+linux-media@lfdr.de>; Thu, 10 Sep 2020 09:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730181AbgIJHxY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Sep 2020 03:53:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730140AbgIJHxK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Sep 2020 03:53:10 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FC0DC061798
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2020 00:53:00 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id nw23so7324341ejb.4
        for <linux-media@vger.kernel.org>; Thu, 10 Sep 2020 00:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QM0o+rVzX3uPzdClaXq4cvOE98Cu7/fWdyVNqeP9dm8=;
        b=utjF/eg5YPe5nbhcIOF5tQlQtWPCjtGTK8ZA6cyO9peRb1+AsJ9ABldRh7kaDScqAD
         Jrq6+arYgOeJ5ykRuBsdYrW9VMbCnuHkMuXgSn7EzRzlG5vDidkh9+EuchObnU6qplQR
         KKXdgISb6vhsH2U3YI04TBqA58ASzbiurG0BdgcMpSxFcWZ9nQX7H6zgXlzfKqyyFzd9
         dO31+ZF6G99eJLEzefX3/Z6nSFswMWOIv2P4yrvZSCwpFstQEAGHWSY0OAvv/AF7QCm5
         BntVnDhCKM8uuRUvXPHKvoFPfJ2AMwI8LAnIoPKqiguBFkVtxJWenUusx+wldxWAYoTo
         pstw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QM0o+rVzX3uPzdClaXq4cvOE98Cu7/fWdyVNqeP9dm8=;
        b=Judrqb8ODo4xsbeJmxRdQfPlm3u49AmWJgCOcK1uDcvD3RA5ryM7lFW7VuUHArjXhd
         asn4ZsNjTHtOLZ4GWz4s06AsOeESnKaWCXAqQOYB2MLCD6dvZIG2xCOlCAVCTY5xBBK9
         fsec2iPqXGDpH2uI98TdeBrtg8YckGhzZx6BfAVlV6zMMaOdrHdYvjXRnKvYEUMU7TkY
         vEh9muVpvCR+PW3yd5IodxlmF/nriZN5PdZdv9poY876PN4+SViruqrvZ8O/DC956Go2
         iAjURjBal75C65VXXyIDYZe1PQ1jb+MaFuiZr78oLbczhNvXlVcVLGW9bbvOBYqHOcUo
         7IBg==
X-Gm-Message-State: AOAM530/IgJL4d6D/lo9g//b9DgExHDIIVKnMnsWBZwyIFQe2pM5qDlc
        xBnjHulCnsUFdt608CXvrZ+Avg==
X-Google-Smtp-Source: ABdhPJwFgl91HQI5KPYNpoHEEW6Ht3uLFBFfrWNK9m0dn0oQ/6u16x/WKIp7+5p5drchm/+2Az3+qg==
X-Received: by 2002:a17:906:cb92:: with SMTP id mf18mr7839719ejb.485.1599724378737;
        Thu, 10 Sep 2020 00:52:58 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id q26sm5742838ejr.97.2020.09.10.00.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 00:52:58 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Elliot Berman <eberman@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 2/2] venus: firmware: Set virtual address ranges
Date:   Thu, 10 Sep 2020 10:52:27 +0300
Message-Id: <20200910075227.950-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910075227.950-1-stanimir.varbanov@linaro.org>
References: <20200910075227.950-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In order to boot some of the new Venus firmware versions TZ call to set
virtual address ranges is needed. Add virtual address ranges for CP and
CP_NONPIX in resource structure and use them when loading and booting
the firmware on remote processor.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c     |  4 ++++
 drivers/media/platform/qcom/venus/core.h     |  4 ++++
 drivers/media/platform/qcom/venus/firmware.c | 19 ++++++++++++++++++-
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index c5af42873aed..3549a094e860 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -540,6 +540,10 @@ static const struct venus_resources sdm845_res_v2 = {
 	.vmem_size = 0,
 	.vmem_addr = 0,
 	.dma_mask = 0xe0000000 - 1,
+	.cp_start = 0,
+	.cp_size = 0x70800000,
+	.cp_nonpixel_start = 0x1000000,
+	.cp_nonpixel_size = 0x24800000,
 	.fwname = "qcom/venus-5.2/venus.mdt",
 };
 
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 1a7aee7ee628..3e3f0138e3c3 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -77,6 +77,10 @@ struct venus_resources {
 	unsigned int vmem_id;
 	u32 vmem_size;
 	u32 vmem_addr;
+	u32 cp_start;
+	u32 cp_size;
+	u32 cp_nonpixel_start;
+	u32 cp_nonpixel_size;
 	const char *fwname;
 };
 
diff --git a/drivers/media/platform/qcom/venus/firmware.c b/drivers/media/platform/qcom/venus/firmware.c
index 8801a6a7543d..1db64a854b88 100644
--- a/drivers/media/platform/qcom/venus/firmware.c
+++ b/drivers/media/platform/qcom/venus/firmware.c
@@ -181,6 +181,7 @@ static int venus_shutdown_no_tz(struct venus_core *core)
 int venus_boot(struct venus_core *core)
 {
 	struct device *dev = core->dev;
+	const struct venus_resources *res = core->res;
 	phys_addr_t mem_phys;
 	size_t mem_size;
 	int ret;
@@ -200,7 +201,23 @@ int venus_boot(struct venus_core *core)
 	else
 		ret = venus_boot_no_tz(core, mem_phys, mem_size);
 
-	return ret;
+	if (ret)
+		return ret;
+
+	if (core->use_tz && res->cp_size) {
+		ret = qcom_scm_mem_protect_video_var(res->cp_start,
+						     res->cp_size,
+						     res->cp_nonpixel_start,
+						     res->cp_nonpixel_size);
+		if (ret) {
+			qcom_scm_pas_shutdown(VENUS_PAS_ID);
+			dev_err(dev, "set virtual address ranges fail (%d)\n",
+				ret);
+			return ret;
+		}
+	}
+
+	return 0;
 }
 
 int venus_shutdown(struct venus_core *core)
-- 
2.17.1

