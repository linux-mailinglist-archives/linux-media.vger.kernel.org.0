Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC34A372FE0
	for <lists+linux-media@lfdr.de>; Tue,  4 May 2021 20:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbhEDSpz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 May 2021 14:45:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230133AbhEDSpz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 May 2021 14:45:55 -0400
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C72AC061574;
        Tue,  4 May 2021 11:45:00 -0700 (PDT)
Received: by mail-qk1-x729.google.com with SMTP id 76so7804722qkn.13;
        Tue, 04 May 2021 11:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XmLS0shw/+P3NJogl9/hrOyMQwZyRYURxiBXGbzHuHs=;
        b=pP4wp7YTAT2b174xR40jBp4CeZK+zO9CSl5qZHWBWocTax207bEzRpeIu+u3KNdlLG
         ErFSkyYTwtiFEjGXn/bfPMZF8dWj03Yw4WUX/liA0Jxx55gDEWOdGKglXpoP96lvj2VE
         cwshfUc8ZPAOLu3bJlES9s1BTKOlOTuqzHLe5FbUIUNBBpjDNMkfGA/WOBW4fphRa+jW
         uh1isIXbiEjXA5Rc8juKTWJ/6EfEX7pz2CYQ+bP+tVo1LdKPsZQBbSlpIX/0A1cvCJad
         amx6ZOFYa32yWg/LDMuYngtIDAkc1KUvVdBZAiEm+PJKPqVwjXQKtAo/ApbInlBiFtGW
         eBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XmLS0shw/+P3NJogl9/hrOyMQwZyRYURxiBXGbzHuHs=;
        b=YSt3eDruFq8cDOPCIonNemd01U+Qizrqzv1tyYQbKzOcbso8OmL9vlEuF/e+re3DBN
         ro3a7eUzcXzuIWeeykTrzEtME4w+ZPY8+8SWyu1edpNkvtMkBc2Heq6BN/wtkYRYtAPo
         M1NEn+oZwf4cZoAhgMRHZuOCBYZUeHxzY2PLPDefGQWPfcLGISZ7jYi2dcbprKDJxIgS
         DSFKY4+dK3QrnOYWEv+cJceNZQbe6PgEwfEzQSofZb0czXZS1fP2cpJktUDi8954oCYm
         5OfeEFaQuAQ7xxKvd8X9QUzaGOQgf7RjI2Ma3SMA12Ct83BiwYgDg6ikXj4nANkNQFCe
         Dwew==
X-Gm-Message-State: AOAM5303+FImhi/Ek41BJ5OS+sAgbmrhLywy7NUYFqb2b67eO7Phw2D9
        ehQjdhbUStepPnea4U8ZJPE=
X-Google-Smtp-Source: ABdhPJyTOsD36HaM4aTU28UG7/G4Hkw7kEa8Qg5I5TkAc4/gVUKI+bsgw0j9P1oOnNKNqHyl9oSuWQ==
X-Received: by 2002:a37:883:: with SMTP id 125mr13212851qki.374.1620153899352;
        Tue, 04 May 2021 11:44:59 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:125:811b:fbbc:3360:40c4:fb64])
        by smtp.googlemail.com with ESMTPSA id x13sm3216059qtf.32.2021.05.04.11.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 11:44:58 -0700 (PDT)
From:   Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
To:     mchehab@kernel.org, skhan@linuxfoundation.org
Cc:     Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        hverkuil-cisco@xs4all.nl
Subject: [PATCH v2] media: em28xx: Fix possible memory leak of em28xx struct
Date:   Tue,  4 May 2021 15:32:49 -0300
Message-Id: <20210504183249.6307-1-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The em28xx struct kref isn't being decreased after an error in the
em28xx_ir_init, leading to a possible memory leak.

A kref_put and em28xx_shutdown_buttons is added to the error handler code.

Signed-off-by: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
---
 drivers/media/usb/em28xx/em28xx-input.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-input.c b/drivers/media/usb/em28xx/em28xx-input.c
index 5aa15a7a49de..59529cbf9cd0 100644
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
@@ -839,6 +840,9 @@ static int em28xx_ir_init(struct em28xx *dev)
 	dev->ir = NULL;
 	rc_free_device(rc);
 	kfree(ir);
+ref_put:
+	em28xx_shutdown_buttons(dev);
+	kref_put(&dev->ref, em28xx_free_device);
 	return err;
 }
 
-- 
2.20.1

