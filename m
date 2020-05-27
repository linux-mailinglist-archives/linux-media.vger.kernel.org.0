Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DF381E46FF
	for <lists+linux-media@lfdr.de>; Wed, 27 May 2020 17:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389647AbgE0PG2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 May 2020 11:06:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389316AbgE0PG1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 May 2020 11:06:27 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69A13C05BD1E;
        Wed, 27 May 2020 08:06:27 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id t11so11873937pgg.2;
        Wed, 27 May 2020 08:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KoZe606OflP+pqwc544DH0O+4ssFpqgDgsR2zurkW6E=;
        b=fTHq9CNaoO/Gi4/N0riUfko+pG34aq7YNbAwwUvsFRuBb5GAhsWZLr9xfV4mcZcRsU
         QnglNUdToL3uMhDaPuOEy3wOxmwCTN5ogN4KlsGkmntq1LZFQlZyiCuy7YiUSvPrrsZe
         pV7BSEcUNIO6NelYjVS62q5JL52V55lud3Yn3KMiQyVldN5CwsKtPPynE8Dc4LKOgAvQ
         dGwJQRQCzdkPzOF7Gn3tEJhPNpcqNp2iiBwR7AIQS/TawJ38jZ1adMhcwl3f2OKkmd1K
         EL1f9JSLCmIHUTI09LohN7PXo9o9L6P2YKhq+MjSPtUFEOqjqmmQ5QBbjn9bN/oysqgh
         jpKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KoZe606OflP+pqwc544DH0O+4ssFpqgDgsR2zurkW6E=;
        b=rpaLkRm8d884MSo8MrMoN38o07CjK3QO+0lEOzWwcyMYJhS+dPnA07DwikU1w1TjuG
         uF9VoFKih7FeuwghkrZr7rzt9/kdzopmZarsSo3m4KdnF6QwKrVOua5sk3qBI5d8M+xe
         lF4lIyareu5TLk9RWT0pLFra8medq8wkNEKZ2RfbpuCI+Idogldd2Ceg4bckXJjQzCe8
         hufRgUoZcX7faxq853FM5+Z3KzKOs2cKvWWQ7Px7Da9ErE4ryMx6lYB5BGhSeFYSe688
         XoThvUXWzLI5qafNCrd/cXY5mWpf40A+gnrrVddqPEFAjsqrp33MDf6b6CHBkMfleb8V
         4vbA==
X-Gm-Message-State: AOAM533R4iDu4Dq6Rl8KviMc6aJKPvP0coJipn1qP/l3sO7K9sDKYN4K
        Y7flXniOgeKGNyoStjg169k=
X-Google-Smtp-Source: ABdhPJxgEH3iDLHEIuRn42o6PH92ZI2uivVSnqhr8WUdlOF6ENTJ/r+yXck2jN01wrAUDOVHsdU/nA==
X-Received: by 2002:aa7:8c53:: with SMTP id e19mr4381417pfd.264.1590591986809;
        Wed, 27 May 2020 08:06:26 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id a16sm2465326pfl.167.2020.05.27.08.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 08:06:26 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester95@gmail.com>,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] media: exynos4-is: add the missed check for pinctrl_lookup_state
Date:   Wed, 27 May 2020 23:06:20 +0800
Message-Id: <20200527150620.539247-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Chuhong Yuan <hslester95@gmail.com>

fimc_md_get_pinctrl() misses a check for pinctrl_lookup_state().
Add the missed check to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
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

