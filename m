Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E43F8B624
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 13:03:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728600AbfHMLDz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Aug 2019 07:03:55 -0400
Received: from mail-yw1-f73.google.com ([209.85.161.73]:46296 "EHLO
        mail-yw1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728598AbfHMLDz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Aug 2019 07:03:55 -0400
Received: by mail-yw1-f73.google.com with SMTP id j133so9699951ywb.13
        for <linux-media@vger.kernel.org>; Tue, 13 Aug 2019 04:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=rNr4ZPVQiRY9460rK+p/RjWfP2XiBB6EuRKjHiRo/qQ=;
        b=NB+nNxe2i9JPeP5p/K3KwWw72d/gd1uAP87BwA5SC2DlTXUqmewM1VyxSaR/9zpTfX
         7252HzgBSDCjnVqh52se43BMYdzuatZhL6hR56buIzY9Jz8wwkNXPWsdY/AoFp5c/BYo
         VfR7yjbue1o7BScHyYP/bEXF14+ByQOpyog/7bcoebzAU9mb66yCwNTn1me8pPEHrtOT
         f9suboV6sUrFWc3rm1bUAmvUNDJ4A4u60KC5LeWvHRCfYH8XrUpH4LeN4tvLbSu0qLw1
         bj3x4VBU070oy/BglfWGr4XnP43adYy7D+bKnt2eu9kc7X2ZCvwouORwwAN5eqIsGDl2
         LNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=rNr4ZPVQiRY9460rK+p/RjWfP2XiBB6EuRKjHiRo/qQ=;
        b=bR9st0iRqiQ7t3hGGdkGlXokner9IOj0oIPJiMFFdXg3nYisDwCPCGu3FWlkiRYRSu
         v53DmWwfYAkSq1rmMEdX+vAdfagdOp4rHmUxLyX+NKr9d3FN617MCmVkvvgo59ieqg/R
         cnmMVrkuj5D20IjuZnoOX91AlQiHFYBeUhtqH8qtMgbualoAElffgFPfexa3h9cKkqjT
         B6Qf5PiXt3MbpzPVDc6j/wUC7AYAlGl4jacQ+NeUNDi5y/3RMKma7Xa7DiYqsQsrXk/X
         nId5AsIDETaeBxXmnKGYoi1vhHCU1ZPQdAviLJ48lKK/wLspa0oEEwB9cuzdIZ87L4XY
         tkJw==
X-Gm-Message-State: APjAAAWabuUm6qVt/hGQPcmuSz7qXPsDAU8RkmC8IojIcJ9zjdqOPRFK
        +vHs/5P2WhAYJFfDtmqAKucx+MYYY2s=
X-Google-Smtp-Source: APXvYqzy3zyQSUtSJVRsXoVnBQExctrAHwWmKhG2weYA8xtqjiHkmA3bvc5GEwy/WQBRR+/id9TXLsPcW2M=
X-Received: by 2002:a81:9a93:: with SMTP id r141mr23669458ywg.469.1565694234480;
 Tue, 13 Aug 2019 04:03:54 -0700 (PDT)
Date:   Tue, 13 Aug 2019 13:02:35 +0200
In-Reply-To: <20190813110300.83025-1-darekm@google.com>
Message-Id: <20190813110300.83025-4-darekm@google.com>
Mime-Version: 1.0
References: <20190813110300.83025-1-darekm@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v6 3/8] tda9950: use cec_notifier_cec_adap_(un)register
From:   Dariusz Marcinkiewicz <darekm@google.com>
To:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     Dariusz Marcinkiewicz <darekm@google.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kees Cook <keescook@chromium.org>,
        Colin Ian King <colin.king@canonical.com>,
        open list <linux-kernel@vger.kernel.org>
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

