Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A2CB46D322
	for <lists+linux-media@lfdr.de>; Wed,  8 Dec 2021 13:18:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233216AbhLHMWC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Dec 2021 07:22:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbhLHMWB (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Dec 2021 07:22:01 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19062C0617A1
        for <linux-media@vger.kernel.org>; Wed,  8 Dec 2021 04:18:30 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id c4so3726561wrd.9
        for <linux-media@vger.kernel.org>; Wed, 08 Dec 2021 04:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JBz1CYJlqFlyc33DhEvmNhqSn4/EdXinmBtKY4GLl0c=;
        b=K/9zl4kN4iO5SvLBsTYiUtmuTeBVvsU+lYY8PYbT80X7Gt4qpDl8qQG3J3l7ISdTQR
         wmVn7j1KHm39akckfD+FhD3jmzybF6T5T9lfCo2yeKD9DuXMehTLm509OAUxTNhelT/k
         GQR1YdtYe4OGO11FN9fuZB1DdErXVa0poEoaZRfgOLPSwVjJ45myr+p5hroCt1pLfyZn
         A1wrKDVfoaM2joslX0K3IxTJd+m9jHvkMxHCBBYYiKJwTJtohumlZh5XdBL7vfRPIcmU
         o//idQ8x1ry9lFA0RFVVY8z8/6gp3shbhrpWJVbOgfBgYUicuZ/v/gt1ma5GJ5ctcZ0c
         /Mtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JBz1CYJlqFlyc33DhEvmNhqSn4/EdXinmBtKY4GLl0c=;
        b=J+szXHjn8CmKKWYmV9HnWZsZaMMnRXiyLimNZVw5+GhjYot/A33271Gl9llG2KKTez
         QLsOTbe1Wjzr1PfRYRk7Qa1AOu3dr8pc7xy5+NIstBCIZyTLBOfKu6MMaRGscJ+aBfJ7
         2oLGXNRaulHU4kyG/ioGBAIetpfMonWT5EU7KZLNVBvhzGPE7FQVt4FWXbp7ZHblu5nh
         ng+d2AS4zMrEev8xC2ailJLyJPPyzYuaZHO1vWsJ0M9lr9WZLXlzEJmX+cVxv6+UjTx4
         eAJXu8CEy5H3lPLXYhyiaBzZsy7TfcN+rtdfCE0g1/BvLPQQmk7jddSqNWExZcCwa5+8
         yy/A==
X-Gm-Message-State: AOAM533nORm3RNcmB4kDGtW0EJKP2YRAFp0szJhwyjB24xQDYw9aQVRK
        Mv56Mu6gwvfpotnXTlxBEPdmeQ==
X-Google-Smtp-Source: ABdhPJwfdPYN0qlT+8NZ6nK0vQTyEXNlds6dLsTrDo9vH6Lsp/8b+QMqAL8SfZMXZnhqPpaQH0q+0Q==
X-Received: by 2002:adf:e8d1:: with SMTP id k17mr57226421wrn.465.1638965908707;
        Wed, 08 Dec 2021 04:18:28 -0800 (PST)
Received: from bismarck.berto.se (p54ac5892.dip0.t-ipconnect.de. [84.172.88.146])
        by smtp.googlemail.com with ESMTPSA id l11sm2532997wrp.61.2021.12.08.04.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 04:18:28 -0800 (PST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] media: i2c: max9286: Use dev_err_probe() helper
Date:   Wed,  8 Dec 2021 13:17:56 +0100
Message-Id: <20211208121756.3051565-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the dev_err_probe() helper, instead of open-coding the same
operation. While at it retrieve the error once and use it from
'ret' instead of retrieving it twice.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/media/i2c/max9286.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/max9286.c b/drivers/media/i2c/max9286.c
index 7c663fd587bbeefa..16aa7e5b0e81c210 100644
--- a/drivers/media/i2c/max9286.c
+++ b/drivers/media/i2c/max9286.c
@@ -1295,11 +1295,9 @@ static int max9286_probe(struct i2c_client *client)
 
 	priv->regulator = devm_regulator_get(&client->dev, "poc");
 	if (IS_ERR(priv->regulator)) {
-		if (PTR_ERR(priv->regulator) != -EPROBE_DEFER)
-			dev_err(&client->dev,
-				"Unable to get PoC regulator (%ld)\n",
-				PTR_ERR(priv->regulator));
 		ret = PTR_ERR(priv->regulator);
+		dev_err_probe(&client->dev, ret,
+			      "Unable to get PoC regulator\n");
 		goto err_powerdown;
 	}
 
-- 
2.34.1

