Return-Path: <linux-media+bounces-21420-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC269C9235
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 20:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE9D6B29617
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2024 19:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B7C1AF0A9;
	Thu, 14 Nov 2024 19:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Wi9nDRUG"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4651AC428
	for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 19:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731611455; cv=none; b=IdnqknzgFl8HoN41i7HZm3Oyb01M6Wwg06cRdouupB8mRGVifbb9Le0kHAvnniu8TXT80WNV1MRSB3L1uncFBkjC1YnT+Iv15MYwhK0TyCP+Hmt6Oeu5axJDEk0x7yB03J3enhkC4wXhH/SSIuHiwjyee6LxN/BEnZjxV5j03AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731611455; c=relaxed/simple;
	bh=WuLUGkHs5rzPTrMYeFD9MhMpg+rW/hjaacAF210Zlvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HIDa6SXEUxZ1NuVmW8tCpzN5m1noUV3ZKis4b/wVrLJyaA4DqtuplkWVdmcfcPUVTHBCRfO0Cu6Z5G4T6gqyGLWNUP9LsUalWjKfmj7A7ZGLE9WQbzCmbkORNLfZ1eAoKtAQJxwr2N16BnACqJ7muJ6cK+bg4gVZD7yIlDu+zp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Wi9nDRUG; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6d3f6a548b2so3815416d6.2
        for <linux-media@vger.kernel.org>; Thu, 14 Nov 2024 11:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731611452; x=1732216252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Agd78fl9Wg05tfWj8TXE/qjuiAxKCZ/bzWF7jfaD9AQ=;
        b=Wi9nDRUGygxIy2h9iFUZPS+/9jSzndUdZMiRzz6bYdKMnxYrBb6yIH5vJa1GlWYoBs
         yhxx5EvC2TLKr+zVmJMmC2RVL0fggmukurTKf1TxAJMUtGshTxECtjRooJztzGmeW8gR
         c8FxR+GjREE6aCViOLxKaUirTgg5gIPpMcXzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731611452; x=1732216252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Agd78fl9Wg05tfWj8TXE/qjuiAxKCZ/bzWF7jfaD9AQ=;
        b=o6m4+PDIB0xGO39CHBNQBTj9oOF0c1RmNA85vAWrf/LCEI9UENFHnvzbB2Ph9OHmeh
         rtb0W9nULncpntsy5vDNcuy+F4o2TzswYljT/NYzaKzTJe8600eKLNXAWEYJgIt/V6Dh
         56b47E2WXRoQNahR65FuU6LRLbERGLsh757hM/j6wLp3STeMFnJIqpAVGt4Ogy555ZYY
         XmaVR6vmExyCHX8Wsn9H543sYC980Lb4UVhzpNea/NPmfIVEbiWwyYa8WVVK8RqT9txN
         1kkbgzQmpmzctAwc9ATWpKnquxYUqgM1XWtIVhVR7YuChU9qTa0OVgd3Q0U/qqcuNG07
         GlNg==
X-Forwarded-Encrypted: i=1; AJvYcCUj7SWuYIbhxrsgbI5uObO0q5giqU2mbDwcNGVJRoZeIlz+4lGAXcaCf3UHMFXqE9/2IHnR3yVz/jrXEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1h8HGfvfBL3Bbva45+oapWgrpKbCqJFMwtPZE5s/HBJpZkiIv
	cLtNPPri8U3hYshQUnON9Cbref38asiLxH/XV11SVwTjHqQaPSsDIy4weq5tbA==
X-Google-Smtp-Source: AGHT+IGfGZ77XmRsvM5pDShNqOVcnKjpwCHBu8ODcL423ifRxyF1TlWSXvxwnSO8pYYbWRznBIZQ6g==
X-Received: by 2002:a05:6214:418e:b0:6cb:e632:a059 with SMTP id 6a1803df08f44-6d39e1f66b9mr323111656d6.49.1731611452695;
        Thu, 14 Nov 2024 11:10:52 -0800 (PST)
Received: from denia.c.googlers.com (189.216.85.34.bc.googleusercontent.com. [34.85.216.189])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3ee7cc7e1sm8857766d6.53.2024.11.14.11.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 11:10:52 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 14 Nov 2024 19:10:37 +0000
Subject: [PATCH v15 08/19] media: uvcvideo: uvc_ioctl_(g|s)_ext_ctrls:
 handle NoP case
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241114-uvc-roi-v15-8-64cfeb56b6f8@chromium.org>
References: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
In-Reply-To: <20241114-uvc-roi-v15-0-64cfeb56b6f8@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: Yunke Cao <yunkec@chromium.org>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

If nothing needs to be done. Exit early.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_v4l2.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
index 02fd5cbc3474..65dbb53b1e75 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -1081,6 +1081,9 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, void *fh,
 	u32 which;
 	int ret;
 
+	if (!ctrls->count)
+		return 0;
+
 	switch (ctrls->which) {
 	case V4L2_CTRL_WHICH_DEF_VAL:
 	case V4L2_CTRL_WHICH_CUR_VAL:
@@ -1121,6 +1124,9 @@ static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
 	unsigned int i;
 	int ret;
 
+	if (!ctrls->count)
+		return 0;
+
 	ret = uvc_ctrl_check_access(chain, ctrls, ioctl);
 	if (ret < 0)
 		return ret;

-- 
2.47.0.338.g60cca15819-goog


