Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 178CE3C7CDE
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 05:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237751AbhGND0r (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 13 Jul 2021 23:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237725AbhGND0q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Jul 2021 23:26:46 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2B11C0613DD;
        Tue, 13 Jul 2021 20:23:54 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id j9so774171pfc.5;
        Tue, 13 Jul 2021 20:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VIzDtcMh9iUc8ZZOTxmi7csButnplyD6SuFzYXtDhe0=;
        b=DYOrZlLEegG0jNCY6d+1VfRC9uPdBH5MIQ2yTEfwRK3YDWP8VHyijGGtI4q6lxZEZp
         nFzFT+MsVZERIqdld4c0ho11fW6RpYdEcLvwMx2SWx26+iYomXrq423UMdKCryaPQPH/
         YFag54LU5JYzeJveaBTonTSQm5EZ6AGsj2sqszr7GET31rQFjqnG3CCuy6bNKyXgSWUm
         YufL9UgjOTHSVZRlcmmR94CW5iKHiutb2/iafbYnz9/iy/EhxaQsS5WVMpV9p2sRqmVo
         k8fO0r6b7X3+SA1yvDxU4Ie84qVsd2pCpbUAnoMZTN7x1uBoc230B1rDO0alUR16O8Nb
         P8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VIzDtcMh9iUc8ZZOTxmi7csButnplyD6SuFzYXtDhe0=;
        b=fxxeEjiJw4e3ucfsbOFq2qvVAR/IRHdkK2+UznJnIlqWkO+SbtSbo66gWRm31/CUhn
         elRQPs+m1rBTsW0yuKDvs7rZiSP8wu9nLNbJipwYJrpmtojGtj5VA8jmKvthfU6JcP91
         otgYVDLe6OFZz7XEgkcaEsExXu4lY7O4qmqlSTibb2RWuugbqbixY5/iNsloeahhoK5/
         Nw081f7pvDUoong57z7fLqGZSXJe5ffrw9zILm9tKuIM1L8V+jzFQ7/Gd2cRIXfeGmxJ
         BFPw1Cxtx4rIQ0hkgFZjrIlEKSXP59PuDKnFUXdu5f14wWBzi8P6/Jvk8x8hYqXw8vA9
         QDAg==
X-Gm-Message-State: AOAM533sDjOdKN2dtDNJUb+aHCqSOJCzHL+SLZa05KZjt+W2QwAs+fLu
        puX0D20RClw2rIUawNrNEFc=
X-Google-Smtp-Source: ABdhPJyd2fMlxHI5igKsBtpzFfPrx1Fq5dQlsbN45U/uRiaNNeJ6m+pwR9I9S/VANxeI2eJnerta7Q==
X-Received: by 2002:a63:3186:: with SMTP id x128mr7210797pgx.379.1626233034514;
        Tue, 13 Jul 2021 20:23:54 -0700 (PDT)
Received: from localhost.localdomain ([154.16.166.218])
        by smtp.gmail.com with ESMTPSA id z23sm4067181pjh.37.2021.07.13.20.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 20:23:54 -0700 (PDT)
From:   Dongliang Mu <mudongliangabcd@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dongliang Mu <mudongliangabcd@gmail.com>
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: usb: fix memory leak in stk_camera_probe
Date:   Wed, 14 Jul 2021 11:23:28 +0800
Message-Id: <20210714032340.504836-1-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

stk_camera_probe mistakenly execute usb_get_intf and increase the
refcount of interface->dev.

Fix this by removing the execution of usb_get_intf.

Reported-by: Dongliang Mu <mudongliangabcd@gmail.com>
Fixes: 0aa77f6c2954 ("[media] move the remaining USB drivers to drivers/media/usb")
Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
 drivers/media/usb/stkwebcam/stk-webcam.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/usb/stkwebcam/stk-webcam.c b/drivers/media/usb/stkwebcam/stk-webcam.c
index a45d464427c4..5bd8e85b9452 100644
--- a/drivers/media/usb/stkwebcam/stk-webcam.c
+++ b/drivers/media/usb/stkwebcam/stk-webcam.c
@@ -1311,7 +1311,6 @@ static int stk_camera_probe(struct usb_interface *interface,
 
 	dev->udev = udev;
 	dev->interface = interface;
-	usb_get_intf(interface);
 
 	if (hflip != -1)
 		dev->vsettings.hflip = hflip;
-- 
2.25.1

