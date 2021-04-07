Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 168C935691A
	for <lists+linux-media@lfdr.de>; Wed,  7 Apr 2021 12:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234880AbhDGKLG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Apr 2021 06:11:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234733AbhDGKLF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Apr 2021 06:11:05 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DC03C061756;
        Wed,  7 Apr 2021 03:10:56 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id x15so8106292wrq.3;
        Wed, 07 Apr 2021 03:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=wPByJzN/lrtdxw7IeGs/VhpNS5SPbMlWIMYIa7XkvgA=;
        b=Mv1KqnOmWXihqzCTJ7mc3sDMHB2wPVvBiahBlHsncEMZtquH6WvHTwwrUTTh6AONiF
         J7HgP0UHU1SZn+flahbTYrKdztw8UgHAP0CCxXG0/LHPpiomdNdtCQmSb4u8U+nGYMi0
         K9FOQJZaQT3Et3YjxjMePQsUoWgUZxmJedTqXXg1VseoePKRo9PcSAgwmLIIpdvExWXK
         hCxRXLox9jhtz5bP2po8hrakmCjWyk7JUp0ocj3G1iwpSWZHNRx0tORESQjhWPlx1fY+
         ABXFXsN40JndUn1ldyjab/Iu/C24XoCYUpqdBKTlu4p+O18kE2r2G1YsDyPwccwe6KOK
         cEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=wPByJzN/lrtdxw7IeGs/VhpNS5SPbMlWIMYIa7XkvgA=;
        b=NSu5SoXFD20ygkAeFgidN+ps1WuKs11f5ZolbzAvwP7sfBrlQ0qPU4veQzmwKi3KFB
         TJTQqiYhIS/1GMEaS12IX5qi9JacVJTyD+TEmz0CKGMVd4WSDZ0jAAP0UrLlTaJRt9CH
         o50mw07w3EfYzf+aHN4MpXdMVUbDCmubR8FTErUrcsTfLdA6TwDoHMGtMc7KNs9LIyMh
         hsWPmp1DQw/ihJA4mpc5zspV8hypb2iilVg5xF/73ObMhHDU6hCr8FLRDQzUFnXZ31Ws
         d7bvP4kgxgLs+vOG3QAsvY1HbvSr74Pnv941GrnhS/nUFM0zMn39tike8nnCKvT7E3Xz
         W5yA==
X-Gm-Message-State: AOAM5314tALn/FZiRu6aKTI4RWea/NZyKdThGEyliYSGtUPC+RwDrNBh
        SAY31u/wqlFN6AhISm3ueOw=
X-Google-Smtp-Source: ABdhPJzF21Oel/0BU67OgtwJ2Z/9oyBl0+N2CQ9W+9/69ZNDuh80eCyuAPaG2Rmx5fOW9kTaY0xQ1A==
X-Received: by 2002:adf:d082:: with SMTP id y2mr2920830wrh.176.1617790254787;
        Wed, 07 Apr 2021 03:10:54 -0700 (PDT)
Received: from LEGION ([39.46.7.73])
        by smtp.gmail.com with ESMTPSA id k13sm46297544wri.27.2021.04.07.03.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 03:10:54 -0700 (PDT)
Date:   Wed, 7 Apr 2021 15:10:47 +0500
From:   Muhammad Usama Anjum <musamaanjum@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" 
        <linux-media@vger.kernel.org>,
        "open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" 
        <linux-amlogic@lists.infradead.org>,
        "moderated list:ARM/Amlogic Meson SoC support" 
        <linux-arm-kernel@lists.infradead.org>
Cc:     musamaanjum@gmail.com, linqiheng@huawei.com,
        kernel-janitors@vger.kernel.org, dan.carpenter@oracle.com
Subject: [PATCH] staging: axis-fifo: media/meson: remove redundant dev_err
 call
Message-ID: <20210407101047.GA1491258@LEGION>
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
 drivers/staging/axis-fifo/axis-fifo.c   | 1 -
 drivers/staging/media/meson/vdec/vdec.c | 8 ++------
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 2bb1c2e9cb57..ed9281089738 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -853,7 +853,6 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	fifo->base_addr = devm_ioremap_resource(fifo->dt_device, r_mem);
 	if (IS_ERR(fifo->base_addr)) {
 		rc = PTR_ERR(fifo->base_addr);
-		dev_err(fifo->dt_device, "can't remap IO resource (%d)\n", rc);
 		goto err_initial;
 	}
 
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

