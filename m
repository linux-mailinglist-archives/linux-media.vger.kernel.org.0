Return-Path: <linux-media+bounces-57693-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JYSO4UXy2lrDwYAu9opvQ
	(envelope-from <linux-media+bounces-57693-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 02:38:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B4B362B6A
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 02:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4F0E330219A8
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 00:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F8162D1F44;
	Tue, 31 Mar 2026 00:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="Jsqod4oK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1089828A3F8
	for <linux-media@vger.kernel.org>; Tue, 31 Mar 2026 00:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774917493; cv=none; b=gOuUuggAkZyR7oh01nazs21Nu5JohPNbQEffCbZWZ3PQvkR4lQ25YtaFb3J6kl/8jE1XDoN/hlrX4K1tO+avgnWM+IKK5N5rVbe/skxn+sw6d5qjW5Wvu6youaMEEvQqisBl7A8GRLT37GswFJBbTBwnuHCbOo2uPtQF5mCjkd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774917493; c=relaxed/simple;
	bh=fsTHyWOUvDIlejGCT9LsXLY/uwNu3171UnVIx7oqPKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aCftSHZVKixjiVomY2/1NHe0FTWRcAWuunh7mDssEEP0r9hcxxiEF8ctoFEevtgWuM1lLQt7MwY6Cl+/vk1LhhekKRiPe8HD0Buuyl6l/F7yRCIiMhZailZxPOBoDluX/2w1wYIZxiFgfrpaTtNlGckfW+QhCiYrlcn07Cy/asI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=Jsqod4oK; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-126ea4e9694so1549864c88.1
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 17:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1774917491; x=1775522291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZwt0R/IQ/cE7o40rmBPpv+gSd79siNpA7SF/5ZqoKk=;
        b=Jsqod4oKgtdHtk+KUfFPa6lDdr18ON0KFGbzeYGVgfThFxgxUZGSqhMFMVFHpc2tU9
         sqbTWYZ167ptOBIfZO6k74AihaINyqTAkMm+7NP4eYxnFy60RzRhP30kzZbXOncBaH33
         oPQqU7Mdo0ONIW+unLri7+8UhR5h+FddMvdidX5leoXNW78TsfPYkqk05SlhmrSXEUBR
         tHFSWYTUeTfGnKjZJ6B81O0NSiBbMXnPiFIwxUHJ7wQ9zwetwyhqr2x4O2AXS54m5m5c
         T+dEd/0qh22prZMYF2VQPPZY40puyHdXWButX6Wv7A7XCSP0acQUdYQUo9EtbZ1LfdvD
         UauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774917491; x=1775522291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DZwt0R/IQ/cE7o40rmBPpv+gSd79siNpA7SF/5ZqoKk=;
        b=DEEVEGXU3ZBa+90/beU/Qc1CJH2sz1oa8LNA2Cp63RQ67UC+6w1ttKkm7uk2Eg6pFJ
         IjR7IDpm6rad08RD+zBWDsBAPwapTNP3Zm03qFftzB/D4Gki9BNajie6HcITDXsMbr2U
         AL/C2xGTj/vyKv5q5VMLyCyUqwhMq03rvuVuw2GcJX8VsdSwuOV9/OuykKV36JxgXF1j
         PHNAhfOrjhdK/BFDFzb2qtewHQeABO9tSSxjTPYGzq7hoz91LQRP2dJszqezZhR7yykK
         qyW6wL0J43VDtOYZpVNfDNXfxEG6I0IdGdh0rjecltGOPm/sUCsu3N6PpmTvjlzyFYB5
         YCAg==
X-Gm-Message-State: AOJu0Yyzqjf97Vwnj0CTucX5tN4OjSXARFuOOEu+u6+h3OErpR7WCYC8
	eY3ZMo/ZucWZsNzzu9gJzH0t8HwZ2rZXnZ9EYe+X5RnkJYs95/sUgKo0MXd1I4XiLw==
X-Gm-Gg: ATEYQzwuBXZPnIxL85AtTo5JyABvLTzae3uOgN8SqOzJBlQD3yqk2WgyjPzGGwrZ/WM
	dsR7/2grMlbVMRNlPh7tKNCnGvSp7IcNTWb7EjLXp6BbV1hQKagjGLD0Yt7v9WHN2wOBnlVHNJQ
	Evq9/bgKUzY8VMtGommpV3HPrvbzPPke0ioAR/vjtXAOpEM3v6X3W85T1LtrU/lLXMgayCW0piM
	ul6AVjTuF7JyE2vTRKs7ilt4ByXokBdLMaEcza+Msu7DKCDhi+PP1SpsxbrDKrHhcW0dTGpq0zY
	szLBS1aarZPRkp4E7qQnA2EEVVzO+lZlJ1wxVPXxySjoXTBtpb0idVAjTc4VU6vvQ+smv8qmob1
	jEiIe5l1aOxqMzhS6H9OAZPfKC+j6ee9rNkV0WFFykVHRnewJRMbt1PyueVaxqEpNnLLmUByYhl
	dU8oRwug0vKw==
X-Received: by 2002:a05:701b:230c:b0:12a:b932:8221 with SMTP id a92af1059eb24-12ab9328744mr3647965c88.5.1774917490924;
        Mon, 30 Mar 2026 17:38:10 -0700 (PDT)
Received: from katana.lan ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab9864810sm9343057c88.12.2026.03.30.17.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 17:38:10 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Ricardo Ribalda <ribalda@chromium.org>,
	Michal Pecio <michal.pecio@gmail.com>,
	JP Hein <jp@jphein.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 2/3] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for fragile firmware
