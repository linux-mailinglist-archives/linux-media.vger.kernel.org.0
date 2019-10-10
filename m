Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E378AD2E43
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2019 18:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726065AbfJJQDK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Oct 2019 12:03:10 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:37967 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbfJJQDK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Oct 2019 12:03:10 -0400
Received: by mail-qk1-f196.google.com with SMTP id x4so2159544qkx.5
        for <linux-media@vger.kernel.org>; Thu, 10 Oct 2019 09:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Gq2K1MPahReKFxfny0U/21k67CRMM0zxuVsY+LkC+cc=;
        b=nFz1tXA+EeJxEVkmyRpOHfU39bZnzBSlFJ9cA8vgyPQd0DQn7th2VNm8+NKa7wBoI7
         86e4a9ypgzw7h2FQszf7cuwcs7MpJdNm2uipkC19Zj4vodsNawxGXWn69MqulF4kCJoT
         eSqkH+pqBN4TGDx9A0LR442NoAHCLMlnRAwaMv/2N+Tec125zBtehi1/dR0ce93SOx7j
         OZ9VNXoJZ/EmEl5Y5JOyu57z4Ggj6qMEDtZizpj26D8k309GN83QJvNGziTHNjT4wzKP
         Hpd1xYiZ1AT4HlASoAORJJXJ9tu31N1KFhuOa/yevNheyhHmxNBMNtrby59+n0ginFIy
         0ZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Gq2K1MPahReKFxfny0U/21k67CRMM0zxuVsY+LkC+cc=;
        b=nKXN2fG0WZ2FAPKrGkUvjxF98kfcRknANUgjWzjfUmEeoS9a1sHp6jKXmSAL3l9ZXK
         zD2VChH1bblENques65nlpJYrhuvVjI0QouYVmueKQuHFu3mMaNeVQh2D8GW8g8w9U0U
         u+qEVAXPUPdXRo0LrOuWzH37BHuHkhOMlh10IqWOxdPdbnCO+1z9UGBlijenZ7O+5FDw
         RVHrd4ZkQH0268c4aPWF9XU95mvFvAhaq2IJc1IgCwssyn/V455ldcMPgdNZybEf7A7K
         DEneq+tNUQXxyoOpC1qLr6ir4yHrP1aCD6V6eD17/YIhlKN4+zxBhUtU5iLlMbFppG0w
         SAeg==
X-Gm-Message-State: APjAAAWTRezmrv7aEYSOOpVpgtn8X3NWK/wSiK/l9gE4E7D7TU7o8gaW
        qUm+Ac7lpkkyIqToUNptmbMvzUra
X-Google-Smtp-Source: APXvYqzWRRn3WDVXCQRM3YFJpbvoo1UpU9Wvfzj0R3WUw4uhsp74OVGUizFKOJgj+l78sGaH4iW+Kw==
X-Received: by 2002:a37:8d05:: with SMTP id p5mr10246882qkd.271.1570723388964;
        Thu, 10 Oct 2019 09:03:08 -0700 (PDT)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id i66sm2736008qkb.105.2019.10.10.09.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 09:03:08 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     mchehab@kernel.org, lars@metafoo.de, slongerbeam@gmail.com,
        tharvey@gateworks.com, linux-media@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] media: adv7180: Move 'chip found' message a bit further
Date:   Thu, 10 Oct 2019 13:02:59 -0300
Message-Id: <20191010160259.21362-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently the "chip found" found message is shown even in the
case where the I2C address is wrongly passed in the device tree,
which is misleading.

To avoid such problem, move this message after real I2C transactions
have been made and we are certain that the adv7180 is really present.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/media/i2c/adv7180.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/adv7180.c b/drivers/media/i2c/adv7180.c
index e780969cc2f2..15fe65a2863d 100644
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
@@ -1370,6 +1367,9 @@ static int adv7180_probe(struct i2c_client *client,
 	if (ret)
 		goto err_media_entity_cleanup;
 
+	v4l_info(client, "chip found @ 0x%02x (%s)\n",
+		 client->addr, client->adapter->name);
+
 	if (state->irq) {
 		ret = request_threaded_irq(client->irq, NULL, adv7180_irq,
 					   IRQF_ONESHOT | IRQF_TRIGGER_FALLING,
-- 
2.17.1

