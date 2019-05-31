Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C97B031410
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 19:45:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbfEaRpT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 13:45:19 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:43877 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726674AbfEaRpT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 13:45:19 -0400
Received: by mail-qt1-f195.google.com with SMTP id z24so1847202qtj.10
        for <linux-media@vger.kernel.org>; Fri, 31 May 2019 10:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=KxRT6szwafUKmLjNrTvi5HJlhOBD/5MSNwHOifE/5ok=;
        b=C9BUFRKTAh1Ik+QXKq145KnsG253zvakYY0f7Katr837GX1zJtzB2aZZUzpCg0USLP
         o/5AVOMsG65SzljVlYG8POK3zr+H61wLLDXWYZ8Sc0Q4l5oBl7klj6jseJHzQ1Vf92vD
         4bQn4t4Au4S9rLAJzICJTTo0V32AP4las0ruNXOlCwMneigi1z7n+Lx8Yxl937WjyTA3
         fHytHXQJef+xeHhI0iYuQkB6wtNSddkCss0N6YI5gIc2lFN6+u85JIF6jqL1jcpRdXKu
         J9zdb3/lBSaRNX0NeeQRV37pA5vBR6+c6JpbHqHJH927pHlyBdD/lGiZ/ypbuJrYI5gg
         GrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=KxRT6szwafUKmLjNrTvi5HJlhOBD/5MSNwHOifE/5ok=;
        b=pxlAShYd+Cy2diTMZXr0AHF3bsdFyzyme77h+z4A4jJupq4EyQ6Ggq4jRKXAaYVtqu
         HOWiJLxYN/vM0vOx9dZBQh8skC7vkDtzHKrRV72kkS7t0RYWSEgqRUrsFAb/zvSrft1W
         EGU3f2sYxjqaQHXmlKZKEPjwP31GAv8dPnXjVQaxeqCeUko59Uq5mEAG1clIXVsmiiZM
         zrnsSF6W4zoYAf8rnCYJtJiexTomrar3aT87K5Z59KZNn3vAc6lY/n93wbjA+qogEtY6
         zdHa7Mlzu7ICIA0Ecm1cO0NEffi+qT2OdwFAoDDpXDBDVq3+QVU9m6HnMdf6V/Cvd7dk
         F7Gw==
X-Gm-Message-State: APjAAAX+x0ra1k5rkMCfUCh3ocdYBOSRxDEkQihIdvTZktX3hHMcNifQ
        WCFV/MqPTirmfpQ4cVA+WJI=
X-Google-Smtp-Source: APXvYqwltfgPETgj0JMosaudLiMKX8GoxK7qNpNbXWJvQidRpInxxhyD26nYHt0cP2o+i3jOXlpGjA==
X-Received: by 2002:ac8:5315:: with SMTP id t21mr593017qtn.229.1559324718548;
        Fri, 31 May 2019 10:45:18 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:3c8:56cb:1049:60d2:137b])
        by smtp.gmail.com with ESMTPSA id f129sm3184879qkj.47.2019.05.31.10.45.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 May 2019 10:45:17 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     rmfrfs@gmail.com, p.zabel@pengutronix.de, slongerbeam@gmail.com,
        linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/3] media: imx7-mipi-csis: Remove unneeded 'ret' initialization
Date:   Fri, 31 May 2019 14:45:05 -0300
Message-Id: <20190531174506.13251-2-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190531174506.13251-1-festevam@gmail.com>
References: <20190531174506.13251-1-festevam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There is no need for initializing the 'ret' variable  as it will
be assigned at:

	ret = mipi_csis_parse_dt(pdev, state);

Remove the unneeded initialization.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/staging/media/imx/imx7-mipi-csis.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging/media/imx/imx7-mipi-csis.c
index 1b538ae77364..acc9936dd075 100644
--- a/drivers/staging/media/imx/imx7-mipi-csis.c
+++ b/drivers/staging/media/imx/imx7-mipi-csis.c
@@ -950,7 +950,7 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct resource *mem_res;
 	struct csi_state *state;
-	int ret = -ENOMEM;
+	int ret;
 
 	state = devm_kzalloc(dev, sizeof(*state), GFP_KERNEL);
 	if (!state)
-- 
2.17.1

