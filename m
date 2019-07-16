Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3826A364
	for <lists+linux-media@lfdr.de>; Tue, 16 Jul 2019 09:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730981AbfGPH6w (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jul 2019 03:58:52 -0400
Received: from mail-qt1-f201.google.com ([209.85.160.201]:33645 "EHLO
        mail-qt1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbfGPH6w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jul 2019 03:58:52 -0400
Received: by mail-qt1-f201.google.com with SMTP id y19so17314498qtm.0
        for <linux-media@vger.kernel.org>; Tue, 16 Jul 2019 00:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=m7n3rFhmx+idK8s3ajEqgLAszpk7xnK8xQBqwfMuZS0=;
        b=JUPkX7edG6+p/s9IQSNg9SGTpFLoIqZCOU0TiuVJtVwnTlZbQJZD5vR6nbcT1EdFOW
         ddGIPdndrC8nwb6+77ajD/9duW4odBRvlIBfmW8jVoHYtItReKR7epjKC7sMyQMQ/ETe
         EQSWpZESasuzpowjYFHBXqkXQDXxz6stbOXzOXWUI5Xqi8fOkR9dl+tFh2POvKieQ2vd
         NUhjpm79Gvd52Uh8plNxwdwKn1hzMzRmD5encfIeeNW5Yuw8cogjFp21a9uIVj6K1E3o
         qL2rE6F9RijKN2h3Gr7P+HIYPggEKHdZhYZVZM1IzQJ1BLJkERx8h+lOx69fa721QX0N
         b/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=m7n3rFhmx+idK8s3ajEqgLAszpk7xnK8xQBqwfMuZS0=;
        b=TQeQ/cB6edu/p7zfr7ly+unSe1Fek3iqEyMTkPPGWHdAmuAEKTj26rUICGeubVfwVa
         UoY2A+UdfSVbbB9Py7ZBl7G42ESGe+JxHUUohkMycZ+4fzxo0MxRvSIziwgqRRZgNGTl
         MXGLdTPvEj2vURVvN6z9UTQYjTXjpwFstAtxuVGSu0ao4YhfX3Yi8hzKxnuvaeez2SV0
         PDc7I2HF00/loWTeGRXps5PDlMGI8rPmKBROKX/IPZLf6s/ps2Qh97PFXIYIEKHQRUj1
         OR31qYI65KIxNMv8Mb8ZpzUl1BnjfsG84osJyDR80jLlAQ+soa16ciJ6SdJaZcRyyzVQ
         VOqQ==
X-Gm-Message-State: APjAAAUFFvFOsBsiOUy3Be35wCu/i7TjVF7FESwft3qvotGgoSIOwX25
        dD647mO7y844msoetwWD97q2r/1nXPdjaM39UHebOHI9TOT3XFW8iV78n4qaacQryGRkYFmf5xZ
        wsIKT2NN1fggXR3URik7mKOmMyxxoUi2GsJSfg6uoOQCyfu5lNry5KAqL8Dj4ZgVlqgAD
X-Google-Smtp-Source: APXvYqwnM++ODBWgq6EIIxe/BhJrIB6UhcG4c6OaOINg0Qfpf9IPpQbXL6qeAIOlwm6ZiqE9HmF2TMc5GbY=
X-Received: by 2002:aed:3f10:: with SMTP id p16mr21590946qtf.110.1563263931255;
 Tue, 16 Jul 2019 00:58:51 -0700 (PDT)
Date:   Tue, 16 Jul 2019 09:58:15 +0200
In-Reply-To: <20190716075820.260202-1-darekm@google.com>
Message-Id: <20190716075820.260202-5-darekm@google.com>
Mime-Version: 1.0
References: <20190716075820.260202-1-darekm@google.com>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
Subject: [PATCH v3 4/9] tda9950: use cec_notifier_cec_adap_(un)register
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        hverkuil@xs4all.nl
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

