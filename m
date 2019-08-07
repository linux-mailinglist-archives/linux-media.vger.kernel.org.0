Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70FBC8483F
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2019 10:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727501AbfHGIyt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 7 Aug 2019 04:54:49 -0400
Received: from mail-qt1-f201.google.com ([209.85.160.201]:39381 "EHLO
        mail-qt1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726244AbfHGIyt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 7 Aug 2019 04:54:49 -0400
Received: by mail-qt1-f201.google.com with SMTP id r15so3050948qtt.6
        for <linux-media@vger.kernel.org>; Wed, 07 Aug 2019 01:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=7yz5TvIjUhkFsaJEChG/sQWYugSPGGNdhiYIO8s9O9w=;
        b=htE6JyTY9SdYOmLfnf523OF9kj2NB6t7ODA70xsKxzOvmqmd26SkZ59p28A52cm5wB
         IXxIpFQwMKZr5yg+jSAoo3GjRNjKTXDsyjX9t1/srW4A8J0ueIxBqBYVtATaBdNWd8Oa
         +auQIWZWtsUw8PnOKw/0nJTX5DGOG5aJjZP6h0Hjg4tuE2jFXixE8yOxBaG0N1BIirO5
         ZjoFnxr15dOogmaZNxGbCiZDRHkzWSc82vy2jBzv7jG6TayYbWa26VAjrvowswbLo+zR
         ICJ68Omb6vNQbzp0iuAL+b3eL3HTfZUZjv9Yj7vh9Ojzna1krVZ3z39ozHSGvCvfwIHL
         q/Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=7yz5TvIjUhkFsaJEChG/sQWYugSPGGNdhiYIO8s9O9w=;
        b=uCl57fv5jObAnRHYTmJShomrUDFqh3sYttof78irNXxMBNEhi/LjqcpQBwIPacM5vJ
         wbhK5vx9mXYcAH3eLiFlJDYQLHjZYOsEJxEhP9758eRIp4LgKkJYjHBoeO160lAngirN
         DPMV0YcWI2lNgIiWyUKw0F04nx2/sunlhHzcGfJiUHTfxeyJfYEQdbY3ldwj48mj8eFw
         8nsEYd+EO06A126J4uOgZ3hLR+tdEMf79UwkFxEQ6JmAzZp5/RVrSxIoQbjya9UemXOK
         iPqu4HD1mfG1a+rg8n1SF1I9zLRaqu8jfnfnwD4C+2o1Lkhz6L7Zbpw8CIyl2e/mqV86
         ZnXA==
X-Gm-Message-State: APjAAAXUCS1lizf0qSIg/cHrybVOKKTqg6iP9xgjDqIkarb65Rj6jfWP
        KHayke8g6KkN4CXcgw8dqEyzDeVSdvHpZUygoSnxp8HB+aLNDNrWwiyNoxMeTUsT08mmX79QTGL
        cTu4C1stKCBoph2FjW37HF3ovDguxBaWqg+S/WotW36v6dohUbf9mJhTZa/oOd0ZGd7Yp
X-Google-Smtp-Source: APXvYqwsyN9JX7aBj7yupHptnoL42fWrUg/lVg1SBYHWSVo6VIvUXYf5K8I7eFOXS7CnQeDAYXUQ165evhI=
X-Received: by 2002:a37:aa88:: with SMTP id t130mr7379750qke.12.1565168088423;
 Wed, 07 Aug 2019 01:54:48 -0700 (PDT)
Date:   Wed,  7 Aug 2019 10:52:27 +0200
In-Reply-To: <20190807085232.151260-1-darekm@google.com>
Message-Id: <20190807085232.151260-5-darekm@google.com>
Mime-Version: 1.0
References: <20190807085232.151260-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
Subject: [PATCH v5 4/9] tda9950: use cec_notifier_cec_adap_(un)register
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl
Cc:     Dariusz Marcinkiewicz <darekm@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the new cec_notifier_cec_adap_(un)register() functions to
(un)register the notifier for the CEC adapter.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/gpu/drm/i2c/tda9950.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i2c/tda9950.c b/drivers/gpu/drm/i2c/tda9950.c
index 250b5e02a314a..e9f6171c47792 100644
--- a/drivers/gpu/drm/i2c/tda9950.c
+++ b/drivers/gpu/drm/i2c/tda9950.c
@@ -423,7 +423,8 @@ static int tda9950_probe(struct i2c_client *client,
 		priv->hdmi = glue->parent;
 
 	priv->adap = cec_allocate_adapter(&tda9950_cec_ops, priv, "tda9950",
-					  CEC_CAP_DEFAULTS,
+					  CEC_CAP_DEFAULTS |
+					  CEC_CAP_CONNECTOR_INFO,
 					  CEC_MAX_LOG_ADDRS);
 	if (IS_ERR(priv->adap))
 		return PTR_ERR(priv->adap);
@@ -460,13 +461,14 @@ static int tda9950_probe(struct i2c_client *client,
 	if (ret < 0)
 		return ret;
 
-	priv->notify = cec_notifier_get(priv->hdmi);
+	priv->notify = cec_notifier_cec_adap_register(priv->hdmi, NULL,
+						      priv->adap);
 	if (!priv->notify)
 		return -ENOMEM;
 
 	ret = cec_register_adapter(priv->adap, priv->hdmi);
 	if (ret < 0) {
-		cec_notifier_put(priv->notify);
+		cec_notifier_cec_adap_unregister(priv->notify);
 		return ret;
 	}
 
@@ -476,8 +478,6 @@ static int tda9950_probe(struct i2c_client *client,
 	 */
 	devm_remove_action(dev, tda9950_cec_del, priv);
 
-	cec_register_cec_notifier(priv->adap, priv->notify);
-
 	return 0;
 }
 
@@ -485,8 +485,8 @@ static int tda9950_remove(struct i2c_client *client)
 {
 	struct tda9950_priv *priv = i2c_get_clientdata(client);
 
+	cec_notifier_cec_adap_unregister(priv->notify);
 	cec_unregister_adapter(priv->adap);
-	cec_notifier_put(priv->notify);
 
 	return 0;
 }
-- 
2.22.0.770.g0f2c4a37fd-goog

