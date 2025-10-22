Return-Path: <linux-media+bounces-45232-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84745BFBBDF
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 13:55:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18614587E68
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 11:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6802033FE3A;
	Wed, 22 Oct 2025 11:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F2rQv7FQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D442B33F8DC
	for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 11:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761134121; cv=none; b=SaZLR86VN0d6EnREbPQxHvqmZfGHRYSJdDHzwGi73pUQDcgvXV4p8NeBbgAQ00Sg+rBtBi9eljrdPMYyaoArZIsC/BQHlx9NY6sqIp8kdO2kjaUIqSutHHwra0EfcCuMSKLHue3FXZDJc8Cf+PRIXCD4MRzn0icImftTLojPuyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761134121; c=relaxed/simple;
	bh=4xFArIFBCi/38kZpFjNp/HhrvCNOBQ0dVzcCEAHfOLg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hovNOWmyGoWogm1CIXabf1OxDzLqGyOz7YALTlZqNcxJqikO0jponz6P30UyVMq1rrb4YMWMScyvc6TfaMz2MiUejGKiatezNNIYyDCmnLeBBgSSY6dJO4PCaa1Lp/GzwEl9lC/feHNfygp9rzbLFHvTzJ3jFIq93y0u+1tRe74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F2rQv7FQ; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-378cfd75fb0so4029161fa.1
        for <linux-media@vger.kernel.org>; Wed, 22 Oct 2025 04:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1761134118; x=1761738918; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jYH9KKHjk03g5K9Bm9ckGVdfxUSlGQea/izXLcw9vU4=;
        b=F2rQv7FQmM3aEHkTOX/AMdiegHD/zocFpZc+7D0mIKep01SNf2pCPZ33yUP+TfrWXe
         Et0oWvq3pFPn6LIySn5gZRNK1qnZlNYnPGqqOZ7obYeCO3AVAzv1HyMPTQTMUltH9YEj
         /DBYYBgNuDcs4UbV4mLg+OkKOzKX5IdsEyFgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761134118; x=1761738918;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jYH9KKHjk03g5K9Bm9ckGVdfxUSlGQea/izXLcw9vU4=;
        b=VS0qH4avPDEXO8ipOofAu3sUt35otAP3TXSRdDgccMLQaLMJKZu5sGBL1uxohHmdgV
         Vd79uiT0k3luHAuA/G4OKslTY927xkYIEQPdtrhn1dF36wU4jlwOQACBgRMM8Cu+Bw1M
         pmMzy6r5xMuv3OkS/KX7lY783pz1CC1+69gvLJCreIX+FxNvtzA1y6hNpfbKuOLoDhXi
         mBkqIeSH7XRQ2z36SvwhI09L5MixRcH7+4Al96M/UEKQGyTVSWGmLpMvT6QfP+J1Xo/b
         sSoccH6JtqWxBmObEExufGA7gKSQ9o3HJhhfVUNkI8ZsaXpUDLiet/w5iTVVul1LduOg
         6ETQ==
X-Gm-Message-State: AOJu0YxKX50nSEXd1m19YivNIV8bekcnKp2F0qSSICkCufqcEY5VIZoI
	SN5Q+FUVKNuH4gOQI7WX1BRI8IKJ/5YxMGLbkPZhnaMKZAPFEGJ9bwPawnd7+yLbZA==
X-Gm-Gg: ASbGncsLNRQXaWuJ/QTwSAihfHCsjtidaL7O6B9l+fXq7y5Z+9w0p2sx+6Ih8OdlC/m
	0ZQ5Sw3sMoJBiXt4SOxUSYuhvQk+t9BlW0eBWj2v/jpaDA6+yYRg5RYECZc+mCk8TFpH9gKR5TV
	+3wXIuCu3RP09mWqC+tYwAB6/aV456D8qcGyBsgcAFyI5a23HpDzxwS39mNh0q5/lUZcm4cmo3T
	6Gxx6tvtP9BlR3r+E3P2n4wk7tgjeExxwVwvHo9RAXCvTOKKxPUxbxe9O/Grv16SO+o+n3MnmZN
	e9qp1qllSReklRzVSwWGw6v4Mvg6c7TsxP6BMTG27/2X8C9aWsMnyLsvxRkKsHLfFafz1BkxMid
	h2jHWMxIRxlgXkF5R1orP4Eyu5YjXpM5UQSzYUWqwxtELBKhzS7tbyfUJGFt0wQZh1mUdsoHZY2
	bYFsDRFLPqt0NyD4QUnYYXR/ELMmUZPI/cyO/bUyMQdznoEtui1njvPQw=
