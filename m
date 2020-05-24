Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 771FF1DFCBD
	for <lists+linux-media@lfdr.de>; Sun, 24 May 2020 05:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388290AbgEXDq0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 23 May 2020 23:46:26 -0400
Received: from mta-p7.oit.umn.edu ([134.84.196.207]:41840 "EHLO
        mta-p7.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728704AbgEXDqY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 23 May 2020 23:46:24 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-p7.oit.umn.edu (Postfix) with ESMTP id 49V5k768ygz9vCCR
        for <linux-media@vger.kernel.org>; Sun, 24 May 2020 03:46:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id odcN6SIeb1lK for <linux-media@vger.kernel.org>;
        Sat, 23 May 2020 22:46:23 -0500 (CDT)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 49V5k74Gndz9vC9D
        for <linux-media@vger.kernel.org>; Sat, 23 May 2020 22:46:23 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 49V5k74Gndz9vC9D
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 49V5k74Gndz9vC9D
Received: by mail-io1-f72.google.com with SMTP id n20so10365016iog.3
        for <linux-media@vger.kernel.org>; Sat, 23 May 2020 20:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C2t9s0DwevmWJTHcbCKM1B0BY0FZ9/xbKiwLnDDABmQ=;
        b=HYBVSsZzTUiOAKEBXh4AEyJQML8TgLiJb9gqAWCrDSXfFtOW/q43Mtbi5IjQ14Pk/i
         L4T+ww0XRpfoU/gY+WudDS4BftM8K0WMe/0krvj+yu8cumuFDl5b9GhvvY2F6Q/jc7zu
         BImcpoPVI4MH64fOmcq+L1gyWY3u2qjcAB6JPMw7vfQ4rAd03gkonh919/0DUhcWBHPU
         ot1d711bIuAeEydfN6XWj6hzbuGSqtTx/nm8N71kvYmryyLkZYPEakoBKS1AgYo5BnDS
         MtDF2QRLJGav9t3JiMleQ2vQ6FZmh4FJoY3+lPheGKDybUudeWHeVYOd5L/9K4+q73Zl
         mvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C2t9s0DwevmWJTHcbCKM1B0BY0FZ9/xbKiwLnDDABmQ=;
        b=V5ZUMiNecQ/AvricdckhHr8qLDlBOgcko9EsLb3L+7rwN0c1EBGz+7o4Hcwt9J0OL5
         WjIJtzNEguj12f+G+C+cI0V7N31KfYGtJa/Dd009B5kK18texT0A5w97avyo7li4ULog
         Mx/ncmwrjT9FeJUy0wPsHn/Kh6NgCqHH+aSGzFKgaCvKVRaoe+WFSucMeP0P3Ag4URUf
         qhx46Xb7x1QcUSw3sfTnCbZzoKdVBCoTlEN9WxNd5YE88RJ6Q/nixEJd0Y330kWFCTRn
         5+7fE/9CRvAHMAijwMEL1t1HtNnhRmIUV1312NDiYK3ZxFkzpj4VTNoOQ6Lb4bLKKqUX
         tuTA==
X-Gm-Message-State: AOAM530OKL/F3kmFxeGjHD9Z/ZPu4OPctedJT+FjWFFF9u2oTMHzl2Zo
        XXgwReW+KsH3uqlc4rc2KfnzRTG7YVEdUMBeKurdxkbZo/sjRLzrvQAC4TxtoeGd+1xl7W8m4+L
        YDisdMRibJ06mD27s5/OlfHdVwfI=
X-Received: by 2002:a05:6e02:686:: with SMTP id o6mr19039606ils.280.1590291983126;
        Sat, 23 May 2020 20:46:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfyg+Rnu6GlHWCG/+kmbS/tsUTytjIAPq63m/9v6dt18hUHnlXMuVCjoAfpRscXHhLXbpoZw==
X-Received: by 2002:a05:6e02:686:: with SMTP id o6mr19039595ils.280.1590291982781;
        Sat, 23 May 2020 20:46:22 -0700 (PDT)
Received: from qiushi.dtc.umn.edu (cs-kh5248-02-umh.cs.umn.edu. [128.101.106.4])
        by smtp.gmail.com with ESMTPSA id j14sm5752392ioj.26.2020.05.23.20.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2020 20:46:21 -0700 (PDT)
From:   wu000273@umn.edu
To:     sylvester.nawrocki@gmail.com
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kjlu@umn.edu, wu000273@umn.edu
Subject: [PATCH V2] media: s3c-camif: fix missing disable in tegra_adma_probe().
Date:   Sat, 23 May 2020 22:46:16 -0500
Message-Id: <20200524034616.31625-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Qiushi Wu <wu000273@umn.edu>

"pm_runtime_enable()" was not handled by "pm_runtime_disable()"
after a call of the function “pm_runtime_get_sync()” failed.
Thus move the jump target “err_pm” before calling function 
"calling pm_runtime_disable()".

Fixes: babde1c243b2 ("[media] V4L: Add driver for S3C24XX/S3C64XX SoC series camera interface")
Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---

V2: improving commit messages.

---
 drivers/media/platform/s3c-camif/camif-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/s3c-camif/camif-core.c b/drivers/media/platform/s3c-camif/camif-core.c
index c6fbcd7036d6..12ee49638f44 100644
--- a/drivers/media/platform/s3c-camif/camif-core.c
+++ b/drivers/media/platform/s3c-camif/camif-core.c
@@ -500,8 +500,8 @@ static int s3c_camif_probe(struct platform_device *pdev)
 	camif_unregister_media_entities(camif);
 err_alloc:
 	pm_runtime_put(dev);
-	pm_runtime_disable(dev);
 err_pm:
+	pm_runtime_disable(dev);
 	camif_clk_put(camif);
 err_clk:
 	s3c_camif_unregister_subdev(camif);
-- 
2.17.1

