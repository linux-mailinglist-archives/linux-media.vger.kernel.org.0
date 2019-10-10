Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA7EAD2E56
	for <lists+linux-media@lfdr.de>; Thu, 10 Oct 2019 18:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726091AbfJJQHT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Oct 2019 12:07:19 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:41042 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbfJJQHT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Oct 2019 12:07:19 -0400
Received: by mail-qt1-f195.google.com with SMTP id v52so9449334qtb.8
        for <linux-media@vger.kernel.org>; Thu, 10 Oct 2019 09:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=jYm8XhNB7JMR/Pm6CJQvzwbJZVmCWwrXqEJrweKEEQM=;
        b=f0vRKDaBLZEa50Al5F+yyka9zdOfYkG3Bn5WYvE2Wk77I0vw2k4L+l7d4DsZLjjavP
         MuMjCAuygxFchevG4DQfRehv5h6Fw7GWzhSucrTkMuSfDWf0KVOxPm9pbGvS+rI139Wy
         ZNzXgBqn0UlDPPfb5jNSWtXvknQAKlSO7+g610zCBkDAn36IqTM8vAd2IW3U2U6r6ew4
         I7yfNLIBJtqsfHe5yo+wMHhP2K9vf9RfC+n05Pm6Mdr9H69cc19sOMyXrQP6rgW3FcW1
         Yf4P26bWGOx9FdIAc4QhyDDoN3qrl5lQULq1wPzwJj89CzqrxMrEaGvLgwwqKgyGvqJs
         SpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=jYm8XhNB7JMR/Pm6CJQvzwbJZVmCWwrXqEJrweKEEQM=;
        b=VszIs2EToZ0SmgQW0NhKfuwfFShzRuQSlP6kg5UGJDU2bilIA1rhl89KEjkM4XMmnm
         vleB4xTG7cdDBnQiBvn+VPhrp3DXIpP6x5Kb3aNUQ1udiYmi8dV4iEKV7XTXD8rNpQR5
         uw9mXSzi7nKb6CY0kSAGaQXfeTtA2i0BhNNle3QjTuyBPsg29ZlHiI5dabGlEGtBxjYQ
         pMUOgfcADYS2xNpTQ31pj7TLRMbm9vP2k6riTYXh6Il5pm2QdkpfWk2gN+z+ISZfV4hN
         lfHy+MKuGBN9akUE7Su5VLoYBtq4sUZFF9eCtfxzDxnBBMXxIsB2ecrxQ69n2NzPLxZ/
         IC/Q==
X-Gm-Message-State: APjAAAWCgimlHBiFW3C2VluTmQ21RuTTTh7rGGTvD7/L/wwMUK+OON29
        sIJ0lAULpCBFjw0rwAyw90c=
X-Google-Smtp-Source: APXvYqw/ZPKguCXuWJR3IfdPY0LU9T9yMPtdsMAjzJYtcSFgbMQnohrH2L9SvaKePJHRWpx4hSlkfg==
X-Received: by 2002:ac8:306e:: with SMTP id g43mr11631912qte.392.1570723638724;
        Thu, 10 Oct 2019 09:07:18 -0700 (PDT)
Received: from fabio-Latitude-E5450.nxp.com ([177.221.114.206])
        by smtp.gmail.com with ESMTPSA id j2sm2564079qki.15.2019.10.10.09.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 09:07:17 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     hverkuil-cisco@xs4all.nl
Cc:     mchehab@kernel.org, lars@metafoo.de, slongerbeam@gmail.com,
        tharvey@gateworks.com, linux-media@vger.kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] media: adv7180: Move 'chip found' message a bit further
Date:   Thu, 10 Oct 2019 13:07:03 -0300
Message-Id: <20191010160703.21493-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently the "chip found" message is shown even in the case where the
I2C address is wrongly passed in the device tree, which is misleading.

To avoid such problem, move this message after real I2C transactions
have been successfully made and we are certain that the adv7180 is
really present.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Remove an extra "found" word from commit log.
- Add "have been successfully "

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

