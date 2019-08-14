Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E26B58D120
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 12:46:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727840AbfHNKp7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 06:45:59 -0400
Received: from mail-yb1-f202.google.com ([209.85.219.202]:50705 "EHLO
        mail-yb1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbfHNKp6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 06:45:58 -0400
Received: by mail-yb1-f202.google.com with SMTP id p80so8278333ybc.17
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2019 03:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=rNr4ZPVQiRY9460rK+p/RjWfP2XiBB6EuRKjHiRo/qQ=;
        b=JpSL21bCCCvwbK2FjwB7E/jnKcDm9D41KjRfUN/ZMV7CAuObTU2sAjHT/9QBhYs1vA
         I0O2sbz4SZhkiL3bvhimKAowi+0b9jhvA+I9Qoyx0qUQxXPKNMHSGGg6PAoC31fKpGDk
         FaHmng7SEUEvXHHxyzi2lpMXoBFZK/QNPB3aEwjAnDzaTOQ/oiT1Ex7XJAR8Z0EEt+uA
         eZP4Vgt9tLhRZySmfka/MsnvyU6VjakU63Vc0P/Jcq03iFvt8kJ1LEwzecXQN9yLJa8z
         wJzSIzXSAO3eKnLA1Tbl6K0ZnzkKBZpHSkmkivhlLZOryY7AcVuDJ21jFv9c4oyt82L+
         6nww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=rNr4ZPVQiRY9460rK+p/RjWfP2XiBB6EuRKjHiRo/qQ=;
        b=OFmyi2Linsa9F/8EZRbOtmLR7QAY4gvFMHu+LZGWpRPf3RJu3oRRkfUQjZjDSvgS/+
         1+ySLb/C42A1MG0EmGZ9nZPT4TA6InTC8k5ApRljtjncyv6vKo54flgjV1pt3aE8BzIY
         E4Xj/DE/ZQTASJeBWemm6Ze6S+mt2Rubc9dq3KZGKTlSJ4/dpyDH3oWa2VH7RW3FObID
         SS26lY893Gi/slTC9jvQeglXmuWxDMOLPxNLK8gkkggdR9F6Rx4Yr4mEwOAyIwbroCmR
         lumLYUVyLkjpd0nY9AGOOyVJsd3fMHA2bCrT3ydtEls5PCrr1WSler7NAQsVJtYxaY/t
         Sxcg==
X-Gm-Message-State: APjAAAW9eAxXQf1nrqYn4wLCGOaNIjHRMtCj33QTVANNyE6o3iihvM2F
        6+sNZXkVioZgu40jvKWly8N5dKAyYxc=
X-Google-Smtp-Source: APXvYqz8wuc7rzzPcMc9pN4pp2/JhTt0TqdoYblYW39TykuwcgtmhPOpuh0zTFZfEq05jYjRSZf+uFC6HSU=
X-Received: by 2002:a81:70c7:: with SMTP id l190mr20647337ywc.280.1565779557384;
 Wed, 14 Aug 2019 03:45:57 -0700 (PDT)
Date:   Wed, 14 Aug 2019 12:45:02 +0200
In-Reply-To: <20190814104520.6001-1-darekm@google.com>
Message-Id: <20190814104520.6001-5-darekm@google.com>
Mime-Version: 1.0
References: <20190814104520.6001-1-darekm@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v7 4/9] tda9950: use cec_notifier_cec_adap_(un)register
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Enrico Weigelt <info@metux.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Colin Ian King <colin.king@canonical.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use the new cec_notifier_cec_adap_(un)register() functions to
(un)register the notifier for the CEC adapter.

Signed-off-by: Dariusz Marcinkiewicz <darekm@google.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Tested-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/gpu/drm/i2c/tda9950.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i2c/tda9950.c b/drivers/gpu/drm/i2c/tda9950.c
index 8039fc0d83db4..a5a75bdeb7a5f 100644
--- a/drivers/gpu/drm/i2c/tda9950.c
+++ b/drivers/gpu/drm/i2c/tda9950.c
@@ -420,7 +420,8 @@ static int tda9950_probe(struct i2c_client *client,
 		priv->hdmi = glue->parent;
 
 	priv->adap = cec_allocate_adapter(&tda9950_cec_ops, priv, "tda9950",
-					  CEC_CAP_DEFAULTS,
+					  CEC_CAP_DEFAULTS |
+					  CEC_CAP_CONNECTOR_INFO,
 					  CEC_MAX_LOG_ADDRS);
 	if (IS_ERR(priv->adap))
 		return PTR_ERR(priv->adap);
@@ -457,13 +458,14 @@ static int tda9950_probe(struct i2c_client *client,
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
 
@@ -473,8 +475,6 @@ static int tda9950_probe(struct i2c_client *client,
 	 */
 	devm_remove_action(dev, tda9950_cec_del, priv);
 
-	cec_register_cec_notifier(priv->adap, priv->notify);
-
 	return 0;
 }
 
@@ -482,8 +482,8 @@ static int tda9950_remove(struct i2c_client *client)
 {
 	struct tda9950_priv *priv = i2c_get_clientdata(client);
 
+	cec_notifier_cec_adap_unregister(priv->notify);
 	cec_unregister_adapter(priv->adap);
-	cec_notifier_put(priv->notify);
 
 	return 0;
 }
-- 
2.23.0.rc1.153.gdeed80330f-goog

