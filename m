Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78E7C3D49B8
	for <lists+linux-media@lfdr.de>; Sat, 24 Jul 2021 21:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbhGXTSI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Jul 2021 15:18:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbhGXTSH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Jul 2021 15:18:07 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC6F1C061575;
        Sat, 24 Jul 2021 12:58:37 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id r16so6120241edt.7;
        Sat, 24 Jul 2021 12:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=nQ55jVTuVaUag5jlvVen69IRc5bdGGnJg6RE+nxxubE=;
        b=lJF81UVG//3ba9IFLpz77tfLKt9Bel+4cVdeP07YcG4kRrNAe/YQv2E6DVYvd7Wrq1
         EWgD5CbNRXrlRgu3VVF0S4ToTAdBNERbthehWbyl8jFC+zD0SkN1gMDH6bLCzvi+ab5t
         ZPfBtaxzyImbItZS0MC9DspYnktBiFGohTDoFuf2vxZGmiKNxJYEifGFhNxOOeLUe65h
         rnOKo4ArZ+ruj5GzuN7jX1ERNmfHqq8/wHkW+n8wia5WbCKqjBD4pNYnz+fNlkjclhVw
         j7TqkIArcCXdI6Rfu3vxxrlK/FY/b534F28n480F8PmVHvJEqNPQQ16SHNkeI+AdCSEG
         jvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=nQ55jVTuVaUag5jlvVen69IRc5bdGGnJg6RE+nxxubE=;
        b=mpu43teVN7N55B/lDFMuDagke68MaAxniia6DPpbDx4frhRRP8jgJ+4Goy8vLzbQnJ
         GDQyqdLHMJ0ZwjmyvqNBF9fRn9W34bxCKDdegq+zn0ZRerv8y1ipPqrmrGNNjvKZvoiE
         nPuzzSHXU2Dj02JWpV7kBvgWsZwfjSm+9VArRbrqtzFL+6rXVkgepzua7zR+l9GaIkR5
         tzHsh+I1ctT1rGhluCK3WB9Bxj/Lf1meeVUF7gQM0MWbSoSpTS0tSzP+KqRQvIRU7U5S
         qs53L3Vt+ts92UflpWtd5nLXDwCp1anqUPLAOwDErkZ1niifE9pl6oJGoBAC+2Xx+ivl
         Q4RA==
X-Gm-Message-State: AOAM531SXmvBioKGgQvPFeZ0WKPI3+Mkv4hWOTA9zexPFtNpt7ihdnRc
        ShzLt0C9rpVhdQ8nNcLNn4I=
X-Google-Smtp-Source: ABdhPJwSGFL6UoZeCWfV2q0W82NV5SYboAZU/hDJvrpELzY2NDEFxI/ykJHRACO4D7ZI/dftqQC90g==
X-Received: by 2002:a05:6402:64e:: with SMTP id u14mr12598627edx.122.1627156714870;
        Sat, 24 Jul 2021 12:58:34 -0700 (PDT)
Received: from pc ([196.235.233.206])
        by smtp.gmail.com with ESMTPSA id z8sm12723271ejd.94.2021.07.24.12.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 12:58:34 -0700 (PDT)
Date:   Sat, 24 Jul 2021 20:58:31 +0100
From:   Salah Triki <salah.triki@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        gregkh@linuxfoundation.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] usb: stkwebcam: update the reference count of the usb device
 structure
Message-ID: <20210724195831.GA509821@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use usb_get_dev() and usb_put_dev() in order to update the reference
count of the usb device structure.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
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

