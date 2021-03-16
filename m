Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 085FF33D999
	for <lists+linux-media@lfdr.de>; Tue, 16 Mar 2021 17:40:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238773AbhCPQjw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Mar 2021 12:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238136AbhCPQjW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Mar 2021 12:39:22 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E64BFC06174A
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 09:39:21 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id g185so35855768qkf.6
        for <linux-media@vger.kernel.org>; Tue, 16 Mar 2021 09:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d7eWW+8Pf3xp++rXcPtYGQh1QURw48Yj87PnA4MMiyQ=;
        b=UDE4JrVi0e/ZKNwnhjZ4M8Fu4y7oXOxQ8K+yQvn0mpt7QiDk0LlHenPUYLRJzei8tE
         uuqqOOvT0Er3tpEzhwOxPKbYfjYs/dbE3Vd8Mi9JQVrVsMZtZeT8oixEDGr+UdrwCx1M
         UXOqedFW+44g4M9sFVV41VaEeSbikiKjZD3ToalfD0LBgRkNKkGbJ/44TrW2XuuYaR/K
         iYy8JghKRyiadsE1lOVz3t+9YhE0Z2KtBp+PEE4IPSq0RjEXEDuxUVTU89mueiC3RWvz
         Hk+k7yFcW8VBC9epHP1l5sLW7smNeTv+gTlxaMdHYIRPDQYXEquVnfViKHpTdQvFCn3X
         OTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=d7eWW+8Pf3xp++rXcPtYGQh1QURw48Yj87PnA4MMiyQ=;
        b=sRGS0ANSgKEgYylQeZ5hrx1zTj64+cD+w+c+Ue114O0UTBM1yYJnwk7Hta783x6Rq5
         5F86TRzLs7YMROpC6W45dHiFX4bUi1zX/rNAZY/MlYM6TALQLQmXZpuFJuNv4KrdKs1J
         Ck5vXtTcrYS0xxMZGpxt7QEoLXiv6BOgtcHfLKcv51/s16tzKV2m2bHjMIL/UY2QVVYn
         RiEJgV5qqeOkYxu7BT/DSGBx3IzIsaQZpptJXigFX8uHtksYXko5+6UR7iLINJ9HjIkL
         TsScoopQrg9MEe9H+KAiQUdqWvHuFtYBDs0wl9gqYcyr7J7/EBqk3D0JJtwD8vfz8Fx1
         rwGw==
X-Gm-Message-State: AOAM532jAXN5DCTta0VeOCf2/dF0VQcoErnePZfe7pVWJ5bgYS0r98Ci
        VqIvOyszQpA9W5mUuvlaOH4=
X-Google-Smtp-Source: ABdhPJw04SOU/T2KezgzcH26EkT6PxRuOrhFWqfh0hodM8KTJUO69zisbi73r8hAMB9HSI2YX6xTnA==
X-Received: by 2002:a37:a350:: with SMTP id m77mr492141qke.146.1615912761111;
        Tue, 16 Mar 2021 09:39:21 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:919::1000])
        by smtp.gmail.com with ESMTPSA id 18sm16010000qkr.77.2021.03.16.09.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 09:39:20 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     p.zabel@pengutronix.de
Cc:     hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] media: coda: Removed unneeded of_match_ptr()
Date:   Tue, 16 Mar 2021 13:39:12 -0300
Message-Id: <20210316163912.234413-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The coda driver only runs on i.MX, which is a DT-only platform, so
remove the unneeded of_match_ptr().

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/media/platform/coda/coda-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/coda/coda-common.c b/drivers/media/platform/coda/coda-common.c
index 995e95272e51..ccb4d3f4804e 100644
--- a/drivers/media/platform/coda/coda-common.c
+++ b/drivers/media/platform/coda/coda-common.c
@@ -3317,7 +3317,7 @@ static struct platform_driver coda_driver = {
 	.remove	= coda_remove,
 	.driver	= {
 		.name	= CODA_NAME,
-		.of_match_table = of_match_ptr(coda_dt_ids),
+		.of_match_table = coda_dt_ids,
 		.pm	= &coda_pm_ops,
 	},
 };
-- 
2.25.1

