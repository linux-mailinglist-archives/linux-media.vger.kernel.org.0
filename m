Return-Path: <linux-media+bounces-37040-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D45AFBAD6
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 20:38:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2484E426B81
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 18:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADB07273D71;
	Mon,  7 Jul 2025 18:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UOAvDuOH"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB90271442
	for <linux-media@vger.kernel.org>; Mon,  7 Jul 2025 18:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751913247; cv=none; b=jBbIvMqm1vXyK56x5t5fgcQoXvJfxc4tDlG9cxaKUBlS91HaMP4mnyfYA6A5WDvK32FrviOTNBeGlP5JMhQht6C4hAQm7wF7wSTll+0CwJoxKFD2jDNlVSDeezJyR7SlkssHmim9nugxVW9BlPb9IOEFZ/QJv5bs+53f45okEs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751913247; c=relaxed/simple;
	bh=YNGFFPC9zzW74qiewwqmxjg3sbDXhOxc1nuxGLMg4Jo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IJ1Mk3+7HXrpBCZKDV//NZhqQZuyaHmOu8bBjqQ34DlNPgHDGSFf+aRyq19AKCKD0J3faRXHTCSRL/Rar/noGXnCAFIZRyZUQ4PPpkNZ1oOhQPvlIB3FBdPeVgE1yz0e4yVVCvu/Wz+E3rRPczd3V7jctTyMa/eqyWcInmZW1B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UOAvDuOH; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553d2eb03a0so5138962e87.1
        for <linux-media@vger.kernel.org>; Mon, 07 Jul 2025 11:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751913243; x=1752518043; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9os3lS8fH6kHGyK9R2m8uRATRzh2C1OPAQHL6vUS+6g=;
        b=UOAvDuOHTlTW3SP79K6ikfG58LdJjxXuhl/24IwvFx2i2XnQfL+7UU+PGEkw2T/bQ/
         uG9FWQswii2lSS3EiFXHzwzQRQkMKCiSSqhne63L5FbRxfyAkKyMoxBXjo8fvx9i7Ws0
         +ecvur4HaQGhoyfe2lNgGzozpZ2C5DkrY7ko4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751913243; x=1752518043;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9os3lS8fH6kHGyK9R2m8uRATRzh2C1OPAQHL6vUS+6g=;
        b=RgKbNydCJ1VnFGAO+XlbIY5ysjjkBF2ie5XM61ip/xLX+BNVbEPAP61iJypuC4fkBN
         V+5Xqced29iQK6aOeA/lY7vjYXNfz8VN7XcG9R1aj375N4Fsh3CFb/x5kue572mJ4rPC
         HUww0kPfZG2cD6XYqE/RePXvobI8CjKAQoQILjsS94a2Qo8BO1rayvLa2kGBGI39HXBf
         b1+SEOGmNrREa8z4yzkcw1KEqqMU5KbdO3QWnpf6nITdrPUejod07N6Chk7ceBSNyRHY
         kOAHuh06z5IVQvqcOmcES9t004OyIRsnFNT6eS/mZsDcT0bLEwk38NChBnJQzKNFDSzs
         heMQ==
X-Gm-Message-State: AOJu0Ywz+/97lvAzxY/LP/0tVF7cUnjt14dcGE4ZYEJ+zrx9d5fqXrWu
	ozcj3XudUAZtO087WbRqhzGjxVSZnpKgHovoox1igGKpyQLOLWdIy3Uuoup/rHFnuA==
X-Gm-Gg: ASbGnctQxP8EMsNz4FAYPwB9zm05H5pCv2zYFbVmws0I5E2gdNuSOzTR/lNDcFSq3Xg
	c03zUfhpSazcwuNCC6Bz6lfVWrmMt6+y2/1GuwjpoCFA2fBNqLgb3pUjPDJFCVPxqEqDEItnYMD
	nmg3uwxkmv24CetNGwIVhBcZGixWqP4F71bXlkTnKKUEO6y1BpscA6cLgLvrjm9KUZbvM7mgly6
	TJ9WKTSGhbSQYY810HvNqwbVNLAF3o2c0hGgruoXZrwuTnD1l1Mcl6Ouczsw5A9+qm2NzaESFqK
	f9W8wF0nUxP61BclQUnH7+OQ4mdmpRbJF5VbqLVbEWuUJr6l4JLsfRiex3BiqjRDM5+/W8Xyng8
	ziymGevlkJze8Gh9IDZoPCzIBQUQAHUSbZkmP5wikfw==
X-Google-Smtp-Source: AGHT+IEo+zOt/AEi0FnK1sr6WXC8fbhAVvwDgLrxJE5f71HHIze0CaiIMj7O14ZqNlyCSg74rdmpIg==
X-Received: by 2002:a05:6512:3d06:b0:553:2884:5fb3 with SMTP id 2adb3069b0e04-557f75de7f0mr181222e87.12.1751913243387;
        Mon, 07 Jul 2025 11:34:03 -0700 (PDT)
Received: from ribalda.c.googlers.com (166.141.88.34.bc.googleusercontent.com. [34.88.141.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383d31a6sm1417630e87.61.2025.07.07.11.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 11:34:03 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 07 Jul 2025 18:34:02 +0000
Subject: [PATCH v8 2/5] media: Documentation: Add note about UVCH length
 field
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-uvc-meta-v8-2-ed17f8b1218b@chromium.org>
References: <20250707-uvc-meta-v8-0-ed17f8b1218b@chromium.org>
In-Reply-To: <20250707-uvc-meta-v8-0-ed17f8b1218b@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Guennadi Liakhovetski <guennadi.liakhovetski@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans de Goede <hansg@kernel.org>, Hans de Goede <hansg@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

The documentation currently describes the UVC length field as the "length
of the rest of the block", which can be misleading. The driver limits the
data copied to a maximum of 12 bytes.

This change adds a clarifying sentence to the documentation to make this
restriction explicit.

Reviewed-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 Documentation/userspace-api/media/v4l/metafmt-uvc.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
index 784346d14bbdbf28348262084d5b0646d30bd1da..4c05e9e54683a2bf844ddf26f99d0d9713ef05de 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-uvc.rst
@@ -44,7 +44,9 @@ Each individual block contains the following fields:
         them
     * - :cspan:`1` *The rest is an exact copy of the UVC payload header:*
     * - __u8 length;
-      - length of the rest of the block, including this field
+      - length of the rest of the block, including this field. Please note that
+        regardless of this value, for V4L2_META_FMT_UVC the kernel will never
+        copy more than 2-12 bytes.
     * - __u8 flags;
       - Flags, indicating presence of other standard UVC fields
     * - __u8 buf[];

-- 
2.50.0.727.gbf7dc18ff4-goog


