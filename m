Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70B05371EC4
	for <lists+linux-media@lfdr.de>; Mon,  3 May 2021 19:38:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231514AbhECRiz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 May 2021 13:38:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231305AbhECRiy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 May 2021 13:38:54 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59D1FC06174A;
        Mon,  3 May 2021 10:38:01 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id r13so3002413qvm.7;
        Mon, 03 May 2021 10:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R4cCmxP4zfgLWhvlmyup8PsoqYwC5VTK38QQTUItQBs=;
        b=s6rILeL6xAf7zh5MuRVYY6PGiDaoda11kvDgVQxP/ZUoxOXwSu9yaqagI0d3xWmpd1
         Iij0p2/XOD0Zh3ezWkAf3WIiCFst02JWdsvgbm6TKreaPbz5+hA1C2qFjV0uK6mJB8jT
         wFy4TGa4jCsLOcf3ujJOjcxrDeUyw4A0LI/hHZXPLA7TwoOaDzaBUiCCnVxW8NIEZlwq
         snufEgEUbdd5ERau36rdX0uR/v1BhG+WUOB9zxDgg+8g0snDyeVJdbVXStsl7MoAKa5f
         0e7vr4f2+8AL49LhtPqYCLuN05Rf3lDnV7Tws5Yj3m6Ytfmf9B/ChIDqwkZ12vFHl9Am
         FVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R4cCmxP4zfgLWhvlmyup8PsoqYwC5VTK38QQTUItQBs=;
        b=VaMLF6pzmSNWiXQNic9YWqwjcmbsilb9gEMAbokf373kLIGUCogA/jbSWnPwjsOXhm
         dFHbHfGnamNZwzxjHKpQ906mrJNVuLg3YLqa/2NyTMm9kjjvq+qqtyYVXEl7zuLefFw2
         9stU1ZimCkMIkjsL3prtNVkGHxXoVMJFzuzcSLshXvPmG2y7oXUHOdGeotz5x9Wl/n6S
         zZBnh3tdw7+5xO4CdKdVz/hytBBkvknbRGaJvl9aca5kWa0ci7EhnFM33MlIyOl6wMl1
         cFBhniXgMseAtasUS2zunOOjEwz6POW9C4CJJGPdWSRnOcz3l4bYSI6E4Vtgw530URgo
         c1cw==
X-Gm-Message-State: AOAM533czFJdYdV/4ZNqz1nvoB6++z14SFBD9aS1W1bQyu+xh3o3QU3o
        1i/LYxFAp+V/aNb+3ncgOns=
X-Google-Smtp-Source: ABdhPJwIlYNv1X6ak4aACOzwrh+SYXq1EiO2NnfGoOcHeNLfxXdrfc626R3XIdBJRd97Invr9PRZPQ==
X-Received: by 2002:ad4:57a8:: with SMTP id g8mr21290308qvx.46.1620063480561;
        Mon, 03 May 2021 10:38:00 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:125:811b:fbbc:3360:40c4:fb64])
        by smtp.googlemail.com with ESMTPSA id b8sm424976qtj.37.2021.05.03.10.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 10:38:00 -0700 (PDT)
From:   Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
To:     mchehab@kernel.org, skhan@linuxfoundation.org
Cc:     Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        hverkuil-cisco@xs4all.nl
Subject: [PATCH] media: em28xx: Fix possible memory leak of em28xx struct
Date:   Mon,  3 May 2021 14:37:15 -0300
Message-Id: <20210503173716.21652-1-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The em28xx struct kref isn't being decreased after an error in the
em28xx_ir_init, leading to a possible memory leak.

A kref_put is added to the error handler code.

Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-input.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-input.c b/drivers/media/usb/em28xx/em28xx-input.c
index 5aa15a7a49de..b89527014cad 100644
--- a/drivers/media/usb/em28xx/em28xx-input.c
+++ b/drivers/media/usb/em28xx/em28xx-input.c
@@ -720,7 +720,8 @@ static int em28xx_ir_init(struct em28xx *dev)
 			dev->board.has_ir_i2c = 0;
 			dev_warn(&dev->intf->dev,
 				 "No i2c IR remote control device found.\n");
-			return -ENODEV;
+			err = -ENODEV;
+			goto ref_put;
 		}
 	}
 
@@ -735,7 +736,7 @@ static int em28xx_ir_init(struct em28xx *dev)
 
 	ir = kzalloc(sizeof(*ir), GFP_KERNEL);
 	if (!ir)
-		return -ENOMEM;
+		goto ref_put;
 	rc = rc_allocate_device(RC_DRIVER_SCANCODE);
 	if (!rc)
 		goto error;
@@ -839,6 +840,8 @@ static int em28xx_ir_init(struct em28xx *dev)
 	dev->ir = NULL;
 	rc_free_device(rc);
 	kfree(ir);
+ref_put:
+	kref_put(&dev->ref, em28xx_free_device);
 	return err;
 }
 
-- 
2.20.1

