Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F24E3203E
	for <lists+linux-media@lfdr.de>; Sat,  1 Jun 2019 19:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbfFARvu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 1 Jun 2019 13:51:50 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:44961 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726013AbfFARvu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 1 Jun 2019 13:51:50 -0400
Received: by mail-qk1-f196.google.com with SMTP id w187so8465612qkb.11
        for <linux-media@vger.kernel.org>; Sat, 01 Jun 2019 10:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=QhOTOR9ZhHXErxoDIUyKQboLl6Rpn3QrGCz20NVmVXQ=;
        b=FS1FAFGAgIzP3T2T4lOWSFhc5N1+pNVJk0iUx+GwM/56VgK7z64EP0eVw7gN4ObfpU
         7juVKX6/HTZpWlUepsNgsFUWSq0F6frlIvlrZY+ijV256BwgNBgMkUn81jLruh4qq1Fh
         rGZQV02RMLy9I1sk+coW6nW71JhqDPNVGnvaghWB2yGt/xK2O/ilT//nHKUxmgDRqw3y
         TneRq7Li5zHqSA5MCYeC68lmhYFDH47PbxwIh0aGY5iy2JNN3ZuGX/ygnNgoMndIdRf9
         K6m4eJH8xrmItVWp6lOz0gXm/78jdck74l2oGx1xteYNaQ/WRXf3eKtlgONB2sSUgLw8
         KNrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=QhOTOR9ZhHXErxoDIUyKQboLl6Rpn3QrGCz20NVmVXQ=;
        b=ap06LyaoQOM+uk/yOUWhhchMlM7f13aB9N3DAGNYYD3xW/C+NFEqw+fWVs9LLK5Lsk
         BQc+ojPOQ/bZfNX1T+lT1f92PotqiQiF9W6IeGKI+tAXoqMhO7Gj/p7vMFOJhzUqWQTb
         gkCQrnTtTm/bH9Ce4HPWSUGEkmULoatgiY8T2jR9Ng/ddHatusBXlcKHFfABWNKbWkS9
         S8nq46f5ZYT80mrJG6zWkPMPh4IwBn46rYAKDQC0Ek75b5Sh0BuIxLiGuC6TLRGmv+nv
         YW/4G4bwLeRAtxy5Zc/DRdTnRyyltjiK3yAU6xLfIo/WtPNX0UeXk9R6SGQHMiEOxIS0
         C2Dw==
X-Gm-Message-State: APjAAAV6jgxC87tzV/Wk96mLFTsy9XFfEblWcs+SE/mzkp/OUbCUedqI
        iZwNtkaTQcluU5D+IMzEjJU=
X-Google-Smtp-Source: APXvYqwkDFhfQbabLwClD+TdFEaI9M77Msti+l4Kts9BmBGhFN730G0k1TecbUUF1Xp7fjEjz19pkw==
X-Received: by 2002:a37:68d2:: with SMTP id d201mr14298019qkc.65.1559411509489;
        Sat, 01 Jun 2019 10:51:49 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:3c8:56cb:1049:60d2:137b])
        by smtp.gmail.com with ESMTPSA id v8sm1558977qkj.77.2019.06.01.10.51.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 01 Jun 2019 10:51:48 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     rmfrfs@gmail.com, p.zabel@pengutronix.de, slongerbeam@gmail.com,
        linux-media@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 3/3] media: imx7-media-csi: Remove unneeded error message
Date:   Sat,  1 Jun 2019 14:51:40 -0300
Message-Id: <20190601175140.16305-3-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190601175140.16305-1-festevam@gmail.com>
References: <20190601175140.16305-1-festevam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In case of ioremap failure, the core code will take care of printing
the error message, so there is no need for having a local error
message in the driver.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/staging/media/imx/imx7-media-csi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
index 7abea8681062..fead72952aba 100644
--- a/drivers/staging/media/imx/imx7-media-csi.c
+++ b/drivers/staging/media/imx/imx7-media-csi.c
@@ -1194,10 +1194,8 @@ static int imx7_csi_probe(struct platform_device *pdev)
 	}
 
 	csi->regbase = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(csi->regbase)) {
-		dev_err(dev, "Failed platform resources map\n");
+	if (IS_ERR(csi->regbase))
 		return PTR_ERR(csi->regbase);
-	}
 
 	spin_lock_init(&csi->irqlock);
 	mutex_init(&csi->lock);
-- 
2.17.1

