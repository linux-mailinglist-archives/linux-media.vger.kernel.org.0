Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A17613AA8
	for <lists+linux-media@lfdr.de>; Sat,  4 May 2019 16:40:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726996AbfEDOkf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 4 May 2019 10:40:35 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:36954 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726217AbfEDOkf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 4 May 2019 10:40:35 -0400
Received: by mail-qk1-f194.google.com with SMTP id c1so717826qkk.4;
        Sat, 04 May 2019 07:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pCuThotQDyC8AKpqAGJcTioH0PThWO88athp0JOGagU=;
        b=hOLgLf4ak0S/BlcjZYPHDuRxVuYx3mL8PTS9F/n1G2vlwPjwNjwtmV5pT4ZdUJ1B40
         CyTE0tQwowerLvpkDxzWOX0wIkstsUHahiQZt2PKmbqKOSHbjDVQBk3Zkgvsjj4ywoc2
         xK121hHvzC2yG1tYH5MImxwStTXIbnE2Ib5cCFfK5aeBRd5o0X2hqKBg298qmt1kiocw
         A8HBQEDyCr6/90duLRhMVqz8HxSnPoEVj6rZgzLJjIjZiXD8NCrQZo15l94+T3SYL9wF
         aoA+Bht9Y4Ffi57T2cNg85VqlFWU+EoMkGPTANHsbVP+61Cec683ci0+XV9lGK4Y/1dV
         otMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pCuThotQDyC8AKpqAGJcTioH0PThWO88athp0JOGagU=;
        b=K7IHQ7qMCNea7l4EoY5jKUd5w9I/xxueskdM+kye6AlZYzFaumEcLE66aNhPf2IreN
         fewprr+aC/WOaEV0rFA1Xst107Dzls7LBzKqP/7b0bs+6iIPP8ORUvKI7TTphDPKc8YI
         LEQpzmCaYQyBvRP8QBSWdEXMj4pXjlj5dO0gHe+efEEl40HdX8dTg8miU7NdS2IMqYpM
         Scs8Eioeb3c654IkfKdUPH9aYKxK7kqa6QqWHi7aP+gcCguaTrJEF66/xYcBT392YeLs
         81zmzY3SQ0+JHnemH45Ar23LTosbOfEj+I56YlNprQVM5lT6D3vt/oTzl3SG/sGQJfGF
         5hYw==
X-Gm-Message-State: APjAAAVBwPzK46AaVgyQsD7WNmp+b7bdIaPkmlPrsRhk3FfXzNs7mYpB
        byt/f9tcpHCScLTOyBl41Ug=
X-Google-Smtp-Source: APXvYqxAmDILa2GTtMpK6FT3DvxdWJog3gLnZWQHZ9CotS6MH0HHqW2VcthhQr9M1Oi+k6gFjzntDQ==
X-Received: by 2002:a37:5945:: with SMTP id n66mr769201qkb.295.1556980834641;
        Sat, 04 May 2019 07:40:34 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:3c8:56cb:1049:60d2:137b])
        by smtp.gmail.com with ESMTPSA id 67sm2536815qtc.29.2019.05.04.07.40.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 04 May 2019 07:40:33 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     rui.silva@linaro.org, slongerbeam@gmail.com,
        p.zabel@pengutronix.de, linux-media@vger.kernel.org,
        sebastien.szymanski@armadeus.com, otavio@ossystems.com.br,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 4/8] media: imx7-media-csi: Propagate the correct error for platform_get_irq()
Date:   Sat,  4 May 2019 11:40:22 -0300
Message-Id: <20190504144027.31920-3-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190504144027.31920-1-festevam@gmail.com>
References: <20190504144027.31920-1-festevam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In the case of platform_get_irq() failure, let's propagate the real error
code instead of a fake one.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index e0286c322fad..a4cc9a342674 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1206,7 +1206,7 @@ static int imx7_csi_probe(struct platform_device *pdev)
 	csi->irq = platform_get_irq(pdev, 0);
 	if (csi->irq < 0) {
 		dev_err(dev, "Missing platform resources data\n");
-		return -ENODEV;
+		return csi->irq;
 	}
 
 	csi->regbase = devm_platform_ioremap_resource(pdev, 0);
-- 
2.17.1

