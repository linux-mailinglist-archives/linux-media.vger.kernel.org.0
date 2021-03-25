Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 017DB348D71
	for <lists+linux-media@lfdr.de>; Thu, 25 Mar 2021 10:54:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbhCYJyX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Mar 2021 05:54:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhCYJyB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Mar 2021 05:54:01 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0837C06174A
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 02:54:00 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id kt15so1834919ejb.12
        for <linux-media@vger.kernel.org>; Thu, 25 Mar 2021 02:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gu3lolEPB9h+1NuQCHnzhktwJF43hVGF2O8ioNpfpS0=;
        b=buzeafrEJ4linZ7gAS2KzWoddhQDwUG3qaJKYbJiW0qizarq9q/Rp5uH/0T3Zuz//l
         6m9oZL1mpNIfTCVaiMvoGRNal++CbpzcRYtDOEVcRbN3POrbgIZhLGbv7WSOFLh5+UdW
         /TpWeownZ8VqnAtQV3KInHvdr6SldB7Iyeo6PqzYwWPkGaSN0RUy4W8QBbBOl/mjQFZv
         f/QhHDekbjb/jMhNuGqrN61nbzrw/y4Xj1lvo5zDeWkDfu+ZT34odqAxQC7wVCVF648i
         D8/KyjFb3eYI/mk4136MofYFbN1F1soxBbBy8gT051rb+WoyjqTMSoAT95wRRvesVR/T
         FPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gu3lolEPB9h+1NuQCHnzhktwJF43hVGF2O8ioNpfpS0=;
        b=HVES4Tb8RtzmzUWwH3vGbbZgki6pJc1DK+BreajzXCa4vpOWa62g2CXkLHbf0TlDqd
         fc1HQl6kY8luqP/msi+strv82hmGO2+x9SiwSbSJfFCuXe572KqGmC4/iiJW1AxsShXx
         +8ftCklCtmNEFXJparkjuSWgdY/h4EJOYtpScUmj3uXC32SUihLyNvb8wGNgaru8BLKk
         gxVPzn3zLuDbYhkxUYLvtloid6sXIctY5QtRo6cR+5Oe2ZldrTXikQr4d5zBH6cbqRyv
         GgHRii7XBynoT1ClQwvNf3+aseyem3/OAkEdj8B70J6WsFHamJItxryixInqZdDeBtIG
         Iv5A==
X-Gm-Message-State: AOAM530sF5Fnuf2NFej+WWg058W2Jm+joouf7qFS6jBPl3u4svCKv6Ry
        kf1zmEJtr1hwPCKdWl+HTa7nsxRecGujgEKG
X-Google-Smtp-Source: ABdhPJwWbZ3loYDd/cOd+DWa4VBDaW5JOAVuNvGtVj2dEtm5RzyMVOqLPvxGv4iQZsQXNmTHVGjoDA==
X-Received: by 2002:a17:906:cd05:: with SMTP id oz5mr8580127ejb.345.1616666039573;
        Thu, 25 Mar 2021 02:53:59 -0700 (PDT)
Received: from localhost.localdomain (hst-221-11.medicom.bg. [84.238.221.11])
        by smtp.gmail.com with ESMTPSA id p19sm2460482edr.57.2021.03.25.02.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 02:53:59 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] venus: core: Drop second v4l2 device unregister
Date:   Thu, 25 Mar 2021 11:53:37 +0200
Message-Id: <20210325095337.1124747-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Wrong solution of rebase conflict leads to calling twice
v4l2_device_unregister in .venus_remove. Delete the second one.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---

The patch a fix on top of
https://patchwork.linuxtv.org/project/linux-media/patch/20210306162903.221668-1-stanimir.varbanov@linaro.org/

 drivers/media/platform/qcom/venus/core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 00d6883d3859..a38d5aa53727 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -368,8 +368,6 @@ static int venus_remove(struct platform_device *pdev)
 
 	hfi_destroy(core);
 
-	v4l2_device_unregister(&core->v4l2_dev);
-
 	mutex_destroy(&core->pm_lock);
 	mutex_destroy(&core->lock);
 	venus_dbgfs_deinit(core);
-- 
2.25.1

