Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4ECB3A26E1
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 10:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230199AbhFJI0Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 04:26:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbhFJI0Z (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 04:26:25 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96EAAC061760;
        Thu, 10 Jun 2021 01:24:29 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id k15so987632pfp.6;
        Thu, 10 Jun 2021 01:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hw+fl/1ZYaGYaV9E+cIjYx72X18eGPIeTmuV7S+e73w=;
        b=uyivjCD25tn577+NaVNvJ8Q+q+vvSk3+UZsnVswWFR13Pm4k/IRIDtH0/8QosljF/X
         Sgj8dd0StHY4xuWxkoGkH2jMd0ZAwPLBiaazjCg7EaqrwUQKguG2eCy7gfydK2RoTB4l
         c5UtyYc7q8z7zldq6lUyPYSr3xmtPdqVk4JHK/cGZlQnuhuYigCef/aKdsNxZZarsH5n
         TSxqtdhX0qWDcDjHR2VzPvbVC0h8843g/hjcaXdWodAj9spywI0civhDgq3R/edfNtAZ
         43HBIabE8faq7ZLI3bQoPbGhJtIIchpjdA3gaaMAVZetnhIoXu8gnVDNweK4zieQvJqH
         l8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hw+fl/1ZYaGYaV9E+cIjYx72X18eGPIeTmuV7S+e73w=;
        b=j8oORT0Lh2XTazLqUqgqzAYo/nQdA0dEs23VXsdoG9hZ5enviRMxrqud0yANPgZIhj
         twxLJr/gdoXKscLHLC2xXBggsfbciWXwxaNqSFNb8ATjkkIin55yvrfurIksO+C4vSdF
         1S/u+8kK2tVdnKn4Dlptx+UQEmLnP0C9nroIBOIdzD/DIqgXhs7ZVp9qzBF2CESqsYDc
         ZcfjMC/RNY37Q9tByS+sZACpU8H8CJtm2hSDoXVv6ra0aWbh1dBlk3Cg+XwGo9exePdX
         0p8BSq07s0uj+lSQAQeNzbTgbm6NVCRZjETtuGaFs3R/SJ37af0MFXtN2GL/nWOKp8kP
         fGwg==
X-Gm-Message-State: AOAM530mgkCk/I0i+z/SWz+MIz3T9mZBwBgOb1UdhhZ7muLUT2UKpSmI
        g7dKTDtt4i8YFvN+e7CcGoNQo4DUIJk23w==
X-Google-Smtp-Source: ABdhPJzBWbzM/IDd+Pi4f+fTza8MxaxdkDP+kIag2GrHJubSAN8qwUmmX/79ILcG4Ad19FXqKVgemw==
X-Received: by 2002:a65:6a16:: with SMTP id m22mr3920250pgu.29.1623313469178;
        Thu, 10 Jun 2021 01:24:29 -0700 (PDT)
Received: from localhost.localdomain ([103.220.76.197])
        by smtp.gmail.com with ESMTPSA id r92sm7602844pja.6.2021.06.10.01.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 01:24:28 -0700 (PDT)
From:   Herman <herman.yim88@gmail.com>
X-Google-Original-From: Herman <yanshuaijun@yulong.com>
To:     a.hajda@samsung.com
Cc:     mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Herman <yanshuaijun@yulong.com>
Subject: [PATCH] drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c : fix typo imporant > important
Date:   Thu, 10 Jun 2021 16:24:09 +0800
Message-Id: <20210610082409.13090-1-yanshuaijun@yulong.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Change 'imporant' into 'important'.

Signed-off-by: Herman <yanshuaijun@yulong.com>
---
 drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c b/drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c
index 49503c20d320..aa80b3f67ded 100644
--- a/drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c
+++ b/drivers/media/platform/s5p-mfc/s5p_mfc_opr_v5.c
@@ -1418,7 +1418,7 @@ static void s5p_mfc_try_run_v5(struct s5p_mfc_dev *dev)
 		if (test_and_clear_bit(0, &dev->hw_lock) == 0)
 			mfc_err("Failed to unlock hardware\n");
 
-		/* This is in deed imporant, as no operation has been
+		/* This is in deed important, as no operation has been
 		 * scheduled, reduce the clock count as no one will
 		 * ever do this, because no interrupt related to this try_run
 		 * will ever come from hardware. */
-- 
2.25.1

