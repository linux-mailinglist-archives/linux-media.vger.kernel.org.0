Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBC28BF648
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2019 17:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727154AbfIZPzq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Sep 2019 11:55:46 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35682 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbfIZPzq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Sep 2019 11:55:46 -0400
Received: by mail-wm1-f65.google.com with SMTP id y21so3175711wmi.0;
        Thu, 26 Sep 2019 08:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=+pFOILDteLs1G9dcmBbAs9+Xx43dXKfMhbXX78aolpU=;
        b=ocEzXFyrDMDNNTqDxb6k2SzrmJrAsPAnZirHH3Kvzd5rbCXfsxdIOtsIGnd+UTNRNM
         yahWX2QAcH4oGusJldWBOlivyIYR0Nug8t8JiTTsmd9XY9ICKH9D8nbfTOpA665/ex5U
         hKOlqQk2mxrR9K4rCC0pztbWeO5xjwYrYhqK6voqQ11h9RnIUDN7C+9UWe4f4bbiiSa+
         /yeFFm2RhU3cdlaBUYWoVQlJ603zASrg32UWVaDKXU0mERpCqcEtyzUz2RkvvghMwDYW
         DwQhLl+grXBeqP0l8jFnctZuYTt2X4uE8DFsqQgdeIj4kJtNxnXTFtbW51MLCKpsJGNG
         lHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=+pFOILDteLs1G9dcmBbAs9+Xx43dXKfMhbXX78aolpU=;
        b=a6AHyxhJ+C6AAJkwYRlq/6ggpPpWWhWOXVZw3vz0C1b9eQyrb/yublR00eEqVRIrEV
         q5/JWcdpcKNTaTdvJiQfSLWSE5Ryd/8qBvzE16lTP86RMryYioeZiEzto0GVg0fGYvHK
         9AdxGA2HpcNA6p8l+JBc5fj0upIUj8AY5UIwbkvB8ZlYX5scrIDcFgywcOqn/WTlcE22
         yJ0DQFuSZNirIVP42VJOxUQao1WpgLyNUsOWn3b2uqZ9Lpr19aBaGGy00kzhIwRFu4jY
         pHpBzO+6OICTveXK1W1GtzQN3i3XH9ZI84zMYPn2TSc5pdGT9/LUz4Q+QdqSWSggcj+C
         Uuuw==
X-Gm-Message-State: APjAAAVxo/85ZA5DJfXG3W0bDjqqk80KINUsYyevJuTEnlOOL3iubgnk
        MZbdeJTb26J2o2ihqRkN1DI=
X-Google-Smtp-Source: APXvYqxJR/GW0YsDT3R3ajEjRVC+xU5wALlX3bWVdIz9CTZ5KKgsTQGUDT72X5cUhJGh7HwgBkbQIw==
X-Received: by 2002:a1c:c1cc:: with SMTP id r195mr3854113wmf.50.1569513342192;
        Thu, 26 Sep 2019 08:55:42 -0700 (PDT)
Received: from sausagefarm (31-34-101-110.abo.bbox.fr. [31.34.101.110])
        by smtp.gmail.com with ESMTPSA id p7sm3902157wma.34.2019.09.26.08.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2019 08:55:41 -0700 (PDT)
Date:   Thu, 26 Sep 2019 17:55:39 +0200
From:   Jeeeun Evans <jeeeunevans@gmail.com>
To:     rmfrfs@gmail.com, slongerbeam@gmail.com, p.zabel@pengutronix.de,
        mchehab@kernel.org, gregkh@linuxfoundation.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media: imx: Use devm_platform_ioremap_resource().
Message-ID: <20190926155539.GA20744@sausagefarm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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

