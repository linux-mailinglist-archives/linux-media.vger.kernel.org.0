Return-Path: <linux-media+bounces-66001-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 61E4HkWhQmrC+wkAu9opvQ
	(envelope-from <linux-media+bounces-66001-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 18:45:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BBA6DD77F
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 18:45:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hkjzAvSa;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66001-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66001-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9ABE830C635C
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 16:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4E746AF2C;
	Mon, 29 Jun 2026 16:38:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA42946AECF
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 16:38:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782751101; cv=none; b=a5NoQ1VaRtcAnqz4rBn+qCyhjqw+Dkw4/fqS5XaytrfC0+UkmOenD73qJjrtJXY+OwAqfcQAl4ZPn1Gi8gfj7OCNhXXjBUmZnTdjEWIkvRPqiXZuR0pKvkzkRWEqYEZGF5cRyOEi7Qly+EDo6bUiK+ma9kGitEerYpuVYReViW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782751101; c=relaxed/simple;
	bh=i3zSZZar9HxwTVK6RGaoT3zVJtgKjt+B4IROgo1/csQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OUvmm3G/ctmIpHhgavLmEzbpfCaKm+PnCe39JNsGCF8CMeX28PZmc7FUilwl/bZ0Z2uVXdi4CMNvYo4eMxp0p+YvMMRNa5HK8fZ4pCuzgdiG1oT046NbipqD0NnPxI/yAvxAgX0/s8jOnoDBY8j695ohek1MYa/neW5x5sx6I2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkjzAvSa; arc=none smtp.client-ip=209.85.128.41
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493b1710405so6167495e9.2
        for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 09:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782751098; x=1783355898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9lVOBVu6iG7kbbsXuXzl46b4dR6osB6ORuufF+Rdaw=;
        b=hkjzAvSashYtwQRYYW+Mxg5NC9hsqBrDTotH584ob/LbqqYlrj2T4YPJkUNSFo+TXF
         kQcwThYwCkSPWEIwwvYasUEnAGdeJ2WI25aeEw+KGyy0I7QhZK7P6KYcjaBkOm8wwI0m
         MlM05M6RUu10y0gc/qXOZTEpMD7h7H6kwHI3yKdBboVoOyfPrXihTraWMKZ+g7NljWrv
         1cik6CqstDm7g8/jlx3Clnet8JJwW1SsvvzSRgFUYznAXUDvplivYKrkDbGb4E6DebRM
         J+yJBIXqraUKPUjyWB4X8ax5t2SUcCWpfbliq/uTrIYvH28+WRYJ+ryKTVTN4t7WRva9
         B5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782751098; x=1783355898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z9lVOBVu6iG7kbbsXuXzl46b4dR6osB6ORuufF+Rdaw=;
        b=TpxK/V/UhvUf4w+h7UKm/8MVTiH4Ia/INOI7JqB313rxLauc21P5rE3U+b12Bb7N9a
         cBrnEoA+bFbOQILeHdNICygz256n1MLjbWTyxL7HEmvZeRMMeEoQydBdZKJG3JoQuMQk
         dzME+bG/c2KM8QMlTfaehGWbY8Slw4mpd1hNk6Whgjq7mFYIiXpGrS3/bfMlhjKErJJI
         0KToMQoWwk0RO9/Fh4LIYFdJ0M5KGRUIPmuByTBcHes74M7Cnx3y865PSuFkR5eYKCjN
         9dStguO/Wyk+oPcN3WrsKT/xZ0GoSa8PAiz7b5ti3hT2VaKmGxnKT7IQVGfCOtFuvkjy
         T66Q==
X-Gm-Message-State: AOJu0YzCZRHMpT+rBdEoOIxe7kdhQOjbxg5yKiMG6f/8DUXO/Y9RrNaX
	3fqxN36GRniQvPkMehvPul7mzUWLmFdrMvzUkyW/AtO3cFVfWdIJuf3vXcGbFoSU
X-Gm-Gg: AfdE7clq7NYWOfASUBSq9V/bdG99Pu/zqfiZRZPHrO7c/k86Tv6HoiT0XnOQEbRhJMh
	m/aZni9PB5v1sgZP3uXJP2pwt4hloU9pLwXPtPDFD+r315WFXF89lI2jDcru1bdNvzNoLjVqtii
	gffnJ4gLvfUw4UY65RssepXG7ty/oqT5iDe7nDnmTEP+aB1UBzGM+2SDRzhI4Blyb/c9khTcLNf
	rGzJEn0MzYGdkgvpoADvp5KyLoBRZntYm2dg+fX7RUWUHysMxysJfdt4oXZXgs1nPNNnyQ0oaZT
	LJWtsxxyH8IP5Jvz0IuCf++jZC2K0a0oHiw1914TJV1lyiHotGKLOTSlF/TeoS6ve1C7oomEVf4
	YedJ+IsuUcrvut74nw9gMj2OMeQ9YswJlfG7q6/2gTLEj0HAURkOpZq9QbnmIyLoU9uuwD60pHX
	tcuYZtXWIkZHclPynNqtHHl/aFlnzXaCpJTSIelTFa9bSn9dtb/lprPF4O2FuyYKt6xHb1JjRoa
	MUqaSNU6n76SYGrUzVeBo33
X-Received: by 2002:a05:600c:5298:b0:492:40df:d49c with SMTP id 5b1f17b1804b1-493b82ac618mr7123435e9.23.1782751098355;
        Mon, 29 Jun 2026 09:38:18 -0700 (PDT)
Received: from helmholtz-coils-PC.nanosat.lab ([147.83.201.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4730937e18dsm15765501f8f.21.2026.06.29.09.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:38:18 -0700 (PDT)
From: =?UTF-8?q?Pol=20Fern=C3=A1ndez=20Fern=C3=A1ndez?= <fernandezfernandezpol@gmail.com>
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Pol=20Fern=C3=A1ndez=20Fern=C3=A1ndez?= <fernandezfernandezpol@gmail.com>
Subject: [PATCH 2/2] media: uvcvideo: add device entry for Logitech C920 (046d:08e5)
Date: Mon, 29 Jun 2026 18:38:03 +0200
Message-ID: <20260629163805.37879-2-fernandezfernandezpol@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260629163805.37879-1-fernandezfernandezpol@gmail.com>
References: <20260629163805.37879-1-fernandezfernandezpol@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.57 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.59)[subject];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-66001-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[ideasonboard.com,vger.kernel.org,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:fernandezfernandezpol@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[fernandezfernandezpol@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fernandezfernandezpol@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C3BBA6DD77F

The Logitech HD Pro Webcam C920 variant with USB ID 046d:08e5 is not
present in the device ID table and is matched only by the generic UVC
catch-all entry, receiving no device-specific quirks.

This device intermittently sends MJPEG frames at 1920x1080/30fps
without the EOI (0xFF 0xD9) End of Image marker, correctly signaling
the incomplete frame via UVC_STREAM_ERR in the UVC payload header.
Applications using strict JPEG decoders (libjpeg) display the corrupted
portion as a gray band covering the remainder of the frame. The issue
does not occur on Windows.

Two contributing factors were identified:

1. The C920 (08e5) operates at the USB 2.0 High Speed isochronous
   ceiling (wMaxPacketSize = 3x1024 = 3072 bytes, altsetting 11).
   The camera firmware has an intermittent bug where it occasionally
   fails to finalize a JPEG frame and signals this correctly via
   UVC_STREAM_ERR. No USB-level isochronous packet failures were
   observed (iso_frame_desc.status was always 0).

2. uvcvideo forces wCompQuality to the maximum value returned by
   GET_MAX during probe negotiation (61 for this device, on a
   firmware-specific scale). The camera's default value from GET_CUR
   is 0, which this firmware uses to indicate adaptive encoding mode.
   Forcing maximum quality increases encoder pressure and raises the
   frequency of UVC_STREAM_ERR events.

Add a device table entry with:
- UVC_QUIRK_RESTORE_CTRLS_ON_INIT and UVC_QUIRK_INVALID_DEVICE_SOF,
  consistent with the existing entry for the related 046d:082d variant
  of the same camera family.
- UVC_QUIRK_NO_FORCE_QUALITY to preserve wCompQuality=0 (adaptive
  mode) during probe negotiation rather than overriding it with the
  maximum value.
- UVC_QUIRK_DROP_STREAM_ERR to ensure frames flagged with
  UVC_STREAM_ERR are silently dropped rather than delivered to
  userspace as truncated JPEG data.

Tested on Linux 7.0.0 at 1920x1080 MJPEG 30fps. With this fix, 0
truncated frames were observed in 300-frame capture sequences
(previously 1-2% of frames were affected).

Signed-off-by: Pol Fernández Fernández <fernandezfernandezpol@gmail.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index XXXXXXX..XXXXXXX 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2729,6 +2729,18 @@
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_NO_RESET_RESUME) },
+	/* Logitech HD Pro Webcam C920 (variant 08e5) */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x046d,
+	  .idProduct		= 0x08e5,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_RESTORE_CTRLS_ON_INIT
+					       | UVC_QUIRK_INVALID_DEVICE_SOF
+					       | UVC_QUIRK_NO_FORCE_QUALITY
+					       | UVC_QUIRK_DROP_STREAM_ERR) },
 	/* Chicony CNF7129 (Asus EEE 100HE) */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
--
2.43.0

