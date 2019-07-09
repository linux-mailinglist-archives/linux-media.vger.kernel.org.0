Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECFC63A1D
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 19:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbfGIRZH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jul 2019 13:25:07 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34548 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfGIRZH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jul 2019 13:25:07 -0400
Received: by mail-pg1-f194.google.com with SMTP id p10so9800565pgn.1
        for <linux-media@vger.kernel.org>; Tue, 09 Jul 2019 10:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+XOGAmvM9zKXLd7snltlz7p/GLyc46ilwqyDiqBZzWE=;
        b=ZLgjzz1KVtsioZuBLGHb69PORJxE1ZDIz2hO09tJG4HqTHrd8gzEE3+lBInpEOP++z
         uWXBvyAa04SdBddiZOory6OjM1PGsck6p98eR/nYwISlHFYOUKaqfdGtcqcfCFeJjpjU
         Ve/4+JwO8UVKInXVoFSx9Eb7QPSuYiDShZJw6Wfn/mGj3FpzEndERMAii85VmO3G5wT9
         ethTL/4vSVyLBYSm0erbJdtDfxdV86tEvJACtX/7R7Z4tsYpv6aRei5tDN2a+MQB8C4y
         XYRC7dy6PPRUNUfxdjbaIt9y8nPfEFq19acGb/lXTVoFbDkpaunwFAEiIfkdQ4QAaus0
         KE0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+XOGAmvM9zKXLd7snltlz7p/GLyc46ilwqyDiqBZzWE=;
        b=sQj5jbKA0OeRw/++ygzzSMsaUJqdLa5kftFpoIJlX2G5+ZidyC95uvOSGt7hvsxfT5
         128qkv6c5kkZLp4fWMlpBsfoVsNkP9wVXGe6yNSbKUoMS4I7s8WGdfQn97xb2+jcxyeD
         3MAMqIY5K8OuZI1iX1Ay6EWy26sRhFSFBQnOUZijOU2MP9UzHXHrV4VA4jUnkk7/5EdY
         GxIYFdzOvrfHS1SlZzpLVU/w2rTBhPMGu1jYVpVaLiZ72sNYOYJkcKad4vfIrAoiJLFi
         J8irILJfD/pfmUmkOa7CxOzKwK8OtBzHDqwHFdFQEp0FDbVnHB8Hx1ewsRHFmAltQHM3
         +1+Q==
X-Gm-Message-State: APjAAAWIz9mj0Ol9DO4reP/PjHVL99cjA5r6FVUrCDHYBb8u3q5hlv4t
        UdWCR9oymeE/5ODaw+94UR8=
X-Google-Smtp-Source: APXvYqwLXsIz8247u+t2R6KRU6rsLxmsDMUTOhViknbtHjRrTGKfJhgq0XtVYDXMIgsn6RwRsAnqoA==
X-Received: by 2002:a17:90a:32ed:: with SMTP id l100mr1308051pjb.11.1562693106952;
        Tue, 09 Jul 2019 10:25:06 -0700 (PDT)
Received: from localhost.localdomain ([110.227.64.207])
        by smtp.gmail.com with ESMTPSA id 97sm4011201pjz.12.2019.07.09.10.25.03
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 10:25:06 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     minghsiu.tsai@mediatek.com, houlong.wei@mediatek.com,
        andrew-ct.chen@mediatek.com, mchehab@kernel.org,
        matthias.bgg@gmail.com, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] media: platform: mtk-mdp: mtk_mdp_core: Add of_node_put() before goto
Date:   Tue,  9 Jul 2019 22:54:54 +0530
Message-Id: <20190709172454.13648-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Each iteration of for_each_child_of_node puts the previous node, but in
the case of a goto from the middle of the loop, there is no put, thus
causing a memory leak. Hence add an of_node_put before the goto in two
places.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
index fc9faec85edb..d0a3f06ad83d 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
@@ -145,13 +145,16 @@ static int mtk_mdp_probe(struct platform_device *pdev)
 		comp = devm_kzalloc(dev, sizeof(*comp), GFP_KERNEL);
 		if (!comp) {
 			ret = -ENOMEM;
+			of_node_put(node);
 			goto err_comp;
 		}
 		mdp->comp[comp_id] = comp;
 
 		ret = mtk_mdp_comp_init(dev, node, comp, comp_id);
-		if (ret)
+		if (ret) {
+			of_node_put(node);
 			goto err_comp;
+		}
 	}
 
 	mdp->job_wq = create_singlethread_workqueue(MTK_MDP_MODULE_NAME);
-- 
2.19.1

