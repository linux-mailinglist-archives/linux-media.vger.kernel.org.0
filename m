Return-Path: <linux-media+bounces-37694-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ADAB045D4
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 18:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC1C44A7AB0
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 16:47:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF232609F7;
	Mon, 14 Jul 2025 16:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Tg1EGDIS"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C585E1EDA1A
	for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 16:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752511548; cv=none; b=owilhvSmT0kzattqV+rqJSiFLrmP4KBPUUTpqNz2VjTpmjsMGgSHa6eIboHU0iz+u5sadzIZSi3R9z7OrAnubTW7vaWcOykxj3mj2niPOnoTsxtBgH5Y87XlkbhnVyrl7GXW/COKifRfeNDIxQMHlv77F4Kj/u4zDC8IeTym+MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752511548; c=relaxed/simple;
	bh=ZFCJUQX+R1jDLGp1kQxI7pxWZsQX4PlP9o9505K2UFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=P2fw+soLhp0SWpYlaeLYE2Jnn3nzQqxFy7Js3/FisQATj9+Y26PdKz/2O8c/sJ0DtFqf6cvcOviuhKBmyuFgMsu+yffhY8DJ5GKV5/HFlZ10aD8Llm3Vpqvqj86riWVTHzwH/Gbj/8cBDRSgsKhQWn845iVrpYVadg4x9KUhsfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Tg1EGDIS; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32b5226e6beso39209141fa.2
        for <linux-media@vger.kernel.org>; Mon, 14 Jul 2025 09:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752511545; x=1753116345; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xD4diS2eZIxvYk4/vXs4cqI2wW3yeZXdZZaYc3t249U=;
        b=Tg1EGDISZxsQVv0xJcC+RuZV9tpQPCuYn45J86ab7FjO3xhQSt/naprVB7qvhkl5rY
         VFQcQUF0/YQQYlQP1gQPsylAMIxigXgNjMIVumHdbKB4JXWC5m3b+ETW44cTy7PIaftC
         B8GQ+4w8gC2pbSPCHH0c05VCH2aj/lGCH7ZB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752511545; x=1753116345;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xD4diS2eZIxvYk4/vXs4cqI2wW3yeZXdZZaYc3t249U=;
        b=OHZGL1KzlRmb++vAKorHcymP+6cr8Vk/ToIKSi4dxPefQV+hDu2KKH83vudHTYkmj0
         uLUDjBX9FnTZ0TXoSFUrRACQfEgCf2wUG12Y1rdbHu3WYTjL23Wq9FTiIoYKXgcxfKGR
         wGtf74wi66qT/mmYgJ+EjaSUcczakyiMC2K2X5Iuv1F4Wboqgri8x6i07qJve6TWmEQX
         k240qBnQMJHA4HcheYlxP4TRzNFkJZg/98ZMMyqlByHMH7PFULW59TMlYACwb5hlrC2G
         WbPQTo4tm5HmaUR8LO2hVClRHmnKW24V4elBtLGw2LS7iRJwtg2rdmqj5zIo33Y+vl4U
         lRMA==
X-Gm-Message-State: AOJu0YzQZbycIpsuuaQ0Cae162wl8WKTz5Jd4cxmUcN5R8J0Xcaa7SDf
	nJTwDIk/99xXtrfDmL7HxV3BptQYUF6KZBgdxf/1a/0frJGBkUPTgWc7AE4HZBV/sQ==
X-Gm-Gg: ASbGncsgM9Fsyhc0pdlgAoe1s4T0rei6QgwOIHzgEXMeRSLO4Hnsv+1tx2JqEtJd2zl
	xEYTbpuyXyHDfNWZOmsbHje8GW2jNLxHrN40QjI1JzHYc8SiXtk4LGRQEQFVQ/Wq4jtiXWFDdRt
	U0srepoLcw2CZo2E8CWADc931Ndemj3MyAa+RQK+r2SnXFmp8OHktDsDUirPHy/tDcxrfZXVueo
	UDP+zIXM4Fraa0Ik3O9JhMsdNQ1tj9e0PNPCp7uf/F9Gr7LbHLcqg0KxaP9nI4EukQQCTeduDlH
	+yblqdBrpOudfwDGUWduzdNCfIzE7Lsj9U9gnGls+YxSJA5nHMdhAtRHYbkT2twcio6wlW3pJQG
	n3L6m67B7Oi6Hcp7V4VXP4zwS8P2cTkJTRd37+EgotdHC720Jd0DnAlqryiw4xdG0wQgLzK/2/r
	a3Ow==
