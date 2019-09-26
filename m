Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66FB8BF5BD
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2019 17:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727145AbfIZPTo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Sep 2019 11:19:44 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33038 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbfIZPTo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Sep 2019 11:19:44 -0400
Received: by mail-wm1-f66.google.com with SMTP id r17so6874007wme.0
        for <linux-media@vger.kernel.org>; Thu, 26 Sep 2019 08:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:message-id:mime-version:content-disposition
         :user-agent;
        bh=lCXAwCC0+Jd5Yo76APgU+nxrjhUlmGrglJVTlf8nMxE=;
        b=XorwWKCX+ksw+jaR7Cfe6jDt+Qn4xDxQPKD7NKga4hrtDVBlar5i5ol4I6YagKvJRe
         bS4xDpSc4gP+nFklah84/GF0o0hxDjY4LGtMe7dTQ3YQWhtg0UKKpgVcW3nxvqv3sJmg
         z5YfXbMVtb9vMNAHyaiAFeqV4AIt856QHbFCC3rJQqcyGzxltBb1M+nvIIHD6vYlqE70
         ianQnQqflOzjf2G9J26YDsBLvn2/YxZeix0OAhZ6pmJWd9alABagj3avaCA2971HC2an
         7obNNfwcL+Ve3p3BDvz1T8Q44356X4zSPatBicHvFPdM/RXDi6RnMOhPPg8lEWPe+4v6
         hQcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:message-id:mime-version
         :content-disposition:user-agent;
        bh=lCXAwCC0+Jd5Yo76APgU+nxrjhUlmGrglJVTlf8nMxE=;
        b=MZKw6/SnzdJy4gi04IdSWCO2ndMtkLeG+TRpICqpyGZ3d9KrGcxTbd1rUKKcn+nKqH
         9Lc9XJ4msBlv5X+HCTZsO9De9wcTr5zyRdsS/emcSC5Y/qhBLhrzricmnhTsCDwEge1N
         RjjYRg87RVg2GeaOv67qUaRPhuoCCKoMdNPE+n6X4j/Qbw2qBbGiLtb/138hvxq74/DE
         sqttJvNN15RbsrCss4mpoY3vS/FVhBltti4h4Je64Xtz8jPJTQ9cq/be/0CN0fc+5xxi
         X23vFagCGc6RK/xW4pvZ73MPYxW7VMj/QVs+C+nIyAcE+jMt5fltbSLzD7bHaSVf9BJS
         vOQg==
X-Gm-Message-State: APjAAAWPivi52jblQcMo3DwKI24CCQo5Hhu45nVbGj2iHY97rAiKmUw9
        VYx7he6BKAo74g9fzi3i/c0=
X-Google-Smtp-Source: APXvYqza4b6vqN8e+IhkomoX940+gJ45UTuvRU78z9/iaNiHFvC88ThuuX9R0j61xW18b9TORsXaMA==
X-Received: by 2002:a1c:f602:: with SMTP id w2mr3349895wmc.145.1569511182305;
        Thu, 26 Sep 2019 08:19:42 -0700 (PDT)
Received: from sausagefarm ([65.39.69.237])
        by smtp.gmail.com with ESMTPSA id g4sm4174095wrw.9.2019.09.26.08.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2019 08:19:41 -0700 (PDT)
Date:   Thu, 26 Sep 2019 17:19:39 +0200
From:   Jeeeun Evans <jeeeunevans@gmail.com>
To:     rmfrfs@gmail.com, slongerbeam@gmail.com, p.zabel@pengutronix.de,
        mchehab@kernel.org, gregkh@linuxfoundation.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org
Message-ID: <20190926151939.GA20175@sausagefarm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org 
Bcc: jeeeun.evans@codethink.co.uk
Subject: [PATCH] staging: media: imx: Use devm_platform_ioremap_resource().
Reply-To: 

This patch fixes a warning by coccicheck:
drivers/staging/media/imx/imx7-mipi-csis.c:973:1-12: WARNING: Use devm_platform_ioremap_resource for state -> regs

Use devm_platform_ioremap_resource helper which wraps platform_get_resource()
and devm_ioremap_resource() together.

Signed-off-by: Jeeeun Evans <jeeeunevans@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 73d8354e618c..bf21db38441f 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -947,7 +947,6 @@ static void mipi_csis_debugfs_exit(struct csi_state *state)
 static int mipi_csis_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *mem_res;
 	struct csi_state *state;
 	int ret;
 
@@ -969,8 +968,7 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	mipi_csis_phy_init(state);
 	mipi_csis_phy_reset(state);
 
-	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	state->regs = devm_ioremap_resource(dev, mem_res);
+	state->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(state->regs))
 		return PTR_ERR(state->regs);
 
-- 
2.20.1

