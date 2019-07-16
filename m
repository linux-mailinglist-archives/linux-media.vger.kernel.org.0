Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 484D06A8BB
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 14:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733285AbfGPM2G (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 08:28:06 -0400
Received: from mail-qt1-f202.google.com ([209.85.160.202]:40537 "EHLO
        mail-qt1-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732475AbfGPM2G (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 08:28:06 -0400
Received: by mail-qt1-f202.google.com with SMTP id e32so17820289qtc.7
        for <linux-media@vger.kernel.org>; Tue, 16 Jul 2019 05:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=m7n3rFhmx+idK8s3ajEqgLAszpk7xnK8xQBqwfMuZS0=;
        b=ps1Zl7cwg97g6D5+cHOE4PVFmGyOf1YqgdgaKjmJnlYLgi77wz2mipqcq8OYAI+kfR
         H+xhaHMqTBq9dp5geyGpMvV7cAduVReqWj3EpGA9HxAA4I5f0eF8bP0suHTBfGCT/VLc
         4obvJGKjUITT6XaCWwQaXMpFsJ7HJ473baYpiMPl4N8A2N1FVblYML7JEfmvI+U5vu4V
         HilHRSB3l0KmdeBe4z393a6ED5DGM1R/xF513T6pEh1hjdzTcoPqtHuJaA4c4wshEDL4
         0z6yPuFqj5HkDIx7GgfHVv+WS+0Pc5b9hsevELeowY+zy09Dumsk1we3/aAKuZj3/ckR
         JabA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=m7n3rFhmx+idK8s3ajEqgLAszpk7xnK8xQBqwfMuZS0=;
        b=KvpuA8M/jRyN0SZkwhGn8/tASbAbYimt//HqHpVSUk48qFRhqbKoif0NQHYzTKfBOZ
         y3wLrGOBY4pYrU/vNXHNnQx0vGkba2bUlEASnV8dDV0PUCm08pPAvF555J7QDCwuAkId
         8ZGCjQM0E9YteY2kB8f8IjMcEk8zXvnDwztU2Bb44v0u4AtmcwSwHy8GA1CnbeE7UDK3
         Lpw1cmSzl4HROUAwUQeM8cZXV4h1dYTPOtJI25PLkep7O9YKFzVnBES3hCs4Xce2Z/jk
         pXbXvnA2CzElQmjUbPydd9n/n1p8HiwOWBPxk8B7pnlFe88AZPJESJXh4P2+2t3i+e+0
         sTXQ==
X-Gm-Message-State: APjAAAUxzHpVRtv5BwBk7LfZwaPbsBfyd1F99mHcgjO5TbJlt2jhZhkw
        8z/hm6obajOp0f4X0HVAU0WngTRg6Eup4fCv1huRF69ZaSEtm83TMRkX2Xo6GLhNpEnjkMMqYTw
        fhgfsbxIpWcjC2+pGA8dsnCgmuAV7YagkGWI738cFEoq1K+flTpcHszWs3yZ5nyyUMKS5
X-Google-Smtp-Source: APXvYqxdneeryHulF9COuffFOjOxMkekk+zmvXpjrHfWvHmAfqW1r+6inDCkFwEU+kaxDX1wZi5A2SHN/W8=
X-Received: by 2002:ac8:244f:: with SMTP id d15mr21707292qtd.32.1563280085206;
 Tue, 16 Jul 2019 05:28:05 -0700 (PDT)
Date:   Tue, 16 Jul 2019 14:27:13 +0200
In-Reply-To: <20190716122718.125993-1-darekm@google.com>
Message-Id: <20190716122718.125993-5-darekm@google.com>
Mime-Version: 1.0
References: <20190716122718.125993-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
Subject: [PATCH v4 4/9] tda9950: use cec_notifier_cec_adap_(un)register
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
2.22.0.510.g264f2c817a-goog

