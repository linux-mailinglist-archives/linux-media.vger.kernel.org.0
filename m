Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3487A1E57CF
	for <lists+linux-media@lfdr.de>; Thu, 28 May 2020 08:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbgE1Gl7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 May 2020 02:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbgE1Gl6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 May 2020 02:41:58 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C823C05BD1E;
        Wed, 27 May 2020 23:41:58 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id a13so11131946pls.8;
        Wed, 27 May 2020 23:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xrBThDxeaj7xavtiCZsH7YWZDMSxeuAoxlObig/4N/I=;
        b=FLxBZ9um2B2vEtPr7iWB8XrtkQjPngKLYYruLGsgNh0z4zcH/kRn+xf9BjeYNqgn6v
         a1y8YeP8u9KYE8YO90AbBef2V2RHKBFt5Uht42QMif6yLUiSoBF96vNaq3O2mrjUecyY
         7n1PFt5QAypRKHp3c0ajsBka1XeAjra/w41dwwD+ZJLvJoA6iDRzZu5rieTDtEBfc8OH
         XK8eB+Hghu9vQMOaaO+1w5bUxee5WXmODQZsnsKZhcoVUJYU0lTWAJlmakfZzBsw9Qan
         cQPV/i03z77q21dBx2XCO2Qg/wTl24x7aWlKON4pprcUxVi2JtpcDVn9aZOW5joX9rJl
         PPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xrBThDxeaj7xavtiCZsH7YWZDMSxeuAoxlObig/4N/I=;
        b=O+X25ODh+OiQ0NUggTPO+dplbmElkFUgJUDy/NU4LMnL+iuWon2cQfwnWbdZcpaCjk
         20Jk2U9u/YjEvkb5odO85d8yc8+GfNPd2pvhYbyscVTaSMjJMCEtVMRmhAjjbAufiEFK
         Xsnk/7Gde3Quo5eBYZ585pJOk1KqG0emBGp4HueJQf5jJVicOIPd9ZgbB+4Kay/QtAUO
         evRpmKDKtYYRyAsSmF3+MsZN6F/IqlUiItwUAOIq7HZ50i1r8IYYpB1QhjsJsJeDw8Hy
         5amPqE3UE49yJWIfFyKTqHoBHVhD3y8Ef2mNPllbAis8UsmMkOVVzlldaSieAwmXLU51
         Qwow==
X-Gm-Message-State: AOAM532WQoHbl0/AdIqhywVQRP++ibdVcj/65i90N+PGMPu4CF5IDOx6
        9YxRZEqddqXtKW9+6BJ4aGg=
X-Google-Smtp-Source: ABdhPJxfyVJYCW6OXxyIdqotYbExAo0vhBiYRCbKzt47PRvIp3kO28WGI5wLHLxB+zAdla2Gy3EPbA==
X-Received: by 2002:a17:902:9695:: with SMTP id n21mr2045679plp.137.1590648118126;
        Wed, 27 May 2020 23:41:58 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id h21sm4284633pjz.6.2020.05.27.23.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 23:41:57 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH v2] media: exynos4-is: Add missed check for pinctrl_lookup_state()
Date:   Thu, 28 May 2020 14:41:47 +0800
Message-Id: <20200528064147.547158-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

fimc_md_get_pinctrl() misses a check for pinctrl_lookup_state().
Add the missed check to fix it.

Fixes: 4163851f7b99 ("[media] s5p-fimc: Use pinctrl API for camera ports configuration]") 
Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
Changes in v2:
  - Add fixes tag.

 drivers/media/platform/exynos4-is/media-dev.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index 9aaf3b8060d5..9c31d950cddf 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -1270,6 +1270,9 @@ static int fimc_md_get_pinctrl(struct fimc_md *fmd)
 
 	pctl->state_idle = pinctrl_lookup_state(pctl->pinctrl,
 					PINCTRL_STATE_IDLE);
+	if (IS_ERR(pctl->state_idle))
+		return PTR_ERR(pctl->state_idle);
+
 	return 0;
 }
 
-- 
2.26.2

