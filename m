Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C90043AE29C
	for <lists+linux-media@lfdr.de>; Mon, 21 Jun 2021 07:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230051AbhFUFKd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Jun 2021 01:10:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbhFUFKb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Jun 2021 01:10:31 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D62A9C061756;
        Sun, 20 Jun 2021 22:08:15 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id b1so1097575pls.3;
        Sun, 20 Jun 2021 22:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kMUpJT6SJolW0ymOF8PtGlnKamkYOUcs0svNbBgMhJY=;
        b=Nudnp+zb14BLhJ0FHsvMYBCcL4Wbt6dELJeu3PBbqKQVXuriixTJmJETbQG0lguS9C
         47EygArUq/9STsCyOZBucXahoKt4wL3Qb6atUgE3uwDNTBqulskplXOi4Tpgn1ACAomW
         6lH/bR4g8d/891nVEa9+0BJY8UoNTGpr5JMI1MpcElzJGGMVwe3vJWHKY4UqEoYkr+IB
         WdFXAZ+0GF12KUeAdO0Ov9yomRQqmetesnAvoR1TMCkDHdWJr2d0Vouo40ktpZBsBfQU
         WtaJY+uw7Quni3TubnodwriNg3mYm52KdRmh66iubwN1LpquGHL54sHlBYtGggXMUuwo
         n2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kMUpJT6SJolW0ymOF8PtGlnKamkYOUcs0svNbBgMhJY=;
        b=k6JHznv2+SeFVI45ozkMMgOtDNWOI0VVEHp+ohv7BXH+NSq6sKDMqm2VBL44jnZc/Q
         7cZN15xpMjN/KsxfQRyy+MgfWWS+Oc43WTTppFigZ1Xa5vH0Eo7mfQt3Ycl/WmLUYgcP
         SuwjUBCIdF60pMxUfIXkdoh19HlPN2P850ioXeEdQbND1NO+cE+h5R5m/XSrVm+kPDgk
         dKidzvAQ3PBfXdF0bgCbtS26Dzv2Hp2GOSGDVE2dXNvp8W7LAZfRPrmO7mlGaMu3014f
         zLdk9S47jh9h4LSHzIh2vaUjU3lfxrD6jqGypkmHFHtmqU2mFSxfcgKqW6CSM55CFl39
         Z3jQ==
X-Gm-Message-State: AOAM533ICHUKxFudw3srMe8YR4HOA7uRLsAsdx4GsVAcze3y2vnRjUjS
        3StW9zMQ5b6nJc+uLlJIOwY=
X-Google-Smtp-Source: ABdhPJwOhL0mLsHjkspQhaibd6HaytHoiZFH5K99xa6QKWQiQsLAaPuXd0zkdqryHwwHYb5KxQCAbg==
X-Received: by 2002:a17:90b:1bc4:: with SMTP id oa4mr25633384pjb.18.1624252095393;
        Sun, 20 Jun 2021 22:08:15 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.71])
        by smtp.gmail.com with ESMTPSA id b5sm11808783pgh.41.2021.06.20.22.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jun 2021 22:08:14 -0700 (PDT)
From:   Dongliang Mu <mudongliangabcd@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Takashi Iwai <tiwai@suse.de>, Sean Young <sean@mess.org>
Cc:     Dongliang Mu <mudongliangabcd@gmail.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] media: dvb-usb: Fix error handling in dvb_usb_i2c_init
Date:   Mon, 21 Jun 2021 13:07:28 +0800
Message-Id: <20210621050729.3898275-3-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621050729.3898275-1-mudongliangabcd@gmail.com>
References: <20210621050729.3898275-1-mudongliangabcd@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

In dvb_usb_i2c_init, if i2c_add_adapter fails, it only prints an error
message, and then continues to set DVB_USB_STATE_I2C. This affects the
logic of dvb_usb_i2c_exit, which leads to that, the deletion of i2c_adap
even if the i2c_add_adapter fails.

Fix this by returning at the failure of i2c_add_adapter and then move
dvb_usb_i2c_exit out of the error handling code of dvb_usb_i2c_init.

Fixes: 13a79f14ab28 ("media: dvb-usb: Fix memory leak at error in dvb_usb_device_init()")
Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
 drivers/media/usb/dvb-usb/dvb-usb-i2c.c  | 9 +++++++--
 drivers/media/usb/dvb-usb/dvb-usb-init.c | 3 ++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/dvb-usb-i2c.c b/drivers/media/usb/dvb-usb/dvb-usb-i2c.c
index 2e07106f4680..bc4b2abdde1a 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-i2c.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-i2c.c
@@ -17,7 +17,8 @@ int dvb_usb_i2c_init(struct dvb_usb_device *d)
 
 	if (d->props.i2c_algo == NULL) {
 		err("no i2c algorithm specified");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err;
 	}
 
 	strscpy(d->i2c_adap.name, d->desc->name, sizeof(d->i2c_adap.name));
@@ -27,11 +28,15 @@ int dvb_usb_i2c_init(struct dvb_usb_device *d)
 
 	i2c_set_adapdata(&d->i2c_adap, d);
 
-	if ((ret = i2c_add_adapter(&d->i2c_adap)) < 0)
+	ret = i2c_add_adapter(&d->i2c_adap);
+	if (ret < 0) {
 		err("could not add i2c adapter");
+		goto err;
+	}
 
 	d->state |= DVB_USB_STATE_I2C;
 
+err:
 	return ret;
 }
 
diff --git a/drivers/media/usb/dvb-usb/dvb-usb-init.c b/drivers/media/usb/dvb-usb/dvb-usb-init.c
index 21ad51be4820..ae3f76787279 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-init.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-init.c
@@ -147,6 +147,7 @@ static int dvb_usb_exit(struct dvb_usb_device *d)
 		d->props.priv_destroy(d);
 
 	kfree(d->priv);
+	d->priv = NULL;
 	return 0;
 }
 
@@ -193,8 +194,8 @@ static int dvb_usb_init(struct dvb_usb_device *d, short *adapter_nums)
 
 err_adapter_init:
 	dvb_usb_adapter_exit(d);
-err_i2c_init:
 	dvb_usb_i2c_exit(d);
+err_i2c_init:
 	if (d->priv && d->props.priv_destroy)
 		d->props.priv_destroy(d);
 err_priv_init:
-- 
2.25.1

