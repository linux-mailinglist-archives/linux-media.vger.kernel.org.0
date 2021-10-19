Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78E92432C10
	for <lists+linux-media@lfdr.de>; Tue, 19 Oct 2021 05:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbhJSDKf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Oct 2021 23:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbhJSDKe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Oct 2021 23:10:34 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20CE2C06161C;
        Mon, 18 Oct 2021 20:08:21 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id m21so18011720pgu.13;
        Mon, 18 Oct 2021 20:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IUyhklULDNWU6fwM13VbKzX6fIzbRhikt8otoP7sTAU=;
        b=ODhMPxDMQ6x3vBafBLKSVrdQgHJ4d3uLTxqAFPdKAPLcrc9/fA1Wf7Iyz0JH6rlRok
         O5uyyhEJkmtBM8J0lCzrjsFp+TccGvNZyWW4l5t8yTo26WlH/UrZZ8S+tVhZkGzVh4Gy
         YuLTfWYEVPTzurox8X4u5KazmMdSAEdUk0rxhn2HujrJAA+R/ndbOi+xrEMIuzrUTz22
         xjXXDrBmo8AAwivdhX9GR2pgnzlcnjNsCh/rZfKcIg/pVqFRC5/TG5eZUSyl/mflsOHa
         gdkRtIudH898d0lUiH46fjhIkLZOMPuIBeovrQZoNbQ3JR5JrTX5HQoUtTCbZ9hqgd9t
         Aehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IUyhklULDNWU6fwM13VbKzX6fIzbRhikt8otoP7sTAU=;
        b=2/k3SO7HE6CjeGZGf/XLnCixVVvdHuWxfI1YJOW6cVgzzT2h9mQOSNGPlwtQmoWLU8
         uJbrPWkVdbrUCNsVepLRVDveUA60GZWSM6nZOOrzcBbs183an+SkN3ognxUxr4OOXiZd
         UXHwsiKvLg0xgvGleDR82uKDUr+Bfw4mB21RCVkBgofjFimfe8yKo5xddHP33AAR0+XO
         ITx90DVBiB0aQ68TydV7iBlAQB+ro1A9lXfyekM7zBHqLa2V0tCHa0+dvoQlfLHmZn1E
         FlxJJJMxShIue0y+Ejtz8vUYceIXajQuszfD8gwO7mlEymWTb/1sAgyxIYf28WhdupQd
         j6dA==
X-Gm-Message-State: AOAM531O5MB73Rq8ZSSGJZC9ceFIw0rjaR/mUL0MW/GfXfPWg1lY2vSw
        qZHpzwCJpXFof/ei+ef4JgU=
X-Google-Smtp-Source: ABdhPJyfcMj79DF+NlyHb93YCbnanVUWgVrodo162DkAtvimiJfg5S71x3BGU6XMG6n+33G3M8YEAQ==
X-Received: by 2002:a63:6dc1:: with SMTP id i184mr11756502pgc.165.1634612900522;
        Mon, 18 Oct 2021 20:08:20 -0700 (PDT)
Received: from localhost.localdomain ([94.177.118.15])
        by smtp.gmail.com with ESMTPSA id e6sm14405803pfm.212.2021.10.18.20.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Oct 2021 20:08:20 -0700 (PDT)
From:   Dongliang Mu <mudongliangabcd@gmail.com>
To:     Fabien Dessenne <fabien.dessenne@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Dongliang Mu <mudongliangabcd@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] driver: bdisp: add pm_runtime_disable in the error handling code
Date:   Tue, 19 Oct 2021 11:08:08 +0800
Message-Id: <20211019030808.3327043-1-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the error handling code of bdisp_probe, it fails to invoke
pm_runtime_disable in many error sites.

Fix this by adding pm_runtime_disable at the label err_remove.

Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
v1->v2: move pm_runtime_disable from the end of label err_pm to
	the beginning of err_remove
 drivers/media/platform/sti/bdisp/bdisp-v4l2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/sti/bdisp/bdisp-v4l2.c b/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
index 6413cd279125..01cc8b577ad4 100644
--- a/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
+++ b/drivers/media/platform/sti/bdisp/bdisp-v4l2.c
@@ -1395,6 +1395,7 @@ static int bdisp_probe(struct platform_device *pdev)
 err_pm:
 	pm_runtime_put(dev);
 err_remove:
+	pm_runtime_disable(dev);
 	bdisp_debugfs_remove(bdisp);
 	v4l2_device_unregister(&bdisp->v4l2_dev);
 err_clk:
-- 
2.25.1

