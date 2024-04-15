Return-Path: <linux-media+bounces-9373-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBB98A4EAD
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 14:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1EA21C20F22
	for <lists+linux-media@lfdr.de>; Mon, 15 Apr 2024 12:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A604E6EB69;
	Mon, 15 Apr 2024 12:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ds5CiL9q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32D76BFA3
	for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 12:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713183143; cv=none; b=pylWB1XMsSkRFuMirc0lPnmZUGiweDKeB7nbhH7sSGWgk2RhVkRkDlhPNc7cXS3EYPeMacUfSocVSikaqzlWMDD3p+zaLsHPInqyf8LiAiNRIcd0Exif1jH94NPx2LodS6SzGwGGX6xt0zH57/gYBsmiot6EBzzCRLjGK7ZzkYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713183143; c=relaxed/simple;
	bh=jpEGID5lkfkjuCxhCPCs5p0pZvOXzvK9e8L9b2260ro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bqukCcibRX/zW7JXCQRV0MAuDIXX9GEMIWf9m+CcW/8mv5Q34ZbRRpe5fD9KodwxnmkQvctZz/OgJxIN/CxeU4oAJvZAUBsTimklnLAOoGxAjlORF/oNBLK9/7bYmaElKr663jFLCMHsyxYT5NE+0gU4QEdMM1k/3WRQHPh7wz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ds5CiL9q; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-78d555254b7so249411485a.1
        for <linux-media@vger.kernel.org>; Mon, 15 Apr 2024 05:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713183140; x=1713787940; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p9LH5+Quj/dO3EfRtFe69jfS5pI4H/tFZnFgNTA9GTg=;
        b=ds5CiL9qdvvvmMfOE2Iy7mhxuw6u5npt00jqav+4bRvbS8jJbTFtzytJQZLEN4rPC9
         hkpx9lIXFVtxoXxdhLj/eF0+DGlmx8vZnVuGEwPfJ9qzDLkQqgCmXN584HoZjHIAsKfl
         nQyUtdM2YIM6I5W1mKuFkLJWk+gVn+LJX9qs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713183140; x=1713787940;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p9LH5+Quj/dO3EfRtFe69jfS5pI4H/tFZnFgNTA9GTg=;
        b=oNCI/NJnxF+FBYW34ALw00ggnbrEda0jDMlSHrOyT0zjKrp/CDn5iWp0agt5agdxZX
         8QtkclgMwg2DVuFNsPQIE3+Emosbbhp2XZuRBqxqselm6MagCazyjbABprkbUY5MUJyL
         njOwlL+rHfpbYzqFuJw5JXKsIZlk3rB9EqHceX1/fcoWSbiPFNHOlz5o9YNlXzjq/cKq
         fG4em52YvSbiwUZpOGuSvOzLRVXV6ay4b9iofA1sOQX//4laF2B0NaoFBHYAQFTUAPfi
         jPcf9ryf398H+rlEOqm6VIa9baRPQQHUwnSTJ53j0t9gYDv0JF/vU90w3jWKimPclg/l
         oYJA==
X-Forwarded-Encrypted: i=1; AJvYcCXTRpMOU+G4p//9WoJQhKCO+fFVNDHeNpeWvZN2X2t4ioFilkROpyT6/fr25SB6NdU37n1/jBedUXapBKoBkr7apMelkPC40Ma299I=
X-Gm-Message-State: AOJu0YwzjrIh7W9Psa1/37+Tnm2TPora/wHoWc1dsyJMLQK4cBd5ex3d
	C18Nc5Eqo24XSdVM5COSxnlj/iKFpn/D7AC5J6AwxugDWmORSrooY/754ehYxtyARRHFTaJyDdd
	WbA==
X-Google-Smtp-Source: AGHT+IGoOB5EpPVrDU5h1An5CQbnM0qtEGwfyyRIU3ysE88/tylqkyBtrRRFK5M2LHc31lbhkElSCA==
X-Received: by 2002:a05:620a:400b:b0:78d:37bf:74cf with SMTP id h11-20020a05620a400b00b0078d37bf74cfmr22270389qko.5.1713183140403;
        Mon, 15 Apr 2024 05:12:20 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id v9-20020a05620a0a8900b0078d5e60b52esm6213365qkg.114.2024.04.15.05.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:12:20 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 15 Apr 2024 12:12:18 +0000
Subject: [PATCH v2] media: usb: siano: Fix allocation of urbs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240415-smatch-v2-1-65215936d398@chromium.org>
X-B4-Tracking: v=1; b=H4sIAKEZHWYC/2XMQQ7CIBCF4as0sxYz0JKiK+9hukCgZRYUA5VoG
 u4uduvyf3n5dsgukctw7XZIrlCmuLYQpw6M1+viGNnWIFAMOHBkOejNeKZm0UsrcZS9hXZ+Jjf
 T+4DuU2tPeYvpc7iF/9Y/onCGbFTSIl60kuJxMz7FQK9wjmmBqdb6BSzLZcafAAAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Yasunari Takiguchi <Yasunari.Takiguchi@sony.com>, 
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

USB urbs must be allocated with usb_alloc_urb. Quoting the manual

Only use this function (usb_init_urb) if you _really_ understand what you
are doing.