Date: Mon, 30 Mar 2026 17:38:05 -0700
Message-ID: <20260331003806.212565-3-jp@jphein.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260331003806.212565-1-jp@jphein.com>
References: <20260331003806.212565-1-jp@jphein.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[jphein.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,chromium.org,gmail.com,jphein.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57693-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[jp@jphein.com,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[jphein.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[jphein.com:dkim,jphein.com:email,jphein.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A3B4B362B6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Some USB webcams have firmware that crashes when it receives rapid
consecutive UVC control transfers (SET_CUR). The Razer Kiyo Pro
(1532:0e05) is one such device -- after several hundred rapid control
changes over a few seconds, the device stops responding entirely,
triggering an xHCI stop-endpoint command timeout that causes the host
controller to be declared dead, disconnecting every USB device on the
bus.

The failure is amplified by the standard UVC error-code query: when a
SET_CUR fails with EPIPE, the driver sends a second transfer (GET_CUR
on UVC_VC_REQUEST_ERROR_CODE_CONTROL) to read the UVC error code. On a
device that is already stalling, this second transfer pushes the
firmware into a full lockup.

Introduce UVC_QUIRK_CTRL_THROTTLE (0x00080000) to address both issues:

  - Enforce a minimum 50ms interval between SET_CUR control transfers,
    preventing the rapid-fire pattern that overwhelms the firmware.
    50ms allows up to 20 control changes per second, which is sufficient
    for interactive slider adjustments while keeping the device stable.

  - Skip the UVC_VC_REQUEST_ERROR_CODE_CONTROL query after EPIPE errors
    on devices with this quirk. EPIPE is returned directly without the
    follow-up query that would amplify the failure.

The UVC control path is serialized by ctrl_mutex, so last_ctrl_set_jiffies
does not require additional locking.

Cc: stable@vger.kernel.org
Signed-off-by: JP Hein <jp@jphein.com>
---
 drivers/media/usb/uvc/uvc_video.c | 32 +++++++++++++++++++++++++++++++
 drivers/media/usb/uvc/uvcvideo.h  |  3 +++
 2 files changed, 35 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index 40c76c051..9f402f55e 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -75,8 +75,30 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 	u8 error;
 	u8 tmp;
 
+	/*
+	 * Rate-limit SET_CUR operations for devices with fragile firmware.
+	 * The Razer Kiyo Pro locks up under sustained rapid SET_CUR
+	 * transfers (hundreds without delay), crashing the xHCI controller.
+	 */
+	if (query == UVC_SET_CUR &&
+	    (dev->quirks & UVC_QUIRK_CTRL_THROTTLE)) {
+		unsigned long min_interval = msecs_to_jiffies(50);
+
+		if (dev->last_ctrl_set_jiffies &&
+		    time_before(jiffies,
+				dev->last_ctrl_set_jiffies + min_interval)) {
+			unsigned long elapsed = dev->last_ctrl_set_jiffies +
+						min_interval - jiffies;
+			msleep(jiffies_to_msecs(elapsed));
+		}
+	}
+
 	ret = __uvc_query_ctrl(dev, query, unit, intfnum, cs, data, size,
 				UVC_CTRL_CONTROL_TIMEOUT);
+
+	if (query == UVC_SET_CUR &&
+	    (dev->quirks & UVC_QUIRK_CTRL_THROTTLE))
+		dev->last_ctrl_set_jiffies = jiffies;
 	if (likely(ret == size))
 		return 0;
 
@@ -108,6 +130,16 @@ int uvc_query_ctrl(struct uvc_device *dev, u8 query, u8 unit,
 		return ret < 0 ? ret : -EPIPE;
 	}
 
+	/*
+	 * Skip the error code query for devices that crash under load.
+	 * The standard error-code query (GET_CUR on
+	 * UVC_VC_REQUEST_ERROR_CODE_CONTROL) sends a second USB transfer to
+	 * a device that is already stalling, which can amplify the failure
+	 * into a full firmware lockup and xHCI controller death.
+	 */
+	if (dev->quirks & UVC_QUIRK_CTRL_THROTTLE)
+		return -EPIPE;
+
 	/* Reuse data[0] to request the error code. */
 	tmp = *(u8 *)data;
 
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index 8480d65ec..cafc71457 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -81,6 +81,7 @@
 #define UVC_QUIRK_INVALID_DEVICE_SOF	0x00010000
 #define UVC_QUIRK_MJPEG_NO_EOF		0x00020000
 #define UVC_QUIRK_MSXU_META		0x00040000
+#define UVC_QUIRK_CTRL_THROTTLE		0x00080000
 
 /* Format flags */
 #define UVC_FMT_FLAG_COMPRESSED		0x00000001
@@ -579,6 +580,8 @@ struct uvc_device {
 	struct usb_interface *intf;
 	unsigned long warnings;
 	u32 quirks;
+	/* Control transfer throttling (UVC_QUIRK_CTRL_THROTTLE) */
+	unsigned long last_ctrl_set_jiffies;
 	int intfnum;
 	char name[32];
 
-- 
2.43.0


