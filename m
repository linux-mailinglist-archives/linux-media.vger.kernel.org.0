Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D86C93DC6E1
	for <lists+linux-media@lfdr.de>; Sat, 31 Jul 2021 18:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229997AbhGaQSo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 31 Jul 2021 12:18:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbhGaQSn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 31 Jul 2021 12:18:43 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24C7CC06175F;
        Sat, 31 Jul 2021 09:18:36 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id e25-20020a05600c4b99b0290253418ba0fbso8368107wmp.1;
        Sat, 31 Jul 2021 09:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=yI/Wr23MR+W9LloBnzrB0gA6UsVFeoNhI++2eqGHMQs=;
        b=DzjBCpnxG5fSnrBM0ecHkKe45c5GsfpvnutWMo9x5KVtbDE85p5+Qe5bDfS6n4p5Pr
         20SC++mfP42lzuRZ+A+CKRzPWVjpABAtXOn0C1D1k8fCKef4S+8ea0Xc6WgpVjmNACSq
         /oVZv5X9vYkPLmjozqvOc1mZ5ykDt2AQ6qzuY3d4TZOBSlO/BiVZL277lv13Awt1m5Md
         EQ0UksMUbqzGLwLNSfxYNBetc4BdwWufCAILStDr2yTJ4no+febvt4rcW/5gs5wlYC6T
         YbVxRwig2xX4h0rg1LG6fuUu6OFC2KWJdK50aj7j1BieEh49oHi4LUqH3Q/WQCoZXpq6
         KGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=yI/Wr23MR+W9LloBnzrB0gA6UsVFeoNhI++2eqGHMQs=;
        b=nX+eWT5PEXgmcZ1EJJDbzpQ5/ciTDALwqhRHR65UC5uwCt9Of4n9Dpn5ZFuDVW7fld
         u45ekqEqXatbEjEK+lH5u6TtsL9QyKcMa5ok0o29+SJpxKdwJ2sYgKtQohtJROWd4C37
         8MJmso8MKsqqkZZTYzdoPoY80GZvsU3SxXRvkL1BKgA2sJN/Vm2YTDirIaupJpcxZWoM
         cQXHa4xkLdopeCqI61oEdDu4Rk2C/05vfyVc9C+znoXAixWwvE0KxNAR19/Xh3pkA9SL
         NDiCokQ/fx9lEelLPHDwDnjP8guXS3etZgJW/9Y50X4BrSfcD7g8GWF5O9PH9GJAjuiM
         gRNw==
X-Gm-Message-State: AOAM53193OWpntqtFGS2p+2eUYxGqOFuI+ApFdArm94h+PhQpMPKPpQN
        CPouwrbsVA0b01WKI8eFMDU=
X-Google-Smtp-Source: ABdhPJx0EowHpW03FyJV6F7pFvb/agrGmB0WrAXANSei9+VyNZBwJEDvB3BAPZECe5vokFR843ZE/Q==
X-Received: by 2002:a1c:a98f:: with SMTP id s137mr8825029wme.40.1627748314781;
        Sat, 31 Jul 2021 09:18:34 -0700 (PDT)
Received: from pc ([196.235.233.206])
        by smtp.gmail.com with ESMTPSA id u11sm5163842wrp.26.2021.07.31.09.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jul 2021 09:18:34 -0700 (PDT)
Date:   Sat, 31 Jul 2021 17:18:31 +0100
From:   Salah Triki <salah.triki@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: stkwebcam: update the reference count of the usb
 device structure
Message-ID: <20210731161831.GA909851@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use usb_get_dev() to increment the reference count of the usb device
structure in order to avoid releasing the structure while it is still in
use. And use usb_put_dev() to decrement the reference count and thus,
when it will be equal to 0 the structure will be released.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
Change since v1:
	Modification of the description

 drivers/media/usb/stkwebcam/stk-webcam.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/stkwebcam/stk-webcam.c b/drivers/media/usb/stkwebcam/stk-webcam.c
index a45d464427c4..3b14679829ed 100644
--- a/drivers/media/usb/stkwebcam/stk-webcam.c
+++ b/drivers/media/usb/stkwebcam/stk-webcam.c
@@ -1309,7 +1309,7 @@ static int stk_camera_probe(struct usb_interface *interface,
 	init_waitqueue_head(&dev->wait_frame);
 	dev->first_init = 1; /* webcam LED management */
 
-	dev->udev = udev;
+	dev->udev = usb_get_dev(udev);
 	dev->interface = interface;
 	usb_get_intf(interface);
 
@@ -1376,6 +1376,7 @@ static void stk_camera_disconnect(struct usb_interface *interface)
 
 	usb_set_intfdata(interface, NULL);
 	unset_present(dev);
+	usb_put_dev(interface_to_usbdev(interface));
 
 	wake_up_interruptible(&dev->wait_frame);
 
-- 
2.25.1