Fix the following smatch error:

drivers/media/usb/siano/smsusb.c:53:38: warning: array of flexible structures

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2: Thanks Hans
- Only leave 1/6, the other ones are in another PR
- Fix the return tag and NULLify the urbs on return
- Link to v1: https://lore.kernel.org/r/20240410-smatch-v1-0-785d009a852b@chromium.org
---
 drivers/media/usb/siano/smsusb.c | 36 ++++++++++++++++++++++++++----------
 1 file changed, 26 insertions(+), 10 deletions(-)

diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/smsusb.c
index 723510520d09..2e25b970946a 100644
--- a/drivers/media/usb/siano/smsusb.c
+++ b/drivers/media/usb/siano/smsusb.c
@@ -40,7 +40,7 @@ struct smsusb_urb_t {
 	struct smscore_buffer_t *cb;
 	struct smsusb_device_t *dev;
 
-	struct urb urb;
+	struct urb *urb;
 
 	/* For the bottom half */
 	struct work_struct wq;
@@ -160,7 +160,7 @@ static int smsusb_submit_urb(struct smsusb_device_t *dev,
 	}
 
 	usb_fill_bulk_urb(
-		&surb->urb,
+		surb->urb,
 		dev->udev,
 		usb_rcvbulkpipe(dev->udev, dev->in_ep),
 		surb->cb->p,
@@ -168,9 +168,9 @@ static int smsusb_submit_urb(struct smsusb_device_t *dev,
 		smsusb_onresponse,
 		surb
 	);
-	surb->urb.transfer_flags |= URB_FREE_BUFFER;
+	surb->urb->transfer_flags |= URB_FREE_BUFFER;
 
-	return usb_submit_urb(&surb->urb, GFP_ATOMIC);
+	return usb_submit_urb(surb->urb, GFP_ATOMIC);
 }
 
 static void smsusb_stop_streaming(struct smsusb_device_t *dev)
@@ -178,7 +178,7 @@ static void smsusb_stop_streaming(struct smsusb_device_t *dev)
 	int i;
 
 	for (i = 0; i < MAX_URBS; i++) {
-		usb_kill_urb(&dev->surbs[i].urb);
+		usb_kill_urb(dev->surbs[i].urb);
 		if (dev->surbs[i].wq.func)
 			cancel_work_sync(&dev->surbs[i].wq);
 
@@ -338,6 +338,8 @@ static void smsusb_term_device(struct usb_interface *intf)
 	struct smsusb_device_t *dev = usb_get_intfdata(intf);
 
 	if (dev) {
+		int i;
+
 		dev->state = SMSUSB_DISCONNECTED;
 
 		smsusb_stop_streaming(dev);
@@ -346,6 +348,11 @@ static void smsusb_term_device(struct usb_interface *intf)
 		if (dev->coredev)
 			smscore_unregister_device(dev->coredev);
 
+		for (i = 0; i < MAX_URBS; i++) {
+			usb_free_urb(dev->surbs[i].urb);
+			dev->surbs[i].urb = NULL;
+		}
+
 		pr_debug("device 0x%p destroyed\n", dev);
 		kfree(dev);
 	}
@@ -390,6 +397,7 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
 	void *mdev;
 	int i, rc;
 	int align = 0;
+	int n_urb = 0;
 
 	/* create device object */
 	dev = kzalloc(sizeof(struct smsusb_device_t), GFP_KERNEL);
@@ -461,16 +469,18 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
 	dev->coredev->is_usb_device = true;
 
 	/* initialize urbs */
-	for (i = 0; i < MAX_URBS; i++) {
-		dev->surbs[i].dev = dev;
-		usb_init_urb(&dev->surbs[i].urb);
+	for (n_urb = 0; n_urb < MAX_URBS; n_urb++) {
+		dev->surbs[n_urb].dev = dev;
+		dev->surbs[n_urb].urb = usb_alloc_urb(0, GFP_KERNEL);
+		if (!dev->surbs[n_urb].urb)
+			goto free_urbs;
 	}
 
 	pr_debug("smsusb_start_streaming(...).\n");
 	rc = smsusb_start_streaming(dev);
 	if (rc < 0) {
 		pr_err("smsusb_start_streaming(...) failed\n");
-		goto err_unregister_device;
+		goto free_urbs;
 	}
 
 	dev->state = SMSUSB_ACTIVE;
@@ -478,13 +488,19 @@ static int smsusb_init_device(struct usb_interface *intf, int board_id)
 	rc = smscore_start_device(dev->coredev);
 	if (rc < 0) {
 		pr_err("smscore_start_device(...) failed\n");
-		goto err_unregister_device;
+		goto free_urbs;
 	}
 
 	pr_debug("device 0x%p created\n", dev);
 
 	return rc;
 
+free_urbs:
+	for (i = 0; i < n_urb; i++) {
+		usb_free_urb(dev->surbs[n_urb].urb);
+		dev->surbs[n_urb].urb = NULL;
+	}
+
 err_unregister_device:
 	smsusb_term_device(intf);
 #ifdef CONFIG_MEDIA_CONTROLLER_DVB

---
base-commit: 34d7bf1c8e59f5fbf438ee32c96389ebe41ca2e8
change-id: 20240410-smatch-8f235d50753d

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


