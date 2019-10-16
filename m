Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70C20D8EB6
	for <lists+linux-media@lfdr.de>; Wed, 16 Oct 2019 12:56:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390318AbfJPK4U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Oct 2019 06:56:20 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42130 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730251AbfJPK4U (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Oct 2019 06:56:20 -0400
Received: by mail-pf1-f194.google.com with SMTP id q12so14482389pff.9;
        Wed, 16 Oct 2019 03:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gvBJmdm/y0qneuBUivymKny+YKAZ1hnIBVUrDzRfAMY=;
        b=eB0K7G6aSD0aLTiq84kb+arRKYxrikpQEExHPmvnHAVCgkrTQhC8t3ejGB9jZSfUy5
         Rq+ByXYHgvaX3HGYV+sXCgUuuBfXL7u0S2Wfv50wyd1AeE/zLGBQoLks6l9oq2ubPSU9
         tf8yvtHBWuNDtuYNoKvhXZkY354bsu+oliCnbkThAR7p1npgU7HxmMIIq4lgDNYNSOjO
         OK4XaH074YjHhO6y80ESh7+LmKzYr1BezfeVah6S8Pc7hYlTD9BoX719RjmK9L8Bh+tm
         S1YKnGlI+O0IzO7ppyncZ2AzUjbUPSe2bk4uuCb2eVnpA5N01yYDDFuHkteGAi5jop57
         VbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gvBJmdm/y0qneuBUivymKny+YKAZ1hnIBVUrDzRfAMY=;
        b=Wx4sDFJRG8zpsH0DJDzbCdRBJt37zT8yD/yc05vT6gzjGirTg+oz8GaozCaMJsKsHK
         UQcPyJorhq5eFXpaE6z6RS5aMqw4xwZBTaCObh+uKRTnZrO56BMjx81PmYtPKmjnltgy
         Nu1d4XLL6dER4zzgIgtzGNuRUmI8Dr3fpx/ga+JsBMFkpwQ+4UUJLHQz5HxcG52qqUaW
         J7C6lswPfL5520BeJybEFMSTDxsnS+lOxUnyNhlhowODZlcKbI3LdJb/c/uXTZUSntqm
         ZVvF8F4Wg82AUtM5Y/QRn0JuCT5AkJ6B1oC6KUOcXd8t7YuAUcBYPvJDt4dy5NBSuAQe
         v11Q==
X-Gm-Message-State: APjAAAXowJ+tTWEjh3vI2GW8DctR8OYqsKNFiWYnQci/jbNYWn6L7afn
        doQz5r7n3SPudxx/hG+JNb4=
X-Google-Smtp-Source: APXvYqzzapAlCLligsGVrbR/hk0VUwWMKMZiilQtFQXYsYcTFiLZ8eXPGVUihvj4/sYjRN2T6As1dg==
X-Received: by 2002:a63:3304:: with SMTP id z4mr44315923pgz.225.1571223379149;
        Wed, 16 Oct 2019 03:56:19 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
        by smtp.gmail.com with ESMTPSA id t68sm23055026pgt.61.2019.10.16.03.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2019 03:56:18 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Mickael Guene <mickael.guene@st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] media: st-mipid02: add a check for devm_gpiod_get_optional
Date:   Wed, 16 Oct 2019 18:56:04 +0800
Message-Id: <20191016105604.8036-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

mipid02_probe misses a check for devm_gpiod_get_optional and may miss
the failure.
Add a check to fix the problem.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/media/i2c/st-mipid02.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/i2c/st-mipid02.c b/drivers/media/i2c/st-mipid02.c
index 81285b8d5cfb..d38e888b0a43 100644
--- a/drivers/media/i2c/st-mipid02.c
+++ b/drivers/media/i2c/st-mipid02.c
@@ -971,6 +971,9 @@ static int mipid02_probe(struct i2c_client *client)
 	bridge->reset_gpio = devm_gpiod_get_optional(dev, "reset",
 						     GPIOD_OUT_HIGH);
 
+	if (IS_ERR(bridge->reset_gpio))
+		return PTR_ERR(bridge->reset_gpio);
+
 	ret = mipid02_get_regulators(bridge);
 	if (ret) {
 		dev_err(dev, "failed to get regulators %d", ret);
-- 
2.20.1

