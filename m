Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DF0DFAA48
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2019 07:38:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbfKMGiO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Nov 2019 01:38:14 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:41431 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725858AbfKMGiN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Nov 2019 01:38:13 -0500
Received: by mail-pl1-f194.google.com with SMTP id d29so635380plj.8;
        Tue, 12 Nov 2019 22:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WLiRoMZ+yFPRoCGfEsARIdmeJYcG3ERIAnLJLg5wK0c=;
        b=vLcgQJ+JfOET6Dta9ztvWBh0hP4Cvr+nOgR+PA2feR3CwMaC2+AIzyBPquzj52BCM8
         lFNvfz9iTm8qFQpxeoC7Nx94ccNNkrr+DrI+1yO/xHkntkc9x+Nj5ff1qotZIzVfMb1s
         GNTTTENoiPoqV3sGuVVlTqHEzZn2haNvvdc7EwFBcW5dp5i9HPyP1stTgrabZPiIvuky
         UV1kMOG8l6INymR34RtSe2zvGGoawgrr/Ryu/wECWhVOoRz2ya3mn9V5P9S6yniylKRN
         4Xm0rN6ZA2FEo0cy1XFaY/TuybMrTCVdfWCI3wZ6L7qm1jbpv87SkGIWND3mdEWSPv6v
         0A/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WLiRoMZ+yFPRoCGfEsARIdmeJYcG3ERIAnLJLg5wK0c=;
        b=qlkxa5Q8g2PcnyPgCZQOINr7eG2XTJoiqLYzQg8InR7mbC7iMgFcR2p7bc0JAR9zmA
         AeFsSu/QKKCyzd/dp809HEAAzUMBQDbcapSMMk9wfpKuQKs0YH4p0/ZZc7VxURdVox13
         hikeYh6++cDQlUiOhT8RCM2ieXWqW37IoLOG79kfJDwj2UGYjiOKrMW1pyOwe+N1gMI9
         gUDvyPY60W0OropSjNmBT2Wg1JOmhvpvl6tfDZAAuzuCbPED5SYqRuiXdEDJSbs/OoG7
         lav6P35zCfEGLMN7GL19y/R8lJDjFDo1sC09wzq7v5kFiCdLSH7gPx/pve1mYjqIWz6M
         l8DQ==
X-Gm-Message-State: APjAAAW6qra1HCoYrqt5SE1goitSfxflq80kuhkmHJaeF3DxP8kKFdSw
        hLANa57rNxIsZQ+H40kuO2c=
X-Google-Smtp-Source: APXvYqxkwHt/TJTAEncicU6ZqxguK637g6oSnIkIAbEXKBP7Wn/waVVv7YtupAcPuqTYaTM/YHI2cg==
X-Received: by 2002:a17:902:aa95:: with SMTP id d21mr2041503plr.182.1573627093320;
        Tue, 12 Nov 2019 22:38:13 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id r13sm1290060pfg.3.2019.11.12.22.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2019 22:38:12 -0800 (PST)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        Houlong Wei <houlong.wei@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] media: platform: mtk-mdp: add missed destroy_workqueue in remove
Date:   Wed, 13 Nov 2019 14:37:59 +0800
Message-Id: <20191113063759.8838-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The driver misses destroying wdt_wq when remove like what is done when
probe fails.
Add the missed calls like what is done to job_wq to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index c1e29a46ae69..aeaed2cf4458 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -229,6 +229,9 @@ static int mtk_mdp_remove(struct platform_device *pdev)
 	mtk_mdp_unregister_m2m_device(mdp);
 	v4l2_device_unregister(&mdp->v4l2_dev);
 
+	flush_workqueue(mdp->wdt_wq);
+	destroy_workqueue(mdp->wdt_wq);
+
 	flush_workqueue(mdp->job_wq);
 	destroy_workqueue(mdp->job_wq);
 
-- 
2.23.0

