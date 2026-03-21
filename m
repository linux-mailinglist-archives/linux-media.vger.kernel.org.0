Return-Path: <linux-media+bounces-56620-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0O53BRUev2mavAMAu9opvQ
	(envelope-from <linux-media+bounces-56620-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 23:39:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A42C42E7843
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 23:39:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A52A5302B3A0
	for <lists+linux-media@lfdr.de>; Sat, 21 Mar 2026 22:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47F2E34A77D;
	Sat, 21 Mar 2026 22:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="UTUPVFJJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39753101A2
	for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 22:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774132681; cv=none; b=M39IjiczsiSh/YmwuGUFaPv/v44cbiu9OYJ8x23XedypCeUrazul+EjQ5VHD2IxlGAXHQqlTYInJvvM3nh4J7ORq9006pGyyGoO9yy7tYIn5JAtm40TKQd4EGHjjRwwTXX//Jgf8kbddyyq4IWQPPIG8fjhye/kc0r9bi/J8j2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774132681; c=relaxed/simple;
	bh=j6YmjRRROEEx3McboqTuoot/Fg9VIXMRcUGQRbpXqMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qVCGVuoBYuyzRpqovdJvC1l8nIaPU9CJEgzqSgH+BTHbu7qUwCngCqLYe171dVyYDngsAjvLFikbTiXO2gwoh8/v6Ltv/pb5t7AxWRiLe+ocEvxjQ0AeyGJv2I5I+jCQexP1CKSdid2wqJKsKcxjGpYTbANlS/PWX+/+WGnQHug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=UTUPVFJJ; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2c0bcd8f194so3660916eec.1
        for <linux-media@vger.kernel.org>; Sat, 21 Mar 2026 15:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774132680; x=1774737480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cn5yWGoO56WXGX+jGKfheaJa/NSsWH6jwCf9WouezW4=;
        b=UTUPVFJJWzq3s9EpQWy3RAFYheRo46oMi7yBM/TVQfzkwokq1HZpUPqF9UmrxPr3HU
         v1reMz1/5EVsaAYE5vupscTC6dluRc5+Dwd6PqkekbdSPkmxxz6anOGhnULBkFw6T/A6
         Qc4z/Ph/Bgo1VjPn6OjlmT1QBVNENDcP/e+YkTYe2ZtqmrTC85wAMHgoWfu1HmJZzl1p
         os0WFdZ7cxNH/nDtEEadWsHlPoJrPVHJHlZf6mfUJdev59Y11SsV2uQDngse8P1QcQEo
         5wsASsPg5NB96UdsF/jYOkYlGjSnl5HwJKnpzvXTkbD4CXN1/U9A1rbDvsdhjgkRuoMy
         bVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774132680; x=1774737480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cn5yWGoO56WXGX+jGKfheaJa/NSsWH6jwCf9WouezW4=;
        b=pz1F4RRK8u3UWmJk78R9vRcS9HPCiaLWgLLDqDPtmGCvbW11++otUeH/HCvxTgbxHZ
         RoeSDM8muqEgOXvczNhAmzA4RpdBUEz00Fp9yGuR1602+kcuzRjgQbK+ME4G1H/lHwqJ
         aPoikHJOFayRiDtlaDq4cP5LxnRmgAkNM4MEfOSY0Di395tYcP1y3ql7++ERoQBDTItN
         KSGRIjLGiLMV+oyZ1o3uKNbtwpPVBh/XfJ8vbsPzvi2UHk/CTdAry6Mc1XXV0NqBumW0
         W/XvU+2IseZdVivYZmpgME1lvlT8f0QA0e6Z81VLf/3dGVw4VAFodWFeTW6Zx09eP5gx
         0/Cw==
X-Gm-Message-State: AOJu0YwMceUuo+JURaWndzOdo5BnVZXUUzULWMa+WRHHYgTqND9hULwX
	bhtMOkJD70IlftvzvpgyJVMOSGCLkX5nhHYNhJSGHojMQ4Lc08TW76P5fGTOH29Tqg==
X-Gm-Gg: ATEYQzxi9bdb+yoLGmoV+KvWjO3Q+dFsUJ+kCPjXTldxrPCYbTjmRt9IqqqIITs228q
	h92UT6fdgmmvqGb2gMaMgygNihM0dFZUyShNIQerrfaLTwqVvY+lZRdJ6qALcIT/wGGe7s540aw
	5qgrJGkmMwWA3A0TgpR34gf2SH2QP0H3bPXQDSq1WgBm+w3patx3A9iK/BH9Z1Xos+5ZYXRXXY6
	IxPIhvxB5KkA+YUu0yMsASECLs3P1AzlQkJRgKrAuC3TyBmJYfmAsCUjUmUW/FpF3WKDQRPuLXw
	dkTt7U6nA7s667xYp9XFwcOLnutE6SKInLzBkvYdtBY4R42alyuLEFe8TvOAW5cvgzsur8fFM6Q
	c7oSyqK30BQdusbdZ1OxWfYd8zlZ0RHn4Qfbv4YixPMJ27TEDucEHbuXhJ4MobErUfuW5vkHtU5
	bR67rAmd2V
X-Received: by 2002:a05:7300:e7a2:b0:2c1:23d:c728 with SMTP id 5a478bee46e88-2c1097ab161mr3419153eec.31.1774132679718;
        Sat, 21 Mar 2026 15:37:59 -0700 (PDT)
Received: from katana.lan ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c985sm7982131eec.2.2026.03.21.15.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 15:37:59 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	JP Hein <jp@jphein.com>
Subject: [PATCH 3/3] media: uvcvideo: add quirks for Razer Kiyo Pro webcam
Date: Sat, 21 Mar 2026 15:37:06 -0700
Message-ID: <20260321223713.1219297-5-jp@jphein.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260321223713.1219297-1-jp@jphein.com>
References: <20260321223713.1219297-1-jp@jphein.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[jphein.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56620-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[launchpad.net:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,jphein.com:dkim,jphein.com:email,jphein.com:mid]
X-Rspamd-Queue-Id: A42C42E7843
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Razer Kiyo Pro (1532:0e05) is a USB 3.0 webcam whose firmware has
two failure modes that cascade into full xHCI host controller death,
disconnecting every USB device on the bus:

  1. LPM/autosuspend resume: the device fails to reinitialize its UVC
     endpoints on resume, producing EPIPE on SET_CUR. The stalled
     endpoint triggers an xHCI stop-endpoint timeout.

  2. Rapid control transfers: ~25 rapid consecutive SET_CUR operations
     overwhelm the firmware, causing a full lockup.

Add the device to the UVC driver table with:

  - UVC_QUIRK_CTRL_THROTTLE: rate-limit SET_CUR (50ms interval) and
    skip error-code queries after EPIPE to prevent crash trigger #2.

  - UVC_QUIRK_DISABLE_AUTOSUSPEND: prevent USB autosuspend transitions
    that trigger crash #1. Same approach as Insta360 Link.

  - UVC_QUIRK_NO_RESET_RESUME: avoid the fragile reset-during-resume
    path. Same approach as Logitech Rally Bar.

Cc: stable@vger.kernel.org
Link: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2061177
Signed-off-by: JP Hein <jp@jphein.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index XXXXXXX..XXXXXXX 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -2566,6 +2566,22 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= (kernel_ulong_t)&uvc_quirk_probe_minmax },

+	/*
+	 * Razer Kiyo Pro — firmware crashes under rapid control transfers
+	 * and on LPM/autosuspend resume, cascading into xHCI controller
+	 * death that disconnects all USB devices on the bus.
+	 */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x1532,
+	  .idProduct		= 0x0e05,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_CTRL_THROTTLE
+					| UVC_QUIRK_DISABLE_AUTOSUSPEND
+					| UVC_QUIRK_NO_RESET_RESUME) },
+
 	/* Oculus VR Positional Tracker DK2 */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
--
2.43.0

