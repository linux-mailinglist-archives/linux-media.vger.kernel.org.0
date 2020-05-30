Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6265C1E8D35
	for <lists+linux-media@lfdr.de>; Sat, 30 May 2020 04:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728649AbgE3Clf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 May 2020 22:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728349AbgE3Cle (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 May 2020 22:41:34 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8318DC03E969;
        Fri, 29 May 2020 19:41:33 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id i17so1926510pli.13;
        Fri, 29 May 2020 19:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=tqT1Z0ZKvBSM+e8jvFBLBJcZZOZwowJYeHajnRMlUKw=;
        b=SItPDO/hGImCOttd+gN5ppN+DRMAeCNL4jZVy5Z0nr1r8x7igPj7Sm9yzgP6X4cILJ
         1b8IMbbsWMwHH9jvSN26vyG8t6SUqCuGUz4xtbnTYPUGsnffWvGXEz/ynJnGXvcIonOo
         bAs5hXz2jMIYUvl6XjDCKFU+0AcN9Mws+ybHm556YV8IxUH97wZX1uWDXqJWLIwXJuvO
         Tg0QGCAwtHfriMyBvfMaRswvrkH6E+GeIhGdWVlUmlh9ihNG16DyuzlomXwmX1Y0yoI/
         Ki0RRiS6ly3+IHH4/HwDRTZArC0ngQpDbLR1eDNtOpiIZz2f5J3GVVr/40nvxwv85knr
         vpEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=tqT1Z0ZKvBSM+e8jvFBLBJcZZOZwowJYeHajnRMlUKw=;
        b=Cu1t+Du9IASTWL8wsD+28Mo9gfNVRa+cY7LE45GkAl7WivKd+QgNdQJha1Msn5UGl4
         Qs6P/Pg6Npfe6Bv0pHDOYqGeANP+PWac2Z/DdY0u87R4wruE+72PxEqI6mM1NO2NfauK
         cAzT4YCCjUew0hlhN34ih6xGkkbTjrPFwKppbGBJF5DBqz06S3jw+zWtY6x4N8L/4lII
         AVIUpQY0UbVAMv1xrVr2elT4IWJkuZ9VuBoGgjRf958MPsvgtHTrJGrXcRXOYyYtRyvg
         e0GR+LM4Lx59E34I8yRbJehPjuN8XP4ECv1+ncbbQfNInRqzUlcxYcRg876AVUTBTLZf
         3e9A==
X-Gm-Message-State: AOAM532BaGlNW9IYM1eTarWBWpdUQCx2p9h/YgJXSfIAW0DQbBuh3moG
        i6wWkMojPIBMkKOPQ/xshG0=
X-Google-Smtp-Source: ABdhPJz02dJbpDs0iY8NEEvJpg4UP56NGkISbLtPY0i+WgHKGbpIcyr8XC2t367IqiNCwGq2m5Vfuw==
X-Received: by 2002:a17:902:c808:: with SMTP id u8mr11172343plx.135.1590806493090;
        Fri, 29 May 2020 19:41:33 -0700 (PDT)
Received: from oslab.tsinghua.edu.cn ([166.111.139.172])
        by smtp.gmail.com with ESMTPSA id n2sm8291365pfe.161.2020.05.29.19.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2020 19:41:32 -0700 (PDT)
From:   Jia-Ju Bai <baijiaju1990@gmail.com>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [PATCH] media: venus: fix possible buffer overlow casued bad DMA value in venus_sfr_print()
Date:   Sat, 30 May 2020 10:41:17 +0800
Message-Id: <20200530024117.24613-1-baijiaju1990@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The value hdev->sfr.kva is stored in DMA memory, and it is assigned to
sfr, so sfr->buf_size can be modified at anytime by malicious hardware. 
In this case, a buffer overflow may happen when the code 
"sfr->data[sfr->buf_size - 1]" is executed.

To fix this possible bug, sfr->buf_size is assigned to a local variable,
and then this variable is checked before being used.

Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
---
 drivers/media/platform/qcom/venus/hfi_venus.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index 0d8855014ab3..4251a9e47a1b 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -960,18 +960,23 @@ static void venus_sfr_print(struct venus_hfi_device *hdev)
 {
 	struct device *dev = hdev->core->dev;
 	struct hfi_sfr *sfr = hdev->sfr.kva;
+	u32 buf_size;
 	void *p;
 
 	if (!sfr)
 		return;
 
-	p = memchr(sfr->data, '\0', sfr->buf_size);
+	buf_size = sfr->buf_size;
+	if (buf_size > 1)
+		return;
+
+	p = memchr(sfr->data, '\0', buf_size);
 	/*
 	 * SFR isn't guaranteed to be NULL terminated since SYS_ERROR indicates
 	 * that Venus is in the process of crashing.
 	 */
 	if (!p)
-		sfr->data[sfr->buf_size - 1] = '\0';
+		sfr->data[buf_size - 1] = '\0';
 
 	dev_err_ratelimited(dev, "SFR message from FW: %s\n", sfr->data);
 }
-- 
2.17.1

