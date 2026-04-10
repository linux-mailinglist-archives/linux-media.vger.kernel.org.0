Return-Path: <linux-media+bounces-58463-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNB+M21E2GnfaggAu9opvQ
	(envelope-from <linux-media+bounces-58463-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 02:29:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7453D0CD7
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 02:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1AF9301F319
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 00:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E3052868A9;
	Fri, 10 Apr 2026 00:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="DEvqTFaW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C466C27A123
	for <linux-media@vger.kernel.org>; Fri, 10 Apr 2026 00:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775780940; cv=none; b=GSsiE9tXAkYJrJksZC6qMdN44FJj0tBmugu2VhKqsm4MsRtaR4LmQzE9CpImTJkkE01XFh9H2B/MP7EN2OkUniR91pmWqvQIfStj0NBqO6XCvXuZqb6Y9XRvB6TlNU/fq+u4a2gUHng4NE/egtSg/ezbO1665qneS+RFKyJ4eDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775780940; c=relaxed/simple;
	bh=ax/QlneOJPW/C07fAtozxCuOB9NREghfagK8LVCvkVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E5RRKi53Hyndx3NUjFCxFtXttR1d7it+shlGcP8DeMyvV6ay26AbG3VPhpSV6zAVPrV4VpY3EgfKU1yGR2cqqjVpiXzUPSreJvdDH68gmRnrBoL83cii4AY4PyfDd4na5akndr5N6M/u5/Yo+ScDXoC3HuwvdLFJBhHxNiygLdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=DEvqTFaW; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1273349c56bso2052434c88.0
        for <linux-media@vger.kernel.org>; Thu, 09 Apr 2026 17:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1775780938; x=1776385738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zu3oR09vRQkDFwrDcL3IwsvCJguXM5kG+ZQlWAVYGNg=;
        b=DEvqTFaWvZSWx9/AnkCJ7w0oCofrVFwpksgrkZxqNhzi/XBuz8WxqOuF4rHkLtuUw9
         ZPZyv3PAli4R8ATOf5hTMnOAfmjrIZtef6oFEczhC8SXZA/gfjSyLu8Wi7hh7oJWTqoQ
         AaTGucFhs8ulsjfzpStWgCWn/WnSccDO0W3VXslryWFbJta8wi7rETdVL+FKbTCSXQHg
         Ad3pL/Rb/f6W1CvgFkgb+MPNzNRE07xl82h6oIsJj5j+U3cRHBBdbCjJ6O6oVwh1NoxC
         rVGZzxBzitMiRRwSIFV7S0vDCJy0x6hvDaBNjtGvU6XEaL+ajL4kOXMzZ5uJh/fe5I0t
         /O9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775780938; x=1776385738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zu3oR09vRQkDFwrDcL3IwsvCJguXM5kG+ZQlWAVYGNg=;
        b=kE7O123H8GQ5Su78VEAZNBOxLrsrfSIhajZs0T7AdQ2zAIN6gamOYg6qETyFpvhWWO
         9HvqiQhGvJ9LylrH1HpDHalPaM2vDvZK963595Qu+IAByt+UL/POJHkgriVswg3fi18q
         jt0jLa3G8VP52bTqpEg0+A/vNAH8VkQkcxzJTu1Fz7XO091VJcIiyn/K0FKp1XQ3rSGV
         Xmg1DX8FyffXNydHw7PYPeHSavo+X1Z1EiFbDzudJohXLCBXDMtdqGZh/KLF9AKYQl1m
         /fYdBrQmjJ7OqvSzR+jqwo01Dw48P9MFtrN8hLIPfXeY0fYO9rHmKqZAujpvcVtni84v
         ksew==
X-Gm-Message-State: AOJu0Yy9zN9NzGSy4a5Hnli3tGPrVifiGPWUuTomGtMrrhvUVkyX79On
	q5ywaprKDGOs1zz5OA71o7oAOWeTLdOOZ0ISy+tGQLolpz1WIAVfAeAHR9O1tRNRHw==
X-Gm-Gg: AeBDietl3Xv93FR9VvUKXayfEOxcbBB49MuHXKm+zjbhbIIRsYOcTNmkKxfiYBX4bzq
	Z8r1PwrkLvO+t6e1mr0clnNrnHh/Tq3TNJWEp99lKVtcB6o1jf1OtU51t8QSz0EMBsbEkswdyWO
	60qLBWFUTr1Q/PYlSkzEaRU8kGfBzN8/2fKcqZhYZxKTaHy7bA7lD3CDCCQiiBCwCu6NgPzrI7z
	R/wwvjO4NqxSOm6DAPUT7HTryQ2NyKtOFgBLUqntRh0rof1gdqcEx8golmdrP7zcMI2knZwsNv5
	s4zanSmeRdVTNMBM69L3WHkPl2ixNmu1TCT3QJLUGJemdPnDLquf3AuX1Nts/4asFZQB1LcQhJY
	ZXiEtdS2DlzVMACZsseRTs5hoTEatweUl+dMWwENhUfbWG0JYM4epivJhmySImXvWo4GlMZxeek
	4Nh+E73A9rr7hi9JQxczOdFXKXeetotSUnc2W/h5DJnBwc36kFpis3vhN1aCdVK68gps3DIV0ei
	u3nLO+WW5bnsUnR+DdLDVsxUF7Agk3mewTr/g==
X-Received: by 2002:a05:7023:b0f:b0:128:d5bd:357f with SMTP id a92af1059eb24-12c34f09283mr660067c88.30.1775780937794;
        Thu, 09 Apr 2026 17:28:57 -0700 (PDT)
Received: from katana.dragonfish-mirfak.ts.net ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346eb162sm1400680c88.11.2026.04.09.17.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 17:28:57 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Ricardo Ribalda <ribalda@chromium.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	JP Hein <jp@jphein.com>
Subject: [PATCH v7 1/2] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for fragile USB firmware
Date: Thu,  9 Apr 2026 17:28:30 -0700
Message-ID: <20260410002831.1046407-2-jp@jphein.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410002831.1046407-1-jp@jphein.com>
References: <20260331003806.212565-1-jp@jphein.com>
 <20260410002831.1046407-1-jp@jphein.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[jphein.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,chromium.org,gmail.com,jphein.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58463-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[jphein.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jphein.com:dkim,jphein.com:email,jphein.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3B7453D0CD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


