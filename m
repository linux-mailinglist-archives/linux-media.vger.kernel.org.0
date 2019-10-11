Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27723D3DAE
	for <lists+linux-media@lfdr.de>; Fri, 11 Oct 2019 12:49:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727399AbfJKKtu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 11 Oct 2019 06:49:50 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:45621 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbfJKKtu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 11 Oct 2019 06:49:50 -0400
Received: by mail-qk1-f193.google.com with SMTP id z67so8403762qkb.12
        for <linux-media@vger.kernel.org>; Fri, 11 Oct 2019 03:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=84YxYus+NGM2i15d0vlhV43b/ArDfHfCNp83n1Ps6UE=;
        b=l+2hAd0FD3hfFykRLtiBMyu2H71bVe8mxPgScWbhbwzTnZIfeQ45EvMM+k8t5f0dw+
         p12UQjL2cXCDgJRdIZdr/8O5ASU7Ln0BnvTfVM4K0QUGBvv0X8XCR5VgqkbfW0EEgkev
         OeOeW5IJmPIx9rTaxRkAvI/JEz686htKz9/832efnbcGdjhUU+cTxGdg3Q5SmA4B7N/s
         d3XualVeodcnUcad1ajQIYT4weQHZcTCfsn3HyjDBSiOu5GS4rC9UJIXIf2GE+KuF+rA
         PqoZJ25TOLBoBoryA3RalDBSxyYClVOc9nEucbwIrhN0VSUt/FmnIMn0qxsXShzSLhcs
         zMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=84YxYus+NGM2i15d0vlhV43b/ArDfHfCNp83n1Ps6UE=;
        b=mY5yfGv3Y2Tx6PvHsIjBU2wbuwqEsSdJnI4tt+55MAP/BaQHgHJXUadkXzIaVEEI5E
         dJ/09JLhXBlcQtlHKsoxgmN6bTHRN454a2h62BOao+a/oE9bWcRqWFfSWto6WHPXx2RJ
         /PtD8dM7jLOaCnP7h6wFgClpEIp1cYExKZGNdmk9A8JlvpJXUGSDN1cfrQP1z5tc2ySU
         YSDq7xedenMFzZcfpqZCr/47km0RJau20twcY+LrlSNB//DQA41KI+xfL+WdB3f43n07
         FpK+/4MHMMQSH4JossAhGucvFiGAtsR/aN92zfINJ/ezezLO0OZCpwcmgO5qxtr+XVpb
         CMbA==
X-Gm-Message-State: APjAAAWD3TytnbXMGdbZOevxyqe5WhXtnQhIhp5eJTuSPJBqe8uxpmrs
        fR27h1q9RFbQFerVY16mikU04SJ1qME=
X-Google-Smtp-Source: APXvYqxoCvw4mH8bmbn4SP3DAb8CWiC0sLtvlpO0YG4UKoQudBKwI0tLkorjRvoSemfItIgJxudx7Q==
X-Received: by 2002:a37:aa10:: with SMTP id t16mr1960355qke.484.1570790988795;
        Fri, 11 Oct 2019 03:49:48 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:99::1])
        by smtp.gmail.com with ESMTPSA id k23sm3781970qtq.68.2019.10.11.03.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 03:49:47 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     mchehab@kernel.org, lars@metafoo.de, slongerbeam@gmail.com,
        tharvey@gateworks.com, linux-media@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3] media: adv7180: Only print 'chip found' message on successful probe
Date:   Fri, 11 Oct 2019 07:49:19 -0300
Message-Id: <20191011104919.29354-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently the "chip found" message is shown even in the case where the
I2C address is wrongly passed in the device tree, or also in the case of
probe failure, which is misleading.

To avoid such problem, move this message after real I2C transactions
have been successfully made and we are certain that the adv7180 is
really present and probed.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v2:
- Only print the "chip found" message on successful probe

 drivers/media/i2c/adv7180.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index e780969cc2f2..6528e2343fc8 100644
--- a/drivers/media/i2c/adv7180.c
+++ b/drivers/media/i2c/adv7180.c
@@ -1309,9 +1309,6 @@ static int adv7180_probe(struct i2c_client *client,
 	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
 		return -EIO;
 
-	v4l_info(client, "chip found @ 0x%02x (%s)\n",
-		 client->addr, client->adapter->name);
-
 	state = devm_kzalloc(&client->dev, sizeof(*state), GFP_KERNEL);
 	if (state == NULL)
 		return -ENOMEM;
@@ -1382,6 +1379,9 @@ static int adv7180_probe(struct i2c_client *client,
 	if (ret)
 		goto err_free_irq;
 
+	v4l_info(client, "chip found @ 0x%02x (%s)\n",
+		 client->addr, client->adapter->name);
+
 	return 0;
 
 err_free_irq:
-- 
2.17.1

