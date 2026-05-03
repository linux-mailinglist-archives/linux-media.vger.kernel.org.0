Return-Path: <linux-media+bounces-60211-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yLZaF2XZ92nymwIAu9opvQ
	(envelope-from <linux-media+bounces-60211-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 01:25:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F185F4B7C12
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 01:25:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B6F2300B853
	for <lists+linux-media@lfdr.de>; Sun,  3 May 2026 23:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 831203C942C;
	Sun,  3 May 2026 23:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="tLFkoTCV"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99673A6F02
	for <linux-media@vger.kernel.org>; Sun,  3 May 2026 23:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777850708; cv=none; b=LwiTdEI7H04kP6HtOOVDYLkmylrbBSK03ZbClcAc4vPXprwWWmoA5STwzYSBbJXrImGTCA7faO/E0SijTyA37YIhxRy8tEWpiicGRmfoTtMX6AEEl34laRP5W+nc1TVmg88o8kQ+HPt9NuDR8NVeX40k9q3baZA7y9edHmSR4uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777850708; c=relaxed/simple;
	bh=ax/QlneOJPW/C07fAtozxCuOB9NREghfagK8LVCvkVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=goej/uWZ3xST7WtINasT+TN7AnYo2HUzEQl6q6a4SbmjE/qvxlGW2yKJBYgl3em9GLt0Xs6+G3g8LqEiYX6ISomJNZ+533Mk4O77he7/vPM6zA2iFLDgaTlbEoaC8CXbR9z2EepvCNI6Lqgs4fBrpiz7w+gcJ+4q3XiGsuPbGas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=tLFkoTCV; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-12dbd0f7ecaso8064496c88.0
        for <linux-media@vger.kernel.org>; Sun, 03 May 2026 16:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1777850705; x=1778455505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zu3oR09vRQkDFwrDcL3IwsvCJguXM5kG+ZQlWAVYGNg=;
        b=tLFkoTCVTwCRDiYLgV5GQQ8q4YWwzaZbQqUad7+SF8/1Ygm9TNJPSt/6uR1TJoOSRK
         OH7ZSwTjl6nT6DrSCRW/arcorEJWrH0pZ//01Ix20p88c9mnJeFlxajm7j0RGyuwdHr8
         0bOtSGBOOkXaTbH9uxJTTHxAoavCKSo/gcTHJZuTxe2R5kqXFVROYbwlTltS2gLcOYBc
         WpQLkqTrVXOLPMOrewWVf3zGGst6jcJhf1EdRI8CjdDJCkAepVVLg8B1E5vB6AAnm+Vv
         ATdSjMMD0w5/VzrIjFTWQc4gvXBrg4G5Uf8wRYMCZLycRBi1O/e/uPVW/ugcyKudWT1Z
         ORDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777850705; x=1778455505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zu3oR09vRQkDFwrDcL3IwsvCJguXM5kG+ZQlWAVYGNg=;
        b=T9lHDFUOOwwSMBql4oBReZ4dKDsXf8q7laCpRrHyfmTnlC9d/6qYFvUlRVtPpDkAKb
         BiKjkrRh7CLE4ekqKlDsNFqBG4hwETuJ4q/9jtDd8bs33A3mvfFtsZstV4A3vtE8erhd
         TXUBa7BznCJ5AXZtbmIN0rcfrfWqBeQF5DJKOEtoadXVmBP0cAaOXqeW84nFXAztUf5k
         T+idPjVOGXrQb5pjS0s4OQt+TN9St/JIHwFnMhNxzRTbpO+RnT7INCwegYbeeNk/UQlg
         crSfWtK0T9FvVkjfdIpWKYzE41KqYauzbpDr1ABuKeaZ/QSqKCMWhBERs/YWc0jtyQ0h
         H7Ww==
X-Gm-Message-State: AOJu0YyxjX81NhPAhH92R023Su3SoZku+71ETlwCrXuAOi/B1dSmyqWa
	gtKtwLezY2xQRc+kxyUSuB/Itst/74EGtnzRBKzLGf+6EmwWL2gYoGqzyitMlLxZBA==
X-Gm-Gg: AeBDievuZu5jCoLqRHLdd+zlHxHl7riMrXzvBKzi15RyqO7GtrEea/tkXKH/80o4QJU
	NBqx/Rj3OYhg7uP1nHeaNVzd2CeGfMUdaN+DDEo9nIVnm6ZoX0CCHGDtwsTv154lsl+ObaZ2Xvv
	DIY5v0ln2tPFqJsJIEqACvZYrhki4wQu6jkefwQrBQkAiuiiNN/Sa3emOW4VBWWQEDef9F53T78
	dslSefKU1o5znQPXMAkjd6+XvbTWisDtISenyVCoNYrPE/edJlji41/hKJG1Fc/we6vxGdlsX32
	dg8f9Fk13YnFgbXTWuX876bQWwcadv9vcuduKDOIm5Zd1cXN2c7zF5b4qFoW+EZNVUWIyNA8ZWx
	rI4g5hwh4m6f6JWuh6j7/6nVJ1wJ0L26ucvK4u2aPnHkyZm9yDV+VrYPW9JyaLcIa5lDLBUG93K
	t/dZ9c03P/Zw/xEwY+VGbNo5YYiYV1/s9026rwRem35olggeJpA79oLe6udWTdy2ErAbpGv6C0q
	+cRsnxoIzOkd4m/WFbc
X-Received: by 2002:a05:7022:220d:b0:128:d714:3ca6 with SMTP id a92af1059eb24-12dfd7ee88emr3530153c88.12.1777850704674;
        Sun, 03 May 2026 16:25:04 -0700 (PDT)
Received: from katana.lan ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df8278e7dsm12432465c88.2.2026.05.03.16.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 16:25:04 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Ricardo Ribalda <ribalda@chromium.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	JP Hein <jp@jphein.com>
Subject: [PATCH v8 1/2] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for fragile USB firmware
Date: Sun,  3 May 2026 16:25:00 -0700
Message-ID: <20260503232501.302335-2-jp@jphein.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260503232501.302335-1-jp@jphein.com>
References: <20260331003806.212565-1-jp@jphein.com>
 <20260503232501.302335-1-jp@jphein.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: F185F4B7C12
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,chromium.org,gmail.com,linux.intel.com,jphein.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60211-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[jphein.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,jphein.com:email,jphein.com:dkim,jphein.com:mid]

Some UVC devices have firmware that locks up under sustained rapid
USB control transfers, crashing the xHCI host controller and taking
all USB devices on the bus with it.

The Razer Kiyo Pro (1532:0e05) is the first known example: approximately
25 rapid consecutive control transfers cause the firmware to stall an
endpoint.

Add UVC_QUIRK_CTRL_THROTTLE which rate-limits all USB control transfers
to 50ms intervals in __uvc_query_ctrl(), the lowest-level UVC control
transfer function, ensuring all callers are throttled including
uvc_set_video_ctrl() which bypasses uvc_query_ctrl().

The 50ms interval was determined experimentally: the device is stable
at this rate under sustained operation, while shorter intervals
eventually trigger the firmware bug.

Signed-off-by: JP Hein <jp@jphein.com>
---
 drivers/media/usb/uvc/uvc_video.c | 20 ++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h  |  3 +++
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index a5013a7..1d1206f 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -36,6 +36,26 @@ static int __uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 	u8 type = USB_TYPE_CLASS | USB_RECIP_INTERFACE;
 	unsigned int pipe;
 
+	/*
+	 * Rate-limit control transfers for devices with fragile firmware.
+	 * The Razer Kiyo Pro locks up under sustained rapid control
+	 * transfers (hundreds without delay), crashing the xHCI controller.
+	 * Throttle in this low-level function to cover all callers,
+	 * including uvc_set_video_ctrl() which bypasses uvc_query_ctrl().
+	 */
+	if (dev->quirks & UVC_QUIRK_CTRL_THROTTLE) {
+		unsigned long min_interval = msecs_to_jiffies(50);
+
+		if (dev->last_ctrl_jiffies &&
+		    time_before(jiffies,
+				dev->last_ctrl_jiffies + min_interval)) {
+			unsigned long wait = dev->last_ctrl_jiffies +
+					     min_interval - jiffies;
+			msleep(jiffies_to_msecs(wait));
+		}
+		dev->last_ctrl_jiffies = jiffies;
+	}
+
 	pipe = (query & 0x80) ? usb_rcvctrlpipe(dev->udev, 0)
 			      : usb_sndctrlpipe(dev->udev, 0);
 	type |= (query & 0x80) ? USB_DIR_IN : USB_DIR_OUT;
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 757254f..31f2af5 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -78,6 +78,7 @@
 #define UVC_QUIRK_INVALID_DEVICE_SOF	0x00010000
 #define UVC_QUIRK_MJPEG_NO_EOF		0x00020000
 #define UVC_QUIRK_MSXU_META		0x00040000
+#define UVC_QUIRK_CTRL_THROTTLE		0x00080000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001
@@ -583,6 +584,8 @@ struct uvc_device {
 	struct usb_interface *intf;
 	unsigned long warnings;
 	u32 quirks;
+	/* UVC control transfer throttling (UVC_QUIRK_CTRL_THROTTLE) */
+	unsigned long last_ctrl_jiffies;
 	int intfnum;
 	char name[32];
 
-- 
2.43.0


