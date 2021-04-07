Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3CDA3571CF
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 18:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236147AbhDGQJz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 12:09:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354322AbhDGQJk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Apr 2021 12:09:40 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F580C061756;
        Wed,  7 Apr 2021 09:09:30 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id y20-20020a1c4b140000b029011f294095d3so1448119wma.3;
        Wed, 07 Apr 2021 09:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=JvelsXiWFhKiuGc95HnXl80V7C2PAh9toMttuEic8p4=;
        b=IrIk1cIvAGMsMIbtfA6TTDf4CDC8HoNmKqtJ2r9DRCj59ZO4+q9oJtLk0SNeP+QqSg
         PDs6Szt1xf8k/Vy81oW9lcyhG2yJufDjgayLf7YQTQy/PUt8iP6E3xEJ64q/R8K7kqTe
         huqXuL9FCwm5zisZd2cywcoQ/PX3+L6dS8gKzUBVziWBP47/P6kPOmBytVStyrlWRUjt
         /vXJg4XJXjaA5RPEcXVYrPZY1QgmIyLuPIykLN7kszLdy3ySpz3AyOlJNXQwvO+k9+Dy
         RXjkvbuNTsXpoCDfXUoVJcNXV/RrDg+uIxUf7N0tVZ71nrYzovG7wM9DhQD8Dn5GovCj
         5nIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=JvelsXiWFhKiuGc95HnXl80V7C2PAh9toMttuEic8p4=;
        b=XL4azrUhNCCSnNAzu9np1TDcKIJGejKoaxDNPJW/hYzRc+bhkfBXWM3+g5cVOij3at
         gCJ4WtIgwUgT8UIQIiYvRdHv3I6KHNHAPok4Zf4TLNO4BzsYg3LBomYGrawft1GxFwaI
         gmgDflVdQPVIY0y0h/HM9HcXlTrM09GbQ8bGmv+kN0Afd+9EXS4A3I4ofewHk2r5TJiV
         v1eMS8Z4KjkuS34KteR5+fcQmV2ZQ2I3csPXVlW00jZZxuqGqyuevQs26YKP1lkE/ZEn
         j1gOu3vKJK+Cf8YJiTgumi0a2KQBWyufkh3kL8XwroN9BJbameisBb9GDN+ZnRAl1qTL
         I8hg==
X-Gm-Message-State: AOAM5334+pfuGq0Gm9c011cHPmZ+gy9U2RaF+yPo01PD6CblB9bs2kSn
        OEceXp0go1y8Kixtc+OiK8k=
X-Google-Smtp-Source: ABdhPJyuSEjgC8gxcdCSq+RmMhMDpIj2VfgSm4mV8lRxLBxVjOmi7Jvkw3oGCeM9Sps9dZfNkLyqaQ==
X-Received: by 2002:a1c:df55:: with SMTP id w82mr3826801wmg.162.1617811769001;
        Wed, 07 Apr 2021 09:09:29 -0700 (PDT)
Received: from LEGION ([39.46.7.73])
        by smtp.gmail.com with ESMTPSA id j6sm8376112wmq.16.2021.04.07.09.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 09:09:28 -0700 (PDT)
Date:   Wed, 7 Apr 2021 21:09:21 +0500
From:   Muhammad Usama Anjum <musamaanjum@gmail.com>
To:     hverkuil@xs4all.nl, Neil Armstrong <narmstrong@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        "open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" 
        <linux-media@vger.kernel.org>,
        "open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" 
        <linux-amlogic@lists.infradead.org>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        "moderated list:ARM/Amlogic Meson SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Cc:     musamaanjum@gmail.com, kernel-janitors@vger.kernel.org,
        dan.carpenter@oracle.com
Subject: [PATCH] staging: media/meson: remove redundant dev_err call
Message-ID: <20210407160921.GA1504294@LEGION>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

devm_ioremap_resource() prints error message in itself. Remove the
dev_err call to avoid redundant error message.

Signed-off-by: Muhammad Usama Anjum <musamaanjum@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index 5d4db7a5b4b5..e51d69c4729d 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1008,17 +1008,13 @@ static int vdec_probe(struct platform_device *pdev)
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dos");
 	core->dos_base = devm_ioremap_resource(dev, r);
-	if (IS_ERR(core->dos_base)) {
-		dev_err(dev, "Couldn't remap DOS memory\n");
+	if (IS_ERR(core->dos_base))
 		return PTR_ERR(core->dos_base);
-	}
 
 	r = platform_get_resource_byname(pdev, IORESOURCE_MEM, "esparser");
 	core->esparser_base = devm_ioremap_resource(dev, r);
-	if (IS_ERR(core->esparser_base)) {
-		dev_err(dev, "Couldn't remap ESPARSER memory\n");
+	if (IS_ERR(core->esparser_base))
 		return PTR_ERR(core->esparser_base);
-	}
 
 	core->regmap_ao =
 		syscon_regmap_lookup_by_phandle(dev->of_node,
-- 
2.25.1