X-Google-Smtp-Source: AGHT+IFstmSy3ZG7G9hzOLBQ33LR5gBe2+Ou9QgkLX9i4b8zh/4XZITZ7ccSGENfX9u9ghW1D5Ivuw==
X-Received: by 2002:a2e:a543:0:b0:377:887f:2ea with SMTP id 38308e7fff4ca-37797a56696mr63663261fa.32.1761134117880;
        Wed, 22 Oct 2025 04:55:17 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377cd7f1e7dsm13689061fa.14.2025.10.22.04.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 04:55:17 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 22 Oct 2025 11:55:16 +0000
Subject: [PATCH] media: uvcvideo: Create a specific id namespace for output
 entities
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-uvc-grandstream-laurent-v1-1-0925738a3484@chromium.org>
X-B4-Tracking: v=1; b=H4sIACPG+GgC/x3MwQpAQBCA4VfRnE2tlcKryGHWDqZYmkVK3t3m+
 B3+/4HIKhyhzR5QviTKFhKKPINhpjAxik8Ga2xVGGvxvAaclIKPhzKtuNCpHA4sx4acq8n4ykG
 qd+VR7v/c9e/7AZa1IY5pAAAA
X-Change-ID: 20251022-uvc-grandstream-laurent-3f9abb8a0d5b
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Nothing can be connected from an output entity. Which means that no
other entity can reference an output entity as baSourceId.

Use this fact to move all the output entities to a different namespace
id.

The output entities are usually named after the dev_name() of the usb
device, so there should not be any uAPI change from this change.

Although with this change we can handle some id collisions
automagically, change the logic of uvc_alloc_new_entity() to keep
showing a warning when a camera has invalid descriptors. Hopefully this
message will help vendors fix their invalid descriptors.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Hi, this patch fixes support for some devices with invalid USB
descriptor.

It is orthogonal to:
https://lore.kernel.org/linux-media/20251021184213.GC19043@pendragon.ideasonboard.com/T/#t

Some devices will be fixed by the other patch, other devices will be
fixed by this. In my opinion is worth to land both patches.

Tested with GRANDSTREAM GUV3100 in a 6.6 kernel.
---
 drivers/media/usb/uvc/uvc_driver.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index fb6afb8e84f00961f86fd8f840fba48d706d7a9a..40f8ae0df89e104992f5d55af3d3539dea3d146e 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -165,10 +165,14 @@ static struct uvc_entity *uvc_entity_by_reference(struct uvc_device *dev,
 	return NULL;
 }
 
+#define ENTITY_HARDWARE_ID(id) ((id) & ~UVC_TERM_OUTPUT)
+
 static struct uvc_streaming *uvc_stream_by_id(struct uvc_device *dev, int id)
 {
 	struct uvc_streaming *stream;
 
+	id = ENTITY_HARDWARE_ID(id);
+
 	list_for_each_entry(stream, &dev->streams, list) {
 		if (stream->header.bTerminalLink == id)
 			return stream;
@@ -810,10 +814,12 @@ static struct uvc_entity *uvc_alloc_new_entity(struct uvc_device *dev, u16 type,
 	}
 
 	/* Per UVC 1.1+ spec 3.7.2, the ID is unique. */
-	if (uvc_entity_by_id(dev, id)) {
-		dev_err(&dev->intf->dev, "Found multiple Units with ID %u\n", id);
+	if (uvc_entity_by_id(dev, ENTITY_HARDWARE_ID(id)))
+		dev_err(&dev->intf->dev, "Found multiple Units with ID %u\n",
+			ENTITY_HARDWARE_ID(id));
+
+	if (uvc_entity_by_id(dev, id))
 		id = UVC_INVALID_ENTITY_ID;
-	}
 
 	extra_size = roundup(extra_size, sizeof(*entity->pads));
 	if (num_pads)
@@ -969,6 +975,7 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 	struct usb_host_interface *alts = dev->intf->cur_altsetting;
 	unsigned int i, n, p, len;
 	const char *type_name;
+	unsigned int id;
 	u16 type;
 
 	switch (buffer[2]) {
@@ -1107,8 +1114,16 @@ static int uvc_parse_standard_control(struct uvc_device *dev,
 			return 0;
 		}
 
+		/*
+		 * Nothing can be connected from an output terminal. To avoid
+		 * entity-id's collisions in devices with invalid USB
+		 * descriptors, move the output terminal id to its own
+		 * namespace.
+		 */
+		id = buffer[3] | UVC_TERM_OUTPUT;
+
 		term = uvc_alloc_new_entity(dev, type | UVC_TERM_OUTPUT,
-					    buffer[3], 1, 0);
+					    id, 1, 0);
 		if (IS_ERR(term))
 			return PTR_ERR(term);
 

---
base-commit: ea299a2164262ff787c9d33f46049acccd120672
change-id: 20251022-uvc-grandstream-laurent-3f9abb8a0d5b

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


