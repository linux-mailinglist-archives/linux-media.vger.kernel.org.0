Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34C2A44DA11
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 17:13:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234172AbhKKQQp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 11:16:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233987AbhKKQQp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 11:16:45 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4F5EC061766
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:13:55 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id w29so10626801wra.12
        for <linux-media@vger.kernel.org>; Thu, 11 Nov 2021 08:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FFkZzpy5SsjOY6Rq6Rp0WjHinpFwH4h4/0g0HL7f/9Y=;
        b=UjJu4ICH0tTIPg5HBtSRd9jXs9OLqdZgo1Y3ooq9d/Hca0jxkgKA/Gxb19AIDWJ3m1
         cwmSntEWFZHzuPmGyyEKwxJAZijGB1IOf5AAATS5cOtUoeN4dlSlX3KtZy7nZc3o8zTs
         /yHluejk8pqr9TA71WHzrb2NYH4R9uNFCVeVThfOM/ujSILXzAmn4oUxZ3EoBZgCsa40
         1zGzr05nFQHynpK1rrvcvaHbhmYAMArSWeXKNzlyWUFFjsjmAfAFLNDs6kPHZLn4fIT8
         /Xc3W7odbrCWOHCe8ZtlfIkiuLsZ78eTInY83Tel6vhYxkuVxCGh8p79fz6qbB85UceY
         a4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FFkZzpy5SsjOY6Rq6Rp0WjHinpFwH4h4/0g0HL7f/9Y=;
        b=OE+IxfXJIlea2zLLKrJpFvW1fJJZ3YYUxUHJYvwzkue3qtbvikRO4TWa+HP1WPxcT/
         tZDJUzl8Brt6fAj4b2Wd2M5TZbSPQCZi4j9WYwg10eEzmFYDfxn852ojjqoRw58ryQU/
         qEh2s9bjhqx049n6sDNtPpfS7JopBdEroL1E1D8dxhNWH5MoEQsHMzrPZQRuK2h5hVeH
         kvceSYOyrUJ1NDaolayBJ6pma6VQ9G2/744dZ/+bqCOtMah2qs96IRVwLsm7htznqB4L
         FfvbNWHkcIEZ+nJHy/4RagmIbmzGuIkDG8ri9YtddXmgHZI9dmn7bBmXGdJPLpC6SFlN
         1geQ==
X-Gm-Message-State: AOAM530fuM6toEBc/6TduLZx67EaTGY2sUVg0GR+kch7BgtpgKNnpZNO
        ch7nhysIGe/4NzP8e9jQugF0vA==
X-Google-Smtp-Source: ABdhPJz7tLrQPN8++IGG60h0xIL7npEFJjCdk7XVwtiYa7rc4V5y/NzqXBcHvs10M/0f7zmizECl0w==
X-Received: by 2002:a05:6000:1544:: with SMTP id 4mr10287232wry.358.1636647234440;
        Thu, 11 Nov 2021 08:13:54 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o1sm3441451wrn.63.2021.11.11.08.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 08:13:53 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        robert.foss@linaro.org, jonathan@marek.ca
Cc:     andrey.konovalov@linaro.org, todor.too@gmail.com,
        agross@kernel.org, bjorn.andersson@linaro.org, mchehab@kernel.org,
        jgrahsl@snap.com, hfink@snap.com, bryan.odonoghue@linaro.org
Subject: [RESEND PATCH 09/18] media: camss: csid-170: set the right HALT_CMD when disabled
Date:   Thu, 11 Nov 2021 16:15:33 +0000
Message-Id: <20211111161542.3936425-10-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211111161542.3936425-1-bryan.odonoghue@linaro.org>
References: <20211111161542.3936425-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Use the "HALT_CMD_RESUME_AT_FRAME_BOUNDARY" define instead of a "1" which
is otherwise confusing, and add a "HALT_CMD_HALT_AT_FRAME_BOUNDARY" which
is set when disabling.

Fixes: eebe6d00e9bf ("media: camss: Add support for CSID hardware version Titan 170")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Robert Foss <robert.foss@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csid-170.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-170.c b/drivers/media/platform/qcom/camss/camss-csid-170.c
index 2c84d40fe3e0..22a7d7ad6340 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-170.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-170.c
@@ -105,7 +105,8 @@
 #define CSID_RDI_CTRL(rdi)			((IS_LITE ? 0x208 : 0x308)\
 						+ 0x100 * (rdi))
 #define		RDI_CTRL_HALT_CMD		0
-#define			ALT_CMD_RESUME_AT_FRAME_BOUNDARY	1
+#define			HALT_CMD_HALT_AT_FRAME_BOUNDARY		0
+#define			HALT_CMD_RESUME_AT_FRAME_BOUNDARY	1
 #define		RDI_CTRL_HALT_MODE		2
 
 #define CSID_RDI_FRM_DROP_PATTERN(rdi)			((IS_LITE ? 0x20C : 0x30C)\
@@ -444,7 +445,10 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 	val |= 1 << CSI2_RX_CFG1_MISR_EN;
 	writel_relaxed(val, csid->base + CSID_CSI2_RX_CFG1);
 
-	val = 1 << RDI_CTRL_HALT_CMD;
+	if (enable)
+		val = HALT_CMD_RESUME_AT_FRAME_BOUNDARY << RDI_CTRL_HALT_CMD;
+	else
+		val = HALT_CMD_HALT_AT_FRAME_BOUNDARY << RDI_CTRL_HALT_CMD;
 	writel_relaxed(val, csid->base + CSID_RDI_CTRL(0));
 }
 
-- 
2.33.0

