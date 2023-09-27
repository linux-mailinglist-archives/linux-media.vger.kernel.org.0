Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4663B7B045F
	for <lists+linux-media@lfdr.de>; Wed, 27 Sep 2023 14:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231699AbjI0Mju (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Sep 2023 08:39:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230109AbjI0Mjt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Sep 2023 08:39:49 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 904FB12A
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 05:39:48 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-31f71b25a99so10838542f8f.2
        for <linux-media@vger.kernel.org>; Wed, 27 Sep 2023 05:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695818387; x=1696423187; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FIhs4BXY6YTveTvsRzye3j10AAGXVI9gvPzsJlGfAZg=;
        b=jlHGwqaLAXIfm1Sgu4OJ8/84uMg3fCpCnLacKoJH17Vc4pAUeEv8UTpxPWbutN6a3T
         gBldw/pF8LrpVYTMdr4OQGff/91Cqj/LGApCLgWOTlWz6ethqiumHW3XSzzNQk6O2Bzi
         xx1vQ7PkRmXtBwoh734yIxGva1SF0AgBPTJdN0p5dLo6LEwhqSAjoJDezqW93Wnd97lK
         FOpn41WlK3ko0N+bGg5P2zoVQ4GzRx/1+0TV2weitrtNgwNwx2uj7O1YeqdlZ9yyPxBF
         o7F+IVild1Ip22tBZZo/dnfiLajffc0DEO+c4gsI9LtveRN6/SrJByi9xAhbtY5YmvWO
         9+vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695818387; x=1696423187;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FIhs4BXY6YTveTvsRzye3j10AAGXVI9gvPzsJlGfAZg=;
        b=oWbNOoWBGKNY2R6QdZzPT7sFNhAH7PFUHl8enUy9jKk3kjq9B+X2kJops5sMMKKM5F
         lTcrbp6IRJacL5Eo8MW67Fi9VFgpOB6fBHXtd0iWFyO2+6LuFINHMPIwF1rjgmpECKce
         w3fsviEE2hTBHa7yaoaremonOcYKMNPe+WR7Tigb0hOwR2Q4Mx450uKkh1Kz+7nDFx0M
         LwBI02BTYCfruYdzA1JuQIuAE0Nr7yUXBg1suXB9vecrHws9jZdLaSKJar6N9W1c/zmQ
         BbvTjviWo/7dwgzM3S/521uE2aNbVLFPGt9Q+IXwZYWPyg2xJ5L3fCUWKcA+1u74IARY
         +6OQ==
X-Gm-Message-State: AOJu0YzQzoSTnT4jPVcoM8M4+wFwruNyxDbN7nNbml+ecLe7dTMjk1De
        Njxz0czqDlFJcNLsL7rn5Ex6+w==
X-Google-Smtp-Source: AGHT+IEX1DR+gf+lCbxY7PiBtDS+udqlOUQsbofCCFY2WMj3GiFEZa/d1gZ3zztXu9BXUCF+I4ff7w==
X-Received: by 2002:adf:fa12:0:b0:31d:c73d:d2ed with SMTP id m18-20020adffa12000000b0031dc73dd2edmr1456778wrr.5.1695818386752;
        Wed, 27 Sep 2023 05:39:46 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x17-20020a5d6511000000b0031fd849e797sm17033260wru.105.2023.09.27.05.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 05:39:46 -0700 (PDT)
Date:   Wed, 27 Sep 2023 15:39:43 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Marvin Lin <milkfafa@gmail.com>
Cc:     Joseph Liu <kwliu@nuvoton.com>, Marvin Lin <kflin@nuvoton.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, openbmc@lists.ozlabs.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] media: nuvoton: npcm-video: Fix IS_ERR() vs NULL bug
Message-ID: <3134a802-75fe-49f3-bcd6-06addc2ffaf5@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The of_parse_phandle() function returns NULL on error.  It never returns
error pointers.  Update the check accordingly.

Fixes: 70721089985c ("media: nuvoton: Add driver for NPCM video capture and encoding engine")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/platform/nuvoton/npcm-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nuvoton/npcm-video.c b/drivers/media/platform/nuvoton/npcm-video.c
index ac8d73b794d3..b9e6782f59b4 100644
--- a/drivers/media/platform/nuvoton/npcm-video.c
+++ b/drivers/media/platform/nuvoton/npcm-video.c
@@ -1660,9 +1660,9 @@ static int npcm_video_ece_init(struct npcm_video *video)
 	void __iomem *regs;
 
 	ece_node = of_parse_phandle(video->dev->of_node, "nuvoton,ece", 0);
-	if (IS_ERR(ece_node)) {
+	if (!ece_node) {
 		dev_err(dev, "Failed to get ECE phandle in DTS\n");
-		return PTR_ERR(ece_node);
+		return -ENODEV;
 	}
 
 	video->ece.enable = of_device_is_available(ece_node);
-- 
2.39.2