X-Google-Smtp-Source: AGHT+IGb7GrL5YkGYqwPa7G0HJ0dKuqlTDSGAH8yZuJoIyviiXBnaIvpe2Ddznx0fDOzJaZFq3wGVw==
X-Received: by 2002:a2e:be89:0:b0:32a:864a:46eb with SMTP id 38308e7fff4ca-33052f808aamr44196941fa.0.1752511544883;
        Mon, 14 Jul 2025 09:45:44 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32fa293b6cdsm16459571fa.38.2025.07.14.09.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 09:45:44 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 14 Jul 2025 16:45:43 +0000
Subject: [PATCH] media: uvcvideo: Fix comments in uvc_meta_detect_msxu
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250714-uvc-meta-followup-v1-1-67bd2dc05ef2@chromium.org>
X-B4-Tracking: v=1; b=H4sIADY0dWgC/x3MTQ5AMBBA4avIrE2ijb+4ilgwpkyCSqtIxN01l
 t/ivQc8O2EPTfKA41O82C1CpQnQ3G8To4zRoDNdZJXKMZyEKx89Grss9go7KqKh5JoN6QFitzs
 2cv/PtnvfD7Z2hdZjAAAA
X-Change-ID: 20250714-uvc-meta-followup-1ccb6e8efc2b
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The comments can be more precise. Let's fix them.

Fixes: 6cb786f040ad ("media: uvcvideo: Auto-set UVC_QUIRK_MSXU_META")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
This series fixes the uvc metadata series landed in:
https://patchwork.linuxtv.org/project/linux-media/patch/998c5fb0-8d32-496c-a1e2-cc9c1a73ede0@kernel.org/

There is no need to Cc: stable, because the series have not landed in
any stable kernel.
---
 drivers/media/usb/uvc/uvc_metadata.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_metadata.c b/drivers/media/usb/uvc/uvc_metadata.c
index 229e08ff323eed9129d835b24ea2e8085bb713b8..2905e46514d74cee09215d86e8eb7ad6e787ece1 100644
--- a/drivers/media/usb/uvc/uvc_metadata.c
+++ b/drivers/media/usb/uvc/uvc_metadata.c
@@ -196,7 +196,10 @@ static int uvc_meta_detect_msxu(struct uvc_device *dev)
 	if (!data)
 		return -ENOMEM;
 
-	/* Check if the metadata is already enabled. */
+	/*
+	 * Check if the metadata is already enabled, or if the device always
+	 * returns metadata.
+	 */
 	ret = uvc_query_ctrl(dev, UVC_GET_CUR, entity->id, dev->intfnum,
 			     MSXU_CONTROL_METADATA, data, sizeof(*data));
 	if (ret)
@@ -208,9 +211,9 @@ static int uvc_meta_detect_msxu(struct uvc_device *dev)
 	}
 
 	/*
-	 * We have seen devices that require 1 to enable the metadata, others
-	 * requiring a value != 1 and others requiring a value >1. Luckily for
-	 * us, the value from GET_MAX seems to work all the time.
+	 * Set the value of MSXU_CONTROL_METADATA to the value from GET_MAX to
+	 * enable the production of MSXU metadata.
+	 * https://learn.microsoft.com/en-us/windows-hardware/drivers/stream/uvc-extensions-1-5#2229-metadata-control
 	 */
 	ret = uvc_query_ctrl(dev, UVC_GET_MAX, entity->id, dev->intfnum,
 			     MSXU_CONTROL_METADATA, data, sizeof(*data));

---
base-commit: d968e50b5c26642754492dea23cbd3592bde62d8
change-id: 20250714-uvc-meta-followup-1ccb6e8efc2b

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


