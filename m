Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97F1B3340F9
	for <lists+linux-media@lfdr.de>; Wed, 10 Mar 2021 16:00:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbhCJPAP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Mar 2021 10:00:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232989AbhCJO76 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Mar 2021 09:59:58 -0500
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84C1CC061760;
        Wed, 10 Mar 2021 06:59:58 -0800 (PST)
Received: by mail-pl1-x631.google.com with SMTP id c16so8618446ply.0;
        Wed, 10 Mar 2021 06:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ux+557dunJ//CVXvtzX/Z5WItSrGBa9LPMeRHKA0DrA=;
        b=sdCZywW+XXtqVqzMsthVMzirahL0ykX7Txl94Lvj8bxHwFH4tMQazGgqsfzS+zxxWQ
         TRhSzC4+U5bBPRwTjgX27mUzf0Cg4TYywsukPq7YYQT7VR+NF8XAakptEyNAsgTF0fVh
         Bo+xb2h/bE9SVBB06qNqJXeerjZFMQznVgta9cKzEI4UpjRowXbKFYzhz/mCQeFIfPQ7
         nwSKddhaTrhFusagnM/lkCDRyBzu9ub5AQn8jYt4bSMU+BxakGWBYhTHmS1Stl8FERzd
         dSUAAEZrT85jXm49pCqXNQpZQpNl98x0KXTigRMOq8f4jWurZg6sg1FM3ql/Eum1ulDe
         OaMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ux+557dunJ//CVXvtzX/Z5WItSrGBa9LPMeRHKA0DrA=;
        b=QtHzxqiLvfJN4Udh5Tj5+RHo2P8zMIbF0nNSEs5/4DL2Ft3wj4tD/A/Iag6FrSRLpV
         AxSJi1MjEUO1Qz39xwHWV8OFwRQlzzt6r70gdKuTtvAYA9eh4sVD7srTdLe1rP5lZYRM
         hh2A9RlMFgvVtWGxpFwIwEUx23BslWqcyuJ1mAy/jVvobKpuZcPmSGwUuyXf0Ok4xhrK
         FS2j3x1BZ9u2aXLOPPA7dJICr5EJMT/CJsvglLfh44RWSD7wGnvkaoCeFkPwzFYq3D6u
         vTiO9xUTezLi/cppPtqsA4UYTYFMdC1f+SR0j81FHPzigYdkp7eA1NW7a99+0d1ilrxi
         fU/Q==
X-Gm-Message-State: AOAM531nSPflm2s1WgAl7zBgcEQ0JpQm1QaPDBeGt0gE5u0zwFMFO7mM
        lr878tRY0rmw9T3vPJj7Uas=
X-Google-Smtp-Source: ABdhPJzmzcT7MTnHlBBDN1Udsyc3gMBHsV9pW5PFhbC1sZYxtcGZ8cFq1OUqDXDhhBqliJabNMdc5Q==
X-Received: by 2002:a17:90b:ecf:: with SMTP id gz15mr3906670pjb.85.1615388397898;
        Wed, 10 Mar 2021 06:59:57 -0800 (PST)
Received: from DESKTOP-4V60UBS.ccdomain.com ([103.220.76.197])
        by smtp.gmail.com with ESMTPSA id y20sm16626941pfo.210.2021.03.10.06.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 06:59:57 -0800 (PST)
From:   Xiaofeng Cao <cxfcosmos@gmail.com>
To:     mchehab@kernel.org, patrice.chotard@st.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Xiaofeng Cao <cxfcosmos@gmail.com>
Subject: [PATCH] Correct 'so'
Date:   Wed, 10 Mar 2021 22:58:16 +0800
Message-Id: <20210310145816.32271-1-cxfcosmos@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In Kconfig it should be 'to'
In c8sectpfe-core.c it should be 'do'

Signed-off-by: Xiaofeng Cao <cxfcosmos@gmail.com>
---
 drivers/media/Kconfig                                 | 2 +-
 drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/Kconfig b/drivers/media/Kconfig
index 6222b3ae220b..b07812657cee 100644
--- a/drivers/media/Kconfig
+++ b/drivers/media/Kconfig
@@ -134,7 +134,7 @@ config MEDIA_PLATFORM_SUPPORT
 	  This is found on Embedded hardware (SoC), on V4L2 codecs and
 	  on some GPU and newer CPU chipsets.
 
-	  Say Y when you want to be able so see such devices.
+	  Say Y when you want to be able to see such devices.
 
 config MEDIA_TEST_SUPPORT
 	bool
diff --git a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
index a7a6ea666740..338b205ae3a7 100644
--- a/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c
@@ -655,7 +655,7 @@ static irqreturn_t c8sectpfe_error_irq_handler(int irq, void *priv)
 
 	/*
 	 * TODO FIXME we should detect some error conditions here
-	 * and ideally so something about them!
+	 * and ideally do something about them!
 	 */
 
 	return IRQ_HANDLED;
-- 
2.25.1

