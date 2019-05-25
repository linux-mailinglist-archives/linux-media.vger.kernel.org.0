Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B6552A619
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2019 20:10:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727544AbfEYSKY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 May 2019 14:10:24 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:34319 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727301AbfEYSJe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 May 2019 14:09:34 -0400
Received: by mail-wm1-f66.google.com with SMTP id e19so4161830wme.1;
        Sat, 25 May 2019 11:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4eBfZLRrGHb2x3swn8adGFmizbO47Ayo/xoUHugBoMU=;
        b=RSW3jJc5cOmU3KlxOMGTccMfw4hPaDwWHdw/2mE9eYDA1A6lANmApHYFWkUW47vKE6
         oKJ36aCUMUee/jTDtqDiLd4DhzDwpHZ/8ZnMYyctHPji87oUoMZnuh4U1PQVDYEOZMvG
         CHGviX2X/ciGaDfKcrg5Oag3T1Dz9Cz+p8X+IP27Z2YdnSDN4XdtOD8//CcMRjmdegI5
         EwRpbWVhtkOpsO3egT9fL0omrS0fyRu0dLudm0g/hZFtDqYOpc0ul4a1+bjeARS5h12C
         KRzcFWaIV1An6AGB36EQAy/pDJ9cgyblYgZ2W5H8T733ICOvqtC3S1+5LveAWjNuiVIz
         QIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4eBfZLRrGHb2x3swn8adGFmizbO47Ayo/xoUHugBoMU=;
        b=SnCYU7yhKWGiyuqUR/N+lAE50fDUUjaFVWwsRc8wboVYO2TNu09Tb14B2zIPlSOPeW
         DIYBR/m53Kopwa0krrzaB2x8puYr7rcOEygH3eM03jXlMe8YHZFkKiuQJVoI68JW1pUX
         By6SI/U40apFyXRva3LJ1CVpMKxJ/+5RyPyqV/K/kpZJBqt2UTaPc2fgKx4kQbahPTtB
         S4hvWHiI+1L1o5N3HqashIme6DpeA1H6uYrWFDgD86Yhis9NbDHJSHqR1aLrjy/DnD7/
         ivyRyp/7tmPi/JW0pTh9U+rRrkpyJ1txVe0t8Nm/TdWGcs5Rfx1a5/2mdFlvzArZ8JEb
         th8g==
X-Gm-Message-State: APjAAAWlVBV/iDgtiXJC8pSlGMtRbNGzsU0qJlf5/WDnQ3uhQXKtFLWz
        P977CmQZFMhuiFAKMVrESaI=
X-Google-Smtp-Source: APXvYqw5zCkHYX4cgvuB+/D9NmrqJdt8S922mugzoPVf3IfcZqOxgJITSNrE8ekrzXAGgx3f+LMsDw==
X-Received: by 2002:a1c:9c03:: with SMTP id f3mr19152220wme.87.1558807771777;
        Sat, 25 May 2019 11:09:31 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0::4e2b:d7ca])
        by smtp.gmail.com with ESMTPSA id s127sm5656914wmf.48.2019.05.25.11.09.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 25 May 2019 11:09:30 -0700 (PDT)
From:   =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH 02/10] media: rc: sunxi: Add A31 compatible
Date:   Sat, 25 May 2019 20:09:15 +0200
Message-Id: <20190525180923.6105-3-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190525180923.6105-1-peron.clem@gmail.com>
References: <20190525180923.6105-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

A31 have a different memory mapping so add the compatible
we will need it later.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 drivers/media/rc/sunxi-cir.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index 307e44714ea0..29ac33b68596 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -319,6 +319,7 @@ static int sunxi_ir_remove(struct platform_device *pdev)
 static const struct of_device_id sunxi_ir_match[] = {
 	{ .compatible = "allwinner,sun4i-a10-ir", },
 	{ .compatible = "allwinner,sun5i-a13-ir", },
+	{ .compatible = "allwinner,sun6i-a31-ir", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, sunxi_ir_match);
-- 
2.20.1

